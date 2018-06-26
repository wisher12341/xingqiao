package com.xq.dto;

import java.util.List;

public class ScheduleDayDto {
    private List<String> todaySchedule;

    public List<String> getTodaySchedule() {
        return todaySchedule;
    }

    public void setTodaySchedule(List<String> todaySchedule) {
        this.todaySchedule = todaySchedule;
    }
}