package com.xq.dao;

import com.xq.model.Teacher;

import java.util.List;

/**
 * Created by netlab606 on 2017/11/8.
 */
public interface TeacherDao_sp {
    List<Teacher> getMyTeachersByOpenid(String openid);
}
