package com.ghc.project.expert.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ghc.framework.aspectj.lang.annotation.Excel;

import java.util.Date;

public class ExpertVo {

    /** $column.columnComment */
    private Long expertId;

    /** 专家姓名 */
    @Excel(name = "专家姓名")
    private String expertName;

    /** 专家性别 */
    @Excel(name = "专家性别")
    private String expertSex;

    /** 身份证号码 */
    @Excel(name = "身份证号码")
    private String idCard;

    /** 工作单位 */
    @Excel(name = "工作单位")
    private String work;

    /** 职位 */
    @Excel(name = "职位")
    private String duty;

    /** 教育背景 */
    @Excel(name = "教育背景")
    private String education;

    /** 职称 */
    @Excel(name = "职称")
    private String title;

    /** 所在地区 */
    @Excel(name = "所在地区")
    private String location;

    /** 研究成果 */
    @Excel(name = "研究成果")
    private String researchResult;

    /** 移动电话 */
    @Excel(name = "移动电话")
    private String mobile;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 专家认证 */
    @Excel(name = "专家认证")
    private String certification;

//    private List<String> professions;
    private String professional;

    /** 审核状态（通过、拒绝） */
    @Excel(name = "审核状态", readConverterExp = "通=过、拒绝")
    private String status;

    /** 关联系统用户id */
    @Excel(name = "关联系统用户id")
    private Long userId;

    /** 添加时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "添加时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date addTime;

    public void setExpertId(Long expertId)
    {
        this.expertId = expertId;
    }

    public Long getExpertId()
    {
        return expertId;
    }
    public void setExpertName(String expertName)
    {
        this.expertName = expertName;
    }

    public String getExpertName()
    {
        return expertName;
    }
    public void setExpertSex(String expertSex)
    {
        this.expertSex = expertSex;
    }

    public String getExpertSex()
    {
        return expertSex;
    }
    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getIdCard()
    {
        return idCard;
    }
    public void setWork(String work)
    {
        this.work = work;
    }

    public String getWork()
    {
        return work;
    }
    public void setDuty(String duty)
    {
        this.duty = duty;
    }

    public String getDuty()
    {
        return duty;
    }
    public void setEducation(String education)
    {
        this.education = education;
    }

    public String getEducation()
    {
        return education;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setLocation(String location)
    {
        this.location = location;
    }

    public String getLocation()
    {
        return location;
    }
    public void setResearchResult(String researchResult)
    {
        this.researchResult = researchResult;
    }

    public String getResearchResult()
    {
        return researchResult;
    }
    public void setMobile(String mobile)
    {
        this.mobile = mobile;
    }

    public String getMobile()
    {
        return mobile;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getEmail()
    {
        return email;
    }
    public void setCertification(String certification)
    {
        this.certification = certification;
    }

    public String getCertification()
    {
        return certification;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setAddTime(Date addTime)
    {
        this.addTime = addTime;
    }

    public Date getAddTime()
    {
        return addTime;
    }

    public String getProfessional() {
        return professional;
    }

    public void setProfessional(String professional) {
        this.professional = professional;
    }
}
