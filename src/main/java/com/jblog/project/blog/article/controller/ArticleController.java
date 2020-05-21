package com.jblog.project.blog.article.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jblog.common.exception.CustomException;
import com.jblog.common.utils.ServletUtils;
import com.jblog.framework.security.LoginUser;
import com.jblog.framework.security.service.TokenService;
import com.jblog.framework.web.controller.BaseController;
import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.article.domain.ArticleEntity;
import com.jblog.project.blog.article.domain.form.ArticleForm;
import com.jblog.project.blog.article.domain.vo.ArticleArchivesVo;
import com.jblog.project.blog.article.service.ArticleTagService;
import com.jblog.project.blog.category.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文章表
 */
@Slf4j
@RestController
@RequestMapping("/article")
public class ArticleController extends BaseController {
    public static final int HOT_OR_NEW_ARTICLE_NUM = 6;
    public static final int ARTICLE_ARCHIVE_LIMIT_NUM = 8;

    @Autowired
    private com.jblog.project.blog.service.ArticleService articleService;
    @Autowired
    private ArticleTagService articleTagService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private TokenService tokenService;

    /**
     * 列表 分页查询
     */
    @GetMapping("/list")
    public AjaxResult list(@RequestParam(value = "pageNum",required = false) Integer pageNum,
                           @RequestParam(value = "pageSize",required = false) Integer pageSize,
                           @RequestParam(value = "orderField",required = false) String orderField,
                           @RequestParam(value = "order",required = false) String order,
                           @RequestParam(value = "tagId",required = false) Integer tagId,
                           @RequestParam(value = "categoryId",required = false) Integer categoryId) {

        Map<String,Object> params = new HashMap<>(16);
        params.put("pageNum",pageNum);
        params.put("pageSize",pageSize);
        params.put("orderField",orderField);
        params.put("order",order);
        params.put("categoryId",categoryId);
        if (tagId != null) {
            params.put("tagId",tagId);
            List<ArticleEntity> articleEntities = articleTagService.queryArticlesByTag(params);
            JSONArray array = articleService.getFormatArticleList(articleEntities);
            return AjaxResult.success(array);
        }

        List<ArticleEntity> list = articleService.queryPage(params);
        JSONArray array = articleService.getFormatArticleList(list);
        return AjaxResult.success(array);
    }


    /**
     * 最热文章
     */
    @GetMapping("/hot")
    public AjaxResult listHotArticles() {
        JSONArray array = articleService.getHotOrNewArticles("view_num");
        return AjaxResult.success(array);
    }

    /**
     * 最新文章
     */
    @GetMapping("/new")
    public AjaxResult listNewArticles() {
        JSONArray array = articleService.getHotOrNewArticles("create_time");
        return AjaxResult.success(array);
    }


    /**
     * 汇总查询
     */
    @GetMapping("/archives")
    public AjaxResult archives() {
        List<ArticleArchivesVo> archivesVos = articleService.queyArticleArchives(ARTICLE_ARCHIVE_LIMIT_NUM);
        return AjaxResult.success(archivesVos);
    }

    /**
     * 查看文章详情时：
     * 获取文章详情
     * 包含作者信息
     * <p>
     * 要增加文章阅读数
     */
    @GetMapping("/view")
    public AjaxResult oneArticleInfo(@RequestParam("id") Long id) {
        JSONObject detailAndAddViewNum = articleService.getArticleDetailAndAddViewNum(id);
        return AjaxResult.success(detailAndAddViewNum);
    }


    /**
     * 编辑文章时：
     * 通过文章Id获取文章详情
     * 不需要用户信息
     */
    @GetMapping("/getArticle")
    public AjaxResult getArticleById(@RequestParam("id") Long id) {
        ArticleEntity article = articleService.selectById(id);
        JSONObject object = new JSONObject();
        object.put("id", article.getId());
        object.put("title", article.getTitle());
        object.put("summary", article.getSummary());
        object.put("content", article.getContent());

        object.put("category", categoryService.selectById(article.getCategoryId()));
        object.put("tags", articleTagService.queryArticleTags(article.getId()));

        return AjaxResult.success(object);
    }

    /**
     * 文章编辑与新增
     */
    @PostMapping("/publish")
    public AjaxResult save(@RequestBody JSONObject json) {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        Long id = json.getLong("id");
        if (id != null) {
            //编辑文章
            ArticleEntity article = articleService.selectById(id);
            if (article == null) {
                throw new CustomException("参数错误");
            }
            articleService.updateOneArticle(loginUser.getUser(), article, json);
        } else {
            //新增文章
            id = articleService.addOneArticle(loginUser.getUser(), json);
        }

        JSONObject object = new JSONObject();
        object.put("articleId", id);
        return AjaxResult.success(object);
    }

    /**
     * 修改文章
     */
    @PreAuthorize("@ss.hasPermi('system:article:edit')")
    @PostMapping("updateArticle")
    public AjaxResult edit(@RequestBody ArticleForm articleForm)
    {
        return toAjax(articleService.updateArticle(articleForm));
    }


}
