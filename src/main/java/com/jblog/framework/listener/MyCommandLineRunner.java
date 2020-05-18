package com.jblog.framework.listener;

import com.jblog.framework.config.GhcConfig;
import org.apache.commons.io.FileUtils;
import org.springframework.boot.*;
import org.springframework.stereotype.*;
import org.springframework.util.ResourceUtils;

import java.io.*;


/**
 * springboot项目启动做一些初始化工作（例如创建默认目录）
 * 此方式支持自动注入
 */
@Component
public class MyCommandLineRunner implements CommandLineRunner {

    @Override
    public void run(String... args) throws Exception {

        //头像上传路径
        String defaultAvatarPath = GhcConfig.getAvatarPath();
        if(!new File(defaultAvatarPath).exists()){
            System.out.println("=============创建默认头像目录===============");
            /**
             * 将 resource/static/avatar 下默认的头像文件拷贝到指定的 本地上传头像路径下
             */
            File path = new File(defaultAvatarPath);
            if(!path.exists()){
                path.mkdirs();
            }
            //springboot下resource的绝对路径
            String classPath = ResourceUtils.getURL("classpath:").getPath();
            File source = new File(classPath+"static"+File.separator+"avatar");
            File target = new File(defaultAvatarPath);

            FileUtils.copyDirectory(source,target);
            System.out.println("=============创建默认头像目录成功===============");
        }

    }
}
