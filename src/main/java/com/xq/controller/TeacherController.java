package com.xq.controller;

import com.xq.dto.CalendarDto;
import com.xq.dto.OrderDto;
import com.xq.dto.Result;
import com.xq.model.*;
import com.xq.service.GoodReportService;
import com.xq.service.TeacherService;
import com.xq.service.UserService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
    @Autowired
    UserService userService;


    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list() {
        return "teacher/teachers";
    }


    /**
     * 评论回复页面
     * @param teacherId
     * @param pid
     * @return
     */
    @RequestMapping(value = "/toReply",method = RequestMethod.GET)
    public ModelAndView toReply(@RequestParam("teacherId") Integer teacherId,@RequestParam("pid") Integer pid) {
//        ModelAndView mv = new ModelAndView("teacher/teacher_comment_reply");
        ModelAndView mv=new ModelAndView("order/comment");
        mv.addObject("title","评论回复");
        mv.addObject("submit","/wx/teacher/comment");
        mv.addObject("type","teacher_reply");
        mv.addObject("teacherId",teacherId);
        mv.addObject("pid",pid);
        return mv;
    }
    /**
     * 获得治疗师
     * @return
     */
    @RequestMapping(value = "/get_teacher",method = RequestMethod.POST)
    @ResponseBody
    public Result get_teacher(Teacher teacher, String years, String priceSelect, HttpServletRequest request, HttpServletResponse response){
//        if (request.getSession().getAttribute("USER") == null){
//            TmpLogin.tmpLogin(request,response);
//        }
        List<Teacher> teacherList=teachersService.getTeachers(teacher,years,priceSelect);
        return new Result(true,teacherList);
    }

    /**
     * 治疗师具体信息界面
     * @return
     */
    @RequestMapping(value = "/{teacher_id}/detail",method = RequestMethod.GET)
    public String teacherIntro(@PathVariable("teacher_id") Integer teacher_id, Model model, HttpServletRequest request, HttpServletResponse response) {
//        if (request.getSession().getAttribute("USER") == null){
//            TmpLogin.tmpLogin(request,response);
//        }
        Teacher teacher=teachersService.getTeacher(teacher_id);
        model.addAttribute("teacher",teacher);

        UserGoodReport userGoodReport=goodReportService.getTeacherGoodReportByUid(request);
        model.addAttribute("usergoodreport",userGoodReport);

        User user= userService.getUserByOpenidStatus(CookieUtil.checkCookie(request, Const.OPENID_PARENT),"0");
        if(user!=null) {
            userService.setUserStatusDesc(user);
        }
        model.addAttribute("user",user);
        return "teacher/teacher";
    }

    /**
     * 所有治疗师评论展示页面
     * @param teacherId
     * @return
     */
    @RequestMapping(value = "/toTeacherCommentList",method = RequestMethod.GET)
    public ModelAndView toOrganCommentList(@Param("teacherId") Integer teacherId,HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("teacher/teacher_comment_list");
        mv.addObject("teacherId",teacherId);
        UserGoodReport userGoodReport=goodReportService.getTeacherGoodReportByUid(request);
        mv.addObject("usergoodreport",userGoodReport);
        //mv.addObject("teacherCommentList",teachersService.getTeacherComments(teacherId));
        return mv;
    }

    /**
     * 治疗师评论分页
     * @param teacherId
     * @param page
     * @param size
     * @return
     */
    @RequestMapping(value = "/getCommentByPage",method = RequestMethod.POST)
    @ResponseBody
    public List<Comment> getOrgCommentByPage(@Param("teacherId") Integer teacherId, @Param("page") Integer page, @Param("size") Integer size) {
        return teachersService.getCommentsByPage(teacherId,page,size);
    }

    /**
     * 单条治疗师评论展示页面
     * @param cid 主评论id
     * @return
     */
    @RequestMapping(value = "/toTeacherCommentSingle",method = RequestMethod.GET)
    public ModelAndView toOrganCommentSingle(@Param("cid") Integer cid,@Param("tid") Integer tid,HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("teacher/teacher_comment_single");
        mv.addObject("teacherId",tid);
        mv.addObject("comm",teachersService.getTeacherCommentByCid(cid));
        UserGoodReport userGoodReport=goodReportService.getTeacherGoodReportByUid(request);
        mv.addObject("usergoodreport",userGoodReport);
        return mv;
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
     * 前往选择时间页面
     * @return
     */
    @RequestMapping(value = "/toSelectTime",method = RequestMethod.POST)
    public ModelAndView toSelectTime(Order order){
        ModelAndView mv=new ModelAndView();
        switch (order.getTimeOpt()){
            case "day": mv.setViewName("order/choose_time");break;
            case "week": mv.setViewName("order/choose_weekday");break;
            default:break;
        }

        mv.addObject("order",order);
        List<String> starts=teachersService.order_time_month(order.getTeacher().getId());
        mv.addObject("starts",starts);
        mv.addObject("schedule",teachersService.getTeacherSchedule(order.getTeacher().getId()));
        return mv;
    }

    /**
     * 前往选择时间页面
     * @return
     */
    @RequestMapping(value = "/toCheckTimes",method = RequestMethod.POST)
    public ModelAndView toCheckTimes(Order order){
        ModelAndView mv=new ModelAndView("order/check_times");
        if (order.getTimeOpt().equals("week")){
            List<String> time = teachersService.weekLoop(order);
            if (!time.get(1).isEmpty()){
                order.setServerTime(time.get(0) + "++" + time.get(1));
            } else {
                order.setServerTime(time.get(0));
            }
        }
        mv.addObject("order",order);
        return mv;
    }

    /**
     * 前往选择时间页面
     * @return
     */
    @RequestMapping(value = "/toChooseFirstClass",method = RequestMethod.POST)
    public ModelAndView toChooseFirstClass(Order order){
        ModelAndView mv=new ModelAndView("order/choose_weekday_first");
        mv.addObject("order",order);
        return mv;
    }


    /**
     * 下预约单 显示级别：月份
     * @param tid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getAvailableDateByWeekday",method = RequestMethod.POST)
    public Result order_time_month(@RequestParam("tid") Integer tid, @RequestParam("condition") String condition){
        List<String> result = teachersService.getAvailableDateByWeekday(tid, condition);
        return new Result(true, result);
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
    public Result order_time_day(@PathVariable Integer tid, @RequestParam String date) throws ParseException {
        CalendarDto calendar=teachersService.order_time_day(tid,date);
        return new Result(true,calendar);
    }

    @ResponseBody
    @RequestMapping(value="orderTime",method = RequestMethod.POST)
    public Result order_time(@RequestParam String start, @RequestParam String end) throws ParseException {
        return new Result(true,teachersService.order_time(start,end));
    }

    @ResponseBody
    @RequestMapping(value="formatDate",method = RequestMethod.POST)
    public Result order_time(@RequestParam String date) throws ParseException {
        return new Result(true,teachersService.formatDateAndTime(date));
    }
}
