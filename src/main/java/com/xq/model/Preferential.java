package com.xq.model;

/**
 * 优惠
 * Created by netlab606 on 2017/7/21.
 */
public class Preferential {

    private Integer id;
    private String name;
    private Integer allAmount;
    private Integer amount;
    private Integer classes;
    private Integer sTime;
    private Integer eTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAllAmount() {
        return allAmount;
    }

    public void setAllAmount(Integer allAmount) {
        this.allAmount = allAmount;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getClasses() {
        return classes;
    }

    public void setClasses(Integer classes) {
        this.classes = classes;
    }

    public Integer getsTime() {
        return sTime;
    }

    public void setsTime(Integer sTime) {
        this.sTime = sTime;
    }

    public Integer geteTime() {
        return eTime;
    }

    public void seteTime(Integer eTime) {
        this.eTime = eTime;
    }
}
