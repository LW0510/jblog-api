package com.jblog.project.blog.tag.domain.vo;

import com.jblog.project.blog.tag.domain.TagEntity;
import lombok.Getter;
import lombok.Setter;

/**
 * tag详情
 *
 * @author shadow
 * @since 2018/7/7 14:56.
 */
@Getter
@Setter
public class TagVo extends TagEntity {

    private static final long serialVersionUID = 5059212992497947120L;

    private int articles;

}
