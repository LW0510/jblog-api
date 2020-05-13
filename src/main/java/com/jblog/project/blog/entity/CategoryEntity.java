package com.jblog.project.blog.entity;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章类别表
 * 
 * @author liangfeihu
 * @email liangfhhd@163.com
 * @date 2018-07-04 15:00:54
 */
@Getter
@Setter
public class CategoryEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键ID
	 */
	//@TableId
	private Integer id;
	/**
	 * 类别名字
	 */
	private String categoryName;
	/**
	 * 类别图标
	 */
	private String avatar;
	/**
	 * 分类描述
	 */
	private String description;
	/**
	 * 创建时间
	 */
	private Date createTime;

}
