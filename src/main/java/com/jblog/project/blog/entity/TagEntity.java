package com.jblog.project.blog.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 标签表
 * 
 * @author liangfeihu
 * @email liangfhhd@163.com
 * @date 2018-07-04 15:00:54
 */
@Getter
@Setter
public class TagEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键ID
	 */
	//@TableId
	private Integer id;
	/**
	 * 标签名字
	 */
	private String tagName;
	/**
	 * 标签图标
	 */
	private String avatar;
	/**
	 * 创建时间
	 */
	private Date createTime;

}
