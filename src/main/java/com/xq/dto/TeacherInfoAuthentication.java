package com.xq.dto;

/**
 *用于治疗师 实名认证页面 真实姓名、身份证号  判断 不直接显示内容的 资料是否有内容（比如：证件照、毕业院校等等） 以及 有内容的话 有几条（比如毕业院校）0表示无 其他表示数目
 * Created by netlab606 on 2017/12/28.
 */
public class TeacherInfoAuthentication {

    private String name;
    private String pid;
    private Integer experienceAge;

    private Integer school=0;//毕业学校
    private Integer award=0;//奖励荣誉
    private Integer certificate=0;//相关证书
    private Integer recoveryHis=0;//康复治疗经历
    private Integer successCase=0;//成功案例
    private Integer peoplePidUrl=0;//证件照
    private Integer otherPic=0;//其他资料
    private String abstractTeacher;//简介


    public Integer getExperienceAge() {
        return experienceAge;
    }

    public void setExperienceAge(Integer experienceAge) {
        this.experienceAge = experienceAge;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public Integer getSchool() {
        return school;
    }

    public void setSchool(Integer school) {
        this.school = school;
    }

    public Integer getAward() {
        return award;
    }

    public void setAward(Integer award) {
        this.award = award;
    }

    public Integer getCertificate() {
        return certificate;
    }

    public void setCertificate(Integer certificate) {
        this.certificate = certificate;
    }

    public Integer getRecoveryHis() {
        return recoveryHis;
    }

    public void setRecoveryHis(Integer recoveryHis) {
        this.recoveryHis = recoveryHis;
    }

    public Integer getSuccessCase() {
        return successCase;
    }

    public void setSuccessCase(Integer successCase) {
        this.successCase = successCase;
    }

    public Integer getPeoplePidUrl() {
        return peoplePidUrl;
    }

    public void setPeoplePidUrl(Integer peoplePidUrl) {
        this.peoplePidUrl = peoplePidUrl;
    }

    public Integer getOtherPic() {
        return otherPic;
    }

    public void setOtherPic(Integer otherPic) {
        this.otherPic = otherPic;
    }

    public String getAbstractTeacher() {
        return abstractTeacher;
    }

    public void setAbstractTeacher(String abstractTeacher) {
        this.abstractTeacher = abstractTeacher;
    }
}
