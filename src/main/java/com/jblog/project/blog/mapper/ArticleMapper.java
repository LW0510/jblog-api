package com.jblog.project.blog.mapper;

import com.jblog.project.blog.entity.ArticleEntity;
import com.jblog.project.blog.vo.ArticleArchivesVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 文章表
 *
 * @author liangfeihu
 * @email liangfhhd@163.com
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

    List<ArticleEntity> queryArticleList(Map<String, Object> params);

    ArticleEntity selectById(Long articleId);

    List selectList();

    Long updateById(ArticleEntity article);

    Long insert(ArticleEntity article);

    Long deleteById(Long id);

}

