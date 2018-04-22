package com.xq.service.impl;

import com.xq.dao.*;
import com.xq.dto.AllTypeOrder;
import com.xq.dto.OrderDto;
import com.xq.model.Message;
import com.xq.model.Order;
import com.xq.model.RecoveryHis;
import com.xq.model.RecoveryLog;
import com.xq.model.*;
import com.xq.service.OrderService;
import com.xq.service.RecoveryLogService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import com.xq.util.OrderUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by netlab606 on 2017/11/2.
 */
@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    OrderDao orderDao;
    @Autowired
    RecoveryLogService recoveryService;
    @Autowired
    RecoveryLogDao recoveryLogDao;
    @Autowired
    MessageDao messageDao;
    @Autowired
    ParentCenterDao parentCenterDao;
    @Autowired
    UserDao userDao;

    public AllTypeOrder getAllOrder(HttpServletRequest request) {
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
//        openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        List<Order> orderList=orderDao.getAllOrderByOpenid(openid);
        setStatusDesc(orderList);
        AllTypeOrder allTypeOrder=new AllTypeOrder();
        List<Order> orderList_wait=new ArrayList<Order>();
        List<Order> orderList_doing=new ArrayList<Order>();
        List<Order> orderList_history=new ArrayList<Order>();
        List<Order> orderList_history_noComment=new ArrayList<Order>();
        for(Order order:orderList){
            String[] times=order.getServerTime().split("#");
            order.setServerTime(times[0].split(" ")[0]+"—"+times[times.length-1].split(" ")[0]);
            if(order.getStatusP()<3){
                //待处理   只有家长付款后  p,t都变为3 才算进行中
                orderList_wait.add(order);
            }else if(order.getStatusP()>=3 &&order.getStatusP()<11){
                orderList_doing.add(order);
            }else{
                //其余都是历史订单
                if(order.getCid()==0 && order.getStatusP()==15) {
                    //未评论的已完成订单
                    orderList_history_noComment.add(order);
                }else{
                    orderList_history.add(order);
                }
            }
        }
        allTypeOrder.setOrderList_doing(orderList_doing);
        allTypeOrder.setOrderList_history(orderList_history);
        allTypeOrder.setOrderList_wait(orderList_wait);
        allTypeOrder.setOrderList_history_noComment(orderList_history_noComment);
        return allTypeOrder;
    }


    public OrderDto getOrderByOid(String oid) {
        OrderDto orderDto=new OrderDto();

        Order order=orderDao.getOrderByOid(oid);
        switch (order.getStatusP()){
            case 1:
                order.setStatusDesc("待治疗师确认");
                break;
            case 2:
                order.setStatusDesc("付款");
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

        List<RecoveryHis> recoveryHisList = new ArrayList<RecoveryHis>();
        if (order.getDemand().getRecoveryHis()!=null) {
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

        if(!(order.getStatusP()==1 || order.getStatusP()==2 || order.getStatusP()==16 || order.getStatusP()==11 || order.getStatusP()==12)) {
            List<RecoveryLog> recoveryLogList = recoveryLogDao.getLogByOrderId(oid);
            orderDto.setRecoveryLogList(recoveryLogList);
            if(order.getStatusP()==3) {
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

    public void orderCancel(String oid) {
        orderDao.orderCancel(oid);

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
                "    您已取消预约单（"+oid+"）。"+
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
                "    家长已取消预约单（"+oid+"）。"+
                "</p>");

        messageDao.addMessage(messageT);
        orderDao.updateTrace(oid,"#"+dateNowStr+"@家长取消预约");
    }

    @Transactional
    public void orderStop(String oid, String reason) {
        orderDao.stop(oid,reason);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);

        Order order=orderDao.getOrderPayByOid(oid);
        Message messageT=new Message();
        messageT.setTime(dateNowStr);
        messageT.setUserId(order.getUidT());
        messageT.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    您的订单（"+oid+"），家长（"+order.getTname()+"）申请终止，理由:"+reason+
                "</p><a href='${path}/teacher/order/"+oid+"/agree'>同意" +
                "</a>");

        messageDao.addMessage(messageT);
        orderDao.updateTrace(oid,"#"+dateNowStr+"@家长终止订单");
    }

    @Transactional
    public void agree(String oid) {
        orderDao.agree(oid);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        orderDao.updateTrace(oid,"#"+dateNowStr+"@家长同意治疗师的终止订单");
        //通知后台管理员
        Order order=orderDao.getOrderPayByOid(oid);
        Message message=new Message();
        message.setTime(dateNowStr);
        message.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    订单（"+oid+"），治疗师（"+order.getTname()+"）申请终止。"+
                "</p>");

        messageDao.addMessageAdmin(message);

        Message messageT=new Message();
        messageT.setTime(dateNowStr);
        messageT.setUserId(order.getUidT());
        messageT.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    您的订单（"+oid+"），家长（"+order.getPname()+"）同意终止."+
                "</p>");

        messageDao.addMessage(messageT);
        orderDao.updateTrace(oid,"#"+dateNowStr+"@家长同意终止");
    }

    public void setStatusDesc(List<Order> orders){
        for(Order order:orders){
            switch (order.getStatusP()){
                case 1:
                    order.setStatusDesc("待治疗师确认");
                    break;
                case 2:
                    order.setStatusDesc("付款");
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


    // 下单失败:用户非正常操作“-1” 订单冲突“-2”
    @Transactional
    public String addOrder(Order order,HttpServletRequest request) {
        //User user = (User) session.getAttribute("USER");
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
        User user=userDao.getParentByOpenid(openid);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        SimpleDateFormat sdfdate = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);

        Parent parent=parentCenterDao.getParentByUserId(user.getId());

        Date date=new Date();

        order.setId(date.getTime()+"");
        order.setPreferential(1);
        order.setsTime(dateNowStr);
        order.setParentId(parent.getId());
        order.setStatusP(1);
        order.setStatusT(1);
        order.setTrace(dateNowStr+"@下预约单");

        // check if conflict
        boolean isOrderConflict = (order.getTeacher() == null);
        if (isOrderConflict){
            return String.valueOf(-1);
        }

        List<Order> ordersToCheck = orderDao.getOnGoingOrdersByTid(order.getTeacher().getId());
        if (CollectionUtils.isNotEmpty(ordersToCheck)){
            for (Order orderToCheck : ordersToCheck) {
                if (OrderUtils.isOrderConflict(order, orderToCheck)){
                    isOrderConflict = true;
                    break;
                }
            }
        }

        if (!isOrderConflict) {
            orderDao.addOrder(order);

            Message messageP = new Message();
            messageP.setTime(dateNowStr);
            messageP.setUserId(user.getId());
            messageP.setMessage("<p>\n" +
                    "<span style=\"color:red;\">系统消息：</span>\n" +
                    "</p>\n" +
                    "<p>\n" +
                    "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                    "    您的预约单已发给治疗师（" + order.getTeacher().getName() + "），请耐心等待治疗师回复。" +
                    "</p>");

            messageDao.addMessage(messageP);

            Message messageT = new Message();
            messageT.setTime(dateNowStr);
            messageT.setUserId(orderDao.getUserIdByOid(order.getId()));
            messageT.setMessage("<p>\n" +
                    "<span style=\"color:red;\">系统消息：</span>\n" +
                    "</p>\n" +
                    "<p>\n" +
                    "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                    "    您收到一份预约单。" +
                    "</p>");

            messageDao.addMessage(messageT);
            return order.getId();
        }

        return String.valueOf(-2);
    }
}
