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
    List<Teacher> getMyTeachersByOpenid(String openid);

    List<Teacher> getTeachers(@Param("teacher") Teacher teacher, @Param("minY") Integer minY, @Param("minP") Integer minP, @Param("maxP") Integer maxP, @Param("maxY") Integer maxY, @Param("flag") Integer y);

    Teacher getTeacherDetail(Integer teacherId);
    Teacher getTeacher(Integer id);

    Teacher getTeacherByUid(Integer id);

    void subSave(@Param("type") String type,@Param("id") String id,@Param("content") String content);

    void save(Teacher teacher);

    List<Teacher> getTeachersByPid(Integer id);

    String getScheduleByUid(Integer id);

    void editSchedule(@Param("schedule") String schedule, @Param("id") Integer id);

}
