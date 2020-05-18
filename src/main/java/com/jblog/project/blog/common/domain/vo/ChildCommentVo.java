package com.jblog.project.blog.common.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


/**
 * @author shadow
 * @since 2018/7/10 14:52.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChildCommentVo implements Serializable{

    private static final long serialVersionUID = 5061212992497947120L;

    private Long articleId;
    private Long parentId;
}
