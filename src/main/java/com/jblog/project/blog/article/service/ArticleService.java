package com.jblog.project.blog.service;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jblog.project.blog.article.domain.ArticleEntity;
import com.jblog.project.blog.article.domain.form.ArticleForm;
import com.jblog.project.blog.article.domain.vo.ArticleArchivesVo;
import com.jblog.project.system.domain.SysUser;


import java.util.List;
import java.util.Map;

/**
 * 文章表
 *
 * @author shadow
 *
 * @date 2018-07-04 15:00:55
 */
public interface ArticleService{

    List<ArticleEntity> queryPage(Map<String, Object> params);

    /**
     * 发布文章按年-月汇总
     *
     * @param limit
     * @return
     */
    List<ArticleArchivesVo> queyArticleArchives(int limit);

    JSONArray getFormatArticleList(List<ArticleEntity> list);

    /**
     * 根据id获取文章，添加阅读数
     *
     * @param articleId
     * @return
     */
    JSONObject getArticleDetailAndAddViewNum(Long articleId);


    /**
     * 添加一篇新文章
     *
     * @param sysUser
     * @param json
     * @return
     */
    Long  addOneArticle(SysUser sysUser, JSONObject json);

    /**
     * 更新一篇文章
     *
     * @param sysUser
     * @param article
     * @param json
     * @return
     */
    Long updateOneArticle(SysUser sysUser, ArticleEntity article, JSONObject json);

    /**
     * 获取文章列表
     * @return
     */
    List selectList();


    /**
     * 获取最热或最新文章
     * type 可取 view_num 最热
     * create_time 最新
     *
     * @param type
     * @return
     */
    JSONArray getHotOrNewArticles(String type);


    /**
     * 通过文章Id获取文章详情
     * @param id
     * @return
     */
    ArticleEntity selectById(Long id);


    /**
     * 修改文章
     * @param articleForm
     * @return
     */
    int updateArticle(ArticleForm articleForm);

}

