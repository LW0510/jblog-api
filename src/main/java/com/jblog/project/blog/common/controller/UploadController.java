package com.jblog.project.blog.common.controller;

import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.project.blog.common.domain.form.UploadForm;
import com.jblog.project.blog.common.service.UploadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 资源上传
 */
@Slf4j
@RestController
public class UploadController {

    @Autowired
    private UploadService uploadService;
//    @PostMapping("/upload")
//    public AjaxResult upload(HttpServletRequest request, MultipartFile image) {
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//        String filePath = sdf.format(new Date());
//
//        File baseFolder = new File(baseFolderPath + filePath);
//        if (!baseFolder.exists()) {
//            baseFolder.mkdirs();
//        }
//
//        StringBuffer url = new StringBuffer();
//        url.append(request.getScheme())
//                .append(":")
//                .append(request.getServerName())
//                .append(":")
//                .append(request.getServerPort())
//                .append(request.getContextPath())
//                .append("/")
//                .append(filePath);
//
//        String imgName = UUID.randomUUID().toString().replace("_", "") + "_" + image.getOriginalFilename().replaceAll(" ", "");
//        try {
//            File dest = new File(baseFolder, imgName);
//            image.transferTo(dest);
//            url.append("/").append(imgName);
//
//            JSONObject object = new JSONObject();
//            object.put("url", url);
//
//            return AjaxResult.success(object);
//        } catch (IOException e) {
//            log.error("文件上传错误 , uri: {} , caused by: ", request.getRequestURI(), e);
//            return AjaxResult.error("文件上传错误");
//        }
//    }

    /**
     * 头像上传
     * @param uploadForm
     * @return
     */
    @PostMapping("/avatar/upload")
    public AjaxResult avatarUpload(UploadForm uploadForm){
        return uploadService.avatarUpload(uploadForm.getFile(),uploadForm.getUserId());
    }


}
