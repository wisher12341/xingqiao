package com.xq.model;

import java.util.List;

/**
 * 机构表
 * Created by netlab606 on 2017/7/6.
 */
public class Organization {

    private Integer id;
    private String name;
    private String NumPeople;
    private String province;
    private String city;
    private String district;
    private String abstractOrg;
    private String introduce;

    private String course;
    private String service;
    private String hardware;
    private String team;
    private String phone;
    private String address;

    private List<OrganComment> organCommentList;//机构评论


    public List<OrganComment> getOrganCommentList() {
        return organCommentList;
    }

    public void setOrganCommentList(List<OrganComment> organCommentList) {
        this.organCommentList = organCommentList;
    }

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

    public String getNumPeople() {
        return NumPeople;
    }

    public void setNumPeople(String numPeople) {
        NumPeople = numPeople;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getAbstractOrg() {
        return abstractOrg;
    }

    public void setAbstractOrg(String abstractOrg) {
        this.abstractOrg = abstractOrg;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getHardware() {
        return hardware;
    }

    public void setHardware(String hardware) {
        this.hardware = hardware;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
