package com.jblog.project.blog.entity;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户表
 * 
 * @author liangfeihu
 * @email liangfhhd@163.com
 * @date 2018-07-04 15:00:54
 */
@Getter
@Setter
public class UserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键ID
	 */
	//@TableId
	private Long id;
	/**
	 * 登录账号
	 */
//	@NotBlank
	private String account;
	/**
	 * 密码
	 */
//    @NotBlank
	private String password;
	/**
	 * 盐
	 */
	private String salt;
	/**
	 * 邮箱
	 */
	private String email;
	/**
	 * 手机号
	 */
	private String phone;
	/**
	 * 上次登录时间
	 */
	private Date lastLoginTime;
	/**
	 * 用户昵称
	 */
	private String nickname;
	/**
	 * 用户头像
	 */
	private String avatar;
	/**
	 * 是否admin，0不是，1是
	 */
	private Integer admin;
	/**
	 * 用户状态
	 */
	private String status;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新时间
	 */
	private Date updateTime;

}
