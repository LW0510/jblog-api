package com.jblog.project.blog.controller;


import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.entity.CategoryEntity;
import com.jblog.project.blog.service.CategoryService;
import com.jblog.project.blog.validator.ValidatorUtils;
import com.jblog.project.blog.vo.CategoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.Arrays;
import java.util.List;


/**
 * 文章类别表
 */
@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public AjaxResult list() {
        List<CategoryEntity> categoryEntityList = categoryService.queryPage(null);
        return AjaxResult.success(categoryEntityList);
    }

    /**
     * 分类详情
     */
    @GetMapping("/detail")
    public AjaxResult detail() {
        List<CategoryVo> categoryVos = categoryService.queryCategoryDetails();
        return AjaxResult.success(categoryVos);
    }

    /**
     * 单条分类详情
     */
    @GetMapping("/detail/info")
    public AjaxResult detailById(@RequestParam("categoryId") Integer categoryId) {
        CategoryVo categoryVo = categoryService.queryOneCategoryDetail(categoryId);
        return AjaxResult.success(categoryVo);
    }


    /**
     * 保存
     */
    @RequestMapping("/save")
    public AjaxResult save(@RequestBody CategoryEntity category) {
        categoryService.insert(category);

        return AjaxResult.success();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public AjaxResult update(@RequestBody CategoryEntity category) {
        ValidatorUtils.validateEntity(category);
//        全部更新
        categoryService.updateById(category);

        return AjaxResult.success();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public AjaxResult delete(@RequestBody Integer[] ids) {
        categoryService.deleteBatchIds(Arrays.asList(ids));

        return AjaxResult.success();
    }

}