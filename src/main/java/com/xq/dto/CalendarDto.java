package com.xq.dto;

import java.util.List;

/**
 * 日历
 * Created by netlab606 on 2017/10/28.
 */
public class CalendarDto {
    private List<String> start;//开始时间
    private List<String> title;
    private List<String> end;//结束时间
    private List<String> period;
    private List<String> className;//日程   样式class 名

    public List<String> getClassName() {
        return className;
    }

    public void setClassName(List<String> className) {
        this.className = className;
    }

    public List<String> getStart() {
        return start;
    }

    public void setStart(List<String> start) {
        this.start = start;
    }

    public List<String> getTitle() {
        return title;
    }

    public void setTitle(List<String> title) {
        this.title = title;
    }

    public List<String> getEnd() {
        return end;
    }

    public void setEnd(List<String> end) {
        this.end = end;
    }

    public List<String> getPeriod() {
        return period;
    }

    public void setPeriod(List<String> period) {
        this.period = period;
    }
}
