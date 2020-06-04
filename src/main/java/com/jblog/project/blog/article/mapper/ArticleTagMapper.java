package com.jblog.project.blog.article.mapper;


import com.jblog.project.blog.article.domain.ArticleEntity;
import com.jblog.project.blog.article.domain.ArticleTagEntity;
import com.jblog.project.blog.tag.domain.TagEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 文章标签表
 */
@Mapper
public interface ArticleTagMapper{

    /**
     * 查询最热标签
     *
     * @param limit
     * @return
     */
    List<Integer> queryHotTagIds(Integer limit);

    /**
     * 根据标签查询文章
     *
     * @param tagId
     * @return
     */
    List<ArticleEntity> queryArticlesByTag(@Param("tagId") Integer tagId);

    /**
     * 获取文章所有标签
     *
     * @param articleId
     * @return
     */
    List<TagEntity> queryArticleTags(Long articleId);

    /**
     * 批量插入 articleTag
     * @param articleTagEntityList
     */
    void insertBatch(@Param("articleTagList") List<ArticleTagEntity> articleTagEntityList);


    List<ArticleTagEntity> queryArticleTagList();


    /**
     * 删除文章与标签的关系
     * @param articleId
     */
    int deleteArticleTag(@Param("articleId") Long articleId);

}

