//package com.jblog.project.blog.service.impl;
//
//import com.baomidou.mybatisplus.mapper.EntityWrapper;
//import com.baomidou.mybatisplus.plugins.Page;
//import com.baomidou.mybatisplus.service.impl.ServiceImpl;
//import com.seu.blog.com.jblog.mapper.LogDao;
//import com.seu.blog.entity.LogEntity;
//import com.seu.blog.service.LogService;
//import com.seu.common.utils.PageUtil;
//import com.seu.common.utils.Query;
//import org.springframework.stereotype.Service;
//
//import java.util.Map;
//
///**
// * 用户操作日志表
// *
// * @author shadow
// *
// * @date 2018-07-04 15:00:54
// */
//@Service("logService")
//public class LogServiceImpl extends ServiceImpl<LogDao, LogEntity> implements LogService {
//
//    @Override
//    public PageUtil queryPage(Map<String, Object> params) {
//        Page<LogEntity> page = this.selectPage(
//                new Query<LogEntity>(params).getPage(),
//                new EntityWrapper<LogEntity>()
//        );
//
//        return new PageUtil(page);
//    }
//
//}
