//package com.jblog.project.blog.controller;
//
//import com.alibaba.fastjson.JSONObject;
//import com.jblog.project.blog.service.impl.CaptchaServiceImpl;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.commons.io.IOUtils;
//import org.apache.commons.lang.RandomStringUtils;
//import org.apache.commons.lang.StringUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.web.bind.annotation.*;
//
//import javax.annotation.Resource;
//import javax.imageio.ImageIO;
//import javax.servlet.ServletException;
//import javax.servlet.ServletOutputStream;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.awt.image.BufferedImage;
//import java.io.IOException;
//import java.util.Date;
//import java.util.Map;
//
///**
// * 登录相关
// */
//@Slf4j
//@RestController
//public class LoginController {
//    @Autowired
//    private Producer producer;
//    @Resource
//    CaptchaServiceImpl captchaService;
//    @Autowired
//    private UserService userService;
//    @Autowired
//    private UserTokenServiceImpl userTokenService;
//
//    @Autowired
//    RedisTemplate<String, String> redisTemplate;
//
//    /**
//     * 验证码
//     */
//    @GetMapping("/captcha")
//    public void captcha(HttpServletResponse response, String uuid) throws ServletException, IOException {
//        response.setHeader("Cache-Control", "no-store, no-cache");
//        response.setContentType("image/jpeg");
//
//        if (StringUtils.isBlank(uuid)) {
//            throw new RestException("uuid不能为空");
//        }
//        生成文字验证码
//        String code = producer.createText();
//        captchaService.setCaptcha(uuid, code);
//
//        获取图片验证码
//        BufferedImage image = producer.createImage(code);
//
//        ServletOutputStream out = response.getOutputStream();
//        ImageIO.write(image, "jpg", out);
//        IOUtils.closeQuietly(out);
//    }
//
//    /**
//     * 登录2(带验证码)
//     */
//    @PostMapping("/login2")
//    public Map<String, Object> login2(@RequestBody LoginForm form) throws IOException {
//         获取Session中验证码
//        if (StringUtils.isBlank(form.getUuid())) {
//            return R.error("参数uuid不能为空");
//        }
//        String randCode = captchaService.getCaptcha(form.getUuid());
//        if (StringUtils.isBlank(randCode)) {
//            return R.error("图片验证码失效，请重新获取");
//        }
//         用户输入的验证码
//        String randomCode = form.getCaptcha();
//        if (randomCode == null || !randomCode.equalsIgnoreCase(randCode)) {
//            return R.error("图片验证码不正确");
//        }
//
//        用户信息
//        UserEntity user = userService.queryByUserAccount(form.getUsername());
//
//        账号不存在、密码错误
//        if (user == null || !user.getPassword().equals(new Sha256Hash(form.getPassword(), user.getSalt()).toHex())) {
//            return R.error("账号或密码不正确");
//        }
//
//        账号锁定
//        if (Constant.UserStatus.PAUSE.getValue().equals(user.getStatus())) {
//            return R.error("账号已被锁定,请联系管理员");
//        }
//
//        生成token，并保存到数据库
//        R r = userTokenService.createToken(user.getId());
//        return r;
//    }
//
//    /**
//     * 用户登录(不带验证码)
//     *
//     * @param json
//     * @return
//     * @throws IOException
//     */
//    @PostMapping("/login")
//    public Map<String, Object> login(@RequestBody JSONObject json) throws IOException {
//        String account = json.getString("account");
//        String password = json.getString("password");
//        if (StringUtils.isBlank(account) || StringUtils.isBlank(password)) {
//            return R.error("参数不对");
//        }
//
//        用户信息
//        UserEntity user = userService.queryByUserAccount(account);
//
//        账号不存在、密码错误
//        if (user == null || !user.getPassword().equals(new Sha256Hash(password, user.getSalt()).toHex())) {
//            return R.error("账号或密码不正确");
//        }
//
//        账号锁定
//        if (Constant.UserStatus.PAUSE.getValue().equals(user.getStatus())) {
//            return R.error("账号已被锁定,请联系管理员");
//        }
//
//        生成token，并保存到数据库
//        R r = userTokenService.createToken(user.getId());
//        return r;
//    }
//
//    /**
//     * 账号注册
//     *
//     * @param json
//     * @return
//     * @throws IOException
//     */
//    @PostMapping("/register")
//    public Map<String, Object> register(@RequestBody JSONObject json, HttpServletRequest httpServletRequest) throws IOException {
//        String account = json.getString("account");
//        String password = json.getString("password");
//        String nickname = json.getString("nickname");
//        if (StringUtils.isBlank(account) || StringUtils.isBlank(password) || StringUtils.isBlank(nickname)) {
//            return R.error("参数不对");
//        }
//
//         限制爬虫频繁调用
//        checkIpTimes(httpServletRequest);
//
//        用户信息
//        UserEntity user = userService.queryByUserAccount(account);
//
//        账号已存在
//        if (user != null) {
//            return R.error("该账号已存在");
//        }
//
//        user = new UserEntity();
//        user.setAccount(account);
//        user.setAdmin(1);
//        user.setCreateTime(new Date());
//        user.setUpdateTime(new Date());
//        user.setNickname(nickname);
//        user.setLastLoginTime(new Date());
//        user.setStatus(Constant.UserStatus.NORMAL.getValue());
//        String salt = RandomStringUtils.randomAlphanumeric(8);
//        user.setSalt(salt);
//        user.setPassword(new Sha256Hash(password, salt).toHex());
//        boolean insert = userService.insert(user);
//        if (!insert) {
//            return R.error("注册账号失败了");
//        }
//
//        生成token，并保存到数据库
//        R r = userTokenService.createToken(user.getId());
//        return r;
//    }
//
//    private void checkIpTimes(HttpServletRequest httpServletRequest) {
//        String ipAddr = IPUtils.getIpAddr(httpServletRequest);
//        if (StringUtils.isBlank(ipAddr)) {
//            return;
//        }
//        int time = 0;
//        String s = redisTemplate.opsForValue().get("register_" + ipAddr);
//        if (StringUtils.isNotBlank(s)) {
//            time = Integer.parseInt(s);
//            if (time >= 3) {
//                throw new RestException("该IP操作次数超过限制");
//            }
//        }
//        redisTemplate.opsForValue().set("register_" + ipAddr, (time + 1) + "", 86400L);
//    }
//
//    /**
//     * 退出登录
//     *
//     * @author shadow
//     * @since 2018/7/1 15:30.
//     */
//    @RequestMapping(value = "/logout", method = RequestMethod.GET)
//    public R logout() {
//        Long userId = ShiroUtils.getUserId();
//        Subject subject = SecurityUtils.getSubject();
//        subject.logout();
//        try {
//            UserTokenEntity tokenEntity = userTokenService.selectOne(new EntityWrapper<UserTokenEntity>().eq("user_id", userId));
//            if (tokenEntity != null) {
//                String token = TokenGenerator.generateValue();
//                tokenEntity.setToken(token);
//                tokenEntity.setExpireTime(new Date());
//                tokenEntity.setUpdateTime(new Date());
//                userTokenService.updateById(tokenEntity);
//            }
//        } catch (Exception e) {
//            record.warn("退出登录, 更新token失败！", e);
//        }
//        return R.ok();
//    }
//
//    public static void main(String[] args) {
//        String salt = "FZlooHpZ";
//        String password = "123456";
//        String toHex = new Sha256Hash(password, salt).toHex();
//        System.out.println(toHex);
//    }
//
//
//}
