package com.jblog.project.blog.validator;

import com.jblog.common.exception.CustomException;
import org.apache.commons.lang.StringUtils;

/**
 * 数据校验
 *
 * @author shadow
 * @email shadow@163.com
 * @date 2017-03-23 15:50
 */
public abstract class Assert {

    public static void isBlank(String str, String message) {
        if (StringUtils.isBlank(str)) {
            throw new CustomException(message);
        }
    }

    public static void isNull(Object object, String message) {
        if (object == null) {
            throw new CustomException(message);
        }
    }
}
