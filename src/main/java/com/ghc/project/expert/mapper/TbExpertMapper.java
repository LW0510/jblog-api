package com.ghc.project.expert.mapper;

import com.ghc.project.expert.domain.TbExpert;
import com.ghc.project.expert.domain.vo.ExpertVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 专家Mapper接口
 * 
 * @author ghc
 * @date 2020-04-26
 */
public interface TbExpertMapper 
{
    /**
     * 查询专家
     * 
     * @param expertId 专家ID
     * @return 专家
     */
     TbExpert selectTbExpertById(Long expertId);

    /**
     * 查询专家列表
     * 
     * @param expertVo 专家
     * @return 专家集合
     */
    public List<TbExpert> selectTbExpertList(ExpertVo expertVo);

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
     * 删除专家
     * 
     * @param expertId 专家ID
     * @return 结果
     */
    public int deleteTbExpertById(Long expertId);

    /**
     * 批量删除专家
     * 
     * @param expertIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteTbExpertByIds(Long[] expertIds);


    /**
     * 查询专家所属领域
     * @param expertId
     * @param relevanceType
     * @return
     */
    String selectProfessionLable(@Param("expertId") Long expertId, @Param("relevanceType") int relevanceType);


    /**
     *  @param expertId
     * @param professionId
     * @param relevanceType
     */
    void insertProRelevance(@Param("expertId") Long expertId, @Param("professionId") Integer professionId,
                          @Param("relevanceType") int relevanceType);

    void deletePressions(@Param("expertIds") Long[] expertIds, @Param("relevanceType") int relevanceType);

    int selectDictCode(@Param("dictValue")String dictValue,@Param("dictType") String dictType);

}
