package com.jblog.project.blog.category.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * 文章分类
 *
 * @author shadow
 * @since 2018/7/7 14:57.
 */
@Getter
@Setter
public class CategoryVo {

    /**
     * 序列化
     */
    private static final long serialVersionUID = -2975739216517528014L;

    private int articles;

    private Integer id;

    private String categoryName;

    private String avatar;

    private String description;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;


}
