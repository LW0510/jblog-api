package com.jblog.project.blog.article.domain.vo;

import com.jblog.project.blog.article.domain.ArticleEntity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HotArticleVo {

    private Long id;
    private String title;

    public HotArticleVo(){}

    public HotArticleVo(ArticleEntity articleEntity){
        this.id  = articleEntity.getId();
        this.title = articleEntity.getTitle();
    }
}
