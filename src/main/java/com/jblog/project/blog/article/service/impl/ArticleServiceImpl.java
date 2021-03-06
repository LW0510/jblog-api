package com.jblog.project.blog.article.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Joiner;
import com.jblog.common.exception.CustomException;
import com.jblog.common.utils.DateUtils;
import com.jblog.common.utils.ip.AddressUtils;
import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.article.domain.ArticleEntity;
import com.jblog.project.blog.article.domain.ArticleTagEntity;
import com.jblog.project.blog.article.domain.form.ArticleForm;
import com.jblog.project.blog.article.domain.vo.HotArticleVo;
import com.jblog.project.blog.article.mapper.ArticleMapper;
import com.jblog.project.blog.article.mapper.ArticleTagMapper;
import com.jblog.project.blog.article.service.ArticleTagService;
import com.jblog.project.blog.category.domain.CategoryEntity;
import com.jblog.project.blog.category.service.CategoryService;
import com.jblog.project.blog.tag.domain.TagEntity;
import com.jblog.project.blog.tag.service.TagService;
import com.jblog.project.blog.utils.PageUtil;
import com.jblog.project.blog.article.domain.vo.ArticleArchivesVo;
import com.jblog.project.system.domain.SysUser;
import com.jblog.project.system.service.ISysUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

import static com.jblog.project.blog.article.controller.ArticleController.HOT_OR_NEW_ARTICLE_NUM;

/**
 * 文章表
 *
 * @author shadow
 *
 * @date 2018-07-04 15:00:55
 */
@Service
public class ArticleServiceImpl implements com.jblog.project.blog.service.ArticleService {

    @Autowired
    private ISysUserService userService;
    @Autowired
    private ArticleTagService articleTagService;
    @Autowired
    private TagService tagService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    private ArticleTagMapper articleTagMapper;


    @Override
    public PageUtil.TableDataInfo queryPage(ArticleForm articleForm) {
        PageUtil.startMyPage(articleForm);
        PageInfo<ArticleEntity> pageInfo = new PageInfo<>(articleMapper.queryArticleList(articleForm));
        //初始化文章标签
        for(ArticleEntity articleEntity : pageInfo.getList()){
            List<String> tags = new ArrayList<>(16);
            List<TagEntity> tagEntities = articleTagMapper.queryArticleTags(articleEntity.getId());
            for(TagEntity tagEntity : tagEntities){
                tags.add(tagEntity.getTagName());
            }
            articleEntity.setTags2(Joiner.on(",").join(tags));
        }

        PageUtil.TableDataInfo tableDataInfo = new PageUtil.TableDataInfo(pageInfo.getList(),pageInfo.getTotal());
        return tableDataInfo;
    }

    /**
     * 发布文章按年-月汇总
     *
     * @param limit
     * @return
     */
    @Override
    public List<ArticleArchivesVo> queyArticleArchives(int limit) {
        return articleMapper.queyArticleArchives(limit);
    }


    /**
     * 根据id获取文章，添加阅读数
     *
     * @param articleId
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public JSONObject getArticleDetailAndAddViewNum(Long articleId) {
        ArticleEntity article = articleMapper.selectById(articleId);
        if (article == null) {
            throw new CustomException("该文章不存在");
        }

        JSONObject object = new JSONObject();
        // 1、文章详情
        object.put("id", article.getId());
        object.put("title", article.getTitle());
        object.put("summary", article.getSummary());
        object.put("createTime", DateUtils.dateTime(article.getCreateTime()));

        article.setViewNum(article.getViewNum() + 1);
        object.put("viewNum", article.getViewNum());
        object.put("commentNum", article.getCommentNum());
        object.put("content", article.getContent());

        // 2、文章作者信息
        SysUser sysUser = userService.selectUserById(article.getUserId());
        JSONObject user = new JSONObject();
        user.put("id", sysUser.getUserId());
        user.put("avatar", AddressUtils.getCurrApiAddress()+"profile/avatar/"+sysUser.getAvatar());
        user.put("nickname", sysUser.getNickName());
        object.put("author", user);

        // 3、文章所属分类信息
//        CategoryEntity categoryEntity = categoryService.selectById(article.getCategoryId());
        CategoryEntity categoryEntity = categoryService.selectById(article.getCategoryId());
        object.put("category", categoryEntity);

        // 4、文章所属标签信息
        List<TagEntity> tagEntities = articleTagService.queryArticleTags(article.getId());
        object.put("tags", tagEntities);

        // 5、文章阅读数 + 1
        articleMapper.updateArticle(article);

        return object;
    }

    /**
     * 添加一篇新文章
     *
     * @param sysUser
     * @param json
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long addOneArticle(SysUser sysUser, JSONObject json) {
        Map<Integer, String> maps = getTagMapInfos();

        // 1、保存文章信息
        ArticleEntity article = new ArticleEntity();
        article.setUserId(sysUser.getUserId());
        article.setNickName(sysUser.getNickName());
        article.setCommentNum(0);
        article.setViewNum(0);
        article.setCreateTime(new Date());
        article.setUpdateTime(new Date());
        article.setWeight(0);
        article.setTitle(json.getString("title"));
        article.setSummary(json.getString("summary"));

        JSONObject body = json.getJSONObject("body");
        article.setContent(body.getString("content"));
        article.setContentHtml(body.getString("contentHtml"));
        //默认待审核状态
        article.setStatus("0");

        // 2、设置分类信息
        JSONObject category = json.getJSONObject("category");
        article.setCategoryId(category.getInteger("id"));

        // 3、设置标签信息
        JSONArray tags = json.getJSONArray("tags");
        StringBuilder tagStr = new StringBuilder();
        for (int i = 0; i < tags.size(); i++ ) {
            Integer tagId = tags.getJSONObject(i).getInteger("id");
            if (i != 0){
                tagStr.append(",");
            }
            tagStr.append(maps.get(tagId));
        }
        article.setTags(tagStr.toString());

        // 4、插入文章信息
        articleMapper.insert(article);
        Long id = article.getId();

        // 5、插入文章对应的标签信息
        List<ArticleTagEntity> articleTagEntityList = new ArrayList();
        for (int i = 0; i < tags.size(); i++ ) {
            Integer tagId = tags.getJSONObject(i).getInteger("id");
            ArticleTagEntity articleTagEntity = new ArticleTagEntity();
            articleTagEntity.setArticleId(id);
            articleTagEntity.setTagId(tagId);
            articleTagEntity.setCreateTime(new Date());
            articleTagEntity.setUpdateTime(new Date());
            articleTagEntityList.add(articleTagEntity);
        }
        articleTagService.insertBatch(articleTagEntityList);

        return id;
    }

    /**
     * 获取标签Map数据
     *
     * @return
     */
    private  Map<Integer, String> getTagMapInfos() {
        List<TagEntity> tagEntities = tagService.selectList(null);
        Map<Integer, String> map = new HashMap<>();
        for (TagEntity tag: tagEntities){
            map.put(tag.getId(), tag.getTagName());
        }
        return map;
    }

    /**
     * 更新一篇文章
     *
     * @param sysUser
     * @param article
     * @param json
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long updateOneArticle(SysUser sysUser, ArticleEntity article, JSONObject json) {
        Long id = article.getId();
        Map<Integer, String> map = getTagMapInfos();

        // 1、更新文章信息
        article.setTitle(json.getString("title"));
        article.setSummary(json.getString("summary"));

        JSONObject body = json.getJSONObject("body");
        article.setContent(body.getString("content"));
        article.setContentHtml(body.getString("contentHtml"));

        JSONObject category = json.getJSONObject("category");
        if (article.getCategoryId().intValue() != category.getInteger("id").intValue()) {
            article.setCategoryId(category.getInteger("id"));
        }

        // 2、获取文章对应的标签信息
        List<ArticleTagEntity> articleTagEntityList = new ArrayList<>();
        StringBuilder tagStr = new StringBuilder();
        JSONArray tags = json.getJSONArray("tags");
        for (int i = 0; i < tags.size(); i++ ) {
            Integer tagId = tags.getJSONObject(i).getInteger("id");
            if (i != 0){
                tagStr.append(",");
            }
            tagStr.append(map.get(tagId));

            ArticleTagEntity articleTagEntity = new ArticleTagEntity();
            articleTagEntity.setArticleId(id);
            articleTagEntity.setTagId(tagId);
            articleTagEntity.setCreateTime(new Date());
            articleTagEntity.setUpdateTime(new Date());
            articleTagEntityList.add(articleTagEntity);
        }
        article.setTags(tagStr.toString());

        article.setUpdateTime(new Date());
        article.setUserId(sysUser.getUserId());
        article.setNickName(sysUser.getNickName());
        articleMapper.updateArticle(article);

        // 3、删除之前的文章标签信息
        articleTagMapper.deleteArticleTag(id);

        // 4、更新文章标签信息
        articleTagService.insertBatch(articleTagEntityList);

        return id;
    }


    /**
     * 获取最热或最新文章
     * type 可取 view_num 最热
     * create_time 最新
     *
     * @param type
     * @param userId
     * @return
     */
    @Override
    public PageUtil.TableDataInfo getHotOrNewArticles(String type, Long userId) {

        PageUtil.PageCondition pageCondition = new  PageUtil.PageCondition();
        pageCondition.setOrderField(type);
        pageCondition.setPageNum(1);
        pageCondition.setPageSize(HOT_OR_NEW_ARTICLE_NUM);

        PageUtil.startMyPage(pageCondition);
        PageInfo<ArticleEntity> pageInfo = new PageInfo(articleMapper.queryArticleListByUserId(userId));
        List<ArticleEntity> hotList = pageInfo.getList().stream().filter(item -> "1".equals(item.getStatus())).collect(Collectors.toList());
        List list = hotList.stream().map(HotArticleVo::new).collect(Collectors.toList());
        PageUtil.TableDataInfo tableDataInfo = new PageUtil.TableDataInfo(list,pageInfo.getTotal());
        return tableDataInfo;
    }

    /**
     * 通过id查询列表
    * @param id
     * @return
     */
    @Override
    public ArticleEntity selectById(Long id) {
        return articleMapper.selectById(id);
    }

    /**
     * 查询文章列表
     * @return
     */
    @Override
    public List selectList() {
        return articleMapper.queryArticleList(null);
    }


    /**
     *
     * @param id
     * @param status
     * @return
     */
    @Override
    public int auditArticle(Long id,String status) {
        return articleMapper.auditArticle(id,status);
    }

    @Override
    public int deleteOneArticle(Long id) {
        //删除文章信息
        articleMapper.deleteById(id);
        //删除文章与标签的关系
        articleTagMapper.deleteArticleTag(id);
        return 1;
    }

    @Override
    public AjaxResult count() {
        AjaxResult result = AjaxResult.success();
        //获取用户数
        result.put("userCount",articleMapper.getUserCount());
        //获取评论数
        result.put("commentCount",articleMapper.getCommentCount());
        //获取文章数
        result.put("articleCount",articleMapper.getArticleCount());
        //获取标签数
        result.put("tagCount",articleMapper.getTagCount());
        return result;
    }
}
