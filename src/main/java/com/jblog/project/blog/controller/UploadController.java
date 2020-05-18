package com.jblog.project.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.jblog.common.core.lang.UUID;
import com.jblog.common.utils.IdUtils;
import com.jblog.common.utils.file.FileUploadUtils;
import com.jblog.framework.config.GhcConfig;
import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.form.UploadForm;
import com.jblog.project.blog.service.UploadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 资源上传
 */
@Slf4j
@RestController
public class UploadController {

    @Autowired
    private UploadService uploadService;
//    @PostMapping("/upload")
//    public AjaxResult upload(HttpServletRequest request, MultipartFile image) {
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//        String filePath = sdf.format(new Date());
//
//        File baseFolder = new File(baseFolderPath + filePath);
//        if (!baseFolder.exists()) {
//            baseFolder.mkdirs();
//        }
//
//        StringBuffer url = new StringBuffer();
//        url.append(request.getScheme())
//                .append(":")
//                .append(request.getServerName())
//                .append(":")
//                .append(request.getServerPort())
//                .append(request.getContextPath())
//                .append("/")
//                .append(filePath);
//
//        String imgName = UUID.randomUUID().toString().replace("_", "") + "_" + image.getOriginalFilename().replaceAll(" ", "");
//        try {
//            File dest = new File(baseFolder, imgName);
//            image.transferTo(dest);
//            url.append("/").append(imgName);
//
//            JSONObject object = new JSONObject();
//            object.put("url", url);
//
//            return AjaxResult.success(object);
//        } catch (IOException e) {
//            log.error("文件上传错误 , uri: {} , caused by: ", request.getRequestURI(), e);
//            return AjaxResult.error("文件上传错误");
//        }
//    }

    /**
     * 头像上传
     * @param uploadForm
     * @return
     */
    @PostMapping("/avatar/upload")
    public AjaxResult avatarUpload(UploadForm uploadForm){
        return uploadService.avatarUpload(uploadForm.getFile(),uploadForm.getUserId());
    }


}
