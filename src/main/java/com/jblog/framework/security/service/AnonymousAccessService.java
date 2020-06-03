package com.jblog.framework.security.service;

import com.jblog.common.utils.ServletUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 匿名访问
 */
public class AnonymousAccessService {

    private static final String[] anonymousAccessUrlList = new String[]{
            "/profile/**","/common/download**","/common/download/resource**","/swagger-ui.html",
            "/swagger-resources/**","/webjars/**","/*/api-docs","/druid/**","/captchaImage",
            "/login",
            //业务相关
            "/article/list","/tags/hot","/category/list","/tags/list",
            "/article/hot","/article/new","/article/archives","/article/view",
            "/tags/detail","/category/detail","/category/detail/info","/comments/article/info","/user/register",
            "/sendMailCode","/user/retrievePassword","/avatar/upload"
    };

    /**
     * 获取匿名访问url
     * @return
     */
    public static String[] getAnonymousAccessUrl(){
        return anonymousAccessUrlList;
    }


    /**
     * 当前请求是否属于匿名请求
     * @return
     */
    public static boolean currUrlIsAnonymousAccess(){
        HttpServletRequest request = ServletUtils.getRequest();
        for(String anonymousAccessUrl : anonymousAccessUrlList){
            if(anonymousAccessUrl.contains(request.getRequestURI())){
                return true;
            }
        }
        return false;
    }
}
