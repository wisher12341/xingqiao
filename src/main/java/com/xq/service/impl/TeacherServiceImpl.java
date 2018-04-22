package com.xq.service.impl;

import com.xq.dao.CommentDao;
import com.xq.dao.OrderDao;
import com.xq.dao.TeacherDao;
import com.xq.dao.UserDao;
import com.xq.dto.*;
import com.xq.model.*;
import com.xq.service.TeacherService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import com.xq.util.OrderUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by joy12 on 2017/11/6.
 */
@Service
public class TeacherServiceImpl implements TeacherService{

    @Autowired
    TeacherDao teachersDao;
    @Autowired
    CommentDao commentDao;
    @Autowired
    OrderDao orderDao;
    @Autowired
    UserDao userDao;


    public List<Teacher> getTeachers(Teacher teacher, String years, String priceSelect) {
        Integer minY=0;
        Integer maxY=0;

        Integer minP=0;
        Integer maxP=0;

        Integer flag=0;//用于标记 上门方式 跟价格区间 都进行了筛选 则查询时  按照特定的规则 0无 1治疗师上门 2学生上门 3在线授课

        //教学经验
        if(years!=null&&!years.equals("")) {
            if (years.equals("3年以下")) {
                maxY=3;
            }else if(years.equals("3-5年")){
                minY=3;
                maxY=5;
            }else  if(years.equals("5年以上")){
                minY=5;
            }
        }
        //价格区间
        if(priceSelect!=null&&!priceSelect.equals("")&&!priceSelect.equals("不限")) {
            if(teacher.getWay()!= null && !teacher.getWay().equals("") && !teacher.getWay().equals("不限")){
                if(teacher.getWay().equals("治疗师上门")) {
                    flag = 1;
                }else if(teacher.getWay().equals("学生上门")){
                    flag=2;
                }else{
                    flag=3;
                }
            }
            if (priceSelect.equals("80-150元")) {
                maxP=150;
                minP=80;
            }else if(priceSelect.equals("150-300元")){
                minP=150;
                maxP=300;
            }else  if(priceSelect.equals("300-500元")){
                minP=300;
                maxP=500;
            }else  if(priceSelect.equals("500元以上")){
                minP=500;
                maxP=10000;
            }
        }



        List<Teacher> teacherList=teachersDao.getCheckedTeachers(teacher,minY,minP,maxP,maxY,flag);
        for(Teacher teacher1:teacherList){
            if(teacher1.getGender().equals("0")){
                teacher1.setGender("男");
            }else {
                teacher1.setGender("女");
            }

            //显示 价格区间
            Integer max = teacher1.getPriceMax();
            Integer min = teacher1.getPriceMin();

            if(max != null && min != null && max != min){
                teacher1.setPrice(min+"-"+max);
            }else{
                teacher1.setPrice(min+"");
            }

            if(teacher1.getDomain()!=null){
                teacher1.setDomain(teacher1.getDomain().replace("、", " "));
            }

            if(teacher1.getObject()!=null){
                teacher1.setObject(teacher1.getObject().replace("、", " "));
            }
        }
        return teacherList;
    }

    public Teacher getTeacher(Integer teacher_id) {
        Teacher teacher=teachersDao.getTeacher(teacher_id);
        teacher.setCommentList(commentDao.getCommentByTid(teacher.getId()));

        if(teacher.getSchool()!=null && !teacher.getSchool().equals("")) {
            List<TeacherInfoSchool> teacherInfoSchools = new ArrayList<>();
            String[] re = teacher.getSchool().split("#");
            int i = 0;
            for (String s : re) {
                TeacherInfoSchool teacherInfoSchool = new TeacherInfoSchool();
                String[] ss = s.split("@");
                teacherInfoSchool.setIndex(i++);
                teacherInfoSchool.setSchoolName(ss[0]);
                teacherInfoSchool.setStartTime(ss[1]);
                teacherInfoSchool.setEndTime(ss[2]);
                switch (ss[3]) {
                    case "0":
                        teacherInfoSchool.setEducation("专科");
                        break;
                    case "1":
                        teacherInfoSchool.setEducation("本科");
                        break;
                    case "2":
                        teacherInfoSchool.setEducation("硕士");
                        break;
                    case "3":
                        teacherInfoSchool.setEducation("博士");
                        break;
                }
                teacherInfoSchool.setMajor(ss[4]);
                teacherInfoSchools.add(teacherInfoSchool);
            }
            Collections.sort(teacherInfoSchools);
            teacher.setTeacherInfoSchoolList(teacherInfoSchools);
        }
        return teacher;
    }

    @Override
    public void addComment(Comment comment, HttpServletRequest request) {
        String pattern = "<img.*?>";
        String detai=comment.getDetail();
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(detai);
        while (m.find()){
            int begin=m.group().indexOf(".png")-5;
            int end=m.group().indexOf(".png");
            String number=m.group().substring(begin,end);
            detai=detai.replace(m.group(),"&#x"+number+";");

        }
        comment.setDetail(detai);
        //User user= (User) request.getSession().getAttribute("USER");
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
//        String openid="123";
        User user=userDao.getParentByOpenid(openid);
        comment.setUid(user.getId());

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);

        comment.setTime(dateNowStr);

        commentDao.addComment(comment);
    }

    @Override
    public List<String> getCommentPics(Integer cid, Integer index) {
        Comment comment=commentDao.getCommentById(cid);
        List<String> pics=new ArrayList<String>();
        String[] str=comment.getPicUrls().split("#");
        for(int i=0;i<str.length;i++){
            pics.add(str[i]);
        }
        return pics;
    }

    @Override
    public List<String> getAvailableDaysInAMonth(Integer tid) {
        List<String> starts=new ArrayList<String>();

        Teacher teacher=teachersDao.getTeacher(tid);

        Date today = new Date();
        Calendar c = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));

        ScheduleWeekDto scheduleWeekDto = OrderUtils.decodeScheduleWeek(teacher.getSchedule());
        List<Order> onGoingOrders = orderDao.getOnGoingOrdersByTid(tid);

        //接下来一个月的时间
        for(int i=1;i<=30;i++){
            //获得治疗师一周安排表
            c.setTime(today);
            c.add(Calendar.DAY_OF_MONTH,i);
            ScheduleDayDto todaySchedule = scheduleWeekDto.getScheduleByDay(OrderUtils.getWeekDayIndex(c));

            /**
             * 以课时为单位
             * 判断各个课时是否已被安排
             */
            if (todaySchedule != null) {
                for (String scheduleTime : todaySchedule.getTodaySchedule()){
                    String serverTime = OrderUtils.scheduleToServerTime(scheduleTime, c.getTime());
                    boolean isThisTimeAvailable = true;
                    for (Order orderOnGoing : onGoingOrders){
                        if (orderOnGoing.getServerTime().contains(serverTime)){
                            isThisTimeAvailable = false;
                            break;
                        }
                    }

                    //一天中有一个时间空闲，就可以显示，结束循环
                    if (isThisTimeAvailable){
                        starts.add(sdf.format(c.getTime()));
                        break;
                    }
                }
            }

        }

        return starts;
    }

    @Override
    public CalendarDto order_time_day(Integer tid, String d) throws ParseException {
        CalendarDto calendarDto = new CalendarDto();
        List<String> start = new ArrayList<String>();
        List<String> title = new ArrayList<String>();
        List<String> end = new ArrayList<String>();
        List<String> className = new ArrayList<String>();
        List<String> period = new ArrayList<>();


        Teacher teacher=teachersDao.getTeacher(tid);

        Date date = null;
        SimpleDateFormat sf1 = new SimpleDateFormat("EEE MMM dd yyyy hh:mm:ss",Locale.ENGLISH);
        SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd");
        String now = null;
        try {
            String tmp = d.split("GMT")[0];
            date = sf1.parse(tmp);
            now=sf2.format(date);

        } catch (ParseException e){
            date = sf2.parse(d);
            now = d;
        }


        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int week=c.get(Calendar.DAY_OF_WEEK);//该天周几  1为周日
        if(week==1){
            week=7;
        }else{
            week=week-1;
        }
        String schedule=teacher.getSchedule();//获得治疗师一周安排表
        String today_schedule=schedule.split("#")[week-1];//今日的工作安排

        List<Order> orderList=orderDao.getTodayServiceTime(now,teacher.getId());//获取当天 正在进行的订单 匹配日期
        List<String> service_time=new ArrayList<String>(); //存储 当天已预约的 起%止  时间
        //只取该天的  服务的时分
        for(Order order:orderList){
            for(String time:order.getServerTime().split("#")){
                if(time.split(" ")[0].equals(now)){
                    service_time.add(time.split(" ")[1]);
                }
            }
        }

        //分析一周安排表中 当天的各个时间段  每个时间段是一课时 看订单是否 已安排的
        for(String time:today_schedule.split("@")){
            if (time.equals("0")) continue;

            if(service_time.size()==0){
                start.add(now+"T"+time.split("-")[0]);
                title.add("可预约");
                end.add(now+"T"+time.split("-")[1]);
                className.add("orderY");
                period.add(time);
                continue;
            }

            for(int i=0;i<service_time.size();i++){
                if(inTime(time,service_time.get(i))){
                    //判断 开始时间和结束时间  是否在该时间段内 只要有一个在 则该时间段 就不可预约
                    start.add(now+"T"+time.split("-")[0]);
                    title.add("已预约");
                    end.add(now+"T"+time.split("-")[1]);
                    className.add("orderN");
                    period.add(time);
                    break;
                }
                if(i==service_time.size()-1){
                    //遍历到最后  则该节课可预约
                    start.add(now+"T"+time.split("-")[0]);
                    title.add("可预约");
                    end.add(now+"T"+time.split("-")[1]);
                    className.add("orderY");
                    period.add(time);
                }

            }

        }
        calendarDto.setStart(start);
        calendarDto.setEnd(end);
        calendarDto.setTitle(title);
        calendarDto.setClassName(className);
        calendarDto.setPeriod(period);
        return calendarDto;
    }

    private boolean inTime(String time, String ser) {
        String start=ser.split("%")[0];
        String end=ser.split("%")[1];

        String start_time=time.split("-")[0];
        String end_time=time.split("-")[1];
        if(start.compareTo(start_time)>=0 && start.compareTo(end_time)<=0){
            return true;
        }
        if(end.compareTo(start_time)>=0 && end.compareTo(end_time)<=0){
            return true;
        }
        return false;
    }

    @Override
    public Map<String,String> order_time(String start, String end) throws ParseException {
        Map<String,String> resultMap = new HashMap<>();
        String[] weekArr = {"日", "一", "二", "三", "四", "五", "六"};
        SimpleDateFormat sf1 = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss",Locale.ENGLISH);
        SimpleDateFormat sftime = new SimpleDateFormat("HH:mm");
        SimpleDateFormat sfdate = new SimpleDateFormat("yyyy-MM-dd");

        start=start.split("GMT")[0];
        end=end.split("GMT")[0];
        Date dateStart = sf1.parse(start);
        Date dateEnd=sf1.parse(end);

        resultMap.put("date",sfdate.format(dateStart));
        resultMap.put("time",sftime.format(dateStart)+"-"+sftime.format(dateEnd));

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(dateStart);
        resultMap.put("weekDay",weekArr[calendar.get(Calendar.DAY_OF_WEEK)-1]);
        resultMap.put("monthDay",calendar.get(Calendar.DAY_OF_MONTH)+"日");

        return resultMap;
    }

    @Override
    public List<Comment> getTeacherComments(Integer id) {
        return commentDao.getMainTeacherCommentsByTid(id);
    }

    @Override
    public Comment getTeacherCommentByCid(Integer cid) {
        return commentDao.getCommentByCid(cid);
    }

    @Override
    public List<Comment> getCommentsByPage(Integer teacherId, Integer page, Integer size){
        Integer start = (page-1)*size;
        return commentDao.getMainCommentsByTidAndPage(teacherId,start,size);
    }

    @Override
    public List<String> getTeacherSchedule(Integer tid) {
        List<String> list = new ArrayList<>();
        String schedule = teachersDao.getScheduleByTid(tid);
        if (schedule != null && !schedule.isEmpty()){
            for (String item : schedule.split("#")) {
                list.add(item);
            }
        }
        list.add(0,list.get(list.size()-1));
        list.remove(list.size()-1);
        return list;
    }

    @Override
    public List<String> getAvailableDateByWeekday(int tid, String condition){
        List<String> result = new ArrayList<>();

        List<String> starts = getAvailableDaysInAMonth(tid);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        String[] conditions = condition.split("@");

        for (String item : starts){
            try {
                int dayOfWeek = OrderUtils.getWeekDay(sdf.parse(item));
                if (dayOfWeek == 7){
                    dayOfWeek = 0;
                }

                if (String.valueOf(dayOfWeek).equals(conditions[0]) && canOrder(order_time_day(tid,item), conditions[1])){
                    result.add(item);
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    private boolean canOrder(CalendarDto calendarDto, String condition){
        if (calendarDto == null) return false;

        String[] conditions = condition.split("%");
        List<String> starts = calendarDto.getStart();
        List<String> ends = calendarDto.getEnd();

        if (starts.size() != ends.size()) return false;

        for (int i=0; i<starts.size(); i++) {
            if (calendarDto.getClassName().get(i).equals("orderY") && starts.get(i).contains(conditions[0]) && ends.get(i).contains(conditions[1])){
                return true;
            }
        }

        return false;

    }



    @Override
    public String formatDateAndTime(String gmt){
        SimpleDateFormat sf1 = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss",Locale.ENGLISH);
        SimpleDateFormat sfdate = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = gmt.split("GMT")[0];
        try {
            Date dateFrom = sf1.parse(dateStr);
            return sfdate.format(dateFrom);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return gmt;
    }

    @Override
    public List<String> weekLoop(Order order){
        List<String> resultList = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();

        List<OrderServerTimeDto> startServeTimes = OrderUtils.decodeServerTime(order.getServerTime());

        int amount = Integer.parseInt(order.getAmount());

        List<Order> onGoingOrders = orderDao.getOnGoingOrdersByTid(order.getTeacher().getId());
        List<OrderServerTimeDto> onGoingServerTimes = new ArrayList<>();
        for (Order orderOnGoing : onGoingOrders) {
            onGoingServerTimes.addAll(OrderUtils.decodeServerTime(orderOnGoing.getServerTime()));
        }

        List<OrderServerTimeDto> availableTimes = new ArrayList<>();
        List<OrderServerTimeDto> conflictTimes = new ArrayList<>();

        do {
            List<OrderServerTimeDto> tmp = new ArrayList<>();
            for (int i = 0; i < startServeTimes.size(); i++){
                OrderServerTimeDto currentServeTime = startServeTimes.get(i);

                boolean isThisTimeAvailable = true;

                if (CollectionUtils.isNotEmpty(onGoingOrders)){
                    for (OrderServerTimeDto onGoingTime : onGoingServerTimes) {
                        if (OrderUtils.isOrderTimeConflict(currentServeTime, onGoingTime)){
                            isThisTimeAvailable = false;
                            break;
                        }
                    }
                }

                if (isThisTimeAvailable){
                    availableTimes.add(currentServeTime);
                    amount--;
                    if (amount <= 0){
                        resultList.add(OrderUtils.fromServerTime(availableTimes));
                        resultList.add(OrderUtils.fromServerTime(conflictTimes));
                        return resultList;
                    }
                } else {
                    conflictTimes.add(currentServeTime);
                }

                OrderServerTimeDto nextWeek = new OrderServerTimeDto();
                calendar.setTime(currentServeTime.getStart());
                calendar.add(Calendar.DATE, 7);
                nextWeek.setStart(calendar.getTime());
                calendar.setTime(currentServeTime.getEnd());
                calendar.add(Calendar.DATE, 7);
                nextWeek.setEnd(calendar.getTime());

                tmp.add(nextWeek);
            }

            startServeTimes = tmp;
        } while (amount > 0);

        resultList.add(OrderUtils.fromServerTime(availableTimes));
        resultList.add(OrderUtils.fromServerTime(conflictTimes));
        return resultList;

    }


}
