package com.xq.dto;

public class ScheduleWeekDto {
    public static final int MONDAY = 0;
    public static final int TUESDAY = 1;
    public static final int WEDNESDAY = 2;
    public static final int THURSDAY = 3;
    public static final int FRIDAY = 4;
    public static final int SATURDAY = 5;
    public static final int SUNDAY = 6;


    private ScheduleDayDto[] weekSchedule;

    public ScheduleWeekDto(){
        weekSchedule = new ScheduleDayDto[7];
    }

    public ScheduleDayDto[] getWeekSchedule() {
        return weekSchedule;
    }

    public void setWeekSchedule(ScheduleDayDto[] weekSchedule) {
        if (weekSchedule != null && weekSchedule.length == 7) {
            this.weekSchedule = weekSchedule;
        }
    }

    public ScheduleDayDto getMonday(){
        return getScheduleByDay(MONDAY);
    }

    public ScheduleDayDto getTuesday(){
        return getScheduleByDay(TUESDAY);
    }

    public ScheduleDayDto getWednesday(){
        return getScheduleByDay(WEDNESDAY);
    }

    public ScheduleDayDto getThursday(){
        return getScheduleByDay(THURSDAY);
    }

    public ScheduleDayDto getFriday(){
        return getScheduleByDay(FRIDAY);
    }

    public ScheduleDayDto getSaturday(){
        return getScheduleByDay(SATURDAY);
    }

    public ScheduleDayDto getSunday(){
        return getScheduleByDay(SUNDAY);
    }

    public void setScheduleByDay(ScheduleDayDto scheduleDayDto, Integer day){
        weekSchedule[day] = scheduleDayDto;
    }

    public ScheduleDayDto getScheduleByDay(Integer day){
        return weekSchedule[day];
    }
}
