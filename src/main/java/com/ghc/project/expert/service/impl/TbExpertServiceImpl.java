package com.ghc.project.expert.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ghc.project.expert.domain.TbExpert;
import com.ghc.project.expert.domain.vo.ExpertVo;
import com.ghc.project.expert.mapper.TbExpertMapper;
import com.ghc.project.expert.service.ITbExpertService;
import com.ghc.project.system.mapper.SysDictDataMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 专家Service业务层处理
 * 
 * @author ghc
 * @date 2020-04-26
 */
@Service
public class TbExpertServiceImpl implements ITbExpertService
{
    @Autowired
    private TbExpertMapper tbExpertMapper;
    @Autowired
    private SysDictDataMapper sysDictDataMapper;

    /**
     * 查询专家
     * 
     * @param expertId 专家ID
     * @return 专家
     */
    @Override
    public ExpertVo selectTbExpertById(Long expertId)
    {
        ExpertVo expertVo = new ExpertVo();
        TbExpert tbExpert = tbExpertMapper.selectTbExpertById(expertId);
        BeanUtils.copyProperties(tbExpert,expertVo);
        String professionLable = tbExpertMapper.selectProfessionLable(expertId, 3);
        expertVo.setProfessional(professionLable);
        return expertVo;
    }

    /**
     * 查询专家列表
     * 
     * @param expertVo 专家
     * @return 专家
     */
    @Override
    public List<ExpertVo> selectTbExpertList(ExpertVo expertVo)
    {
        List<TbExpert> tbExperts = tbExpertMapper.selectTbExpertList(expertVo);
        List<ExpertVo> resultList = new ArrayList<>();
        for (TbExpert tb : tbExperts) {
            System.out.println(tb);
            ExpertVo expertVoTemp = new ExpertVo();
            BeanUtils.copyProperties(tb,expertVoTemp);
            String sexLable = sysDictDataMapper.selectDictLabel("sys_user_sex",tb.getExpertSex());
            expertVoTemp.setExpertSex(sexLable);
            String statusLable = sysDictDataMapper.selectDictLabel("tb_expert_status",tb.getStatus());
            expertVoTemp.setStatus(statusLable);
//            List<String> professionLables = tbExpertMapper.selectProfessions(tbExpert.getExpertId(),3);
            String professionLable = tbExpertMapper.selectProfessionLable(tb.getExpertId(), 3);
            expertVoTemp.setProfessional(professionLable);
            resultList.add(expertVoTemp);
        }
        return resultList;
    }

    /**
     * 新增专家
     * 
     * @param expert 专家
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertTbExpert(ExpertVo expert)
    {
        tbExpertMapper.insertTbExpert(expert);
//        List<Integer> professionDictCodes = new ArrayList<>();
        //根据 professions即（dictValue） 获取 dictCode
//        for(String professionDictValue : expert.getProfessions()){
//            professionDictCodes.add(tbExpertMapper.selectDictCode(professionDictValue,"tb_project_professional"));
//        }
        Integer professionDictCode = tbExpertMapper.selectDictCode(expert.getProfessional(),"tb_project_professional");
        //添加领域
//        for(Integer professionId : professionDictCodes){
//            tbExpertMapper.insertProRelevance(expert.getExpertId(),professionId,3);
//        }
        tbExpertMapper.insertProRelevance(expert.getExpertId(),professionDictCode,3);
        return 1;
    }

    /**
     * 修改专家
     * 
     * @param tbExpert 专家
     * @return 结果
     */
    @Override
    public int updateTbExpert(TbExpert tbExpert)
    {
        return tbExpertMapper.updateTbExpert(tbExpert);
    }

    /**
     * 批量删除专家
     * 
     * @param expertIds 需要删除的专家ID
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteTbExpertByIds(Long[] expertIds)
    {
        tbExpertMapper.deleteTbExpertByIds(expertIds);
        // 删除领域
        tbExpertMapper.deletePressions(expertIds,3);
        return 1;
    }

    /**
     * 删除专家信息
     * 
     * @param expertId 专家ID
     * @return 结果
     */
    @Override
    public int deleteTbExpertById(Long expertId)
    {
        return tbExpertMapper.deleteTbExpertById(expertId);
    }
}
