package com.xq.dao;

import com.xq.model.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 86761 on 2017/11/7.
 */
public interface TeacherDao {
    Teacher getTeacher(int id);
    List<Teacher> getTeachersByUserId(@Param(value="id") Integer id);

}
