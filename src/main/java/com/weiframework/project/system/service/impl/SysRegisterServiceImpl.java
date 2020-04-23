package com.weiframework.project.system.service.impl;

import com.weiframework.project.system.domain.SysUser;
import com.weiframework.project.system.mapper.SysUserMapper;
import com.weiframework.project.system.service.ISysRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户注册 业务层处理
 *
 * @author ghc
 */
@Service
public class SysRegisterServiceImpl implements ISysRegisterService {

    @Autowired
    private SysUserMapper userMapper;

    @Override
    public int registerUser(SysUser user) {

        // 新增用户信息
        int rows = userMapper.insertUser(user);

        return rows;
    }

}
