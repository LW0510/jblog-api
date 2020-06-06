package com.jblog.project.blog.record.controller;

import com.jblog.framework.aspectj.lang.annotation.Log;
import com.jblog.framework.aspectj.lang.enums.BusinessType;
import com.jblog.framework.web.controller.BaseController;
import com.jblog.framework.web.domain.AjaxResult;
import com.jblog.framework.web.page.TableDataInfo;
import com.jblog.project.blog.record.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.jblog.project.blog.entity.RecordEntity;

import java.util.List;

@RestController
@RequestMapping("/record")
public class RecordController extends BaseController {

    @Autowired
    private RecordService recordService;

//    @PreAuthorize("@ss.hasPermi('system:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(RecordEntity recordEntity)
    {
        startPage();
        List<RecordEntity> list = recordService.selectRecordEntityList(recordEntity);
        return getDataTable(list);
    }


//    @PreAuthorize("@ss.hasPermi('system:record:query')")
    @GetMapping("/getRecord")
    public AjaxResult getInfo(@RequestParam("id") Long id)
    {
        return AjaxResult.success(recordService.selectRecordEntityById(id));
    }


//    @PreAuthorize("@ss.hasPermi('system:record:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/addRecord")
    public AjaxResult add(RecordEntity recordEntity)
    {
        return toAjax(recordService.insertRecordEntity(recordEntity));
    }


//    @PreAuthorize("@ss.hasPermi('system:record:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/updateRecord")
    public AjaxResult edit(RecordEntity recordEntity)
    {
        return toAjax(recordService.updateRecordEntity(recordEntity));
    }

    /**
     * 删除【请填写功能名称】
     */
//    @PreAuthorize("@ss.hasPermi('system:record:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping("/deleteRecord")
    public AjaxResult remove(@RequestParam("id") Long id)
    {
        return toAjax(recordService.deleteRecordEntityByIds(new Long[]{id}));
    }
}
