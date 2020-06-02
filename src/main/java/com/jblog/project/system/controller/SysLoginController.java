package com.jblog.project.system.controller;

import java.io.File;
import java.util.List;
import java.util.Set;

import com.jblog.common.utils.ip.AddressUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.jblog.common.constant.Constants;
import com.jblog.common.utils.ServletUtils;
import com.jblog.framework.security.LoginBody;
import com.jblog.framework.security.LoginUser;
import com.jblog.framework.security.service.SysLoginService;
import com.jblog.framework.security.service.SysPermissionService;
import com.jblog.framework.security.service.TokenService;
import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.system.domain.SysMenu;
import com.jblog.project.system.domain.SysUser;
import com.jblog.project.system.service.ISysMenuService;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * 登录验证
 * 
 * @author jblog
 */
@RestController
public class SysLoginController
{
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private SysPermissionService permissionService;

    @Autowired
    private TokenService tokenService;

    /**
     * 登录方法
     * 
     * @param username 用户名
     * @param password 密码
     * @param captcha 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(LoginBody loginBody)
    {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     * 
     * @return 用户信息
     */
    @GetMapping("/getInfo")
    public AjaxResult getInfo()
    {

        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        SysUser user = loginUser.getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        user.setAvatar(AddressUtils.getCurrApiAddress() + "profile/avatar/"+user.getAvatar());
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);

        return ajax;
    }

    /**
     * 获取路由信息
     * 
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        // 用户信息
        SysUser user = loginUser.getUser();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(user.getUserId());
        return AjaxResult.success(menuService.buildMenus(menus));
    }
}
