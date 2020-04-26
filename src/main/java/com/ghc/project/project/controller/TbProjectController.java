package com.ghc.project.project.controller;

import com.ghc.common.utils.poi.ExcelUtil;
import com.ghc.framework.aspectj.lang.annotation.Log;
import com.ghc.framework.aspectj.lang.enums.BusinessType;
import com.ghc.framework.web.controller.BaseController;
import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.framework.web.page.TableDataInfo;
import com.ghc.project.project.domain.TbProject;
import com.ghc.project.project.service.ITbProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 项目管理Controller
 *
 * @author ghc
 * @date 2020-04-24
 */
@RestController
@RequestMapping("/system/project")
public class TbProjectController extends BaseController
{
    @Autowired
    private ITbProjectService tbProjectService;

    /**
     * 查询项目管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:project:list')")
    @GetMapping("/list")
    public TableDataInfo list(TbProject tbProject)
    {
        startPage();
        List<TbProject> list = tbProjectService.selectTbProjectList(tbProject);
        return getDataTable(list);
    }

    /**
     * 导出项目管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:project:export')")
    @Log(title = "项目管理", businessType = BusinessType.EXPORT)
//    @GetMapping("/export")
    public AjaxResult export(TbProject tbProject)
    {
        List<TbProject> list = tbProjectService.selectTbProjectList(tbProject);
        ExcelUtil<TbProject> util = new ExcelUtil<TbProject>(TbProject.class);
        return util.exportExcel(list, "project");
    }

    /**
     * 获取项目管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:project:query')")
    @GetMapping(value = "/{projectId}")
    public AjaxResult getInfo(@PathVariable("projectId") Long projectId)
    {
        return AjaxResult.success(tbProjectService.selectTbProjectById(projectId));
    }

    /**
     * 新增项目管理
     */
    @PreAuthorize("@ss.hasPermi('system:project:add')")
    @Log(title = "项目管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TbProject tbProject)
    {
        return toAjax(tbProjectService.insertTbProject(tbProject));
    }

    /**
     * 修改项目管理
     */
    @PreAuthorize("@ss.hasPermi('system:project:edit')")
    @Log(title = "项目管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TbProject tbProject)
    {
        return toAjax(tbProjectService.updateTbProject(tbProject));
    }

    /**
     * 删除项目管理
     */
    @PreAuthorize("@ss.hasPermi('system:project:remove')")
    @Log(title = "项目管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{projectIds}")
    public AjaxResult remove(@PathVariable Long[] projectIds)
    {
        return toAjax(tbProjectService.deleteTbProjectByIds(projectIds));
    }
}
