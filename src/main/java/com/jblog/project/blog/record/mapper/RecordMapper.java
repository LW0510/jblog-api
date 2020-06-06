package com.jblog.project.blog.record.mapper;
import com.jblog.project.blog.entity.RecordEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecordMapper {

     RecordEntity selectRecordEntityById(Long id);


     List<RecordEntity> selectRecordEntityList(RecordEntity blogRecord);


     int insertRecordEntity(RecordEntity blogRecord);


     int updateRecordEntity(RecordEntity blogRecord);


     int deleteRecordEntityById(Long id);


     int deleteRecordEntityByIds(Long[] ids);
}
