package com.jblog.project.blog.vo;


import com.jblog.project.blog.entity.CommentEntity;
import lombok.Getter;
import lombok.Setter;

/**
 * Created by shadow on 2018/7/10.
 */
@Getter
@Setter
public class CommentVo extends CommentEntity {

    private String avatar;
    private String nickname;

}
