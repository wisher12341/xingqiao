package com.xq.model;

/**
 * 康复日志
 * Created by netlab606 on 2017/7/25.
 */
public class RecoveryLog {
    private Integer id;
    private String orderId;
    private String time;
    private String confirmTime;
    private Integer confirmStatus; //0未确认   1已确认    2预期确认
    private String content;
    private Integer remindStatus; //0未提醒 1已提醒

    private String teacherName;//治疗师 姓名  在家长个人中心的需求管理的  需求详情的康复日志 显示 治疗师的姓名，表明哪个治疗师写的
    private String recoverOb;//康复领域

    public String getRecoverOb() {
        return recoverOb;
    }

    public void setRecoverOb(String recoverOb) {
        this.recoverOb = recoverOb;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getConfirmTime() {
        return confirmTime;
    }

    public void setConfirmTime(String confirmTime) {
        this.confirmTime = confirmTime;
    }

    public Integer getConfirmStatus() {
        return confirmStatus;
    }

    public void setConfirmStatus(Integer confirmStatus) {
        this.confirmStatus = confirmStatus;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getRemindStatus() {
        return remindStatus;
    }

    public void setRemindStatus(Integer remindStatus) {
        this.remindStatus = remindStatus;
    }
}
