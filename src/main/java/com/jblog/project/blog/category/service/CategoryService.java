package com.jblog.project.blog.category.service;

import com.jblog.project.blog.category.domain.CategoryEntity;
import com.jblog.project.blog.category.domain.vo.CategoryVo;

import java.util.List;
import java.util.Map;

/**
 * 文章类别表
 */
public interface CategoryService {

    List<CategoryEntity> queryPage(Map<String, Object> params);

    /**
     * 文章分类详情
     *
     * @return
     */
    List<CategoryVo> queryCategoryDetails();

    /**
     * 单条文章分类详情
     *
     * @return
     */
    CategoryVo queryOneCategoryDetail(Integer categoryId);

    CategoryEntity selectById(Integer categoryId);

    Integer insert(CategoryEntity category);

    Integer updateById(CategoryEntity category);

    Integer deleteBatchIds(List<Integer> asList);

}

