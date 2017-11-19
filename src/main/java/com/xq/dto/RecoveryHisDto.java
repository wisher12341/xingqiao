package com.xq.dto;

/**
 * Created by 86761 on 2017/11/19.
 */
public class RecoveryHisDto {

    private int index;
    private String time;
    private String name;
    private String count;
    private String detail;



    public RecoveryHisDto(String recoveryHis) {
        String[] strings=recoveryHis.split("_");
        this.index = Integer.parseInt(strings[0]);
        this.time = strings[2];
        this.name = strings[1];
        this.count = strings[3];
        this.detail = strings[4];
    }

    public RecoveryHisDto(String name,String time,  String count, String detail) {
        this.time = time;
        this.name = name;
        this.count = count;
        this.detail = detail;
    }
    public RecoveryHisDto(int index,String name,String time,  String count, String detail) {
        this.index=index;
        this.name = name;
        this.time = time;
        this.count = count;
        this.detail = detail;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
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
        stringBuilder.append(time);
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
        stringBuilder.append(time);
        stringBuilder.append("#");
        stringBuilder.append(count);
        stringBuilder.append("#");
        stringBuilder.append(detail);
        return stringBuilder.toString();
    }

}
