package com.jblog.project.blog.comment.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jblog.common.exception.CustomException;
import com.jblog.common.utils.ServletUtils;
import com.jblog.common.utils.ip.AddressUtils;
import com.jblog.framework.security.LoginUser;
import com.jblog.framework.security.service.TokenService;
import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.comment.domain.CommentEntity;
import com.jblog.project.blog.comment.domain.vo.CommentVo;
import com.jblog.project.blog.comment.service.CommentService;
import com.jblog.project.blog.common.domain.vo.AuthorVo;
import com.jblog.project.blog.common.domain.vo.ChildCommentVo;
import com.jblog.project.blog.article.domain.ArticleEntity;
import com.jblog.project.blog.service.ArticleService;
import com.jblog.project.system.domain.SysUser;
import com.jblog.project.system.service.ISysUserService;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 评论表
 */
@RestController
@RequestMapping("/comments")
public class CommentController {
    private Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private CommentService commentService;
    @Autowired
    private ISysUserService userService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private TokenService tokenService;


    /**
     * 获取某篇文章的评论
     */
    @RequestMapping("/article/info")
    public AjaxResult info(@RequestParam("id") Long id) {

        String url = AddressUtils.getCurrApiAddress();
        List<CommentVo> commentVos = commentService.queryArticleComments(id);
        JSONArray array = new JSONArray();
        for (CommentVo vo : commentVos) {
            vo.setAvatar(url+"avatar/"+vo.getAvatar());
            JSONObject object = formatCommentInfo(vo);

//            EntityWrapper<CommentEntity> entityWrapper = new EntityWrapper<>();
//            entityWrapper.eq("article_id", vo.getArticleId());
//            entityWrapper.eq("parent_id", vo.getId());
//            int childCount = commentService.selectCount(entityWrapper);
            int childCount = commentService.selectCount(vo.getArticleId(),vo.getId());
            if (childCount <= 0) {
                object.put("childrens", new JSONArray());
            } else {
                List<CommentVo> commentVoList = commentService.queryChildrenComments(new ChildCommentVo(vo.getArticleId(), vo.getId()));
                object.put("childrens", formatChildCommentInfo(commentVoList));
            }
            array.add(object);
        }

        return AjaxResult.success(array);
    }


    /**
     * 格式化评论数据
     *
     * @param vo
     * @return
     */
    private JSONObject formatCommentInfo(CommentVo vo) {
        JSONObject object = new JSONObject();
        object.put("id", vo.getId());
        object.put("level", vo.getLevelFlag());
        object.put("content", vo.getContent());
        object.put("createDate", new DateTime(vo.getCreateTime()).toString("yyyy-MM-dd HH:mm:ss"));
        object.put("author", new AuthorVo(vo.getUserId(), vo.getAvatar(), vo.getNickname()));
        return object;
    }

    /**
     * 获取子评论信息
     *
     * @param commentVoList
     * @return
     */
    private JSONArray formatChildCommentInfo(List<CommentVo> commentVoList) {
        JSONArray array = new JSONArray();
        for (CommentVo vo : commentVoList) {
            JSONObject object = formatCommentInfo(vo);
            object.put("childrens", new JSONArray());
            if (vo.getToUid() != null) {
                SysUser sysUser = userService.selectUserById(vo.getToUid());
                object.put("toUser", new AuthorVo(sysUser.getUserId(), sysUser.getAvatar(), sysUser.getNickName()));
            }
            array.add(object);
        }
        return array;
    }


    /**
     * 发表评论
     */
    @PostMapping("/create/change")
    public AjaxResult save(@RequestBody JSONObject json) {
//        UserEntity userEntity = ShiroUtils.getUserEntity();
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());

        Long articleId = json.getJSONObject("article").getLong("id");
        ArticleEntity articleEntity = articleService.selectById(articleId);
        if (articleEntity == null) {
            throw new CustomException("参数有误");
        }
        JSONObject object = commentService.publishArticleComment(articleEntity, loginUser.getUser(), json);

        return AjaxResult.success(object);
    }


    /**
     * 列表
     */
    @RequestMapping("/list")
    public AjaxResult list(@RequestParam Map<String, Object> params) {
        List<CommentEntity> commentEntities = commentService.queryPage(params);

        AjaxResult result = new AjaxResult();
        result.put("page", commentEntities);
        return result;
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public AjaxResult delete(@RequestBody Long[] ids) {
        commentService.deleteBatchIds(Arrays.asList(ids));

        return AjaxResult.success();
    }

}
