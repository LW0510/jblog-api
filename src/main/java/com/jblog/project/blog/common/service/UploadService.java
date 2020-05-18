package com.jblog.project.blog.common.service;

import com.jblog.framework.web.domain.AjaxResult;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


public interface UploadService {


    @Transactional(rollbackFor = Exception.class)
    AjaxResult avatarUpload(MultipartFile avatar, Long userId);
}
