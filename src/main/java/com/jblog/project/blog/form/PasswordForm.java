package com.jblog.project.blog.form;

import lombok.Getter;
import lombok.Setter;

/**
 * 密码表单
 *
 * @author shadow@163.com
 * @since  2018-01-25
 */
@Getter
@Setter
public class PasswordForm {
    /**
     * 原密码
     */
    private String password;
    /**
     * 新密码
     */
    private String newPassword;


}
