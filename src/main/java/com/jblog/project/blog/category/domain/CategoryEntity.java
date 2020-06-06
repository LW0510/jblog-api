package com.jblog.project.blog.category.domain;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章类别表
 * 
 * @author shadow
 *
 * @date 2018-07-04 15:00:54
 */
@Getter
@Setter
public class CategoryEntity  {


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
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date createTime;

}
