package com.weiframework.project.system.service;

import com.weiframework.project.system.domain.SysUser;

/**
 * 用户注册 业务层
 *
 * @author ghc
 */
public interface ISysRegisterService {

    /**
     * 注册新用户
     *
     * @param user 用户信息
     * @return 结果
     **/
    public int registerUser(SysUser user);
}
