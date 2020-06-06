package com.jblog.project.blog.article.mapper;

import com.jblog.project.blog.article.domain.ArticleEntity;
import com.jblog.project.blog.article.domain.form.ArticleForm;
import com.jblog.project.blog.article.domain.vo.ArticleArchivesVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 文章表
 *
 * @author shadow
 *
 * @date 2018-07-04 15:00:55
 */
@Mapper
public interface ArticleMapper {
    /**
     * 发布文章按年-月汇总
     *
     * @param limit
     * @return
     */
    List<ArticleArchivesVo> queyArticleArchives(int limit);

    List<ArticleEntity> queryArticleList(ArticleForm articleForm);

    ArticleEntity selectById(Long articleId);

    List<ArticleEntity> queryArticleListByUserId(@Param("userId") Long userId);

    int updateArticle(ArticleEntity article);

    Long insert(ArticleEntity article);

    Long deleteById(Long id);

    int auditArticle(@Param("id") Long id, @Param("status") String status);

    Integer getUserCount();

    Integer getCommentCount();

    Integer getArticleCount();

    Integer getTagCount();
}

