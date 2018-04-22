package com.xq.dto;

import com.xq.model.Order;
import com.xq.model.RecoveryLog;

import java.util.List;

/**
 * 订单详情页面的5个tab
 * Created by netlab606 on 2017/11/4.
 */
public class OrderDto {

    private Integer count;//订单当前进度
    private String percent;//进度百分比
    private String nextTime;//下次服务时间
    private Order order;
    private List<RecoveryLog> recoveryLogList;//康复日志


    public String getPercent() {
        return percent;
    }

    public void setPercent(String percent) {
        this.percent = percent;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getNextTime() {
        return nextTime;
    }

    public void setNextTime(String nextTime) {
        this.nextTime = nextTime;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<RecoveryLog> getRecoveryLogList() {
        return recoveryLogList;
    }

    public void setRecoveryLogList(List<RecoveryLog> recoveryLogList) {
        this.recoveryLogList = recoveryLogList;
    }
}
