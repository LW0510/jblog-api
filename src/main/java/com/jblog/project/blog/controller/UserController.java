package com.jblog.project.blog.controller;//package com.weiframework.project.blog.controller;
//
//import com.alibaba.fastjson.JSONObject;
//import com.weiframework.framework.web.domain.AjaxResult;
//import com.weiframework.project.blog.entity.UserEntity;
//import com.weiframework.project.blog.service.UserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.Arrays;
//import java.util.Map;
//
//
///**
// * 用户表
// *
// * @author liangfeihu
// * @email liangfhhd@163.com
// * @date 2018-07-04 15:00:54
// */
//@RestController
//@RequestMapping("/user")
//public class UserController {
//    @Autowired
//    private UserService userService;
//
//    @GetMapping("/current")
//    public AjaxResult getCurrentUser(HttpServletRequest request) {
//        UserEntity userEntity = ShiroUtils.getUserEntity();
//
//        JSONObject object = new JSONObject();
//        object.put("account", userEntity.getAccount());
//        object.put("nickname", userEntity.getNickname());
//        object.put("avatar", userEntity.getAvatar());
//        object.put("id", userEntity.getId());
//
//        return AjaxResult.success(object);
//    }
//
//    /**
//     * 列表
//     */
//    @RequestMapping("/list")
//    public AjaxResult list(@RequestParam Map<String, Object> params){
//        PageUtils page = userService.queryPage(params);
//
//        return AjaxResult.success().put("page", page);
//    }
//
//    /**
//     * 信息
//     */
//    @RequestMapping("/info/{id}")
//    public AjaxResult info(@PathVariable("id") Long id){
//        UserEntity user = userService.selectById(id);
//
//        return AjaxResult.success().put("user", user);
//    }
//
//    /**
//     * 保存
//     */
//    @RequestMapping("/save")
//    public AjaxResult save(@RequestBody UserEntity user){
//        userService.insert(user);
//
//        return AjaxResult.success();
//    }
//
//    /**
//     * 修改
//     */
//    @RequestMapping("/update")
//    public AjaxResult update(@RequestBody UserEntity user){
//        ValidatorUtils.validateEntity(user);
//        //全部更新
//        userService.updateAllColumnById(user);
//
//        return AjaxResult.success();
//    }
//
//    /**
//     * 删除
//     */
//    @RequestMapping("/delete")
//    public AjaxResult delete(@RequestBody Long[] ids){
//        userService.deleteBatchIds(Arrays.asList(ids));
//
//        return AjaxResult.success();
//    }
//
//}
