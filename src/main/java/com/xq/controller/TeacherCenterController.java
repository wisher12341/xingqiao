package com.xq.controller;

import com.xq.dto.ModifyPageDto;
import com.xq.model.Demand;
import com.xq.model.RecoveryLog;
import com.xq.service.TeacherCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        mv.addObject("teacherId",1);
        return mv;
    }

    /**
     *我的患者
     */
    @RequestMapping(value = "/{teacherId}/myDemands")
    public ModelAndView toMyDemands(@PathVariable Integer teacherId){
        ModelAndView mv=new ModelAndView("teacherCenter/myDemands");
        mv.addObject("demands",teacherCenterService.getDemands(teacherId));
        mv.addObject("teacherId",teacherId);
        return mv;
    }

    /**
     *简历详情
     */
    @RequestMapping(value = "/{teacherId}/{id}/demandDetail",method = RequestMethod.GET)
    public ModelAndView toDemandDetail(@PathVariable Integer id,@PathVariable Integer teacherId){
        Demand demand=teacherCenterService.getDemandDetail(id);
        List<RecoveryLog> recoveryLogList=teacherCenterService.getRecoveryLogs(id,teacherId);
        for(RecoveryLog recoveryLog:recoveryLogList){
            System.out.println(recoveryLog.getOrderId());
        }
        ModelAndView mv=new ModelAndView("teacherCenter/demandDetail");
        mv.addObject("demand",demand);
        mv.addObject("recoveryHisList",teacherCenterService.getRecoveryHisList(demand.getRecoveryHis()));
        mv.addObject("recoveryLogList",recoveryLogList);
        return mv;
    }

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
     *星级评定
     */
    @RequestMapping(value = "/{userId}/myLevel")
    public ModelAndView myLevel(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myLevel");
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

    /**
     *
     * 修改字段
     */
    @RequestMapping(value = "/{objId}/{uiName}/{oldValue}/{fieldName}/modifyPage")
    public ModelAndView modifyPage(@PathVariable int objId,@PathVariable String uiName, @PathVariable String oldValue,@PathVariable String fieldName)
    {
        ModelAndView mv=new ModelAndView("teacherCenter/modifyPage");
        ModifyPageDto modifyPageDto=new ModifyPageDto(oldValue,fieldName,uiName,objId);
        mv.addObject("modifyPageDto",modifyPageDto);
        return mv;
    }


    /**
     *保存字段修改
     */
    @RequestMapping(value = "/saveModify")
    @ResponseBody
    public Map saveModify(@RequestParam("fieldName") String fieldName, @RequestParam("objId") Integer objId, @RequestParam("newValue") String newValue){
        Map map=new HashMap();
        teacherCenterService.modifyFeild(objId,newValue,fieldName);
        return map;
    }


}
