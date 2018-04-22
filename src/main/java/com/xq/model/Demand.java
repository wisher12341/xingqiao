package com.xq.model;

/**
 * 家长需求
 * Created by netlab606 on 2017/7/13.
 */
public class Demand {
    private Integer id;
    private String name;
    private Integer gender;
    private String birthday;
    private String disease;
    private String report;
    private String diseaseHis;
    private String allergyHis;
    private String recoveryHis; //格式   华师宝贝#2015.9-2016.9#3#感觉统合康复@杏林语言康复#2015.10-2016.9#3#言语语言康复
    private String remark;
    private Integer userId;

    private String first;


    private String way;//在治疗师个人中心  我的患者 页面 患者列表 显示
    private User user;
    private Parent parent;



    public Parent getParent() {
        return parent;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public void setParent(Parent parent) {
        this.parent = parent;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getFirst() {
        return first;
    }

    public void setFirst(String first) {
        this.first = first;
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

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public String getDiseaseHis() {
        return diseaseHis;
    }

    public void setDiseaseHis(String diseaseHis) {
        this.diseaseHis = diseaseHis;
    }

    public String getAllergyHis() {
        return allergyHis;
    }

    public void setAllergyHis(String allergyHis) {
        this.allergyHis = allergyHis;
    }

    public String getRecoveryHis() {
        return recoveryHis;
    }

    public void setRecoveryHis(String recoveryHis) {
        this.recoveryHis = recoveryHis;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
