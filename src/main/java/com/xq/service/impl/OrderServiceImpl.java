package com.xq.service.impl;

import com.xq.dao.OrderDao;
import com.xq.dto.AllTypeOrder;
import com.xq.model.Order;
import com.xq.service.OrderService;
import com.xq.util.ConstOrder;
import com.xq.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by netlab606 on 2017/11/2.
 */
@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    OrderDao orderDao;

    @Override
    public AllTypeOrder getAllOrder(HttpServletRequest request) {
//        String openid= CookieUtil.checkCookie(request, ConstOrder.OPENID);
        String openid="123";
        List<Order> orderList=orderDao.getAllOrderByOpenid(openid);
        setStatusDesc(orderList);
        AllTypeOrder allTypeOrder=new AllTypeOrder();
        List<Order> orderList_wait=new ArrayList<Order>();
        List<Order> orderList_doing=new ArrayList<Order>();
        List<Order> orderList_history=new ArrayList<Order>();
        for(Order order:orderList){
            if(order.getStatusP()<3){
                //待处理   只有家长付款后  p,t都变为3 才算进行中
                orderList_wait.add(order);
            }else if(order.getStatusP()>=3 &&order.getStatusP()<11){
                orderList_doing.add(order);
            }else{
                //其余都是历史订单
                orderList_history.add(order);
            }
        }
        allTypeOrder.setOrderList_doing(orderList_doing);
        allTypeOrder.setOrderList_history(orderList_history);
        allTypeOrder.setOrderList_wait(orderList_wait);
        return allTypeOrder;
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
}
