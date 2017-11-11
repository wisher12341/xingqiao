package com.xq.controller;

import com.xq.dto.TeacherDto;
import com.xq.model.Demand;
import com.xq.service.ParentCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 86761 on 2017/11/5.
 */
@Controller
@RequestMapping("/wx/parentCenter")
public class ParentCenterController {
    @Autowired
    ParentCenterService parentCenterService;

    /**
    * 个人中心首页
    */
    @RequestMapping(value = "")
    public ModelAndView parentCenter(){
        ModelAndView mv=new ModelAndView("parentCenter/parentCenter");
        mv.addObject("userId",2);
        mv.addObject("userName",parentCenterService.getUserNameById(2));
        return mv;
    }

    /**
    *我的治疗师
    */
    @RequestMapping(value = "/{userId}/myTeacher")
    public ModelAndView toMyTeacher(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myTeacher");
        mv.addObject("teachers",parentCenterService.getTeachersByParent(userId));
        return mv;
    }

    /**
     *治疗师详情
     */
    @RequestMapping(value = "/{tid}/teacherDetail",method = RequestMethod.GET)
    public ModelAndView toTeacherDetail(@PathVariable Integer tid){
        TeacherDto teacher=parentCenterService.getTeacherDetail(tid);
        ModelAndView mv=new ModelAndView("parentCenter/teacherDetail");
        mv.addObject("teacher",teacher);
        return mv;
    }

    /**
     *需求管理
     */
    @RequestMapping(value = "/{userId}/myDemands")
    public ModelAndView toMyDemands(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myDemands");
        mv.addObject("demands",parentCenterService.getDemands(userId));
        return mv;
    }

    /**
     *简历详情
     */
    @RequestMapping(value = "/{id}/demandDetail",method = RequestMethod.GET)
    public ModelAndView toDemandDetail(@PathVariable Integer id){
        Demand demand=parentCenterService.getDemandDetail(id);
        ModelAndView mv=new ModelAndView("parentCenter/demandDetail");
        mv.addObject("demand",demand);
        return mv;
    }

    /**
     *消息中心
     */
    @RequestMapping(value = "/{userId}/myMessages")
    public ModelAndView myMessages(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myMessages");
        mv.addObject("messages",parentCenterService.getMessagesByUserId(userId));
        return mv;
    }

    /**
     *我的资料
     */
    @RequestMapping(value = "/{userId}/myInfo")
    public ModelAndView myInfo(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myInfo");
        mv.addObject("parent",parentCenterService.getParentByUserId(userId));
        mv.addObject("user",parentCenterService.getUserById(userId));
        return mv;
    }

}
