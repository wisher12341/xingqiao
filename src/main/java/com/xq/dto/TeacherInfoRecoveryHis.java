package com.xq.dto;

/**
 * 治疗师个人资料 康复经历
 * Created by netlab606 on 2018/1/5.
 */
public class TeacherInfoRecoveryHis implements Comparable{

    private Integer index;//由于显示涉及到了 排序 所以编辑时的索引 按照这个

    private String name;
    private String startTime;
    private String endTime;
    private String detail;



    @Override
    public int compareTo(Object o) {
        TeacherInfoRecoveryHis obj=(TeacherInfoRecoveryHis) o;
        return this.startTime.compareTo(obj.getStartTime());
    }


    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
