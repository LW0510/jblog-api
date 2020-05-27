package com.jblog.project.blog.article.service.impl;


import com.github.pagehelper.PageInfo;
import com.jblog.project.blog.article.domain.ArticleTagEntity;
import com.jblog.project.blog.article.domain.form.ArticleForm;
import com.jblog.project.blog.article.mapper.ArticleTagMapper;
import com.jblog.project.blog.article.domain.ArticleEntity;
import com.jblog.project.blog.article.service.ArticleTagService;
import com.jblog.project.blog.tag.domain.TagEntity;
import com.jblog.project.blog.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 文章标签表
 *
 * @author shadow
 *
 * @date 2018-07-04 15:00:55
 */
@Service("articleTagService")
public class ArticleTagServiceImpl implements ArticleTagService {

    @Autowired
    private ArticleTagMapper articleTagMapper;

    @Override
    public List<ArticleTagEntity> queryPage(Map<String, Object> params) {
//        Page<ArticleTagEntity> page = this.selectPage(
//                new Query<ArticleTagEntity>(params).getPage(),
//                new EntityWrapper<>()
//        );
//
//        return new PageUtil(page);
        return articleTagMapper.queryArticleTagList();
    }

    /**
     * 查询最热标签
     *
     * @param limit
     * @return
     */
    @Override
    public List<Integer> queryHotTagIds(Integer limit){
        List<Integer> hotTagIds = articleTagMapper.queryHotTagIds(limit);
        return hotTagIds;
    }


    /**
     * 根据标签查询文章
     * @param articleForm
     * @return
     */
    @Override
    public PageUtil.TableDataInfo queryArticlesByTag(ArticleForm articleForm) {

        PageUtil.startMyPage(articleForm);
        PageInfo<ArticleEntity> pageInfo = new PageInfo<>(articleTagMapper.queryArticlesByTag(articleForm.getTagId()));
        PageUtil.TableDataInfo tableDataInfo = new PageUtil.TableDataInfo(pageInfo.getList(),pageInfo.getTotal());
        return tableDataInfo;
    }

    /**
     * 获取文章所有标签
     *
     * @param articleId
     * @return
     */
    @Override
    public List<TagEntity> queryArticleTags(Long articleId) {
        return articleTagMapper.queryArticleTags(articleId);
    }

    @Override
    public void insertBatch(List<ArticleTagEntity> articleTagEntityList) {
        articleTagMapper.insertBatch(articleTagEntityList);
    }
}
