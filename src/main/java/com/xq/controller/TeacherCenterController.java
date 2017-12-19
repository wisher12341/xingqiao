package com.xq.controller;

import com.xq.dto.ModifyPageDto;
import com.xq.model.Demand;
import com.xq.model.RecoveryLog;
import com.xq.model.Teacher;
import com.xq.model.User;
import com.xq.service.TeacherCenterService;
import com.xq.service.UserService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    UserService userService;

    /**
     * 治疗师中心首页
     */
    @RequestMapping(value = "")
    public ModelAndView teacherCenter(HttpServletRequest request){
        ModelAndView mv=new ModelAndView("teacherCenter/teacherCenter");
       // String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
        String openid="oxsEYwkz_Yz4ND5Y8nF2ZYN0JZ9E";

        User user=userService.getUserByOpenidStatus(openid,"1");
        Teacher teacher=teacherCenterService.getTeacherByUserId(user.getId());
        mv.addObject("user",user);
        mv.addObject("teacher",teacher);
        return mv;
    }

    /**
     *我的患者
     */
    @RequestMapping(value = "/{teacherId}/{userId}/myDemands")
    public ModelAndView toMyDemands(@PathVariable Integer teacherId,@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myDemands");
        mv.addObject("demands",teacherCenterService.getDemands(teacherId));
        mv.addObject("teacherId",teacherId);
        mv.addObject("user",teacherCenterService.getUserById(userId));
        mv.addObject("name",teacherCenterService.getNameByUserId(userId));
        return mv;
    }

    /**
     *简历详情
     */
    @RequestMapping(value = "/{teacherId}/{userId}/{id}/demandDetail",method = RequestMethod.GET)
    public ModelAndView toDemandDetail(@PathVariable Integer id,@PathVariable Integer teacherId,@PathVariable Integer userId){
        Demand demand=teacherCenterService.getDemandDetail(id);
        List<RecoveryLog> recoveryLogList=teacherCenterService.getRecoveryLogs(id,teacherId);
//        for(RecoveryLog recoveryLog:recoveryLogList){
//            System.out.println(recoveryLog.getOrderId());
//        }
        ModelAndView mv=new ModelAndView("teacherCenter/demandDetail");
        mv.addObject("demand",demand);
        mv.addObject("recoveryHisList",teacherCenterService.getRecoveryHisList(demand.getRecoveryHis()));
        mv.addObject("recoveryLogList",recoveryLogList);
        mv.addObject("user",teacherCenterService.getUserById(userId));
        mv.addObject("name",teacherCenterService.getNameByUserId(userId));
        return mv;
    }

    /**
     *消息中心
     */
    @RequestMapping(value = "/{userId}/myMessages")
    public ModelAndView myMessages(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myMessages");
        mv.addObject("messages",teacherCenterService.getMessagesByUserId(userId));
        mv.addObject("name",teacherCenterService.getNameByUserId(userId));
        mv.addObject("user",teacherCenterService.getUserById(userId));
        return mv;
    }

    /**
     *星级评定
     */
    @RequestMapping(value = "/{userId}/myLevel")
    public ModelAndView myLevel(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myLevel");
        return mv;
    }

    /**
     *我的资料
     */
    @RequestMapping(value = "/{userId}/myInfo")
    public ModelAndView myInfo(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myInfo");
        Teacher teacher=teacherCenterService.getTeacherByUserId(userId);
        mv.addObject("teacher",teacher);
        mv.addObject("user",teacherCenterService.getUserById(userId));
        return mv;
    }

    /**
     *
     * 填写个人资料页面
     */
    @RequestMapping(value="/{userId}/fillInfoPage")
    public ModelAndView fillInfoPage(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/fillInfoPage");
        mv.addObject("userId",userId);
        return mv;
    }

    /**
     *
     * 修改字段
     */
    @RequestMapping(value = "/{objId}/{fieldName}/modifyPage")
    public ModelAndView modifyPage(@PathVariable int objId,@PathVariable String fieldName)
    {
        ModelAndView mv=new ModelAndView("teacherCenter/modifyPage");
        ModifyPageDto modifyPageDto=teacherCenterService.getModifyDto(objId,fieldName);
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

    /**
     *
     * 修改成功案例
     */
    @RequestMapping(value = "{userId}/{caseIndex}/modifyText")
    public ModelAndView modifyPage(@PathVariable int userId,@PathVariable int caseIndex)
    {
        ModelAndView mv=new ModelAndView("teacherCenter/modifyText");
        mv.addObject("userId",userId);
        mv.addObject("cases",teacherCenterService.getTeacherByUserId(userId).getSuccessCase());
        mv.addObject("casesIndex",caseIndex);
        mv.addObject("case",teacherCenterService.getTeacherByUserId(userId).getSuccessCase().split("#")[caseIndex]);
        return mv;
    }



}
