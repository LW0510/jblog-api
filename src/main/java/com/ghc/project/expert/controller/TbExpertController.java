package com.ghc.project.expert.controller;

import java.util.List;

import com.ghc.common.utils.poi.ExcelUtil;
import com.ghc.project.expert.domain.TbExpert;
import com.ghc.project.expert.domain.vo.ExpertVo;
import com.ghc.project.expert.service.ITbExpertService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ghc.framework.aspectj.lang.annotation.Log;
import com.ghc.framework.aspectj.lang.enums.BusinessType;
import com.ghc.framework.web.controller.BaseController;
import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.framework.web.page.TableDataInfo;

/**
 * 专家Controller
 * 
 * @author ghc
 * @date 2020-04-26
 */
@RestController
@RequestMapping("/expert")
public class TbExpertController extends BaseController
{
    @Autowired
    private ITbExpertService tbExpertService;

    /**
     * 查询专家列表
     */
    @PreAuthorize("@ss.hasPermi('expert:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExpertVo expertVo)
    {
        startPage();
        List<ExpertVo> list = tbExpertService.selectTbExpertList(expertVo);
        return getDataTable(list);
    }

//    /**
//     * 导出专家列表
//     */
//    @PreAuthorize("@ss.hasPermi('expert:export')")
//    @Log(title = "专家", businessType = BusinessType.EXPORT)
//    @GetMapping("/export")
//    public AjaxResult export(TbExpert tbExpert)
//    {
//        List<ExpertVo> list = tbExpertService.selectTbExpertList(tbExpert);
//        ExcelUtil<ExpertVo> util = new ExcelUtil<ExpertVo>(ExpertVo.class);
//        return util.exportExcel(list, "expert");
//    }

    /**
     * 获取专家详细信息
     */
    @PreAuthorize("@ss.hasPermi('expert:query')")
    @GetMapping(value = "/{expertId}")
    public AjaxResult getInfo(@PathVariable("expertId") Long expertId)
    {
        return AjaxResult.success(tbExpertService.selectTbExpertById(expertId));
    }

    /**
     * 新增专家
     */
    @PreAuthorize("@ss.hasPermi('expert:add')")
    @Log(title = "专家", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExpertVo expert)
    {
        return toAjax(tbExpertService.insertTbExpert(expert));
    }

    /**
     * 修改专家
     */
    @PreAuthorize("@ss.hasPermi('expert:edit')")
    @Log(title = "专家", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TbExpert tbExpert)
    {
        return toAjax(tbExpertService.updateTbExpert(tbExpert));
    }

    /**
     * 删除专家
     */
    @PreAuthorize("@ss.hasPermi('expert:remove')")
    @Log(title = "专家", businessType = BusinessType.DELETE)
	@DeleteMapping("/{expertIds}")
    public AjaxResult remove(@PathVariable Long[] expertIds)
    {
        return toAjax(tbExpertService.deleteTbExpertByIds(expertIds));
    }
}
