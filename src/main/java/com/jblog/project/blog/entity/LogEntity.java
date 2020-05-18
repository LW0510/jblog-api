package com.jblog.project.blog.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户操作日志表
 * 
 * @author shadow
 * @email liangfhhd@163.com
 * @date 2018-07-04 15:00:54
 */
@Getter
@Setter
public class LogEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键ID
	 */
	//@TableId
	private Long id;
	/**
	 * 创建时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date createTime;
	/**
	 * 访问Ip
	 */
	private String ip;
	/**
	 * 操作模块
	 */
	private String module;
	/**
	 * 访问方法
	 */
	private String method;
	/**
	 * 方法参数
	 */
	private String params;
	/**
	 * 操作人昵称
	 */
	private String nickname;
	/**
	 * 操作事项
	 */
	private String operation;
	/**
	 * 操作耗时
	 */
	private Long time;
	/**
	 * 操作用户userId
	 */
	private Long userId;

}
