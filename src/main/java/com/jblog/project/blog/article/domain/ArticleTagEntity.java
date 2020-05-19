package com.jblog.project.blog.article.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章标签表
 * 
 * @author shadow
 *
 * @date 2018-07-04 15:00:55
 */
@Getter
@Setter
public class ArticleTagEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键ID
	 */
	private Long id;
	/**
	 * 文章ID
	 */
	private Long articleId;
	/**
	 * 标签ID
	 */
	private Integer tagId;
	/**
	 * 创建时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date createTime;
	/**
	 * 更新时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date updateTime;

}
