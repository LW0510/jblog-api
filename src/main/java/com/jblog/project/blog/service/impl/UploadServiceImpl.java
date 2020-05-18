package com.jblog.project.blog.service.impl;
import com.google.common.collect.Lists;
import java.util.Date;

import com.jblog.framework.security.service.TokenService;
import com.jblog.project.system.domain.SysDept;
import com.google.common.collect.Maps;

import com.jblog.common.exception.CustomException;
import com.jblog.common.utils.IdUtils;
import com.jblog.common.utils.ServletUtils;
import com.jblog.common.utils.file.FileUploadUtils;
import com.jblog.framework.config.GhcConfig;
import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.mapper.UserMapper;
import com.jblog.project.blog.service.UploadService;
import com.jblog.project.system.domain.SysUser;
import com.jblog.project.system.mapper.SysUserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Service
public class UploadServiceImpl implements UploadService {

    private final static Logger logger = LoggerFactory.getLogger(UploadServiceImpl.class);

    @Autowired
    private SysUserMapper userMapper;
    @Autowired
    private TokenService tokenService;

    /**
     * 头像上传
     * @param avatar
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public AjaxResult avatarUpload(MultipartFile avatar, Long userId) {
        HttpServletRequest request = ServletUtils.getRequest();
        String basePath = GhcConfig.getAvatarPath();
        String fileName = IdUtils.simpleUUID();

        String returnFileName = null;
        try {
            returnFileName = FileUploadUtils.upload(basePath,fileName,avatar);
        } catch (IOException e) {
            logger.error(e.getMessage());
            throw new CustomException("头像上传失败");
        }

        SysUser user = new SysUser();
        user.setUserId(userId);
        user.setAvatar(returnFileName);
        user.setUpdateBy(tokenService.getLoginUser(request).getUsername());
        int num = userMapper.updateUser(user);

        //前端访问头像url
        if(num > 0){
            StringBuffer url = new StringBuffer();
            url.append(request.getScheme())
                    .append(":")
                    .append(request.getServerName())
                    .append(":")
                    .append(request.getServerPort())
                    .append(request.getContextPath())
                    .append("/")
                    .append(returnFileName);
            AjaxResult res = AjaxResult.success();
            res.put("url",url);
            return res;
        }
        return AjaxResult.error("上传失败");
    }
}
