package com.xq.service.impl;

import com.xq.dao.MessageDao;
import com.xq.dao.OrderDao;
import com.xq.dao.OrderTeacherDao;
import com.xq.dao.RecoveryLogDao;
import com.xq.dto.AllTypeOrder;
import com.xq.dto.OrderDto;
import com.xq.model.Message;
import com.xq.model.Order;
import com.xq.model.RecoveryHis;
import com.xq.model.RecoveryLog;
import com.xq.service.OrderTeacherService;
import com.xq.service.RecoveryLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by netlab606 on 2017/11/2.
 */
@Service
public class OrderTeacherServiceImpl implements OrderTeacherService {

    @Autowired
    OrderTeacherDao orderTeacherDao;
    @Autowired
    RecoveryLogService recoveryService;
    @Autowired
    RecoveryLogDao recoveryLogDao;
    @Autowired
    MessageDao messageDao;
    @Autowired
    OrderDao orderDao;


    public AllTypeOrder getAllOrder(String uid) {
        List<Order> orderList=orderTeacherDao.getAllOrderByUid(uid);
        setStatusDesc(orderList);
        AllTypeOrder allTypeOrder=new AllTypeOrder();
        List<Order> orderList_wait=new ArrayList<Order>();
        List<Order> orderList_doing=new ArrayList<Order>();
        List<Order> orderList_history=new ArrayList<Order>();
        for(Order order:orderList){
            if(order.getStatusT()<3){
                //待处理   只有家长付款后  p,t都变为3 才算进行中
                orderList_wait.add(order);
            }else if(order.getStatusT()>=3 &&order.getStatusT()<11){
                orderList_doing.add(order);
            }else{
                //其余都是历史订单  治疗师 不需要  分出是否评论
                orderList_history.add(order);
            }
        }
        allTypeOrder.setOrderList_doing(orderList_doing);
        allTypeOrder.setOrderList_history(orderList_history);
        allTypeOrder.setOrderList_wait(orderList_wait);
        return allTypeOrder;
    }


    public OrderDto getOrderByOid(String oid) {
        OrderDto orderDto=new OrderDto();
        Order order=orderDao.getOrderByOid(oid);
        switch (order.getStatusT()){
            case 1:
                order.setStatusDesc("待处理");
                break;
            case 2:
                order.setStatusDesc("待家长付款");
                break;
            case 3:
                order.setStatusDesc("进行中");
                break;
            case 4:
                order.setStatusDesc("家长终止审核中");
                break;
            case 5:
                order.setStatusDesc("治疗师终止审核中");
                break;
            case 6:
                order.setStatusDesc("退款处理中");
                break;
            case 7:
                order.setStatusDesc("待家长同意终止订单");
                break;
            case 8:
                order.setStatusDesc("待治疗师同意终止订单");
                break;
            case 11:
                order.setStatusDesc("家长已取消");
                break;
            case 12:
                order.setStatusDesc("治疗师逾期未处理");
                break;
            case 13:
                order.setStatusDesc("被治疗师终止");
                break;
            case 14:
                order.setStatusDesc("被家长终止");
                break;
            case 15:
                order.setStatusDesc("完成");
                break;
            case 16:
                order.setStatusDesc("治疗师拒绝");
                break;
        }
        List<RecoveryHis> recoveryHisList=new ArrayList<RecoveryHis>();

        if(order.getDemand().getRecoveryHis()!=null) {
            String[] data = order.getDemand().getRecoveryHis().split("@");
            for (String s : data) {
                RecoveryHis recoveryHis = new RecoveryHis();
                recoveryHis.setName(s.split("#")[0]);
                recoveryHis.setTime(s.split("#")[1]);
                recoveryHis.setDetail(s.split("#")[3]);
                recoveryHis.setCount(Integer.parseInt(s.split("#")[2]));
                recoveryHisList.add(recoveryHis);
            }
        }
        order.setRecoveryHisList(recoveryHisList);

        if(!(order.getStatusT()==1 || order.getStatusT()==2 || order.getStatusT()==16 || order.getStatusT()==11 || order.getStatusT()==12)) {
            List<RecoveryLog> recoveryLogList = recoveryLogDao.getLogByOrderId(oid);
            orderDto.setRecoveryLogList(recoveryLogList);
            if(order.getStatusT()==3) {
                Integer count = recoveryService.getConfirmCountByOid(oid);//该订单康复日志已确认的数量
                orderDto.setCount(count);
                List<String> serverTimes = Arrays.asList(order.getServerTime().split("#"));
                Collections.sort(serverTimes);
                for (int i = 0; i < serverTimes.size(); i++) {
                    if (count == i) {
                        orderDto.setNextTime(serverTimes.get(i));
                        break;
                    }
                }
                orderDto.setPercent((count * 100) / Double.parseDouble(order.getAmount()) + "%");
            }
        }
        orderDto.setOrder(order);
        return orderDto;
    }

    @Transactional
    public void orderAffirm(String orderId) {
        orderTeacherDao.orderAffirm(orderId);

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);

        Order order=orderDao.getOrderPayByOid(orderId);
        Message messageP=new Message();
        messageP.setTime(dateNowStr);
        messageP.setUserId(order.getUidP());
        messageP.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    您的预约单（"+orderId+"），治疗师已接受。"+
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
                "    您已接受预约单（"+orderId+"）。"+
                "</p>");

        messageDao.addMessage(messageT);
        orderDao.updateTrace(orderId,"#"+dateNowStr+"@治疗师接受");
    }

    @Transactional
    public void orderReject(String orderId,String reason) {
        orderTeacherDao.orderReject(orderId,reason);

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);

        Order order=orderDao.getOrderPayByOid(orderId);
        Message messageP=new Message();
        messageP.setTime(dateNowStr);
        messageP.setUserId(order.getUidP());
        messageP.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    您的预约单（"+orderId+"），治疗师已拒绝。理由："+reason+
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
                "    您已拒绝预约单（"+orderId+"）。理由"+reason+
                "</p>");

        messageDao.addMessage(messageT);
        orderDao.updateTrace(orderId,"#"+dateNowStr+"@治疗师拒绝");
    }

    @Override
    @Transactional
    public void orderFinish(String oid) {
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

    @Override
    @Transactional
    public void agree(String oid) {
        orderTeacherDao.agree(oid);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        orderDao.updateTrace(oid,"#"+dateNowStr+"@治疗师同意家长的终止订单");
        //通知后台管理员
        Order order=orderDao.getOrderPayByOid(oid);
        Message message=new Message();
        message.setTime(dateNowStr);
        message.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    订单（"+oid+"），家长（"+order.getPname()+"）申请终止。"+
                "</p>");

        messageDao.addMessageAdmin(message);

        Message messageP=new Message();
        messageP.setTime(dateNowStr);
        messageP.setUserId(order.getUidP());
        messageP.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    您的订单（"+oid+"），治疗师（"+order.getTname()+"）同意终止."+
                "</p>");

        messageDao.addMessage(messageP);
        orderDao.updateTrace(oid,"#"+dateNowStr+"@治疗师同意终止");
    }

    @Override
    @Transactional
    public void orderStop(String oid, String reason) {
        orderTeacherDao.orderStop(oid,reason);
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
                "    您的订单（"+oid+"），治疗师（"+order.getTname()+"）申请终止，理由:"+reason+
                "</p><a href='${path}/parentCenter/"+oid+"/agree'>同意" +
                "</a>");

        messageDao.addMessage(messageP);
        orderDao.updateTrace(oid,"#"+dateNowStr+"@治疗师终止订单");
    }

    public void setStatusDesc(List<Order> orders){
        for(Order order:orders){
            switch (order.getStatusT()){
                case 1:
                    order.setStatusDesc("待处理");
                    break;
                case 2:
                    order.setStatusDesc("待家长付款");
                    break;
                case 3:
                    order.setStatusDesc("进行中");
                    break;
                case 4:
                    order.setStatusDesc("家长终止审核中");
                    break;
                case 5:
                    order.setStatusDesc("治疗师终止审核中");
                    break;
                case 6:
                    order.setStatusDesc("退款处理中");
                    break;
                case 7:
                    order.setStatusDesc("待家长同意终止订单");
                    break;
                case 8:
                    order.setStatusDesc("待治疗师同意终止订单");
                    break;
                case 11:
                    order.setStatusDesc("家长已取消");
                    break;
                case 12:
                    order.setStatusDesc("治疗师逾期未处理");
                    break;
                case 13:
                    order.setStatusDesc("被治疗师终止");
                    break;
                case 14:
                    order.setStatusDesc("被家长终止");
                    break;
                case 15:
                    order.setStatusDesc("完成");
                    break;
                case 16:
                    order.setStatusDesc("治疗师拒绝");
                    break;
            }
        }
    }
}
