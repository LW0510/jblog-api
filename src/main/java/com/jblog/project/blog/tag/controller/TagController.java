package com.jblog.project.blog.tag.controller;

import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.article.service.ArticleTagService;
import com.jblog.project.blog.tag.domain.TagEntity;
import com.jblog.project.blog.tag.domain.vo.TagVo;
import com.jblog.project.blog.tag.service.TagService;
import com.jblog.project.blog.validator.ValidatorUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;


/**
 * 标签表
 */
@Slf4j
@RestController
@RequestMapping("/tags")
public class TagController {
    public static final int HOT_ARTICLE_TAG_NUM = 4;
    @Autowired
    private TagService tagService;
    @Autowired
    private ArticleTagService articleTagService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public AjaxResult list() {
        List<TagEntity> tagEntities = tagService.selectList();
        return AjaxResult.success(tagEntities);
    }

    /**
     * 热门
     */
    @GetMapping("/hot")
    public AjaxResult hot() {
        List<Integer> tagIds = articleTagService.queryHotTagIds(HOT_ARTICLE_TAG_NUM);
        log.info("tagIds.size()={} {}", tagIds.size(), tagIds.toString());
        Integer[] tagIdsArray = new Integer[tagIds.size()];
        /*for (int i = 0; i < tagIds.size(); i++) {
            tagIdsArray[i] = tagIds.get(i);
        }*/
        List<TagEntity> tagEntities = tagService.queryHotTagDetails(tagIds.toArray(tagIdsArray));
        return AjaxResult.success(tagEntities);
    }

    /**
     * 查询标签详情
     */
    @GetMapping("/detail")
    public AjaxResult detail() {
        List<TagVo> tagVos = tagService.queryTagDetails();
        return AjaxResult.success(tagVos);
    }

    /**
     * 单条标签详情
     */
    @GetMapping("/detail/info")
    public AjaxResult detailById(@RequestParam("id") Integer tagId) {
        TagVo tagVo = tagService.queryOneTagDetail(tagId);
        return AjaxResult.success(tagVo);
    }


    /**
     * 保存
     */
    @RequestMapping("/save")
    public AjaxResult save(@RequestBody TagEntity tag) {
        tagService.insert(tag);

        return AjaxResult.success();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public AjaxResult update(@RequestBody TagEntity tag) {
        ValidatorUtils.validateEntity(tag);
//        全部更新
        tagService.updateById(tag);

        return AjaxResult.success();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public AjaxResult delete(@RequestBody Integer[] ids) {
        tagService.deleteBatchIds(Arrays.asList(ids));

        return AjaxResult.success();
    }

}
