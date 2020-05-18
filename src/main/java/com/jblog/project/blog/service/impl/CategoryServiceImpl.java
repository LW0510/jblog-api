package com.jblog.project.blog.service.impl;


import com.jblog.common.utils.ip.AddressUtils;
import com.jblog.project.blog.mapper.CategoryMapper;
import com.jblog.project.blog.entity.CategoryEntity;
import com.jblog.project.blog.service.CategoryService;
import com.jblog.project.blog.vo.CategoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 文章类别表
 *
 * @author shadow
 * @email liangfhhd@163.com
 * @date 2018-07-04 15:00:54
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public List<CategoryEntity> queryPage(Map<String, Object> params) {
//        Page<CategoryEntity> page = this.selectPage(
//                new Query<CategoryEntity>(params).getPage(),
//                new EntityWrapper<>()
//        );

//        return new PageUtils(page);
        String url = AddressUtils.getCurrApiAddress();
        List<CategoryEntity> categoryEntities = categoryMapper.queryCategoryList(params);
        for(CategoryEntity categoryEntity: categoryEntities){
            categoryEntity.setAvatar(url+"avatar/"+categoryEntity.getAvatar());
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
            categoryVo.setAvatar(url+"avatar/"+categoryVo.getAvatar());
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
