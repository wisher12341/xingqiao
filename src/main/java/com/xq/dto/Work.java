package com.xq.dto;

import java.util.List;

/**
 * 日程安排
 * Created by netlab606 on 2018/1/7.
 */
public class Work {
    private String today;//今天的日期
    private List<WorkMonth> monthWork;
    private List<WorkDay> workDay;

    public String getToday() {
        return today;
    }

    public void setToday(String today) {
        this.today = today;
    }

    public List<WorkMonth> getMonthWork() {
        return monthWork;
    }

    public void setMonthWork(List<WorkMonth> monthWork) {
        this.monthWork = monthWork;
    }

    public List<WorkDay> getWorkDay() {
        return workDay;
    }

    public void setWorkDay(List<WorkDay> workDay) {
        this.workDay = workDay;
    }
}
