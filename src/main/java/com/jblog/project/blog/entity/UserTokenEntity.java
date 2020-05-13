package com.jblog.project.blog.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 系统用户Token
 * 
 * @author liangfeihu
 * @email liangfhhd@163.com
 * @date 2018-07-04 15:00:54
 */
@Getter
@Setter
public class UserTokenEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键ID
	 */
	//@TableId
	private Long id;
	/**
	 * 用户ID
	 */
	private Long userId;
	/**
	 * token
	 */
	private String token;
	/**
	 * 过期时间
	 */
	private Date expireTime;
	/**
	 * 更新时间
	 */
	private Date updateTime;
	/**
	 * 创建时间
	 */
	private Date createTime;
}
