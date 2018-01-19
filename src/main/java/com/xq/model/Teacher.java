package com.xq.model;

import java.util.List;

/**
 * 治疗师 个人资料
 * Created by netlab606 on 2017/7/7.
 */
public class Teacher {

    private Integer id;
    private Integer userId;


    private String name;
    private String pid;
    private String address; //没用
    private String unit;
    private String abstractTeacher;
    private Integer priceT;
    private Integer priceS;
    private Integer priceO;
    private String availableTime;
    private String level;
    private String tGround;
    private String sGround;
    private String domain;
    private String question;
    private String object;
    private String project; //没用
    private Integer experienceAge;
    private String way;
    private String coursePrice;
    private String schedule;

    private String gender;

    private Integer priceMin;
    private Integer priceMax;
    private Integer priceMid;

    private Integer isPass;
    private String pidUrlFront;
    private String pidUrlBack;
    private String school;//毕业学校
    private String award;//奖励荣誉
    private String certificate;//相关证书
    private String recoveryHis;//康复治疗经历
    private String successCase;//成功案例
    private String detailAddress;
    private String peoplePidUrl;
    private String otherPic;

    private String time;

    private Integer period;//课时  单位分钟

    private String price;//最终显示的 价格 或价格区间  以及接受价格的筛选


    private List<Comment> commentList;//该治疗师的评论

    //手机和邮箱字段是在user表  为了方便 就直接在这里也加了
    private String phone;
    private String email;

    private String headimgurl;//公众号添加-jcy

    private Integer star;//星级

    //家长-我的治疗师
    private User user;
    private List<Demand> demandList;

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public String getHeadimgurl() {
        return headimgurl;
    }

    public void setHeadimgurl(String headimgurl) {
        this.headimgurl = headimgurl;
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getOtherPic() {
        return otherPic;
    }

    public void setOtherPic(String otherPic) {
        this.otherPic = otherPic;
    }

    public String getPhone() {
        return phone;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }


    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Demand> getDemandList() {
        return demandList;
    }

    public void setDemandList(List<Demand> demandList) {
        this.demandList = demandList;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getAward() {
        return award;
    }

    public void setAward(String award) {
        this.award = award;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }


    public String getPidUrlFront() {
        return pidUrlFront;
    }

    public void setPidUrlFront(String pidUrlFront) {
        this.pidUrlFront = pidUrlFront;
    }

    public String getPidUrlBack() {
        return pidUrlBack;
    }

    public void setPidUrlBack(String pidUrlBack) {
        this.pidUrlBack = pidUrlBack;
    }

    public String getRecoveryHis() {
        return recoveryHis;
    }

    public void setRecoveryHis(String recoveryHis) {
        this.recoveryHis = recoveryHis;
    }

    public String getSuccessCase() {
        return successCase;
    }

    public void setSuccessCase(String successCase) {
        this.successCase = successCase;
    }

    public String getPeoplePidUrl() {
        return peoplePidUrl;
    }

    public void setPeoplePidUrl(String peoplePidUrl) {
        this.peoplePidUrl = peoplePidUrl;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }



    public Integer getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(Integer priceMin) {
        this.priceMin = priceMin;
    }

    public Integer getIsPass() {
        return isPass;
    }

    public void setIsPass(Integer isPass) {
        this.isPass = isPass;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Integer getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(Integer priceMax) {
        this.priceMax = priceMax;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }



    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getAbstractTeacher() {
        return abstractTeacher;
    }

    public void setAbstractTeacher(String abstractTeacher) {
        this.abstractTeacher = abstractTeacher;
    }

    public Integer getPriceMid() {
        return priceMid;
    }

    public void setPriceMid(Integer priceMid) {
        this.priceMid = priceMid;
    }

    public Integer getPriceT() {
        return priceT;
    }

    public void setPriceT(Integer priceT) {
        this.priceT = priceT;
    }

    public Integer getPriceS() {
        return priceS;
    }

    public void setPriceS(Integer priceS) {
        this.priceS = priceS;
    }

    public Integer getPriceO() {
        return priceO;
    }

    public void setPriceO(Integer priceO) {
        this.priceO = priceO;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }


    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getObject() {
        return object;
    }

    public void setObject(String object) {
        this.object = object;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }



    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }


    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


    public String getAvailableTime() {
        return availableTime;
    }

    public void setAvailableTime(String availableTime) {
        this.availableTime = availableTime;
    }

    public String gettGround() {
        return tGround;
    }

    public void settGround(String tGround) {
        this.tGround = tGround;
    }

    public String getsGround() {
        return sGround;
    }

    public void setsGround(String sGround) {
        this.sGround = sGround;
    }

    public Integer getExperienceAge() {
        return experienceAge;
    }

    public void setExperienceAge(Integer experienceAge) {
        this.experienceAge = experienceAge;
    }

    public String getCoursePrice() {
        return coursePrice;
    }

    public void setCoursePrice(String coursePrice) {
        this.coursePrice = coursePrice;
    }
}
