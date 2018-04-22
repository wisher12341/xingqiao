package com.xq.dto;

import java.util.List;

/**
 * Created by netlab606 on 2018/1/12.
 */
public class WorkDayDto {
    private List<WorkDay> work;
    private String today;

    public List<WorkDay> getWork() {
        return work;
    }

    public void setWork(List<WorkDay> work) {
        this.work = work;
    }

    public String getToday() {
        return today;
    }

    public void setToday(String today) {
        this.today = today;
    }
}
