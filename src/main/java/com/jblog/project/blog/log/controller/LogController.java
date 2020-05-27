//package com.jblog.project.blog.controller;
//
//import com.jblog.framework.web.domain.AjaxResult;
//import com.jblog.project.blog.entity.LogEntity;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.Arrays;
//import java.util.Map;
//
//
///**
// * 用户操作日志表
// */
//@RestController
//@RequestMapping("/log")
//public class LogController {
//    @Autowired
//    private LogService logService;
//
//    /**
//     * 列表
//     */
//    @RequestMapping("/list")
//    public AjaxResult list(@RequestParam Map<String, Object> params) {
//        PageUtil page = logService.queryPage(params);
//
//        return AjaxResult.success().put("page", page);
//    }
//
//    /**
//     * 信息
//     */
//    @RequestMapping("/info/{id}")
//    public AjaxResult info(@PathVariable("id") Long id) {
//        LogEntity log = logService.selectById(id);
//
//        return (AjaxResult) AjaxResult.success().put("log", log);
//    }
//
//    /**
//     * 保存
//     */
//    @RequestMapping("/save")
//    public AjaxResult save(@RequestBody LogEntity log) {
//        logService.insert(log);
//
//        return AjaxResult.success();
//    }
//
//    /**
//     * 修改
//     */
//    @RequestMapping("/update")
//    public AjaxResult update(@RequestBody LogEntity log) {
//        ValidatorUtils.validateEntity(log);
////        全部更新
//        logService.updateAllColumnById(log);
//
//        return AjaxResult.success();
//    }
//
//    /**
//     * 删除
//     */
//    @RequestMapping("/delete")
//    public AjaxResult delete(@RequestBody Long[] ids) {
//        logService.deleteBatchIds(Arrays.asList(ids));
//
//        return AjaxResult.success();
//    }
//
//}
