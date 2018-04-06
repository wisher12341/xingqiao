package com.xq.service.impl;

import com.xq.dao.*;
import com.xq.dto.RecoveryLogDto;
import com.xq.model.*;
import com.xq.service.RecoveryLogService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * Created by netlab606 on 2017/6/30.
 */
@Service
public class RecoveryLogServiceImpl implements RecoveryLogService {

    @Autowired
    RecoveryLogDao recoveryLogDao;
    @Autowired
    TeacherDao teacherDao;
    @Autowired
    DemandDao demandDao;
    @Autowired
    OrderDao orderDao;
    @Autowired
    MessageDao messageDao;
    @Autowired
    OrderTeacherDao orderTeacherDao;

    public Integer getConfirmCountByOid(String orderId) {
        return recoveryLogDao.getConfirmCountByOid(orderId);
    }

    public RecoveryLogDto getLogsByDto(RecoveryLogDto recoveryLogDto, HttpServletRequest request) {
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
        List<Teacher> teacherList=teacherDao.getMyTeachersByOpenid(openid);
        List<Demand> demandList=demandDao.getMyDemandsByOpenid(openid);
        recoveryLogDto.setTeacherList(teacherList);
        recoveryLogDto.setDemandList(demandList);

        if(recoveryLogDto.getStartTime()!=null && !recoveryLogDto.getStartTime().equals("")) {
            recoveryLogDto.setStartTime(recoveryLogDto.getStartTime().replaceAll("/", "-"));
            recoveryLogDto.setEndTime(recoveryLogDto.getEndTime().replaceAll("/", "-") + " 23:59:59");
        }
        List<RecoveryLog> recoveryLogList=recoveryLogDao.getLogsByDto(recoveryLogDto);
        recoveryLogDto.setRecoveryLogList(recoveryLogList);

        List<String> obs=orderDao.getAllRecoveryObsByOpenid(openid);
        recoveryLogDto.setObs(obs);


        if(recoveryLogDto.getStartTime()!=null && !recoveryLogDto.getStartTime().equals("")) {
            recoveryLogDto.setStartTime(recoveryLogDto.getStartTime().replaceAll("-", "/"));
            recoveryLogDto.setEndTime(recoveryLogDto.getEndTime().replaceAll("-", "/").split(" ")[0]);
        }
        return recoveryLogDto;
    }

    public RecoveryLogDto getMyTeachersAndDemandsNoConfirmLogByUid(HttpServletRequest request) {
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
//        openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        List<Teacher> teacherList=teacherDao.getMyTeachersByOpenid(openid);
        List<Demand> demandList=demandDao.getMyDemandsByOpenid(openid);
        RecoveryLogDto recoveryLogDto=new RecoveryLogDto();
        recoveryLogDto.setTeacherList(teacherList);
        recoveryLogDto.setDemandList(demandList);
        List<String> obs=orderDao.getAllRecoveryObsByOpenid(openid);
        List<RecoveryLog> recoveryLogList=recoveryLogDao.getNoConfirmLogByOpenid(openid);
        for(RecoveryLog recoveryLog:recoveryLogList){
            recoveryLog.setServerTime(recoveryLog.getServerTime().split("#")[recoveryLog.getIndex()-1].replace("%","-"));
        }
        Collections.sort(recoveryLogList);
        recoveryLogDto.setRecoveryLogNoConfirmList(recoveryLogList);
        recoveryLogDto.setObs(obs);
        return recoveryLogDto;
    }

    @Transactional
    public void allConfirmByOrderId(String orderId) {
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        recoveryLogDao.allConfirmByOrderId(orderId,dateNowStr);
        Order order=orderDao.getOrderPayByOid(orderId);
        Message messageT=new Message();
        messageT.setTime(dateNowStr);
        messageT.setUserId(order.getUidT());
        messageT.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    家长（"+order.getPname()+"）已确认康复日志。"+
                "</p>");

        messageDao.addMessage(messageT);
        orderDao.updateTrace(orderId,"#"+dateNowStr+"@家长确认当前全部康复日志");
        checkOrderFinish(orderId);//检查该订单是否完成 家长确认了最后一个 康复日志 订单即完成
    }

    @Transactional
    public void confirmById(Integer id, String oid) {

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);

        recoveryLogDao.confirmById(id,dateNowStr);

        Order order=orderDao.getOrderPayByOid(oid);
        Message messageT=new Message();
        messageT.setTime(dateNowStr);
        messageT.setUserId(order.getUidT());
        messageT.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    家长（"+order.getPname()+"）已确认康复日志。"+
                "</p>");

        messageDao.addMessage(messageT);
        orderDao.updateTrace(oid,"#"+dateNowStr+"@家长确认康复日志");
        checkOrderFinish(oid);//检查该订单是否完成 家长确认了最后一个 康复日志 订单即完成
    }

    @Transactional
    public void remind(Integer lid, String oid) {
        recoveryLogDao.remind(lid);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        Order order=orderDao.getOrderPayByOid(oid);
        Message message=new Message();
        message.setUserId(order.getUidP());
        message.setTime(dateNowStr);
        message.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    您的订单（"+oid+"），治疗师（"+order.getTname()+"）提醒您确认康复日志。"+
                "</p>");

        messageDao.addMessage(message);
    }

    @Override
    @Transactional
    public void addRecovery(RecoveryLog recoveryLog) {
        //简化 表情
        String pattern = "<img.*?>";
        String detai=recoveryLog.getContent();
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(detai);
        while (m.find()){
            int begin=m.group().indexOf(".png")-5;
            int end=m.group().indexOf(".png");
            String number=m.group().substring(begin,end);
            detai=detai.replace(m.group(),"&#x"+number+";");

        }
        recoveryLog.setContent(detai);

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        recoveryLog.setTime(dateNowStr);
        recoveryLog.setConfirmStatus(0);

        Integer nowNumber=recoveryLogDao.getLogCountByOid(recoveryLog.getOrderId());
        recoveryLog.setIndex(nowNumber+1);

        recoveryLogDao.add(recoveryLog);

        orderDao.updateTrace(recoveryLog.getOrderId(),"#"+dateNowStr+"@治疗师填写康复日志");
        Order order=orderDao.getOrderPayByOid(recoveryLog.getOrderId());
        Message message=new Message();
        message.setUserId(order.getUidP());
        message.setTime(dateNowStr);
        message.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    您的订单（"+recoveryLog.getOrderId()+"），治疗师（"+order.getTname()+"）已填写康复日志，请前往确认。<a href='/parentCenter/"+recoveryLog.getOrderId()+"/doing_detail'>查看</a>"+
                "</p>");

        messageDao.addMessage(message);
    }

    private void checkOrderFinish(String oid){
        CheckOrderFinish checkOrderFinish=orderDao.checkOrderFinish(oid);
        if(checkOrderFinish.getAmount()==checkOrderFinish.getConfirm()){
            //订单完成
            orderTeacherDao.orderFinish(oid);
            Date d = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
            String dateNowStr = sdf.format(d);

            Order order=orderDao.getOrderPayByOid(oid);
            Message messageP=new Message();
            messageP.setTime(dateNowStr);
            messageP.setUserId(order.getUidP());
            messageP.setMessage("<p>\n" +
                    "<span style=\"color:red;\">系统消息：</span>\n" +
                    "</p>\n" +
                    "<p>\n" +
                    "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                    "    您的订单（"+oid+"），已完成。"+
                    "</p>");

            messageDao.addMessage(messageP);

            Message messageT=new Message();
            messageT.setTime(dateNowStr);
            messageT.setUserId(order.getUidT());
            messageT.setMessage("<p>\n" +
                    "<span style=\"color:red;\">系统消息：</span>\n" +
                    "</p>\n" +
                    "<p>\n" +
                    "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                    "    订单（"+oid+"）已完成。"+
                    "</p>");

            messageDao.addMessage(messageT);
            orderDao.updateTrace(oid,"#"+dateNowStr+"@订单完成");
        }
    }


    @Override
    public RecoveryLog getLogByRid(Integer rid) {
        RecoveryLog recoveryLog=recoveryLogDao.getLogByRid(rid);
        return recoveryLog;
    }
}
