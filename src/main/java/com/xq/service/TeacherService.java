package com.xq.service;

import com.xq.dto.CalendarDto;
import com.xq.model.Comment;
import com.xq.model.Teacher;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

/**
 * Created by joy12 on 2017/11/6.
 */
public interface TeacherService {
    List<Teacher> getTeachers(Teacher teacher, String years, String priceSelect);

    Teacher getTeacher(Integer teacher_id);

    void addComment(Comment comment, HttpServletRequest request);

    List<String> getCommentPics(Integer cid, Integer index);

    List<String> order_time_month(Integer tid);

    CalendarDto order_time_day(Integer tid, String date) throws ParseException;

    String order_time(String start, String end) throws ParseException;
}
