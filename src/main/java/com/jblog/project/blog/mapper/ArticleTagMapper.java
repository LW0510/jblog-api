package com.jblog.project.blog.mapper;


import com.jblog.project.blog.entity.ArticleEntity;
import com.jblog.project.blog.entity.ArticleTagEntity;
import com.jblog.project.blog.entity.TagEntity;
import com.jblog.project.blog.vo.TagPageVo;
import org.apache.ibatis.annotations.Mapper;

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
     * @param tagPageVo
     * @return
     */
    List<ArticleEntity> queryArticlesByTag(TagPageVo tagPageVo);

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


    List<ArticleTagEntity> queryArticleTagList();
}

