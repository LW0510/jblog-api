package com.jblog.project.blog.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jblog.common.exception.CustomException;
import com.jblog.common.utils.ServletUtils;
import com.jblog.framework.security.LoginUser;
import com.jblog.framework.security.service.TokenService;
import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.entity.ArticleEntity;
import com.jblog.project.blog.service.ArticleService;
import com.jblog.project.blog.service.ArticleTagService;
import com.jblog.project.blog.service.CategoryService;
import com.jblog.project.blog.vo.ArticleArchivesVo;
import com.jblog.project.blog.vo.TagPageVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import java.util.Map;

/**
 * 文章表
 */
@Slf4j
@RestController
@RequestMapping("/article")
public class ArticleController {
    public static final int HOT_OR_NEW_ARTICLE_NUM = 6;
    public static final int ARTICLE_ARCHIVE_LIMIT_NUM = 8;

    @Autowired
    private ArticleService articleService;
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
    public AjaxResult list(Map<String, Object> params) {
        params.put("sidx", "view_num");
        params.put("order", "DESC");
        String tagIdStr = (String) params.get("tagId");
        if (StringUtils.isNotBlank(tagIdStr)) {
            Integer tagId = Integer.parseInt(tagIdStr);
            TagPageVo tagPageVo = getTagPageVo(params, tagId);
            List<ArticleEntity> articleEntities = articleTagService.queryArticlesByTag(tagPageVo);
            JSONArray array = articleService.getFormatArticleList(articleEntities);
            return AjaxResult.success(array);
        }

        List<ArticleEntity> list = articleService.queryPage(params);
        JSONArray array = articleService.getFormatArticleList(list);
        return AjaxResult.success(array);
    }

    /**
     * 构造分页参数
     *
     * @param params
     * @param tagId
     * @return
     */
    private TagPageVo getTagPageVo(Map<String, Object> params, Integer tagId) {
        Integer pageNo = 1;
        Integer pageSize = 10;
        //分页参数
        if (params.get("pageNo") != null) {
            pageNo = Integer.parseInt((String) params.get("pageNo"));
        }
        if (params.get("pageSize") != null) {
            pageSize = Integer.parseInt((String) params.get("pageSize"));
        }

        Integer offset = (pageNo - 1) * pageSize;
        TagPageVo tagPageVo = new TagPageVo(offset, pageSize, tagId);
        return tagPageVo;
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


}
