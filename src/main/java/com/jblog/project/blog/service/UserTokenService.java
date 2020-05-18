package com.jblog.project.blog.service;//package com.weiframework.project.blog.service;
//
//
//import com.weiframework.framework.web.domain.AjaxResult;
//import com.weiframework.project.blog.entity.UserTokenEntity;
//
//import java.util.Map;
//
///**
// * 系统用户Token
// *
// * @author shadow
// * @email liangfhhd@163.com
// * @date 2018-07-04 15:00:54
// */
//public interface UserTokenService extends IService<UserTokenEntity> {
//
//    PageUtils queryPage(Map<String, Object> params);
//
//    /**
//     * 生成token
//     *
//     * @param userId 用户ID
//     */
//    AjaxResult createToken(long userId);
//
//    /**
//     * 退出，修改token值
//     *
//     * @param userId 用户ID
//     */
//    void logout(long userId);
//}
//
