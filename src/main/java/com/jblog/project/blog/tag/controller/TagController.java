package com.jblog.project.blog.tag.controller;

import com.jblog.framework.web.controller.BaseController;
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
import java.util.prefs.BackingStoreException;


/**
 * 标签表
 */
@Slf4j
@RestController
@RequestMapping("/tags")
public class TagController extends BaseController {
    public static final int HOT_ARTICLE_TAG_NUM = 4;
    @Autowired
    private TagService tagService;
    @Autowired
    private ArticleTagService articleTagService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public AjaxResult list(TagEntity tagEntity) {
        List<TagEntity> tagEntities = tagService.selectList(tagEntity);
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
     * id查询标签
     */
    @GetMapping("/getTagById")
    public AjaxResult getTagById(@RequestParam("id") Integer id) {
        TagEntity tagEntity = tagService.getTagById(id);
        return AjaxResult.success(tagEntity);
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
    public AjaxResult save(TagEntity tag) {
        tagService.insert(tag);

        return AjaxResult.success();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public AjaxResult update(TagEntity tag) {
//        ValidatorUtils.validateEntity(tag);
//        全部更新
        tagService.updateById(tag);

        return AjaxResult.success();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public AjaxResult delete(@RequestParam("id") Integer id) {
        tagService.deleteBatchIds(Arrays.asList(new Integer[]{id}));

        return AjaxResult.success();
    }

}
