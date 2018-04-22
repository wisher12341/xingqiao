package com.xq.dto;

/**
 * 月视图中标记  哪些天 有安排
 * Created by netlab606 on 2018/1/7.
 */
public class WorkMonth {
    //按照 fullcalendar的参数格式
    private String start;
    private String title;

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
