package com.xq.service;

import com.xq.dto.CalendarDto;
import com.xq.model.Comment;
import com.xq.model.Order;
import com.xq.model.OrganComment;
import com.xq.model.Teacher;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * Created by joy12 on 2017/11/6.
 */
public interface TeacherService {
    List<Teacher> getTeachers(Teacher teacher, String years, String priceSelect);

    Teacher getTeacher(Integer teacher_id);

    void addComment(Comment comment, HttpServletRequest request);

    List<String> getCommentPics(Integer cid, Integer index);

    CalendarDto order_time_day(Integer tid, String date) throws ParseException;

    Map<String,String> order_time(String start, String end) throws ParseException;

    List<Comment> getTeacherComments(Integer id);

    Comment getTeacherCommentByCid(Integer cid);

    List<Comment> getCommentsByPage(Integer teacherId, Integer page, Integer size);

    List<String> getTeacherSchedule(Integer tid);

    List<String> getAvailableDateByWeekday(int tid, String condition);

    String formatDateAndTime(String gmt);

    List<String> weekLoop(Order order);

    List<String> getAvailableDaysInAMonth(Integer tid);
}