package com.xq.model;

/**
 * 用于检查订单是否完成
 * Created by netlab606 on 2017/12/19.
 */
public class CheckOrderFinish {

    private Integer amount;//订单的服务总次数
    private Integer confirm;//确认的康复日志数

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getConfirm() {
        return confirm;
    }

    public void setConfirm(Integer confirm) {
        this.confirm = confirm;
    }
}
