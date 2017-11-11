package com.xq.controller;

import com.xq.model.Demand;
import com.xq.service.TeacherCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 86761 on 2017/11/10.
 */
@Controller
@RequestMapping("/wx/teacherCenter")

public class TeacherCenterController {
    @Autowired
    TeacherCenterService teacherCenterService;

    /**
     * 治疗师中心首页
     */
    @RequestMapping(value = "")
    public ModelAndView teacherCenter(){
        ModelAndView mv=new ModelAndView("teacherCenter/teacherCenter");
        mv.addObject("userId",1);
        mv.addObject("name",teacherCenterService.getNameByUserId(1));
        return mv;
    }

    /**
     *我的患者
     */
    @RequestMapping(value = "/{userId}/myDemands")
    public ModelAndView toMyDemands(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myDemands");
        mv.addObject("demands",teacherCenterService.getDemands(userId));
        return mv;
    }

    /**
     *简历详情
     */
//    @RequestMapping(value = "/{id}/demandDetail",method = RequestMethod.GET)
//    public ModelAndView toDemandDetail(@PathVariable Integer id){
//        Demand demand=teacherCenterService.getDemandDetail(id);
//        ModelAndView mv=new ModelAndView("parentCenter/demandDetail");
//        mv.addObject("demand",demand);
//        return mv;
//    }

    /**
     *消息中心
     */
    @RequestMapping(value = "/{userId}/myMessages")
    public ModelAndView myMessages(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myMessages");
        mv.addObject("messages",teacherCenterService.getMessagesByUserId(userId));
        return mv;
    }

    /**
     *我的资料
     */
    @RequestMapping(value = "/{userId}/myInfo")
    public ModelAndView myInfo(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myInfo");
        mv.addObject("teacher",teacherCenterService.getTeacherByUserId(userId));
        mv.addObject("user",teacherCenterService.getUserById(userId));
        return mv;
    }


}
