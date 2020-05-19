package com.jblog.project.blog.tag.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 标签表
 * 
 * @author shadow
 *
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
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date createTime;

}
