package com.jblog.project.blog.article.controller;


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
import com.jblog.project.blog.utils.PageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


import java.util.List;

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
    public PageUtil.TableDataInfo list(ArticleForm articleForm) {

        if (articleForm.getTagId() != null) {
            PageUtil.TableDataInfo tableDataInfo = articleTagService.queryArticlesByTag(articleForm);
            return tableDataInfo;
        }
        PageUtil.TableDataInfo tableDataInfo = articleService.queryPage(articleForm);
        return tableDataInfo;
    }



    /**
     * 最热文章
     */
    @GetMapping("/hot")
    public PageUtil.TableDataInfo listHotArticles() {
        PageUtil.TableDataInfo tableDataInfo = articleService.getHotOrNewArticles("view_num", null);
        return tableDataInfo;
    }

    /**
     * 最新文章
     */
    @GetMapping("/new")
    public PageUtil.TableDataInfo listNewArticles(@RequestParam("userId") Long userId) {
        PageUtil.TableDataInfo tableDataInfo = articleService.getHotOrNewArticles("create_time",userId);
        return tableDataInfo;
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
        object.put("userId", article.getUserId());
        object.put("nickName", article.getNickName());
        object.put("content", article.getContent());
        object.put("viewNum",article.getViewNum());
        object.put("commentNum",article.getCommentNum());
        object.put("weight",article.getWeight());
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
     * 审核文章
     */
    @PreAuthorize("@ss.hasPermi('system:article:edit')")
    @PostMapping("/auditArticle")
    public AjaxResult auditArticle(@RequestParam("id") Long id,
                                   @RequestParam("status") String status)
    {
        return toAjax(articleService.auditArticle(id,status));
    }



    /**
     * 删除文章
     */
//    @PreAuthorize("@ss.hasPermi('system:article:delete')")
    @PostMapping("/deleteArticle")
    public AjaxResult delete(@RequestParam("id") Long id)
    {
        return toAjax(articleService.deleteOneArticle(id));
    }


    /**
     * 用户数、评论数、文章数、标签数统计
     */

    @GetMapping("/count")
    public AjaxResult count() {
        AjaxResult result = articleService.count();
        return result;
    }

}
