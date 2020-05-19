package com.jblog.project.blog.article.service;

import com.jblog.project.blog.article.domain.ArticleEntity;
import com.jblog.project.blog.article.domain.ArticleTagEntity;
import com.jblog.project.blog.tag.domain.TagEntity;

import java.util.List;
import java.util.Map;

/**
 * //文章标签表
 */
public interface ArticleTagService {

    List<ArticleTagEntity> queryPage(Map<String, Object> params);

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
     * @param params
     * @return
     */
    List<ArticleEntity> queryArticlesByTag(Map<String, Object> params);

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
    void insertBatch(List<ArticleTagEntity> articleTagEntityList);

}

