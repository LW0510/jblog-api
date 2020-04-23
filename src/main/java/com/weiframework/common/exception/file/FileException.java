package com.weiframework.common.exception.file;

import com.weiframework.common.exception.BaseException;

/**
 * 文件信息异常类
 * 
 * @author ghc
 */
public class FileException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public FileException(String code, Object[] args)
    {
        super("file", code, args, null);
    }

}
