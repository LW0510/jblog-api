package com.weiframework.project.system.controller;

import com.weiframework.common.utils.SecurityUtils;
import com.weiframework.framework.web.controller.BaseController;
import com.weiframework.framework.web.domain.AjaxResult;
import com.weiframework.project.system.domain.SysUser;
import com.weiframework.project.system.service.ISysRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户注册
 *
 * @author ghc
 */
@RestController
public class SysRegisterController extends BaseController {

    @Autowired
    private ISysRegisterService registerService;

    @PostMapping("/register")
    public AjaxResult login(String username, String password)
    {
        AjaxResult ajax = AjaxResult.success();

        SysUser user = new SysUser();
        user.setUserName(username);
        user.setNickName(username);
        user.setPassword(SecurityUtils.encryptPassword(password));
        int result = registerService.registerUser(user);

        return ajax;
    }
}
