package com.xq.controller;

import com.xq.dto.ModifyPageDto;
import com.xq.dto.TeacherDto;
import com.xq.model.Demand;
import com.xq.service.ParentCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

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
        mv.addObject("userId",userId);
        return mv;
    }

    /**
     *治疗师详情
     */
    @RequestMapping(value = "/{userId}/myTeacher/{tid}/teacherDetail",method = RequestMethod.GET)
    public ModelAndView toTeacherDetail(@PathVariable Integer userId,@PathVariable Integer tid){
        TeacherDto teacher=parentCenterService.getTeacherDetail(tid);
        ModelAndView mv=new ModelAndView("parentCenter/teacherDetail");
        mv.addObject("teacher",teacher);
        mv.addObject("userId",userId);
        return mv;
    }

    /**
     *需求管理
     */
    @RequestMapping(value = "/{userId}/myDemands")
    public ModelAndView toMyDemands(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myDemands");
        mv.addObject("demands",parentCenterService.getDemands(userId));
        mv.addObject("userId",userId);
        return mv;
    }

    /**
     *简历详情
     */
    @RequestMapping(value = "/{userId}/myDemands/{id}/demandDetail",method = RequestMethod.GET)
    public ModelAndView toDemandDetail(@PathVariable Integer userId,@PathVariable Integer id){
        Demand demand=parentCenterService.getDemandDetail(id);
        ModelAndView mv=new ModelAndView("parentCenter/demandDetail");
        mv.addObject("demand",demand);
        mv.addObject("userId",userId);
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

    /**
     *
     * 修改个人资料
     */
    @RequestMapping(value = "/{userId}/{uiName}/{oldValue}/{fieldName}/modifyPage")
    public ModelAndView modifyPage(@PathVariable int userId,@PathVariable String uiName, @PathVariable String oldValue,@PathVariable String fieldName)
    {
        ModelAndView mv=new ModelAndView("parentCenter/modifyPage");
        ModifyPageDto modifyPageDto=new ModifyPageDto(oldValue,fieldName,uiName,userId);
        mv.addObject("modifyPageDto",modifyPageDto);
        return mv;
    }


    /**
     *保存个人资料修改
     */
    @RequestMapping(value = "/saveModify")
    @ResponseBody
    public Map saveModify(@RequestParam("fieldName") String fieldName,@RequestParam("userId") Integer userId,@RequestParam("newValue") String newValue){
        Map map=new HashMap();
        parentCenterService.modifyParentInfo(userId,newValue,fieldName);
        return map;
    }

    /**
     * 修改需求简历
     */
    @RequestMapping(value = "/{userId}/{demandId}/{uiName}/{oldValue}/{fieldValue}/demandModify")
    public ModelAndView demandModify(@PathVariable int userId,@PathVariable int demandId,@PathVariable String uiName, @PathVariable String oldValue,@PathVariable String fieldName)
    {
        ModelAndView mv=new ModelAndView("parentCenter/demandModify");
        System.out.println(fieldName);
        ModifyPageDto modifyPageDto=new ModifyPageDto(oldValue,fieldName,uiName,demandId);
        mv.addObject("modifyPageDto",modifyPageDto);
        mv.addObject("userId",userId);
        return mv;
    }

    /**
     *保存需求简历修改
     */
    @RequestMapping(value = "/saveDemandModify")
    @ResponseBody
    public Map saveDemandModify(@RequestParam("fieldName") String fieldName,@RequestParam("demandId") Integer demandId,@RequestParam("newValue") String newValue){
        Map map=new HashMap();
        parentCenterService.modifyDemand(demandId,newValue,fieldName);
        return map;
    }


}
