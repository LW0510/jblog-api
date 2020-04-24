package com.ghc.project.expert.controller;

import com.ghc.framework.web.controller.BaseController;
import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.framework.web.page.TableDataInfo;
import com.ghc.project.expert.domain.Expert;
import com.ghc.project.expert.service.ExpertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/expert")
public class ExpertController extends BaseController {

    @Autowired
    private ExpertService expertService;


    /**
     * 获取专家列表
     */
//    @PreAuthorize("@ss.hasPermi('system:user:list')")
    @GetMapping("/list")
    public TableDataInfo list(Expert expert)
    {
        startPage();
        List<Expert> list = expertService.selectExpertList(expert);
        return getDataTable(list);
    }


    /**
     * 添加专家
     */
    @PostMapping
    public AjaxResult add(@RequestBody Expert expert){

        if(expertService.checkIcdExisted(expert.getIdCard())) {
            return AjaxResult.error("添加专家'" + expert.getExpertName() + "'失败，身份证已存在");
        }else if(expertService.checkEmailExisted(expert.getEmail())){
            return AjaxResult.error("添加专家'" + expert.getExpertName() + "'失败，邮箱已存在");
        }
        return toAjax(expertService.addExpert(expert));
    }


    /**
     * 修改专家
     */
//    @PreAuthorize("@ss.hasPermi('system:expert:edit')")
//    @Log(title = "专家", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Expert expert)
    {
        return toAjax(expertService.updateExpert(expert));
    }

    /**
     * 删除专家
     */
//    @PreAuthorize("@ss.hasPermi('system:expert:remove')")
//    @Log(title = "专家", businessType = BusinessType.DELETE)
    @DeleteMapping("/{expertIds}")
    public AjaxResult remove(@PathVariable Long[] expertIds)
    {
        return toAjax(expertService.deleteExpertByIds(expertIds));
    }


}
