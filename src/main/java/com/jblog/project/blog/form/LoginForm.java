package com.jblog.project.blog.form;

import lombok.Getter;
import lombok.Setter;

/**
 * 登录表单
 *
 * @author liangfeihu@163.com
 * @since 2018-01-25
 */
@Getter
@Setter
public class LoginForm {
    private String username;
    private String password;
    private String captcha;
    private String uuid;


}