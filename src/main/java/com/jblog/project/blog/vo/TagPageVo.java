package com.jblog.project.blog.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by liangfeihu on 2018/7/7.
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TagPageVo {
    Integer offset;
    Integer pageSize;
    Integer tagId;

}
