package com.jblog.project.blog.comment.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jblog.project.blog.article.mapper.ArticleMapper;
import com.jblog.project.blog.comment.domain.CommentEntity;
import com.jblog.project.blog.comment.domain.vo.CommentVo;
import com.jblog.project.blog.comment.mapper.CommentMapper;
import com.jblog.project.blog.comment.service.CommentService;
import com.jblog.project.blog.common.domain.vo.AuthorVo;
import com.jblog.project.blog.common.domain.vo.ChildCommentVo;
import com.jblog.project.blog.article.domain.ArticleEntity;
import com.jblog.project.blog.service.ArticleService;
import com.jblog.project.system.domain.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 评论表
 *
 * @author shadow
 *
 * @date 2018-07-04 15:00:54
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<CommentEntity> queryPage(Map<String, Object> params) {
//        Page<CommentEntity> page = this.selectPage(
//                new Query<CommentEntity>(params).getPage(),
//                new EntityWrapper<CommentEntity>()
//        );
//
//        return new PageUtils(page);
        return commentMapper.queryCommentList(params);
    }

    /**
     * 获取文章评论信息
     *
     * @param articleId
     * @return
     */
    @Override
    public List<CommentVo> queryArticleComments(Long articleId) {
        return commentMapper.queryArticleComments(articleId);
    }

    /**
     * 获取子评论信息
     *
     * @param dto
     * @return
     */
    @Override
    public List<CommentVo> queryChildrenComments(ChildCommentVo dto) {
        return commentMapper.queryChildrenComments(dto);
    }

    /**
     * 发布文章评论
     *
     * @param articleEntity
     * @param userEntity
     * @param json
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public JSONObject publishArticleComment(ArticleEntity articleEntity, SysUser userEntity, JSONObject json) {
        // 1、更新文章评论数+1
        articleEntity.setCommentNum(articleEntity.getCommentNum() + 1);
        articleMapper.updateArticle(articleEntity);

        // 2、插入一条文章评论
        CommentEntity comment = new CommentEntity();
        comment.setArticleId(articleEntity.getId());
        comment.setContent(json.getString("content"));
        comment.setCreateTime(new Date());
        comment.setUpdateTime(new Date());
        comment.setUserId(userEntity.getUserId());

        // 3、设置文章评论级别 level_flag
        //    为0:评论文章;1:评论某人评论;2:回复某人评论
        JSONObject parent = json.getJSONObject("parent");
        JSONObject toUser = json.getJSONObject("toUser");
        if (parent != null) {
            comment.setParentId(parent.getLong("id"));
            if (toUser != null) {
                comment.setLevelFlag("2");
                comment.setToUid(toUser.getLong("id"));
            } else {
                comment.setLevelFlag("1");
            }
        } else {
            comment.setLevelFlag("0");
        }
        commentMapper.insert(comment);

        // 4、返回评论数据
        JSONObject object = new JSONObject();
        object.put("id", comment.getId());
        object.put("level", comment.getLevelFlag());
        object.put("content", comment.getContent());
        object.put("createDate", comment.getCreateTime().getTime());
        object.put("author", new AuthorVo(comment.getUserId(), userEntity.getAvatar(), userEntity.getNickName()));
        if (toUser != null) {
            object.put("toUser", toUser);
        }
        if (parent != null) {
            object.put("parent", parent);
        }

        return object;
    }

    @Override
    public int selectCount(Long articleId, Long id) {
        return commentMapper.selectCount(articleId,id);

    }

    @Override
    public Long deleteBatchIds(List<Long> asList) {
        return commentMapper.deleteBatchIds(asList);
    }
}
