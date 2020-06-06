package com.jblog.project.blog.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.jblog.framework.aspectj.lang.annotation.Excel;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author shadow
 *
 * @date 2018-07-04 15:00:54
 */
@Getter
@Setter
public class RecordEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/** id */
	private Long id;

	/** 创建人id */
	@Excel(name = "创建人id")
	private Long userId;

	/** 内容 */
	@Excel(name = "内容")
	private String content;

	/** 创建时间 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	@Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
	private Date createdAt;

}
