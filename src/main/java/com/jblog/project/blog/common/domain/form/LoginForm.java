package com.jblog.project.blog.common.domain.form;

import lombok.Getter;
import lombok.Setter;

/**
 * 登录表单
 *
 * @author shadow@163.com
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
