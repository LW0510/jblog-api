package com.jblog.project.blog.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章表
 *
 * @author liangfeihu
 * @email liangfhhd@163.com
 * @date 2018-07-04 15:00:55
 */
@Getter
@Setter
public class ArticleEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    private Long id;
    /**
     * 用户ID
     */
    private Long userId;
    /**
     * 作者昵称
     */
    private String nickName;
    /**
     * 文章标题
     */
    private String title;
    /**
     * 文章摘要
     */
    private String summary;
    /**
     * 文章内容txt
     */
    private String content;
    /**
     * 文章内容html
     */
    private String contentHtml;
    /**
     * 浏览数
     */
    private Integer viewNum;
    /**
     * 评论数
     */
    private Integer commentNum;
    /**
     * 权重
     */
    private Integer weight;
    /**
     * 文章标签
     */
    private String tags;
    /**
     * 文章分类ID
     */
    private Integer categoryId;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;

    public String[] getTagArray() {
        return tags!= null ? tags.split(",") : null;
    }
}
