package com.xq.dto;

/**
 * Created by 86761 on 2017/11/19.
 */
public class RecoveryHisDto {

    private int index;
    private String beginTime;
    private String name;
    private String count;
    private String detail;
    private String endTime;



    public RecoveryHisDto(String recoveryHis) {
        String[] strings=recoveryHis.split("_");
        this.index = Integer.parseInt(strings[0]);
        this.beginTime = strings[2].split("-")[0];
        this.endTime = strings[2].split("-")[1];
        this.name = strings[1];
        this.count = strings[3];
        this.detail = strings[4];
    }

    public RecoveryHisDto(String name,String time,  String count, String detail) {
        this.beginTime = time.split("-")[0];
        this.endTime = time.split("-")[1];
        this.name = name;
        this.count = count;
        this.detail = detail;
    }
    public RecoveryHisDto(int index,String name,String time,  String count, String detail) {
        this.index=index;
        this.name = name;
        this.beginTime = time.split("-")[0];
        this.endTime = time.split("-")[1];
        this.count = count;
        this.detail = detail;
    }

    public RecoveryHisDto(int index, String name, String beginTime, String endTime, String detail, String count) {
        this.index=index;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.name = name;
        this.detail = detail;
        this.count = count;

    }
    public RecoveryHisDto(){}

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String toString(){
        StringBuilder stringBuilder=new StringBuilder();
        stringBuilder.append(index);
        stringBuilder.append("_");
        stringBuilder.append(name);
        stringBuilder.append("_");
        stringBuilder.append(beginTime);
        stringBuilder.append("-");
        stringBuilder.append(endTime);
        stringBuilder.append("_");
        stringBuilder.append(count);
        stringBuilder.append("_");
        stringBuilder.append(detail);
        return stringBuilder.toString();
    }

    public String toFeildStr(){
        StringBuilder stringBuilder=new StringBuilder();
        stringBuilder.append(name);
        stringBuilder.append("#");
        stringBuilder.append(beginTime);
        stringBuilder.append("-");
        stringBuilder.append(endTime);
        stringBuilder.append("#");
        stringBuilder.append(count);
        stringBuilder.append("#");
        stringBuilder.append(detail);
        return stringBuilder.toString();
    }

}
