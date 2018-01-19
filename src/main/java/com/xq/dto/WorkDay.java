package com.xq.dto;

import com.xq.model.Demand;
import com.xq.model.Order;
import com.xq.model.Parent;

/**
 * 日程安排 当天事务
 * Created by netlab606 on 2018/1/7.
 */
public class WorkDay implements Comparable{
    private String startTime;
    private String endTime;
    private Order order;


    @Override
    public int compareTo(Object o) {
        WorkDay obj=(WorkDay) o;
        return this.startTime.compareTo(obj.getStartTime());
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
