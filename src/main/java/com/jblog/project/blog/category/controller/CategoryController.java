package com.jblog.project.blog.category.controller;


import com.jblog.common.utils.ip.AddressUtils;
import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.category.domain.CategoryEntity;
import com.jblog.project.blog.category.domain.vo.CategoryVo;
import com.jblog.project.blog.category.service.CategoryService;
import com.jblog.project.blog.validator.ValidatorUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.io.File;
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
    public AjaxResult detailById(@RequestParam("id") Integer categoryId) {
        String url = AddressUtils.getCurrApiAddress();
        CategoryVo categoryVo = categoryService.queryOneCategoryDetail(categoryId);
        categoryVo.setAvatar(url+"profile/avatar/"+categoryVo.getAvatar());
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
