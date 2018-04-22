package com.xq.model;

/**
 * 康复史
 * Created by netlab606 on 2017/7/27.
 */
public class RecoveryHis {
    private String name;//历史康复机构
    private String time;//康复起止时间
    private String detail;//康复形式及康复内容
    private Integer count;//康复频次(周)

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
