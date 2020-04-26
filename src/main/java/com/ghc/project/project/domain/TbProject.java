package com.ghc.project.project.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ghc.framework.aspectj.lang.annotation.Excel;
import com.ghc.project.system.domain.SysDictData;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

/**
 * @author ：Liz
 * @date ：2020/4/24
 */
@Getter
@Setter
public class TbProject {
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long projectId;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String projectName;

    /** 项目类型 */
    @Excel(name = "项目类型")
    private Integer projectType;

    /** 项目内容 */
    @Excel(name = "项目内容")
    private String content;

    /** 需求描述 */
    @Excel(name = "需求描述")
    private String description;

    /** 费用预算 */
    @Excel(name = "费用预算")
    private String cost;

    /** 任务完成时间 */
    @Excel(name = "任务完成时间")
    private Integer days;

    /** 所在地区 */
    @Excel(name = "所在地区")
    private String location;

    /** 机构/企业名称 */
    @Excel(name = "机构/企业名称")
    private String organization;

    /** 联系人 */
    @Excel(name = "联系人")
    private String contacts;

    /** 联系方式 */
    @Excel(name = "联系方式")
    private String contactWay;

    /** 电子邮箱 */
    @Excel(name = "电子邮箱")
    private String email;


    private Long userId;

    /** 添加时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "添加时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date addTime;

    /** '项目状态（状态：已发布、审核中、已关闭、未通过）' */
    @Excel(name = "项目状态", readConverterExp = "状态：已发布、审核中、已关闭、未通过")
    private Integer status;
    /** 申请人姓名*/
    @Excel(name = "申请人")
    private String userName;

    private List<SysDictData> professionals;

}
