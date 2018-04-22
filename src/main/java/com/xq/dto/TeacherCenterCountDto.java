package com.xq.dto;

//治疗师 个人中心  日志中心 评论中心 等的  数量或者 未读数量
public class TeacherCenterCountDto {

    private Integer logNumber;//日志中心
    private Integer commentNumber;//评论中心
    private Integer messageNumber;//消息中心

    public Integer getLogNumber() {
        return logNumber;
    }

    public void setLogNumber(Integer logNumber) {
        this.logNumber = logNumber;
    }

    public Integer getCommentNumber() {
        return commentNumber;
    }

    public void setCommentNumber(Integer commentNumber) {
        this.commentNumber = commentNumber;
    }

    public Integer getMessageNumber() {
        return messageNumber;
    }

    public void setMessageNumber(Integer messageNumber) {
        this.messageNumber = messageNumber;
    }
}
