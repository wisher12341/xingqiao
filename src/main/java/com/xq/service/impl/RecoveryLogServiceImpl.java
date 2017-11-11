package com.xq.service.impl;

import com.xq.dao.DemandDao;
import com.xq.dao.OrderDao;
import com.xq.dao.RecoveryLogDao;
import com.xq.dao.TeacherDao_sp;
import com.xq.dto.RecoveryLogDto;
import com.xq.model.Demand;
import com.xq.model.Order;
import com.xq.model.RecoveryLog;
import com.xq.model.Teacher;
import com.xq.service.RecoveryLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
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
    TeacherDao_sp teacherDao_sp;
    @Autowired
    DemandDao demandDao;
    @Autowired
    OrderDao orderDao;

    public Integer getConfirmCountByOid(String orderId) {
        return recoveryLogDao.getConfirmCountByOid(orderId);
    }

    public RecoveryLogDto getLogsByDto(RecoveryLogDto recoveryLogDto, HttpServletRequest request) {
//        String openid= CookieUtil.checkCookie(request, ConstOrder.OPENID);
        String openid="123";
        List<Teacher> teacherList=teacherDao_sp.getMyTeachersByOpenid(openid);
        List<Demand> demandList=demandDao.getMyDemandsByOpenid(openid);
        recoveryLogDto.setTeacherList(teacherList);
        recoveryLogDto.setDemandList(demandList);
        List<RecoveryLog> recoveryLogList=recoveryLogDao.getLogsByDto(recoveryLogDto);
        recoveryLogDto.setRecoveryLogList(recoveryLogList);
        return recoveryLogDto;
    }

    public RecoveryLogDto getMyTeachersAndDemandsByUid(HttpServletRequest request) {
//        String openid= CookieUtil.checkCookie(request, ConstOrder.OPENID);
        String openid="123";
        List<Teacher> teacherList=teacherDao_sp.getMyTeachersByOpenid(openid);
        List<Demand> demandList=demandDao.getMyDemandsByOpenid(openid);
        RecoveryLogDto recoveryLogDto=new RecoveryLogDto();
        recoveryLogDto.setTeacherList(teacherList);
        recoveryLogDto.setDemandList(demandList);
        return recoveryLogDto;
    }

    public void allConfirmByOrderId(String orderId) {
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        recoveryLogDao.allConfirmByOrderId(orderId,dateNowStr);
        Order order=orderDao.getOrderPayByOid(orderId);
//        Message messageT=new Message();
//        messageT.setTime(dateNowStr);
//        messageT.setUserId(order.getUidT());
//        messageT.setMessage("<p>\n" +
//                "<span style=\"color:red;\">系统消息：</span>\n" +
//                "</p>\n" +
//                "<p>\n" +
//                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
//                "    家长（"+order.getPname()+"）已确认康复日志。"+
//                "</p>");
//
//        messageDao.addMessage(messageT);
        orderDao.updateTrace(orderId,"#"+dateNowStr+"@家长确认当前全部康复日志");
    }

    public void confirmById(Integer id, String oid) {

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);

        recoveryLogDao.confirmById(id,dateNowStr);

        Order order=orderDao.getOrderPayByOid(oid);
//        Message messageT=new Message();
//        messageT.setTime(dateNowStr);
//        messageT.setUserId(order.getUidT());
//        messageT.setMessage("<p>\n" +
//                "<span style=\"color:red;\">系统消息：</span>\n" +
//                "</p>\n" +
//                "<p>\n" +
//                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
//                "    家长（"+order.getPname()+"）已确认康复日志。"+
//                "</p>");
//
//        messageDao.addMessage(messageT);
        orderDao.updateTrace(oid,"#"+dateNowStr+"@家长确认康复日志");
    }
}
