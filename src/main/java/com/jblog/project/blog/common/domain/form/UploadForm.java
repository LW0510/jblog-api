package com.jblog.project.blog.common.domain.form;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Setter
@Getter
public class UploadForm {

    private Long userId;
    private MultipartFile file;
}
