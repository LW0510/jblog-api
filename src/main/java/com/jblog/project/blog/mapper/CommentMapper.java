package com.jblog.project.blog.mapper;

import com.jblog.project.blog.dto.ChildCommentDto;
import com.jblog.project.blog.entity.CommentEntity;
import com.jblog.project.blog.vo.CommentVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 评论表
 */
@Mapper
public interface CommentMapper{


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
    List<CommentVo> queryChildrenComments(ChildCommentDto dto);


    List<CommentEntity> queryCommentList(Map<String, Object> params);

    Long insert(CommentEntity comment);

    int selectCount(@Param("articleId") Long articleId, @Param("id") Long id);

    Long deleteBatchIds(List<Long> asList);

}

