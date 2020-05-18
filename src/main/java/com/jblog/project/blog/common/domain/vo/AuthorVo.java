package com.jblog.project.blog.common.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author shadow
 * @since 2018/7/10 15:02.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthorVo implements Serializable{
    private static final long serialVersionUID = 5059212992463947120L;

    private Long id;
    private String avatar;
    private String nickname;
}
