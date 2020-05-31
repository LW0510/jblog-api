package com.jblog;


import com.jblog.common.utils.Threads;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.junit4.SpringRunner;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MailTest {

    private static final Logger logger = LoggerFactory.getLogger(MailTest.class);
    @Autowired
    private JavaMailSender mailSender;
    @Value("${spring.mail.username}")
    private String from;

    @Test
    public void sendSimpleMail() {
        String to = "2581992919@qq.com";
        StringBuilder sb = new StringBuilder();
        sb.append("邮箱为:" + to + "的用户您好：<br/><br/>");
        sb.append("您的邮箱认证码为:<strong></strong>");
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
            messageHelper.setTo(to);
            //邮件主题
            message.setSubject("用户密码找回");
            //邮件内容，html格式
            messageHelper.setText(sb.toString(), true);
            //发送
            mailSender.send(message);
            //日志信息
            logger.info("找回密码邮件以发送");
        } catch (MessagingException e) {
            logger.error("找回密码邮件发送异常！", e);
        }
    }
}
