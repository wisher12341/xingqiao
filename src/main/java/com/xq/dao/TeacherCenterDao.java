package com.xq.dao;

import com.xq.model.Demand;
import com.xq.model.Teacher;
import com.xq.model.User;

import java.util.List;

/**
 * Created by 86761 on 2017/11/10.
 */
public interface TeacherCenterDao {
    List<Demand> getDemandsByTeacherUserId(int userId);
    String getNameByUserId(int userId);
    User getUserById(int userId);
    Teacher getTeacherByUserId(int userId);
}
