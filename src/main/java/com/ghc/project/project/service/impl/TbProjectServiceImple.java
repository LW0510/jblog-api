package com.ghc.project.project.service.impl;

import com.ghc.project.project.domain.TbProject;
import com.ghc.project.project.mapper.TbProjectMapper;
import com.ghc.project.project.service.ITbProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ：Liz
 * @date ：2020/4/24
 */
@Service
public class TbProjectServiceImple implements ITbProjectService {

    @Autowired
    private TbProjectMapper tbProjectMapper;


    @Override
    public TbProject selectTbProjectById(Long projectId) {
        return tbProjectMapper.selectTbProjectById(projectId);
    }

    @Override
    public List<TbProject> selectTbProjectList(TbProject tbProject) {
        return tbProjectMapper.selectTbProjectList(tbProject);
    }

    @Override
    public int insertTbProject(TbProject tbProject) {
        return tbProjectMapper.insertTbProject(tbProject);
    }

    @Override
    public int updateTbProject(TbProject tbProject) {
        return tbProjectMapper.updateTbProject(tbProject);
    }

    @Override
    public int deleteTbProjectByIds(Long[] projectIds) {
        return tbProjectMapper.deleteTbProjectByIds(projectIds);
    }

    @Override
    public int deleteTbProjectById(Long projectId) {
        return tbProjectMapper.deleteTbProjectById(projectId);
    }
}
