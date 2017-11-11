package com.xq.dto;

import com.xq.model.Teacher;

/**
 * Created by 86761 on 2017/11/7.
 */
public class TeacherDto {

    Teacher teacher;
    private String headimgurl;



    public TeacherDto(Teacher teacher){
        this.teacher = teacher;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getHeadimgurl() {
        return headimgurl;
    }

    public void setHeadimgurl(String headimgurl) {
        this.headimgurl = headimgurl;
    }

}
