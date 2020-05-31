package com.jblog.project.blog.user.controller;

import com.jblog.common.constant.UserConstants;
import com.jblog.common.utils.SecurityUtils;
import com.jblog.common.utils.ServletUtils;
import com.jblog.framework.aspectj.lang.annotation.Log;
import com.jblog.framework.aspectj.lang.enums.BusinessType;
import com.jblog.framework.security.LoginUser;
import com.jblog.framework.security.service.TokenService;
import com.jblog.framework.web.controller.BaseController;
import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.user.service.UserService;
import com.jblog.project.system.domain.SysRole;
import com.jblog.project.system.domain.SysUser;
import com.jblog.project.system.service.ISysRoleService;
import com.jblog.project.system.service.ISysUserService;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@RestController
@RequestMapping("/system/user")
public class UserController extends BaseController {

    @Autowired
    private ISysUserService iSysUserService;
    @Autowired
    private ISysRoleService roleService;
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;

    /**
     * 前台用户注册
     */
//    @PreAuthorize("@ss.hasPermi('system:user:add')")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping("/register")
    public AjaxResult add(@RequestBody SysUser user)
    {
        if (UserConstants.NOT_UNIQUE.equals(iSysUserService.checkUserNameUnique(user.getUserName())))
        {
            return AjaxResult.error("新增用户'" + user.getUserName() + "'失败，登录账号已存在");
        }
        else if (UserConstants.NOT_UNIQUE.equals(iSysUserService.checkPhoneUnique(user)))
        {
            return AjaxResult.error("新增用户'" + user.getUserName() + "'失败，手机号码已存在");
        }
        else if (UserConstants.NOT_UNIQUE.equals(iSysUserService.checkEmailUnique(user)))
        {
            return AjaxResult.error("新增用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        user.setAvatar("avatar.png");
        user.setNickName(user.getUserName());
        user.setCreateBy(user.getUserName());
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));

        //默认添加普通角色
        SysRole common = roleService.selectRoleByRoleKey("common");
        user.setRoleIds(new Long[]{common.getRoleId()});
        return toAjax(iSysUserService.insertUser(user));
    }


    /**
     * 找回密码
     * @param mail
     * @param newPwd
     * @param code
     * @param uuid
     * @return
     */
    @PostMapping("/retrievePassword")
    public AjaxResult retrievePassword(@RequestParam("email") String mail,
                                       @RequestParam("password") String newPwd,
                                       @RequestParam("code") String code,
                                       @RequestParam("uuid") String uuid){

        userService.retrievePassword(mail,newPwd,code,uuid);
        return AjaxResult.success("密码修改成功！账号密码已发送至邮箱！");
    }


    /**
     * 获取当前登录用户信息
     * @return
     */
    @GetMapping("/currUser")
    public AjaxResult getCurrUser(){

        HttpServletRequest request = ServletUtils.getRequest();
        LoginUser currUser = tokenService.getLoginUser(request);
        return AjaxResult.success(currUser);
    }

}
