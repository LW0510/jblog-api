package com.jblog.project.blog.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jblog.common.utils.StringUtils;
import com.jblog.project.blog.mapper.ArticleTagMapper;
import com.jblog.project.blog.entity.ArticleEntity;
import com.jblog.project.blog.entity.ArticleTagEntity;
import com.jblog.project.blog.entity.TagEntity;
import com.jblog.project.blog.service.ArticleTagService;
import com.jblog.project.blog.utils.PageUtils;
import com.jblog.project.blog.vo.PageCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 文章标签表
 *
 * @author shadow
 * @email liangfhhd@163.com
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
//        return new PageUtils(page);
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
     *
     * @param params
     * @return
     */
    @Override
    public List<ArticleEntity> queryArticlesByTag(Map<String, Object> params) {

        PageUtils.startMyPage(params);
        PageInfo<ArticleEntity> pageInfo = new PageInfo<>(articleTagMapper.queryArticlesByTag((Integer) params.get("tagId")));
        return pageInfo.getList();
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
