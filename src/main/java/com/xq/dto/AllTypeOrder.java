package com.xq.dto;


import com.xq.model.Order;

import java.util.List;

/**
 * 待处理、进行中、历史订单
 * Created by netlab606 on 2017/7/21.
 */
public class AllTypeOrder {

    private List<Order> orderList_wait;//待处理
    private List<Order> orderList_doing;//进行中
    private List<Order> orderList_history;//历史


    public List<Order> getOrderList_wait() {
        return orderList_wait;
    }

    public void setOrderList_wait(List<Order> orderList_wait) {
        this.orderList_wait = orderList_wait;
    }

    public List<Order> getOrderList_doing() {
        return orderList_doing;
    }

    public void setOrderList_doing(List<Order> orderList_doing) {
        this.orderList_doing = orderList_doing;
    }

    public List<Order> getOrderList_history() {
        return orderList_history;
    }

    public void setOrderList_history(List<Order> orderList_history) {
        this.orderList_history = orderList_history;
    }
}
