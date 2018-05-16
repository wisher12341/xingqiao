package com.xq.service.impl;


import com.xq.dao.*;
import com.xq.dto.*;
import com.xq.model.*;
import com.xq.service.ParentCenterService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import com.xq.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 86761 on 2017/11/5.
 */
@Service

public class ParentCenterServiceImpl implements ParentCenterService {

    @Autowired
    ParentCenterDao parentCenterDao;
    @Autowired
    DemandDao demandDao;
    @Autowired
    TeacherDao teacherDao;
    @Autowired
    UserDao userDao;
    @Autowired
    MessageDao messageDao;
    @Autowired
    OrderDao orderDao;
    @Autowired
    CommentDao commentDao;

    @Override
    public Parent getParentByUserId(int userId){
        return parentCenterDao.getParentByUserId(userId);
    }

    @Override
    public List<Demand> getDemands(int userId){
        return demandDao.getDemandByUserId(userId);
    }

    @Override
    public List<Teacher> getTeachersByParent(int userId){
        return teacherDao.getTeachersByUserId(userId);
    }

    @Override
    public Teacher getTeacherDetail(int teacherId){
        Teacher teacher=teacherDao.getTeacherDetail(teacherId);
        return teacher;
    }

    @Override
    public Demand getDemandDetail(int demandId){
        return demandDao.getDemandById(demandId);
    }

    @Override
    public List<Message> getMessagesByUserId(int userId){
        return messageDao.getMessagesByUserId(userId);
    }

    @Override
    public void deleteMessage(int messageId){
        messageDao.deleteMessage(messageId);
    }

    @Override
    public User getUserById(int userId){
        return userDao.getUserById(userId);
    }

    @Override
    public String getUserNameById(int userId){
        return parentCenterDao.getUserNameById(userId);
    }



    public List<Demand> isexisted(HttpServletRequest request, Integer teacheId) {
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
//        String openid="123";
        User user=userDao.getParentByOpenid(openid);
        Parent parent = parentCenterDao.getParentByUserId(user.getId());
        if (parent == null || user==null || user.getUserStatus()!=2) {
            return null;
        } else {
            List<Demand> demandList = demandDao.getDemandByuserId(user.getId());
            for (Demand demand : demandList) {
                //查询该订单的  需求简历   是不是第一次交易
                List<Order> orderList = orderDao.getOrder(demand.getId(), teacheId);
                if (orderList.size() > 0) {
                    demand.setFirst("no");
                } else {
                    demand.setFirst("yes");
                }
            }
            return demandList;
        }
    }

    @Override
    public ModifyPageDto getModifyDto(int objId, String fieldName, String table){
        if(table.equals("parent")){
            Parent parent=getParentByUserId(objId);
            User user=getUserById(objId);
            switch (fieldName){
                case "realName":
                    return new ModifyPageDto(parent.getRealName(), fieldName, "姓名", objId,table);
                case "pid":
                    return new ModifyPageDto(parent.getPid(), fieldName, "身份证号", objId,table);
                case "ground":
                    return new ModifyPageDto(parent.getGround()+"_"+parent.getAddress(), fieldName, "地址", objId,table);
                case "phone":
                    return new ModifyPageDto(user.getPhone(), fieldName, "手机", objId,table);
                case "email":
                    return new ModifyPageDto(user.getEmail(), fieldName, "邮箱", objId,table);
                case "gender":
                    return new ModifyPageDto(user.getGender()==0?"男":"女", fieldName, "性别", objId,table);
                default:
                    return null;
            }
        }
        else if(table.equals("demand")){
            Demand demand=getDemandDetail(objId);
            switch (fieldName){
                case "name":
                    return new ModifyPageDto(demand.getName(),fieldName,"姓名",objId,table);
                case "gender":
                    return new ModifyPageDto(demand.getGender()==1?"男":"女", fieldName, "性别", objId,table);
                case "birthday":
                    return new ModifyPageDto(demand.getBirthday(),fieldName,"出生日期",objId,table);
                case "report":
                    return new ModifyPageDto(demand.getReport(),fieldName,"诊断报告",objId,table);
                case "diseaseHis":
                    return new ModifyPageDto(demand.getDiseaseHis(),fieldName,"病史",objId,table);
                case "allergyHis":
                    return new ModifyPageDto(demand.getAllergyHis(),fieldName,"过敏史",objId,table);
                case "remark":
                    return new ModifyPageDto(demand.getRemark(),fieldName,"备注",objId,table);
                default:
                    return null;
            }
        }
        else
            return null;
    }

    @Override
    public void modifyFeild(int objId,String newValue,String fieldName,String table){
        switch (table) {
            case "parent":
                modifyParent(objId, newValue, fieldName);
                break;
            case "demand":
                modifyDemand(objId, newValue, fieldName);
                break;
        }
    }




    private void modifyParent(int userId,String value,String fieldName){

        switch(fieldName){
            case "phone":
                parentCenterDao.updatePhone(value,userId);
                break;
            case "email":
                parentCenterDao.updateEmail(value,userId);
                break;
            case "gender":
                if(value.equals("0")) parentCenterDao.updateGender(0,userId);
                else  parentCenterDao.updateGender(1,userId);
                break;
            case "realName":
                parentCenterDao.updateRealName(value,userId);
                break;
            case "pid":
                parentCenterDao.updatePid(value,userId);
                break;
            case "ground":
                String[] values=value.split("_");
                parentCenterDao.updateGroundAndAddr(values[0],values[1],userId);
                break;
        }
        parentCenterDao.updateUserStatus(3,userId);
    }

    private void modifyDemand(int demandId,String newValue,String fieldName) {
        switch (fieldName) {
            case "name":
                demandDao.updateName(newValue, demandId);
                break;
            case "gender":
                if (newValue.equals("1")) demandDao.updateGender(1, demandId);
                else demandDao.updateGender(2, demandId);
                break;
            case "birthday":
                demandDao.updateBirthday(newValue, demandId);
                break;
            case "diseaseHis":
                demandDao.updateDiseaseHis(newValue, demandId);
                break;
            case "allergyHis":
                demandDao.updateAllergyHis(newValue, demandId);
                break;
            case "report":
                demandDao.updateReport(newValue, demandId);
                break;
            case "remark":
                demandDao.updateRemark(newValue, demandId);
                break;
        }
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
    public void addRecoveryHis(RecoveryHisDto recoveryHisDto, int demandId){
        String recoveryHisStr=demandDao.getRecoveryHis(demandId);
        String newRecoveryHis="@"+recoveryHisDto.getName()+"#"+recoveryHisDto.getBeginTime()+"-"+recoveryHisDto.getEndTime()
                +"#"+recoveryHisDto.getCount()+"#"+recoveryHisDto.getDetail();
        recoveryHisStr+=newRecoveryHis;
        demandDao.updateRecoveryHis(recoveryHisStr,demandId);
    }

    @Override
    public void modifyRecoveryHis(RecoveryHisDto recoveryHisDto, int demandId){
        String recoveryHisStr=demandDao.getRecoveryHis(demandId);
        List<String> strs= Arrays.asList(recoveryHisStr.split("@"));
        String newRecoveryHis=recoveryHisDto.toFeildStr();
        for(int j=0;j<strs.size();j++){
            System.out.println(strs.get(j));
        }
        strs.set(recoveryHisDto.getIndex(),newRecoveryHis);
        StringBuilder stringBuilder=new StringBuilder();
        for(int i=0;i<strs.size()-1;i++){
            stringBuilder.append(strs.get(i));
            stringBuilder.append("@");
        }
        stringBuilder.append(strs.get(strs.size()-1));
        demandDao.updateRecoveryHis(stringBuilder.toString(),demandId);
    }

    @Override
    public void addDemand( int userId,String name,int gender,String birthday,String report,String diseaseHis,
                           String allergyHis,String remark){
        demandDao.addDemand(userId,name,gender,birthday,report,diseaseHis,allergyHis,remark);
    }

//    @Override
//    public int myInfoStatus(int userId){ //0.未完成 1.审核中 2.完成
//        User user=getUserById(userId);
//        if(user.getUserStatus()==0) return 0;
//        else if(user.getUserStatus()==1) return 1;
//        if(user.getPhone()==null || user.getEmail()==null || user.getGender() ==null){
//            return 0;
//        }
//        Parent parent=getParentByUserId(userId);
//        if(parent==null) return 0;
//        else if(parent.getAddress()==null || parent.getGround()==null || parent.getPid()==null){
//            return 0;
//        }
//        return 2;
//    }

    @Override
    public void fillInfo(ParentInfoDto parentInfoDto){
        parentCenterDao.fillInfoUser(parentInfoDto);
        parentCenterDao.fillInfoParent(parentInfoDto);
    }



    public void uploadPhoto(HttpServletRequest request,int userId){
        String picUrl="";
        MultipartHttpServletRequest MulRequest = request instanceof MultipartHttpServletRequest ? (MultipartHttpServletRequest) request : null;
        Iterator<String> fileNames = MulRequest.getFileNames();
        while(fileNames.hasNext()) { // 遍历请求中的信息
            String fileName = fileNames.next();

            //图片
            try {
                String path= FileUpload.uploadFile(MulRequest.getFile(fileName), request, FileUpload.ICON_PARENT_ROOT_PATH);
                picUrl=path.substring(path.indexOf("img"),path.length());
                System.out.println(picUrl);
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
        parentCenterDao.updateIcon(picUrl,userId);
    }

    @Override
    public void allInformRead(HttpServletRequest request) {
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
//        openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        User user=userDao.getUserByOpenidStatus(openid,"0");
        messageDao.allInformRead(user.getId());
    }

    @Override
    public PCommentsDto getCommentsByUserId(Integer userId) {
        PCommentsDto pCommentsDto=new PCommentsDto();
        List<Comment> hisCommentList=commentDao.getParentHisCommentsByUid(userId);

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
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

        List<Order> orderList=orderDao.getParentNoCommentOrderByUid(userId);

        pCommentsDto.setNoCommentOrders(orderList);
        pCommentsDto.setHisComments(hisCommentList);
        return pCommentsDto;
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
        }
        switch (ctype){
            case "email":
                teacherInfoEdit.setCtypeDesc("邮箱");
                break;
            case "gender":
                teacherInfoEdit.setCtypeDesc("性别");
                break;
            case "realName":
                teacherInfoEdit.setCtypeDesc("真实姓名");
                break;
            case "pid":
                teacherInfoEdit.setCtypeDesc("证件号");
                break;
            case "nickname":
                teacherInfoEdit.setCtypeDesc("昵称");
                break;
        }

        if(userStatus!=0) {
            //更改用户状态
            switch (ctype) {
                case "realName":
                case "pid":
                    teacherInfoEdit.setIsChangeStatus(1);
            }
        }
        return teacherInfoEdit;
    }

    @Override
    public Parent getIdCardByUid(Integer uid) {
        Parent parent=parentCenterDao.getIdcardByUid(uid);
        return parent;
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

        List<Order> orderList=orderDao.getAllDoingOrderByUid(userId);//获得该家长 正在进行的所有订单

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

        List<Order> orderList=orderDao.getAllDoingDayOrderByUid(uid,day);
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
    public void changeInfo(Parent parent) {
        parentCenterDao.changeInfo(parent);
    }


    @Override
    public Result checkAccountReg(Integer uid) {
        User user=userDao.getUserById(uid);
        Parent parent=parentCenterDao.getParentByUserId(uid);
        if(user.getHeadimgurl()==null || user.getHeadimgurl().equals("") ||
                user.getUsername()==null || user.getUsername().equals("") ||
                parent.getRealName()==null || parent.getRealName().equals("") ||
                parent.getPid()==null || parent.getPid().equals("") ||
                parent.getPidFrontUrl()==null || parent.getPidFrontUrl().equals("")){
            return new Result(false,"资料未填写完整");
        }

        return new Result(true,"提交成功，请耐心等待审核");
    }
}

