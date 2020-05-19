package com.jblog.project.blog.comment.service;

import com.alibaba.fastjson.JSONObject;
import com.jblog.project.blog.comment.domain.CommentEntity;
import com.jblog.project.blog.comment.domain.vo.CommentVo;
import com.jblog.project.blog.common.domain.vo.ChildCommentVo;
import com.jblog.project.blog.article.domain.ArticleEntity;
import com.jblog.project.system.domain.SysUser;

import java.util.List;
import java.util.Map;

/**
 * 评论表
 */
public interface CommentService {

    List<CommentEntity> queryPage(Map<String, Object> params);

    /**
     * 获取文章评论信息
     *
     * @param articleId
     * @return
     */
    List<CommentVo> queryArticleComments(Long articleId);

    /**
     * 获取子评论信息
     *
     * @param dto
     * @return
     */
    List<CommentVo> queryChildrenComments(ChildCommentVo dto);

    /**
     * 发布文章评论
     *
     * @param articleEntity
     * @param userEntity
     * @param json
     * @return
     */
    JSONObject publishArticleComment(ArticleEntity articleEntity, SysUser userEntity, JSONObject json);

    int selectCount( Long articleId, Long id);

    Long deleteBatchIds(List<Long> asList);

}

