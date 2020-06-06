package com.jblog.project.blog.record.service.impl;

import com.jblog.common.utils.ServletUtils;
import com.jblog.framework.security.LoginUser;
import com.jblog.framework.security.service.TokenService;
import com.jblog.project.blog.record.mapper.RecordMapper;
import com.jblog.project.blog.record.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import com.jblog.project.blog.entity.RecordEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.Date;
import java.util.List;

@Service
public class RecordImpl implements RecordService {

    @Autowired
    private RecordMapper recordMapper;
    @Autowired
    private TokenService tokenService;


    @Override
    public RecordEntity selectRecordEntityById(Long id)
    {
        return recordMapper.selectRecordEntityById(id);
    }

    @Override
    public List<RecordEntity> selectRecordEntityList(RecordEntity blogRecord)
    {
        return recordMapper.selectRecordEntityList(blogRecord);
    }


    @Override
    public int insertRecordEntity(RecordEntity blogRecord)
    {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        blogRecord.setUserId(loginUser.getUser().getUserId());
        blogRecord.setCreatedAt(new Date());
        return recordMapper.insertRecordEntity(blogRecord);
    }


    @Override
    public int updateRecordEntity(RecordEntity blogRecord)
    {
        return recordMapper.updateRecordEntity(blogRecord);
    }

    @Override
    public int deleteRecordEntityByIds(Long[] ids)
    {
        return recordMapper.deleteRecordEntityByIds(ids);
    }


    @Override
    public int deleteRecordEntityById(Long id)
    {
        return recordMapper.deleteRecordEntityById(id);
    }
}
