package com.ghc.project.expert.service;

import com.ghc.project.expert.domain.Expert;
import com.ghc.project.expert.mapper.ExpertMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExpertService {

    @Autowired
    private ExpertMapper expertMapper;

    public List<Expert> selectExpertList(Expert expert) {
        return expertMapper.selectExpertList(expert);
    }


    public boolean checkIcdExisted(String icd) {
        return expertMapper.checkIcdExisted(icd) > 0;
    }

    public boolean checkEmailExisted(String email) {
        return expertMapper.checkEmailExisted(email) > 0;
    }

    public int addExpert(Expert expert) {
        return expertMapper.addExpert(expert);
    }


    /** 修改专家
     * @param expert 专家
     * @return 结果
     */
    public int updateExpert(Expert expert)
    {
        return expertMapper.updateExpert(expert);
    }

    /**
     * 批量删除专家
     *
     * @param expertIds 需要删除的专家ID
     * @return 结果
     */
    public int deleteExpertByIds(Long[] expertIds)
    {
        return expertMapper.deleteExpertByIds(expertIds);
    }

    /**
     * 删除专家信息
     *
     * @param expertId 专家ID
     * @return 结果
     */
    public int deleteExpertById(Long expertId)
    {
        return expertMapper.deleteExpertById(expertId);
    }
}
