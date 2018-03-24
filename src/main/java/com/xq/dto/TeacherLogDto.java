package com.xq.dto;

import com.xq.model.Order;

//治疗师 日志中心
public class TeacherLogDto {
    private Integer count;//康复日志填写的进度
    private Order order;
    private String time;//需要 填写康复日志的  康复时间

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
