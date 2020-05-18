package com.jblog.project.blog.article.domain.vo;


import lombok.Getter;
import lombok.Setter;

/**
 * Created by shadow on 2018/7/7.
 */

@Getter
@Setter
public class ArticleArchivesVo {
    private String year;
    private String month;
    private Integer count;

}
