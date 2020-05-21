package com.jblog.project.blog.article.domain.form;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ArticleForm {

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
}
