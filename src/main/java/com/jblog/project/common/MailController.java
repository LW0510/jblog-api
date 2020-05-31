package com.jblog.project.common;

import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.user.service.UserService;
import com.jblog.project.system.domain.SysUser;
import com.jblog.project.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailController {

    @Autowired
    private UserService userService;
    @Autowired
    private SysUserMapper userMapper;


    /**
     * 发送邮箱认证码
     * @param mail
     * @return
     */
    @GetMapping("/sendMailCode")
    public AjaxResult sendMailCode(@RequestParam("mail")String mail){
        SysUser user = userMapper.selectUserByEmail(mail);
        if(user == null){
            return AjaxResult.error("邮箱不存在");
        }
        AjaxResult ajaxResult = AjaxResult.success();
        String uuid = userService.sendMailCode(mail);
        ajaxResult.put("uuid",uuid);
        return ajaxResult;
    }
}
