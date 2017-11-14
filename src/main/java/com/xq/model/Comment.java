package com.xq.model;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 评论
 * Created by netlab606 on 2017/9/7.
 */
public class Comment {

    private Integer id;
    private String detail;
    private Integer level;
    private String time;
    private Integer isOpen;//是否公开  1是

    private String picUrls;

    private User user;//对应的用户

    private String username;//公众号添加-jcy
    private String headimgurl;//公众号添加-jcy

    private Integer type;//评论的类型 1主动评论  0跟帖 2该治疗师回帖
    private Integer good;//赞数
    private Integer report;//举报数

    private List<Comment> commentList;//跟帖
    private Comment teacherComment;//治疗师回应
    private Integer uid;//对应用户id
    private Integer pid;//跟帖 对应父评论id

    private MultipartFile[] pics;//照片

    public MultipartFile[] getPics() {
        return pics;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getHeadimgurl() {
        return headimgurl;
    }

    public void setHeadimgurl(String headimgurl) {
        this.headimgurl = headimgurl;
    }

    public void setPics(MultipartFile[] pics) {
        this.pics = pics;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getPicUrls() {
        return picUrls;
    }

    public void setPicUrls(String picUrls) {
        this.picUrls = picUrls;
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

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public Comment getTeacherComment() {
        return teacherComment;
    }

    public void setTeacherComment(Comment teacherComment) {
        this.teacherComment = teacherComment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getIsOpen() {
        return isOpen;
    }

    public void setIsOpen(Integer isOpen) {
        this.isOpen = isOpen;
    }
}
