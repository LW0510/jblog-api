package com.jblog.project.blog.vo;


import lombok.*;

/**
 * Created by shadow on 2018/7/7.
 */

@Getter
@Setter
public class PageCondition {

    private Integer pageNum;
    private Integer pageSize;
    private String orderField;
    private String order;

    //是否有指定字段排序条件（默认false）
    private boolean orderFlag;

    //构造的 orderBy 语句
    private String orderByStatement;


}
