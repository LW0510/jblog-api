package com.ghc.project.expert.domain;

import com.ghc.framework.web.domain.BaseEntity;

import java.util.Date;

/**
 * 专家对象 tb_expert
 */
public class Expert extends BaseEntity {

    private static final long serialVersionUID = 1L;


    private Long expertId;

    private String expertName;

    private String expertSex;

    private String professional;

    private String idCard;

    private String work;

    private String duty;

    private String education;

    private String title;

    private String location;

    private String researchResult;

    private String mobile;

    private String email;

    private String certification;

    private String status;

    private String userId;

    private Date addTime;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getExpertId() {
        return expertId;
    }

    public void setExpertId(Long expertId) {
        this.expertId = expertId;
    }

    public String getExpertName() {
        return expertName;
    }

    public void setExpertName(String expertName) {
        this.expertName = expertName;
    }

    public String getExpertSex() {
        return expertSex;
    }

    public void setExpertSex(String expertSex) {
        this.expertSex = expertSex;
    }

    public String getProfessional() {
        return professional;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public void setProfessional(String professional) {
        this.professional = professional;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getResearchResult() {
        return researchResult;
    }

    public void setResearchResult(String researchResult) {
        this.researchResult = researchResult;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCertification() {
        return certification;
    }

    public void setCertification(String certification) {
        this.certification = certification;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }
}
