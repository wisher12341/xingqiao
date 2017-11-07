package com.xq.controller;

import com.xq.dto.Result;
import com.xq.model.Comment;
import com.xq.model.Teacher;
import com.xq.model.UserGoodReport;
import com.xq.service.GoodReportService;
import com.xq.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by joy12 on 2017/11/6.
 */
@Controller
@RequestMapping("/teacher")
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
    public String organintro(@PathVariable("teacher_id") Integer teacher_id, Model model, HttpServletRequest request) {
        Teacher teacher=teachersService.getTeacher(teacher_id);
        model.addAttribute("teacher",teacher);
        UserGoodReport userGoodReport=goodReportService.getTeacherGoodReportByUid(request);
        model.addAttribute("usergoodreport",userGoodReport);
        return "teacherMore";
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
        return "redirect:/teacher/"+tid+"/detail";
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
}
