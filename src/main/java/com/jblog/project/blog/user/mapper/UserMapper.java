package com.jblog.project.blog.user.mapper;

import com.jblog.project.blog.user.domain.UserEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户表
 */
@Mapper
public interface UserMapper{

    /**
     * 根据用户名，查询系统用户
     */
    UserEntity queryByUserAccount(String account);

}

