package com.xq.controller;

import com.xq.dto.CalendarDto;
import com.xq.dto.Result;
import com.xq.model.Comment;
import com.xq.model.Teacher;
import com.xq.model.UserGoodReport;
import com.xq.service.GoodReportService;
import com.xq.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

/**
 * Created by joy12 on 2017/11/6.
 */
@Controller
@RequestMapping("/wx/teacher")
public class TeacherController {
    @Autowired
    TeacherService teachersService;
    @Autowired
    GoodReportService goodReportService;


    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list() {
        return "teacher/teachers";
    }

    /**
     * 获得治疗师
     * @return
     */
    @RequestMapping(value = "/get_teacher",method = RequestMethod.POST)
    @ResponseBody
    public Result get_teacher(Teacher teacher, String years, String priceSelect){
        List<Teacher> teacherList=teachersService.getTeachers(teacher,years,priceSelect);
        return new Result(true,teacherList);
    }

    /**
     * 治疗师具体信息界面
     * @return
     */
    @RequestMapping(value = "/{teacher_id}/detail",method = RequestMethod.GET)
    public String teacherIntro(@PathVariable("teacher_id") Integer teacher_id, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("USER") == null){
            TmpLogin.tmpLogin(request);
        }
        Teacher teacher=teachersService.getTeacher(teacher_id);
        model.addAttribute("teacher",teacher);
        UserGoodReport userGoodReport=goodReportService.getTeacherGoodReportByUid(request);
        model.addAttribute("usergoodreport",userGoodReport);
        return "teacher/teacher";
    }


    /**
     * 治疗师评论 :跟帖
     * @param comment
     * @param request
     * @return
     */
    @RequestMapping(value = "/comment",method = RequestMethod.POST)
    public String comment(Comment comment, HttpServletRequest request, Integer tid){
        teachersService.addComment(comment,request);
        return "redirect:/wx/teacher/"+tid+"/detail";
    }

    /**
     * 评论图片
     * @param cid 评论id
     * @param index 第一个显示的 index
     * @param model
     * @return
     */
    @RequestMapping(value = "/{cid}/pic/{index}",method = RequestMethod.GET)
    public String pic(@PathVariable Integer cid,@PathVariable Integer index,Model model){
        List<String> pics=teachersService.getCommentPics(cid,index);
        model.addAttribute("pics",pics);
        model.addAttribute("index",index);
        return "picture";
    }

    /**
     * 下预约单 显示级别：月份
     * @param tid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/{tid}/orderTime/month",method = RequestMethod.GET)
    public Result order_time_month(@PathVariable Integer tid){
        List<String> starts=teachersService.order_time_month(tid);
        return new Result(true,starts);
    }

    /**
     * 下预约单 显示级别：日
     * @param tid
     * @param date
     * @return
     * @throws ParseException
     */
    @ResponseBody
    @RequestMapping(value = "/{tid}/orderTime/day",method = RequestMethod.POST)
    public Result order_time_day(@PathVariable Integer tid,@RequestParam String date) throws ParseException {
        CalendarDto calendar=teachersService.order_time_day(tid,date);
        return new Result(true,calendar);
    }

    @ResponseBody
    @RequestMapping(value="orderTime",method = RequestMethod.POST)
    public Result order_time(@RequestParam String start,@RequestParam String end) throws ParseException {
        String time=teachersService.order_time(start,end);
        return new Result(true,time);
    }
}
