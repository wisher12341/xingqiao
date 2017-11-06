package com.xq.model;

/**
 * 记录用户 点赞、举报 哪个 类别的评论id
 * Created by netlab606 on 2017/10/5.
 */
public class UserGoodReport {

    private Integer uid;
    private String orgCommentGood="";//机构评论赞 id 以 #分割
    private String orgCommentReport="";//机构评论举报 id 以 #分割
    private String teacherCommentGood="";//治疗师评论赞 id 以 #分割
    private String teacherCommentReport="";//治疗师评论举报 id 以 #分割

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getOrgCommentGood() {
        return orgCommentGood;
    }

    public void setOrgCommentGood(String orgCommentGood) {
        this.orgCommentGood = orgCommentGood;
    }

    public String getOrgCommentReport() {
        return orgCommentReport;
    }

    public void setOrgCommentReport(String orgCommentReport) {
        this.orgCommentReport = orgCommentReport;
    }

    public String getTeacherCommentGood() {
        return teacherCommentGood;
    }

    public void setTeacherCommentGood(String teacherCommentGood) {
        this.teacherCommentGood = teacherCommentGood;
    }

    public String getTeacherCommentReport() {
        return teacherCommentReport;
    }

    public void setTeacherCommentReport(String teacherCommentReport) {
        this.teacherCommentReport = teacherCommentReport;
    }
}
