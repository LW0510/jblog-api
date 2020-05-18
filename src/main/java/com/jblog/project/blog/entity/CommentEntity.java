package com.jblog.project.blog.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 评论表
 */
@Getter
@Setter
public class CommentEntity implements Serializable {
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
	 * 文章ID
	 */
	private Long articleId;
	/**
	 * 评论内容
	 */
	private String content;
	/**
	 * 父评论Id
	 */
	private Long parentId;
	/**
	 * 评论的评论用户ID
	 */
	private Long toUid;
	/**
	 * 评论级别
	 */
	private String levelFlag;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date updateTime;


}
