package com.xq.model;


import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 机构评论
 * Created by netlab606 on 2017/10/4.
 */
public class OrganComment {

    private Integer id;
    private String time;
    private String detail;//评论内容
    private String picurls;//评论照片路径 多个以“#”分割
    private Integer isOpen;//是否公开 1公开 0匿名
    private Integer type;//评论的类型 1主动评论  0跟帖 2该机构跟帖
    private Integer good;//赞数
    private Integer report;//举报数
    private Integer pid;//如果是回应的话 其 主动评论id

    private Integer oid;//对应机构ID
    private Integer uid;//对应用户id
    private User user;//对应的用户
    private Organization organization;//对应的机构
    private List<OrganComment> organCommentChildList;//如果是主动评论的话  其 跟帖

    private MultipartFile[] pics;

    public MultipartFile[] getPics() {
        return pics;
    }

    public void setPics(MultipartFile[] pics) {
        this.pics = pics;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public List<OrganComment> getOrganCommentChildList() {
        return organCommentChildList;
    }

    public void setOrganCommentChildList(List<OrganComment> organCommentChildList) {
        this.organCommentChildList = organCommentChildList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getPicurls() {
        return picurls;
    }

    public void setPicurls(String picurls) {
        this.picurls = picurls;
    }

    public Integer getIsOpen() {
        return isOpen;
    }

    public void setIsOpen(Integer isOpen) {
        this.isOpen = isOpen;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getGood() {
        return good;
    }

    public void setGood(Integer good) {
        this.good = good;
    }

    public Integer getReport() {
        return report;
    }

    public void setReport(Integer report) {
        this.report = report;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}
