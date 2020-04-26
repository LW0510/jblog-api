package com.ghc.project.expert.service;


import com.ghc.project.expert.domain.TbExpert;
import com.ghc.project.expert.domain.vo.ExpertVo;

import java.util.List;

/**
 * 专家Service接口
 * 
 * @author ghc
 * @date 2020-04-26
 */
public interface ITbExpertService 
{
    /**
     * 查询专家
     * 
     * @param expertId 专家ID
     * @return 专家
     */
    ExpertVo selectTbExpertById(Long expertId);

    /**
     * 查询专家列表
     * 
     * @param expertVo 专家
     * @return 专家集合
     */
     List<ExpertVo> selectTbExpertList(ExpertVo expertVo);

    /**
     * 新增专家
     * 
     * @param expert 专家
     * @return 结果
     */
    public int insertTbExpert(ExpertVo expert);

    /**
     * 修改专家
     * 
     * @param tbExpert 专家
     * @return 结果
     */
    public int updateTbExpert(TbExpert tbExpert);

    /**
     * 批量删除专家
     * 
     * @param expertIds 需要删除的专家ID
     * @return 结果
     */
    public int deleteTbExpertByIds(Long[] expertIds);

    /**
     * 删除专家信息
     * 
     * @param expertId 专家ID
     * @return 结果
     */
    public int deleteTbExpertById(Long expertId);
}
