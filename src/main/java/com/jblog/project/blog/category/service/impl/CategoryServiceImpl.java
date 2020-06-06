package com.jblog.project.blog.category.service.impl;


import com.jblog.common.utils.ip.AddressUtils;
import com.jblog.project.blog.category.domain.CategoryEntity;
import com.jblog.project.blog.category.domain.vo.CategoryVo;
import com.jblog.project.blog.category.mapper.CategoryMapper;
import com.jblog.project.blog.category.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文章类别表
 *
 * @author shadow
 *
 * @date 2018-07-04 15:00:54
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public List<CategoryEntity> queryPage(CategoryEntity params) {

        String url = AddressUtils.getCurrApiAddress();
        List<CategoryEntity> categoryEntities = categoryMapper.queryCategoryList(params);
        for(CategoryEntity categoryEntity: categoryEntities){
            categoryEntity.setAvatar(
                    url+"profile/avatar/"+categoryEntity.getAvatar());
        }
        return categoryEntities;
    }

    /**
     * 文章分类详情
     *
     * @return
     */
    @Override
    public List<CategoryVo> queryCategoryDetails() {
        String url = AddressUtils.getCurrApiAddress();
        List<CategoryVo> categoryVoList = categoryMapper.queryCategoryDetails();
        for(CategoryVo categoryVo: categoryVoList){
            categoryVo.setAvatar(url+"profile/avatar/"+categoryVo.getAvatar());
        }
        return categoryVoList;
    }

    /**
     * 单条文章分类详情
     *
     * @return
     */
    @Override
    public CategoryVo queryOneCategoryDetail(Integer categoryId) {
        return categoryMapper.queryOneCategoryDetail(categoryId);
    }

    @Override
    public CategoryEntity selectById(Integer categoryId) {
        return categoryMapper.selectById(categoryId);
    }

    @Override
    public Integer insert(CategoryEntity category) {
        return categoryMapper.insert(category);
    }

    @Override
    public Integer updateById(CategoryEntity category) {
        return categoryMapper.updateById(category);
    }

    @Override
    public Integer deleteBatchIds(List<Integer> asList) {
        return categoryMapper.deleteBatchIds(asList);
    }
}
