package com.ghc.project.expert.mapper;

import com.ghc.project.expert.domain.Expert;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExpertMapper {

    List<Expert> selectExpertList(Expert expert);

    int checkIcdExisted(String icd);

    int checkEmailExisted(String email);

    int addExpert(Expert expert);

    int updateExpert(Expert expert);

    int deleteExpertByIds(Long[] expertIds);

    int deleteExpertById(Long expertId);


}
