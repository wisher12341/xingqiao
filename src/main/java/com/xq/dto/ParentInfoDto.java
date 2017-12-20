package com.xq.dto;

/**
 * Created by 86761 on 2017/12/15.
 */
public class ParentInfoDto {
    int userId;
    String realName;
    int gender;
    String phone;
    String email;
    String pid;
    String ground;
    String address;

    public ParentInfoDto() {
    }

    public ParentInfoDto(int userId, String realName, int gender, String phone, String email, String pid, String ground, String address) {
        this.userId = userId;
        this.realName = realName;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.pid = pid;
        this.ground = ground;
        this.address = address;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
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
}
