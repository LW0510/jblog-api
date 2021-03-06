package com.jblog.project.blog.article.domain.form;

import com.jblog.project.blog.utils.PageUtil;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class ArticleForm extends PageUtil.PageCondition {

    private static final long serialVersionUID = 1L;

    private Long id;

    private Long userId;

    private String nickName;

    private String title;

    private String summary;

    private String content;

    private String contentHtml;

    private Integer viewNum;

    private Integer commentNum;

    private Integer weight;

    private String tags;

    private Integer categoryId;

    private Date createTime;

    private Date updateTime;

    private String status;

    private Integer tagId;

    private Integer year;

    private Integer month;


}
