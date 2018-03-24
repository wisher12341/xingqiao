package com.xq.service.impl;

import com.xq.dao.*;
import com.xq.dto.*;
import com.xq.model.*;
import com.xq.service.TeacherCenterService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import com.xq.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 86761 on 2017/11/10.
 */
@Service
public class TeacherCenterServiceImpl implements TeacherCenterService {
    @Autowired
    TeacherCenterDao teacherCenterDao;
    @Autowired
    MessageDao messageDao;
    @Autowired
    DemandDao demandDao;
    @Autowired
    UserDao userDao;
    @Autowired
    OrderTeacherDao orderTeacherDao;
    @Autowired
    RecoveryLogDao recoveryLogDao;
    @Autowired
    CommentDao commentDao;
    @Autowired
    OrderDao orderDao;

    @Override
    public String getNameByUserId(int userId){
        return teacherCenterDao.getNameByUserId(userId);
    }

    @Override
    public User getUserById(int userId){
        return teacherCenterDao.getUserById(userId);
    }

    @Override
    public Teacher getTeacherByUserId(int userId){
        return teacherCenterDao.getTeacherByUserId(userId);
    }

    @Override
    public MessageDto getMessagesByUserId(int uid){
        MessageDto messageDto=new MessageDto();
        messageDto.setReadInform(messageDao.getReadInformByUid(uid,0));//第一页 0-10
        messageDto.setNoReadInform(messageDao.getNoReadInformByUid(uid));

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        for(Message message:messageDto.getNoReadInform()){
            if(message.getTime().split(" ")[0].equals(dateNowStr)){
                message.setTime(message.getTime().split(" ")[1]);
            }else{
                message.setTime(message.getTime().split(" ")[0]);
            }
        }
        for(Message message:messageDto.getReadInform()){
            if(message.getTime().split(" ")[0].equals(dateNowStr)){
                message.setTime(message.getTime().split(" ")[1]);
            }else{
                message.setTime(message.getTime().split(" ")[0]);
            }
        }
        if(messageDto.getReadInform().size()==0 && messageDto.getNoReadInform().size()==0){
            messageDto.setIsNoneInform(1);
        }
        return messageDto;
    }

    @Override
    public List<Demand> getDemands(int teacherId){
        return teacherCenterDao.getDemandsByTeacherId(teacherId);
    }

    @Override
    public Demand getDemandDetail(int demandId){
        return demandDao.getDemandById(demandId);
    }

    @Override
    public List<RecoveryLog> getRecoveryLogs(int demandId, int teacherId){
        return teacherCenterDao.getRecoveryLogs(demandId,teacherId);
    }

    @Override
    public List<RecoveryHisDto> getRecoveryHisList(String recoveryHis){
        if(recoveryHis==null) return null;
        List<RecoveryHisDto> recoveryHisDtos=new ArrayList<RecoveryHisDto>();
        String[] strs=recoveryHis.split("@");
        for(int i=0;i<strs.length;i++){
            String[] feilds=strs[i].split("#");
            RecoveryHisDto recoveryHisDto=new RecoveryHisDto(i,feilds[0],feilds[1],feilds[2],feilds[3]);
            recoveryHisDtos.add(recoveryHisDto);
        }
        return recoveryHisDtos;
    }

    @Override
    public ModifyPageDto getModifyDto(int objId, String fieldName) {

        if (getTeacherByUserId(objId) == null) teacherCenterDao.addTeacher(objId);
        Teacher teacher = getTeacherByUserId(objId);
        User user = getUserById(objId);
        switch (fieldName) {
            case "name":
                return new ModifyPageDto(teacher.getName(), fieldName, "姓名", objId);
            case "gender":
                return new ModifyPageDto(user.getGender() == 0 ? "男" : "女", fieldName, "性别",objId);
            case "phone":
                return new ModifyPageDto(user.getPhone(), fieldName, "手机", objId);
            case "email":
                return new ModifyPageDto(user.getEmail(), fieldName, "邮箱", objId);
            case "school":
                return new ModifyPageDto(teacher.getSchool(), fieldName, "毕业院校", objId);
            case "domain":
                return new ModifyPageDto(teacher.getDomain(), fieldName, "康复类型", objId);
            case "object":
                return new ModifyPageDto(teacher.getObject(), fieldName, "康复对象", objId);
            case "way":
                return new ModifyPageDto(teacher.getWay(), fieldName, "上门方式", objId);
            case "tGround":
                return new ModifyPageDto(teacher.gettGround(), fieldName, "治疗师上门区域", objId);
            case "sGround":
                return new ModifyPageDto(teacher.getsGround(), fieldName, "学生上门区域", objId);
            case "pid":
                return new ModifyPageDto(teacher.getPid(), fieldName, "身份证号", objId);
            default:
                return null;
        }
    }

    @Override
    @Transactional
    public void modifyFeild(int userId,String value,String fieldName){
        switch (fieldName) {
            case "name":
                teacherCenterDao.updateName(value, userId);
                break;
            case "gender":
                Integer integerValue = Integer.parseInt(value);
                teacherCenterDao.updateGender(integerValue, userId);
                break;
            case "phone":
                teacherCenterDao.updatePhone(value, userId);
                break;
            case "email":
                teacherCenterDao.updateEmail(value, userId);
                break;
            case "school":
                teacherCenterDao.updateSchool(value, userId);
                break;
            case "domain":
                teacherCenterDao.updateDomain(value, userId);
                break;
            case "object":
                teacherCenterDao.updateObject(value, userId);
                break;
            case "way":
                teacherCenterDao.updateWay(value, userId);
                break;
            case "tGround":
                teacherCenterDao.updateTGround(value, userId);
                break;
            case "sGround":
                teacherCenterDao.updateSGround(value, userId);
                break;
            case "pid":
                teacherCenterDao.updatePid(value, userId);
                break;
            case "successCase":
                teacherCenterDao.updateSuccessCase(value,userId);
                break;
        }
        teacherCenterDao.updateUserStatus(3, userId);
    }

    public void uploadPhoto(HttpServletRequest request, int userId){
        String picUrl="";
        MultipartHttpServletRequest MulRequest = request instanceof MultipartHttpServletRequest ? (MultipartHttpServletRequest) request : null;
        Iterator<String> fileNames = MulRequest.getFileNames();
        while(fileNames.hasNext()) { // 遍历请求中的信息
            String fileName = fileNames.next();

            //图片
            try {
                String path= FileUpload.uploadFile(MulRequest.getFile(fileName), request, FileUpload.ICON_TEACHER_ROOT_PATH);
                picUrl=path.substring(path.indexOf("img"),path.length());
                System.out.println(picUrl);
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
        teacherCenterDao.updateIcon(picUrl,userId);
    }

    @Override
    public TeacherInfoAuthentication getTeacherInfoAuthenticationByUid(Integer userId) {
        TeacherInfoAuthentication teacherInfoAuthentication=new TeacherInfoAuthentication();
        Teacher teacher=teacherCenterDao.getTeacherByUserId(userId);

        teacherInfoAuthentication.setName(teacher.getName());
        teacherInfoAuthentication.setPid(teacher.getPid());

        if (teacher.getExperienceAge()!=null && teacher.getExperienceAge()!=0){
            teacherInfoAuthentication.setExperienceAge(teacher.getExperienceAge());
        }

        if (teacher.getAbstractTeacher()!=null && !teacher.getAbstractTeacher().equals("")){
            teacherInfoAuthentication.setAbstractTeacher(teacher.getAbstractTeacher());
        }
        int i=0;
        if (teacher.getPidUrlBack()!=null && !teacher.getPidUrlBack().equals("")){
            i++;
        }
        if (teacher.getPidUrlFront()!=null && !teacher.getPidUrlFront().equals("")){
            i++;
        }
        if (teacher.getPeoplePidUrl()!=null && !teacher.getPeoplePidUrl().equals("")){
            i++;
        }
        teacherInfoAuthentication.setPeoplePidUrl(i);
        i=0;
        if(teacher.getSchool()!=null &&!teacher.getSchool().equals("")){
            String[] schools=teacher.getSchool().split("#");
            teacherInfoAuthentication.setSchool(schools.length);
        }
        if(teacher.getAward()!=null &&!teacher.getAward().equals("")){
            String[] awards=teacher.getAward().split("#");
            teacherInfoAuthentication.setAward(awards.length);
        }
        if(teacher.getCertificate()!=null &&!teacher.getCertificate().equals("")){
            String[] cers=teacher.getCertificate().split("#");
            teacherInfoAuthentication.setCertificate(cers.length);
        }
        if(teacher.getRecoveryHis()!=null &&!teacher.getRecoveryHis().equals("")){
            String[] rechs=teacher.getRecoveryHis().split("#");
            teacherInfoAuthentication.setRecoveryHis(rechs.length);
        }
        if(teacher.getSuccessCase()!=null &&!teacher.getSuccessCase().equals("")){
            String[] succs=teacher.getSuccessCase().split("#");
            teacherInfoAuthentication.setSuccessCase(succs.length);
        }
        if(teacher.getOtherPic()!=null &&!teacher.getOtherPic().equals("")){
            String[] others=teacher.getOtherPic().split("#");
            teacherInfoAuthentication.setOtherPic(others.length);
        }


        return teacherInfoAuthentication;
    }


    @Override
    //最后一个参数  如果值为string 则不管type是什么 都返回字符串
    public Object getInfoByTypeName(int uid, String type,String string) {
        String t="";
        switch (type){
            case "successCase":
                t="success_case";
                break;
            case "award":
            case "certificate":
            case "school":
            case "abstractTeacher":
            case "name":
            case "pid":
            case "other_pic":
            case "schedule":
            case "period":
            case "people_pid_url":
            case "pid_url_front":
            case "pid_url_back":
                t=type;
                break;
            case "recoveryHis":
                t="recovery_his";
                break;
            case "experienceAge":
                t="experience_age";
                break;
        }
        String result=teacherCenterDao.getInfoByTypeName(uid,t);

        if(type.equals("school") && !string.equals("string")){
            List<TeacherInfoSchool> teacherInfoSchools=new ArrayList<>();
            String[] re=result.split("#");
            int i=0;
            for(String s:re){
                TeacherInfoSchool teacherInfoSchool=new TeacherInfoSchool();
                String[] ss=s.split("@");
                teacherInfoSchool.setIndex(i++);
                teacherInfoSchool.setSchoolName(ss[0]);
                teacherInfoSchool.setStartTime(ss[1]);
                teacherInfoSchool.setEndTime(ss[2]);
                switch (ss[3]){
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
            return teacherInfoSchools;
        }else if(type.equals("recoveryHis") && !string.equals("string")){
            List<TeacherInfoRecoveryHis> teacherInfoRecoveryHises=new ArrayList<>();
            String[] re=result.split("#");
            int i=0;
            for(String s:re){
                TeacherInfoRecoveryHis teacherInfoRecoveryHis=new TeacherInfoRecoveryHis();
                String[] ss=s.split("@");
                teacherInfoRecoveryHis.setName(ss[0]);
                teacherInfoRecoveryHis.setStartTime(ss[1]);
                teacherInfoRecoveryHis.setEndTime(ss[2]);
                teacherInfoRecoveryHis.setDetail(ss[3]);
                teacherInfoRecoveryHis.setIndex(i++);
                teacherInfoRecoveryHises.add(teacherInfoRecoveryHis);
            }
            Collections.sort(teacherInfoRecoveryHises);
            return teacherInfoRecoveryHises;
        }else {
            return result;
        }
    }

    @Override
    public Object getInfoByTypeNameIndex(int uid, String type, int index) {
        String t="";
        switch (type){
            case "successCase":
                t="success_case";
                break;
            case "award":
            case "certificate":
            case "school":
            case "abstractTeacher":
            case "name":
            case "pid":
            case "other_pic":
            case "schedule":
                t=type;
                break;
            case "recoveryHis":
                t="recovery_his";
                break;
            case "experienceAge":
                t="experience_age";
                break;
        }
        String[] result=teacherCenterDao.getInfoByTypeName(uid,t).split("#");

        if(type.equals("school")){
            TeacherInfoSchool teacherInfoSchool=new TeacherInfoSchool();
            String[] ss=result[index].split("@");
            teacherInfoSchool.setSchoolName(ss[0]);
            teacherInfoSchool.setStartTime(ss[1]);
            teacherInfoSchool.setEndTime(ss[2]);
            teacherInfoSchool.setEducation(ss[3]);
            teacherInfoSchool.setMajor(ss[4]);
            return teacherInfoSchool;
        }else if(type.equals("recoveryHis")){
            TeacherInfoRecoveryHis teacherInfoRecoveryHis=new TeacherInfoRecoveryHis();
            String[] ss=result[index].split("@");
            teacherInfoRecoveryHis.setName(ss[0]);
            teacherInfoRecoveryHis.setStartTime(ss[1]);
            teacherInfoRecoveryHis.setEndTime(ss[2]);
            teacherInfoRecoveryHis.setDetail(ss[3]);
            return teacherInfoRecoveryHis;
        }else{
            return result[index];
        }
    }

    @Override
    @Transactional
    public void addComplexInfo(int uid, String type, String title, String detail, String picUrls, TeacherInfoSchool teacherInfoSchool, TeacherInfoRecoveryHis teacherInfoRecoveryHis) {
        User user=userDao.getUserByUid(uid);
        //如果是通过审核 或者不通过审核   修改后用户状态都改为 3 审核中  其他不变
        if(user.getUserStatus()==2 || user.getUserStatus()==4){
            userDao.changeUserStatus(uid,3);
        }
        String data="";

        String t="";
        String pre= (String) getInfoByTypeName(uid,type,"string");

        if(pre!=null && !pre.equals("")) {
            data = "#";
        }

        switch (type){
            case "successCase":
                t="success_case";
                data+=title+"@"+detail;
                break;
            case "award":
            case "certificate":
            case "other_pic":
                t=type;
                data+=detail+"@"+picUrls;
                break;
            case "school":
                t="school";
                data+=teacherInfoSchool.getSchoolName()+"@"+teacherInfoSchool.getStartTime()+"@"+teacherInfoSchool.getEndTime()+"@"+teacherInfoSchool.getEducation()+"@"+teacherInfoSchool.getMajor();
                break;
            case "recoveryHis":
                t="recovery_his";
                data+=teacherInfoRecoveryHis.getName()+"@"+teacherInfoRecoveryHis.getStartTime()+"@"+teacherInfoRecoveryHis.getEndTime()+"@"+teacherInfoRecoveryHis.getDetail();
                break;
        }

        teacherCenterDao.addComplexInfo(t,data,uid);

    }

    @Override
    public void editComplexInfo(int uid, String type, int index, String title, String detail, String picUrls, String deleteExitImg, TeacherInfoSchool teacherInfoSchool, TeacherInfoRecoveryHis teacherInfoRecoveryHis) {
        User user=userDao.getUserByUid(uid);
        //如果是通过审核 或者不通过审核   修改后用户状态都改为 3 审核中  其他不变
        if(user.getUserStatus()==2 || user.getUserStatus()==4){
            userDao.changeUserStatus(uid,3);
        }
        String t="";
        String data="";
        switch (type){
            case "successCase":
                t="success_case";
                data=title+"@"+detail;
                break;
            case "certificate":
            case "award":
            case "other_pic":
                t=type;
                String now_index=teacherCenterDao.getInfoByTypeName(uid,t).split("#")[index];//定位到 该字段 当前修改的索引  内容
                String[] exit_pics=now_index.split("@")[1].split("!");
                String now_pics="";
                for(int i=0;i<exit_pics.length;i++){
                    if(deleteExitImg.indexOf("#"+i)==-1){
                        //该已存在图片未被删除
                        now_pics+=exit_pics[i]+"!";
                    }
                }
                now_pics+=picUrls;
                if(now_pics.substring(now_pics.length()-1,now_pics.length()).equals("!")){
                    now_pics=now_pics.substring(0,now_pics.length()-1);
                }
                data=detail+"@"+now_pics;
                break;
            case "school":
                t=type;
                data+=teacherInfoSchool.getSchoolName()+"@"+teacherInfoSchool.getStartTime()+"@"+teacherInfoSchool.getEndTime()+"@"+teacherInfoSchool.getEducation()+"@"+teacherInfoSchool.getMajor();
                break;
            case "recoveryHis":
                t="recovery_his";
                data+=teacherInfoRecoveryHis.getName()+"@"+teacherInfoRecoveryHis.getStartTime()+"@"+teacherInfoRecoveryHis.getEndTime()+"@"+teacherInfoRecoveryHis.getDetail();
                break;
            case "abstractTeacher":
                t=type;
                data+=detail;
                break;
            case "name":
            case "pid":
                t=type;
                data+=title;
                break;
            case "experienceAge":
                t="experience_age";
                data+=title;
                break;
        }

        String[] result=teacherCenterDao.getInfoByTypeName(uid,t).split("#");
        result[index]=data;

        String str="";
        for (String s:result){
            str+="#"+s;
        }
        teacherCenterDao.updateComplexInfo(t,str.substring(1),uid);
    }

    @Override
    public void delComplexInfo(int uid, String type, int index) {
        String t="";
        switch (type){
            case "successCase":
                t="success_case";
                break;
            case "certificate":
            case "award":
            case "other_pic":
            case "school":
                t=type;
                break;
            case "recoveryHis":
                t="recovery_his";
                break;
            case "abstractTeacher":
                t=type;
                break;
            case "name":
            case "pid":
                t=type;
                break;
            case "experienceAge":
                t="experience_age";
                break;
        }

        String[] result=teacherCenterDao.getInfoByTypeName(uid,t).split("#");
        result[index]="";

        String str="";
        for (String s:result){
            if(!s.equals("")) {
                str += "#" + s;
            }
        }
        teacherCenterDao.updateComplexInfo(t,str.substring(1),uid);
    }

    @Override
    public String addInfoImg(HttpServletRequest request) {
        String deleteImg= CookieUtil.checkCookie(request,"deleteImg");//获得要删除的img ID
        String picsUrl="";
        // 从请求中获取到文件信息需要将请求转换为MultipartHttpServletRequest类型
        MultipartHttpServletRequest MulRequest = request instanceof MultipartHttpServletRequest ? (MultipartHttpServletRequest) request : null;
        Iterator<String> fileNames = MulRequest.getFileNames();
        while(fileNames.hasNext()) { // 遍历请求中的信息
            String fileName = fileNames.next(); //
            //该图片 是要删除的图片  #被转义了
            if(!deleteImg.equals("%23")) {
                String name = "%23" + fileName + "%23";
                if (deleteImg.indexOf(name) != -1) {
                    continue;
                }
            }
            //图片
            try {
                String path= FileUpload.uploadFile(MulRequest.getFile(fileName), request, FileUpload.TEACHER_INFO_AWARD_ROOT_PATH);
//                WxInterceptor.logger.info(path);
                int index = path.indexOf("img");
                picsUrl += path.substring(index, path.length()) + "!";
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (!picsUrl.equals("")) {
            picsUrl = picsUrl.substring(0, picsUrl.length() - 1);
        }
        return picsUrl;
    }

    @Override
    public Work getWorkByUid(Integer userId) {
        Work work=new Work();
        List<WorkMonth> workMonthList=new ArrayList<>();
        List<WorkDay> workDayList=new ArrayList<>();

        Date today = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(today);

        work.setToday(dateNowStr);

        List<Order> orderList=orderTeacherDao.getAllDoingOrderByUid(userId);//获得该治疗师 正在进行的所有订单

        StringBuffer monthWork=new StringBuffer();//用于有任务的日期 避免重复

        //遍历 正在进行的所有订单 根据订单服务进度 只分析 未完成的服务时间
        for(Order order:orderList){
            String[] serveTimes=order.getServerTime().split("#");
            for(String time:serveTimes){
                String date=time.split(" ")[0];//截取年月日
                if(date.compareTo(dateNowStr)==0){
                    //今天的任务安排
                    WorkDay workDay=new WorkDay();
                    workDay.setStartTime(time.split(" ")[1].split("%")[0]);
                    workDay.setEndTime(time.split(" ")[1].split("%")[1]);
                    workDay.setOrder(order);
                    workDayList.add(workDay);
                    if(monthWork.indexOf(date)==-1){
                        WorkMonth workMonth=new WorkMonth();
                        workMonth.setStart(date);
                        String title=date.split("-")[2];
                        if(title.substring(0,1).equals("0")){
                            title=title.substring(1);
                        }
                        workMonth.setTitle(title);
                        workMonthList.add(workMonth);
                        monthWork.append(date);
                    }
                }else if (date.compareTo(dateNowStr)>0 && monthWork.indexOf(date)==-1){
                    //以后的安排
                    WorkMonth workMonth=new WorkMonth();
                    workMonth.setStart(date);
                    String title=date.split("-")[2];
                    if(title.substring(0,1).equals("0")){
                        title=title.substring(1);
                    }
                    workMonth.setTitle(title);
                    workMonthList.add(workMonth);
                    monthWork.append(date);
                }else{
                    continue;
                }
            }
        }
        Collections.sort(workDayList);
        work.setMonthWork(workMonthList);
        work.setWorkDay(workDayList);
        return work;
    }

    @Override
    public WorkDayDto getDayWorkByUid(Integer uid, String date) throws ParseException {
        WorkDayDto workDayDto=new WorkDayDto();

        List<WorkDay> workDayList=new ArrayList<>();

        date=date.split("GMT")[0];
        SimpleDateFormat sf1 = new SimpleDateFormat("EEE MMM dd yyyy hh:mm:ss",Locale.ENGLISH);
        Date d = sf1.parse(date);
        SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd");
        String day=sf2.format(d);//该天的日期

        List<Order> orderList=orderTeacherDao.getAllDoingDayOrderByUid(uid,day);
        for(Order order:orderList){
            String[] serveTimes=order.getServerTime().split("#");
            for(String time:serveTimes){
                String dd=time.split(" ")[0];//截取年月日
                if(dd.compareTo(day)==0){
                    //该天的任务安排
                    WorkDay workDay=new WorkDay();
                    workDay.setStartTime(time.split(" ")[1].split("%")[0]);
                    workDay.setEndTime(time.split(" ")[1].split("%")[1]);
                    workDay.setOrder(order);
                    workDayList.add(workDay);
                }
            }
        }
        Collections.sort(workDayList);

        workDayDto.setWork(workDayList);
        workDayDto.setToday(day);
        return workDayDto;
    }

    @Override
    public Teacher getTeacherInfoByUid(Integer uid, String type) {
        String[] types=type.split("@");
        return teacherCenterDao.getTeacherInfoByUid(uid,types);
    }

    @Override
    public void editServiceInfo(Teacher teacher) {
        User user=userDao.getUserByUid(teacher.getUserId());
        //如果是通过审核 或者不通过审核   修改后用户状态都改为 3 审核中  其他不变
        if(user.getUserStatus()==2 || user.getUserStatus()==4){
            userDao.changeUserStatus(teacher.getUserId(),3);
        }
        teacherCenterDao.editServiceInfo(teacher);
    }

    @Override
    public Teacher getTeacherWayByUserId(Integer uid, String type) {
        String[] t = new String[0];
        switch (type){
            case "student":
                t= new String[]{"price_s", "t_ground", "detailAddress","way"};
                break;
            case "teacher":
                t= new String[]{"price_t", "s_ground","way"};
                break;
            case "online":
                t= new String[]{"price_o","way"};
                break;
        }
        Teacher teacher=teacherCenterDao.getTeacherInfoByUid(uid,t);
        return teacher;
    }

    @Override
    public void editServiceInfoWay(Integer uid, String type, Teacher teacher, String area1, String area2, String ctype) {
        User user=userDao.getUserByUid(teacher.getUserId());
        //如果是通过审核 或者不通过审核   修改后用户状态都改为 3 审核中  其他不变
        if(user.getUserStatus()==2 || user.getUserStatus()==4){
            userDao.changeUserStatus(teacher.getUserId(),3);
        }

        //先判断 原来的way的内容 根据是add还是edit  生成新的way
        String way = teacherCenterDao.getInfoByTypeName(uid, "way");
        if(ctype.equals("add")) {
            if (way != null && !way.equals("")){
                teacher.setWay(way+"、"+teacher.getWay());
            }
        }

        //学生上门
        if(type.equals("student")){
            teacher.settGround(area1+"-"+area2);
        }

        teacherCenterDao.editServiceInfoWay(teacher);
    }


    @Override
    public void addSchedule(Integer uid, String week, String time) throws ParseException {
        String schedule= (String) getInfoByTypeName(uid,"schedule","");
        String[] s=schedule.split("#");
        String data="";
        for(int i=0;i<s.length;i++){
            if((i+1)==Integer.parseInt(week)){
                if(s[i].equals("")){
                    data+="#"+time+"-"+getStartEndTime(time,(String)getInfoByTypeName(uid,"period",""));
                }else{
                    data+="#"+s[i]+"@"+time+"-"+getStartEndTime(time,(String)getInfoByTypeName(uid,"period",""));
                }
            }else{
                data+="#"+s[i];
            }
        }
        teacherCenterDao.updateComplexInfo("schedule",data.substring(1),uid);
    }


    @Override
    public void delSchedule(Integer uid, String time) throws ParseException {
        String schedule= (String) getInfoByTypeName(uid,"schedule","");
        String[] s=schedule.split("#");
        String data="";



        String t="";//具体的开始时间
        time=time.split("GMT")[0];
        SimpleDateFormat sf1 = new SimpleDateFormat("EEE MMM dd yyyy HH:mm",Locale.ENGLISH);
        Date date = sf1.parse(time);
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        Integer week=c.get(Calendar.DAY_OF_WEEK);//该天周几  1为周日
        if(week==1){
            week=7;
        }else{
            week=week-1;
        }
        t=sf1.format(date).split(" ")[4];


        for(int i=0;i<s.length;i++){
            if((i+1)==week){
                String[] ss=s[i].split("@");
                data+="#";
                String d="";
                for (String a:ss){
                    //比较 开始时间
                    if(!a.split("-")[0].equals(t)){
                        d+="@"+a;
                    }
                }
                data+=d.substring(1);
            }else{
                data+="#"+s[i];
            }
        }
        teacherCenterDao.updateComplexInfo("schedule",data.substring(1),uid);
    }

    @Override
    public void editIdCard(MultipartFile peoplePidUrl, MultipartFile pidUrlBack, MultipartFile pidUrlFront, Integer uid, HttpServletRequest request) {
        User user=userDao.getUserByUid(uid);
        //如果是通过审核 或者不通过审核   修改后用户状态都改为 3 审核中  其他不变
        if(user.getUserStatus()==2 || user.getUserStatus()==4){
            userDao.changeUserStatus(uid,3);
        }


        String path1 = "";
        int index1=0;
        if(!peoplePidUrl.isEmpty()) {
            try {
                path1 = FileUpload.uploadFile(peoplePidUrl, request, FileUpload.ICON_TEACHER_ROOT_PATH);
                index1=path1.indexOf("img");
            } catch (IOException e) {
                e.printStackTrace();
            }
            path1=path1.substring(index1);
        }

        String path2 = "";
        int index2=0;
        if(!pidUrlFront.isEmpty()) {
            try {
                path2 = FileUpload.uploadFile(pidUrlFront, request, FileUpload.ICON_TEACHER_ROOT_PATH);
                index2=path2.indexOf("img");
            } catch (IOException e) {
                e.printStackTrace();
            }
            path2=path2.substring(index2);
        }
        String path3 = "";
        int index3=0;
        if(!pidUrlBack.isEmpty()) {
            try {
                path3 = FileUpload.uploadFile(pidUrlBack, request, FileUpload.ICON_TEACHER_ROOT_PATH);
                index3=path3.indexOf("img");
            } catch (IOException e) {
                e.printStackTrace();
            }
            path3=path3.substring(index3);
        }

        teacherCenterDao.editIdCard(path1,path2,path3,uid);
    }

    @Override
    public Teacher getIdCardByUid(Integer uid) {
        Teacher teacher=new Teacher();
        teacher.setPeoplePidUrl((String) getInfoByTypeName(uid,"people_pid_url",""));
        teacher.setPidUrlFront((String) getInfoByTypeName(uid,"pid_url_front",""));
        teacher.setPidUrlBack((String) getInfoByTypeName(uid,"pid_url_back",""));
        return teacher;
    }

    private String getStartEndTime(String time, String minute) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm",Locale.ENGLISH);
        Date date = sdf.parse(time);
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.MINUTE, Integer.parseInt(minute));
        Date t = c.getTime();
        return sdf.format(t);
    }

    @Override
    public List<TeacherLogDto> getLogByUid(Integer userId) {
        List<TeacherLogDto> teacherLogDtoList=new ArrayList<>();

        List<Order> orders=orderTeacherDao.getLogByUid(userId);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);//系统时间
        for(Order order:orders){
            Integer count=recoveryLogDao.getLogCountByOid(order.getId());//已写好的  康复日志数量
            if(count!=Integer.parseInt(order.getAmount())){
                //该订单的康复日志没有写完
                String[] serverTimes=order.getServerTime().split("#");
                for(int i=0;i<serverTimes.length;i++){
                    if(i==count){
                        //下一次 需要填写康复日志的 服务时间  与系统时间做比较
                        String time=serverTimes[i].split("%")[0];
                        if(dateNowStr.compareTo(time)>0){
                            //系统时间大于 需要当前康复服务时间 则 显示
                            TeacherLogDto teacherLogDto=new TeacherLogDto();
                            teacherLogDto.setCount(count);
                            teacherLogDto.setOrder(order);
                            teacherLogDto.setTime(serverTimes[i].replace('%','-'));
                            teacherLogDtoList.add(teacherLogDto);
                            break;
                        }
                    }
                }

            }
        }
        return teacherLogDtoList;
    }

    @Override
    public TeacherCenterCountDto getCounts(Integer id, String type) {
        TeacherCenterCountDto teacherCenterCountDto=new TeacherCenterCountDto();
        //日志中心
        if(type.equals("teacher")) {
            int logN = 0;
            List<Order> orders = orderTeacherDao.getLogByUid(id);
            Date d = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
            String dateNowStr = sdf.format(d);//系统时间
            for (Order order : orders) {
                Integer count = recoveryLogDao.getLogCountByOid(order.getId());//已写好的  康复日志数量
                if (count != Integer.parseInt(order.getAmount())) {
                    //该订单的康复日志没有写完
                    String[] serverTimes = order.getServerTime().split("#");
                    for (int i = 0; i < serverTimes.length; i++) {
                        if (i == count) {
                            //下一次 需要填写康复日志的 服务时间  与系统时间做比较
                            String time = serverTimes[i].split("%")[0];
                            if (dateNowStr.compareTo(time) > 0) {
                                //系统时间大于 需要当前康复服务时间 则 显示
                                logN++;
                                break;
                            }
                        }
                    }
                }
            }
            teacherCenterCountDto.setLogNumber(logN);

            int commentN=commentDao.getNoReplyCommentCountByUid(id);
            teacherCenterCountDto.setCommentNumber(commentN);
        }
        else{
            int commentN=orderDao.getNoCommentCountByUid(id);
            teacherCenterCountDto.setCommentNumber(commentN);
        }

        int messageN=messageDao.getNoReadInformCountByUid(id);
        teacherCenterCountDto.setMessageNumber(messageN);


        return teacherCenterCountDto;
    }

    @Override
    public TeacherInfoEdit myInfoEdit(String ftype, String ctype, String value, Integer userStatus) {
        TeacherInfoEdit teacherInfoEdit=new TeacherInfoEdit(value,ctype);
        switch (ftype){
            case "base":
                teacherInfoEdit.setFtype("基本资料");
                break;
            case "authentication":
                teacherInfoEdit.setFtype("实名认证");
                break;
            case "service":
                teacherInfoEdit.setFtype("康复服务");
        }
        switch (ctype){
            case "email":
                teacherInfoEdit.setCtypeDesc("邮箱");
                break;
            case "gender":
                teacherInfoEdit.setCtypeDesc("性别");
                break;
            case "name":
                teacherInfoEdit.setCtypeDesc("真实姓名");
                break;
            case "pid":
                teacherInfoEdit.setCtypeDesc("证件号");
                break;
            case "experience_age":
                teacherInfoEdit.setCtypeDesc("康复教龄");
                break;
            case "period":
                teacherInfoEdit.setCtypeDesc("课时");
                break;
        }

        if(userStatus!=0) {
            //更改用户状态
            switch (ctype) {
                case "name":
                case "pid":
                case "experience_age":
                case "period":
                    teacherInfoEdit.setIsChangeStatus(1);
            }
        }
        return teacherInfoEdit;
    }

    @Override
    @Transactional
    public void myInfoEditPost(String ftype, String ctype, String value, Integer isChangeStatus, HttpServletRequest request, String status) {
        String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
        openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        User user=null;
        if(status.equals("parent")){
            user=userDao.getUserByOpenidStatus(openid,"0");
        }else{
            user=userDao.getUserByOpenidStatus(openid,"1");
        }
        //如果是通过审核 或者不通过审核   修改后用户状态都改为 3 审核中  其他不变
        if(isChangeStatus==1){
            userDao.changeUserStatus(user.getId(),3);
        }
        teacherCenterDao.myInfoEditPost(ftype,ctype,value,user.getId(),status);
    }

    @Override
    public List<Message> getInformMessageByPage(HttpServletRequest request, Integer page) {
        String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
        openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        User user=userDao.getUserByOpenidStatus(openid,"1");
        List<Message> messageList=messageDao.getReadInformByUid(user.getId(),(page-1)*10);

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        for(Message message:messageList){
            if(message.getTime().split(" ")[0].equals(dateNowStr)){
                message.setTime(message.getTime().split(" ")[1]);
            }else{
                message.setTime(message.getTime().split(" ")[0]);
            }
        }
        return messageList;
    }

    @Override
    public void allInformRead(HttpServletRequest request) {
        String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
        openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        User user=userDao.getUserByOpenidStatus(openid,"1");
        messageDao.allInformRead(user.getId());
    }

    @Override
    public TCommentsDto getCommentsByUserId(Integer userId) {
        TCommentsDto tCommentsDto=new TCommentsDto();
        List<Comment> noReplyCommentList=commentDao.getNoReplyCommentsByUid(userId);
        List<Comment> hisCommentList=commentDao.getHisCommentsByUid(userId);

        //今天的只显示 时分秒  过去的显示 年月日
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        for(Comment comment:noReplyCommentList){
            if(comment.getTime().split(" ")[0].equals(dateNowStr)){
                comment.setTime(comment.getTime().split(" ")[1]);
            }else{
                comment.setTime(comment.getTime().split(" ")[0]);
            }
        }
        for(Comment comment:hisCommentList){
            if(comment.getTime().split(" ")[0].equals(dateNowStr)){
                comment.setTime(comment.getTime().split(" ")[1]);
            }else{
                comment.setTime(comment.getTime().split(" ")[0]);
            }
            if(comment.getTeacherComment().getTime().split(" ")[0].equals(dateNowStr)){
                comment.getTeacherComment().setTime(comment.getTeacherComment().getTime().split(" ")[1]);
            }else{
                comment.getTeacherComment().setTime(comment.getTeacherComment().getTime().split(" ")[0]);
            }
        }
        tCommentsDto.setNoReplyComments(noReplyCommentList);
        tCommentsDto.setHisComments(hisCommentList);
        return tCommentsDto;
    }

    @Override
    public Integer getUidByTid(Integer tid) {
        return teacherCenterDao.getUidByTid(tid);
    }
}
