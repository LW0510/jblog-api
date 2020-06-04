package com.jblog.project.blog.user.service;

import com.jblog.common.constant.Constants;
import com.jblog.common.exception.CustomException;
import com.jblog.common.utils.IdUtils;
import com.jblog.common.utils.SecurityUtils;
import com.jblog.common.utils.VerifyCodeUtils;
import com.jblog.framework.redis.RedisCache;
import com.jblog.project.system.domain.SysUser;
import com.jblog.project.system.mapper.SysUserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.concurrent.TimeUnit;

@Service
public class UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserService.class);
    @Autowired
    private RedisCache redisCache;

//    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private SysUserMapper userMapper;

//    @Value("${spring.mail.username}")
    private String from;



    /**
     * 发送邮箱认证码
     */
    public String sendMailCode(String mail) {
        // 生成随机字串
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
        // 唯一标识
        String uuid = IdUtils.simpleUUID();
        String verifyKey = Constants.CAPTCHA_CODE_KEY + uuid;
        redisCache.setCacheObject(verifyKey, verifyCode, 5, TimeUnit.MINUTES);

        StringBuilder sb = new StringBuilder();
        sb.append("邮箱为:" + mail + "的用户您好：<br/><br/>");
        sb.append("您的邮箱认证码为:<strong>"+verifyCode+"</strong><br/><br/>");
        sb.append("此邮件无需回复！！<br/><br/>");
        sb.append("来自：一点点梵博客平台<br/><br/>");

        //获取MimeMessage对象
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper;
        try {
            messageHelper = new MimeMessageHelper(message, true);
            //邮件发送人
            messageHelper.setFrom(from);
            //邮件接收人
            messageHelper.setTo(mail);
            //邮件主题
            message.setSubject("邮箱认证码");
            //邮件内容，html格式
            messageHelper.setText(sb.toString(), true);
            //发送
            mailSender.send(message);
            //日志信息
            logger.info("邮件认证码已发送");
        } catch (MessagingException e) {
            logger.error("邮件认证码发送异常！", e);
        }

        return uuid;
    }

    /**
     * 找回密码
     * @param mail
     * @param newPwd
     * @param uuid
     */
    @Transactional(rollbackFor = Exception.class)
    public void retrievePassword(String mail, String newPwd,String code, String uuid) {

        String verifyKey = Constants.CAPTCHA_CODE_KEY + uuid;
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            throw new CustomException("邮箱认证码已过期");
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            throw new CustomException("邮箱认证码错误");
        }
        SysUser user = userMapper.selectUserByEmail(mail);
        SysUser u = new SysUser();
        u.setPassword(SecurityUtils.encryptPassword(newPwd));
        u.setUserId(user.getUserId());
        int num = userMapper.updateUser(u);

        if(num  > 0){
            //发送邮箱
            StringBuilder sb = new StringBuilder();
            sb.append("邮箱为:<strong>" + mail + "</strong>的用户您好：<br/><br/>");
            sb.append("您的用户名为:<strong>"+user.getUserName()+"</strong>"+" 密码为:<strong>"+newPwd+"</strong><br/><br/>");
            sb.append("(此邮件由系统自动发出, 请勿回复。)<br/><br/>");
            sb.append("来自：一点点梵博客平台<br/><br/>");
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper;
            try {
                messageHelper = new MimeMessageHelper(message, true);
                messageHelper.setFrom(from);
                messageHelper.setTo(mail);
                message.setSubject("用户密码找回");
                messageHelper.setText(sb.toString(), true);
                mailSender.send(message);
                logger.info("找回密码邮件已发送");
            } catch (MessagingException e) {
                logger.error("找回密码邮件发送异常！", e);
            }
        }else{
            throw new CustomException("找回密码失败");
        }
    }
}
