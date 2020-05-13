package com.jblog.project.blog.mapper;


import com.jblog.project.blog.entity.CategoryEntity;
import com.jblog.project.blog.vo.CategoryVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 文章类别表
 */
@Mapper
public interface CategoryMapper {
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


    List<CategoryEntity> queryCategoryList(Map<String, Object> params);


    Integer insert(CategoryEntity category);

    Integer updateById(CategoryEntity category);

    Integer deleteBatchIds(List<Integer> asList);

}

