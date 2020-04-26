package com.ghc.project.project.service;

import com.ghc.project.project.domain.TbProject;

import java.util.List;

/**
 * Created by Liz on 2020/4/24.
 */
public interface ITbProjectService {
    /**
     * 查询项目管理
     *
     * @param projectId 项目管理ID
     * @return 项目管理
     */
    TbProject selectTbProjectById(Long projectId);

    /**
     * 查询项目管理列表
     *
     * @param tbProject 项目管理
     * @return 项目管理集合
     */
    List<TbProject> selectTbProjectList(TbProject tbProject);

    /**
     * 新增项目管理
     *
     * @param tbProject 项目管理
     * @return 结果
     */
    int insertTbProject(TbProject tbProject);

    /**
     * 修改项目管理
     *
     * @param tbProject 项目管理
     * @return 结果
     */
    int updateTbProject(TbProject tbProject);

    /**
     * 批量删除项目管理
     *
     * @param projectIds 需要删除的项目管理ID
     * @return 结果
     */
    int deleteTbProjectByIds(Long[] projectIds);

    /**
     * 删除项目管理信息
     *
     * @param projectId 项目管理ID
     * @return 结果
     */
    int deleteTbProjectById(Long projectId);
}
