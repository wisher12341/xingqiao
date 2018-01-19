package com.xq.dto;

/**
 * 治疗师个人资料 毕业院校
 * Created by netlab606 on 2018/1/5.
 */
public class TeacherInfoSchool implements Comparable{

    private Integer index;//由于显示涉及到了 排序 所以编辑时的索引 按照这个

    private String schoolName;
    private String startTime;
    private String endTime;
    private String education;//学历
    private String major;//专业

    public String getSchoolName() {
        return schoolName;
    }

    @Override
    public int compareTo(Object o) {
        TeacherInfoSchool obj=(TeacherInfoSchool) o;
        return this.startTime.compareTo(obj.getStartTime());
    }


    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
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

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
}
