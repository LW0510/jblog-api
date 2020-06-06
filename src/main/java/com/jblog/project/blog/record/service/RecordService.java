package com.jblog.project.blog.record.service;
import com.jblog.project.blog.entity.RecordEntity;

import java.util.List;

public interface RecordService{

    RecordEntity selectRecordEntityById(Long id);


    List<RecordEntity> selectRecordEntityList(RecordEntity blogRecord);


    int insertRecordEntity(RecordEntity blogRecord);


    int updateRecordEntity(RecordEntity blogRecord);


    int deleteRecordEntityByIds(Long[] ids);


    int deleteRecordEntityById(Long id);
}
