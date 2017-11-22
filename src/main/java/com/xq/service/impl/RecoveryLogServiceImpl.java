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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;


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

    public RecoveryLogDto getMyTeachersAndDemandsByUid(HttpServletRequest request) {
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
        List<Teacher> teacherList=teacherDao.getMyTeachersByOpenid(openid);
        List<Demand> demandList=demandDao.getMyDemandsByOpenid(openid);
        RecoveryLogDto recoveryLogDto=new RecoveryLogDto();
        recoveryLogDto.setTeacherList(teacherList);
        recoveryLogDto.setDemandList(demandList);
        List<String> obs=orderDao.getAllRecoveryObsByOpenid(openid);
        recoveryLogDto.setObs(obs);
        return recoveryLogDto;
    }

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
    }

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
}
