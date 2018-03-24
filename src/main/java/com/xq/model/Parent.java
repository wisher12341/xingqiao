package com.xq.model;

/**
 * 家长 个人资料
 * Created by netlab606 on 2017/7/13.
 */
public class Parent {

    private Integer id;
    private Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    private String realName;
    private String pid;
    private String pidFrontUrl;//身份证正面照
    private String pidBackUrl;//身份证反面照
    private String peoplePidUrl;//手持身份证
    private String address;//详细地址
    private String ground;//市区路 地址
    private String time;//添加时间

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPidFrontUrl() {
        return pidFrontUrl;
    }

    public void setPidFrontUrl(String pidFrontUrl) {
        this.pidFrontUrl = pidFrontUrl;
    }

    public String getPidBackUrl() {
        return pidBackUrl;
    }

    public void setPidBackUrl(String pidBackUrl) {
        this.pidBackUrl = pidBackUrl;
    }

    public String getGround() {
        return ground;
    }

    public void setGround(String ground) {
        this.ground = ground;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPeoplePidUrl() {
        return peoplePidUrl;
    }

    public void setPeoplePidUrl(String peoplePidUrl) {
        this.peoplePidUrl = peoplePidUrl;
    }
}
