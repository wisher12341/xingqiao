package com.xq.util;

import com.xq.dto.OrderServerTimeDto;
import com.xq.dto.ScheduleDayDto;
import com.xq.dto.ScheduleWeekDto;
import com.xq.model.Order;
import org.apache.commons.lang.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class OrderUtils {
    private static String SERVER_SEPERATOR_DATE = "#";
    private static String SERVER_SEPERATOR_TIME = "%";

    private static String SCHEDULE_SEPERATOR_DAY = "#";
    private static String SCHEDULE_SEPERATOR_LESSON = "@";
    private static String SCHEDULE_SEPERATOR_TIME = "-";

    private static String DATETIME_TEMPLATE = "yyyy-MM-dd HH:mm";
    private static String DATE_TEMPLATE = "yyyy-MM-dd";
    private static String TIME_TEMPLATE = "HH:mm";

    private static int MIN_HISTORIC_ORDER_STATUS = 11;

    public static String scheduleToServerTime(String scheduleTime, Date date){
        if (StringUtils.isEmpty(scheduleTime) || date == null) return "";
        SimpleDateFormat sdf = new SimpleDateFormat(DATE_TEMPLATE);
        String dateStr = sdf.format(date);

        return dateStr + " " + scheduleTime.replace(SCHEDULE_SEPERATOR_TIME, SERVER_SEPERATOR_TIME);
    }

    public static int getWeekDayIndex(Calendar calendar){
        return getWeekDay(calendar) - 1;
    }

    public static int getWeekDay(Calendar calendar){
        if (calendar == null) return  -1;

        int weekDay = calendar.get(Calendar.DAY_OF_WEEK);//该天周几  1为周日
        if(weekDay == 1){
            weekDay = 7;
        }else{
            weekDay = weekDay-1;
        }
        return weekDay;
    }

    public static int getWeekDay(Date date){
        if (date == null) return -1;

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return getWeekDay(calendar);
    }

    public static ScheduleWeekDto decodeScheduleWeek(String str){
        ScheduleWeekDto scheduleWeekDto = new ScheduleWeekDto();
        if (StringUtils.isEmpty(str)) return scheduleWeekDto;

        String[] scheduleWeek = str.split(SCHEDULE_SEPERATOR_DAY);
        if (scheduleWeek != null && scheduleWeek.length == 7){
            List<ScheduleDayDto> scheduleDayDtoList = new ArrayList<>();
            for (String schedule : scheduleWeek) {
                List<String> scheduleList = new ArrayList<>();
                for (String s : schedule.split(SCHEDULE_SEPERATOR_LESSON)) {
                    if (!"0".equals(s)){
                        scheduleList.add(s);
                    }
                }
                ScheduleDayDto scheduleDayDto = new ScheduleDayDto();
                scheduleDayDto.setTodaySchedule(scheduleList);
                scheduleDayDtoList.add(scheduleDayDto);
            }
            scheduleWeekDto.setWeekSchedule(scheduleDayDtoList.toArray(new ScheduleDayDto[0]));
        }

        return scheduleWeekDto;
    }


    public static OrderServerTimeDto toServerTime(String str){
        OrderServerTimeDto result = new OrderServerTimeDto();
        if (StringUtils.isEmpty(str)) return result;

        SimpleDateFormat sdfTime = new SimpleDateFormat(DATETIME_TEMPLATE);
        SimpleDateFormat sdfDate = new SimpleDateFormat(DATE_TEMPLATE);

        String[] times = str.split(SERVER_SEPERATOR_TIME);
        if (times.length == 2) {
            try {
                Date start = sdfTime.parse(times[0]);

                StringBuffer endTimeStr = new StringBuffer();
                endTimeStr.append(sdfDate.format(start)).append(" ").append(times[1]);

                Date end = sdfTime.parse(endTimeStr.toString());

                result.setStart(start);
                result.setEnd(end);

            } catch (ParseException e) {
                e.printStackTrace();
            }
        }


        return result;
    }

    public static String fromServerTime(OrderServerTimeDto dto){

        SimpleDateFormat sdfDateTime = new SimpleDateFormat(DATETIME_TEMPLATE);
        SimpleDateFormat sdfTime = new SimpleDateFormat(TIME_TEMPLATE);

        String result = sdfDateTime.format(dto.getStart()) + SERVER_SEPERATOR_TIME + sdfTime.format(dto.getEnd());

        return result;
    }

    public static String fromServerTime(List<OrderServerTimeDto> dto){
        Collections.sort(dto, new Comparator<OrderServerTimeDto>() {
            @Override
            public int compare(OrderServerTimeDto o1, OrderServerTimeDto o2) {
                if (o1 == null || o2 == null || o1.getStart() == null || o2.getStart() == null) return 0;
                if (o1.getStart().before(o2.getStart())){
                    return -1;
                } else if (o1.getStart().after(o2.getStart())){
                    return 1;
                }
                return 0;
            }
        });

        StringBuffer sb = new StringBuffer();

        for (OrderServerTimeDto time : dto) {
            sb.append(fromServerTime(time)).append(SERVER_SEPERATOR_DATE);
        }

        if (sb.length() > 0){
            return sb.substring(0, sb.length()-1);
        }

        return sb.toString();
    }

    public static List<OrderServerTimeDto> decodeServerTime(String str){
        List<OrderServerTimeDto> resultList = new ArrayList<>();
        if (StringUtils.isEmpty(str)) return resultList;

        String[] lessons = str.split(SERVER_SEPERATOR_DATE);
        if (lessons != null && lessons.length > 0){
            SimpleDateFormat sdfTime = new SimpleDateFormat(DATETIME_TEMPLATE);
            SimpleDateFormat sdfDate = new SimpleDateFormat(DATE_TEMPLATE);

            for (String lesson : lessons) {
                String[] times = lesson.split(SERVER_SEPERATOR_TIME);
                if (times.length == 2) {
                    try {
                        Date start = sdfTime.parse(times[0]);

                        StringBuffer endTimeStr = new StringBuffer();
                        endTimeStr.append(sdfDate.format(start)).append(" ").append(times[1]);

                        Date end = sdfTime.parse(endTimeStr.toString());

                        OrderServerTimeDto orderServerTimeDto = new OrderServerTimeDto();
                        orderServerTimeDto.setStart(start);
                        orderServerTimeDto.setEnd(end);

                        resultList.add(orderServerTimeDto);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        return resultList;
    }

    public static boolean isOrderConflict(Order order1, Order order2){
        // 同一个订单
        if (StringUtils.equals(order1.getId(),order2.getId())){
            return false;
        }

        // 至少一个是历史订单
        if (order1.getStatusP() >= MIN_HISTORIC_ORDER_STATUS || order1.getStatusT() >= MIN_HISTORIC_ORDER_STATUS ||
                order1.getStatusP() >= MIN_HISTORIC_ORDER_STATUS || order1.getStatusT() >= MIN_HISTORIC_ORDER_STATUS){
            return false;
        }

        // 服务时间是否有重叠
        if (order1.getTeacherId() == null ?
                order2.getTeacherId() == null :
                order1.getTeacherId().equals(order2.getTeacherId())){
            List<OrderServerTimeDto> list1 = decodeServerTime(order1.getServerTime());
            List<OrderServerTimeDto> list2 = decodeServerTime(order2.getServerTime());

            for (OrderServerTimeDto time1 : list1) {
                for (OrderServerTimeDto time2 : list2){
                    if (isOrderTimeConflict(time1, time2)){
                        return true;
                    }
                }
            }
        }

        return false;
    }

    public static boolean isOrderTimeConflict(OrderServerTimeDto time1, OrderServerTimeDto time2){
        if (time1 == null || time2 == null){
            return false;
        }

        if (time1.getEnd().before(time2.getStart()) || time2.getEnd().before(time1.getStart())){
            return false;
        }

        return true;
    }
}