package com.xq.controller;


import com.xq.dto.ModifyPageDto;

import com.xq.dto.RecoveryHisDto;
import com.xq.dto.TeacherDto;

import com.xq.dto.Result;

import com.xq.model.Demand;
import com.xq.service.ParentCenterService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
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
        mv.addObject("recoveryHisList",parentCenterService.getRecoveryHisList(demand.getRecoveryHis()));
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
     * 家长个人中心主界面
     * @return
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(){
        return "center/index";
    }

    /**
     *判断家长是否完成个人资料
     */
    @ResponseBody
    @RequestMapping(value="/isexisted", method = RequestMethod.POST)
    public Result isexisted(HttpSession session, @RequestParam Integer teacherId){
        List<Demand> demandList=parentCenterService.isexisted(session,teacherId);
        if(demandList==null) {
            return new Result(false);
        }else{
            return new Result(true,demandList);
        }
    }

    /**
     * 家长 资料完善
     * @return
     */
    @RequestMapping(value = "/parent_info_page",method = RequestMethod.GET)
    public String parent_info_page(){
        return "parent_info";
    }

    /**
     *
     * 修改字段
     */
    @RequestMapping(value = "/{objId}/{uiName}/{oldValue}/{fieldName}/{table}/modifyPage")
    public ModelAndView modifyPage(@PathVariable int objId,@PathVariable String uiName, @PathVariable String oldValue,@PathVariable String fieldName,@PathVariable String table)
    {
        ModelAndView mv=new ModelAndView("parentCenter/modifyPage");
        ModifyPageDto modifyPageDto=new ModifyPageDto(oldValue,fieldName,uiName,objId,table);
        mv.addObject("modifyPageDto",modifyPageDto);
        return mv;
    }


    /**
     *保存字段修改
     */
    @RequestMapping(value = "/saveModify")
    @ResponseBody
    public Map saveModify(@RequestParam("fieldName") String fieldName,@RequestParam("objId") Integer objId,@RequestParam("newValue") String newValue,@RequestParam("table") String table){
        Map map=new HashMap();
        parentCenterService.modifyFeild(objId,newValue,fieldName,table);
        return map;
    }


    /**
     *
     * 修改康复史页面
     */
    @RequestMapping(value = "/{userId}/myDemands/{demandId}/demandDetail/{recoveryHis}/modifyRecoveryHis")
    public ModelAndView toModifyRecovery(@PathVariable int userId,@PathVariable int demandId,@PathVariable String recoveryHis)
    {
        ModelAndView mv=new ModelAndView("parentCenter/recoveryHisSingle");
        RecoveryHisDto recoveryHisDto=new RecoveryHisDto(recoveryHis);
        mv.addObject("recoveryHis",recoveryHisDto);
        mv.addObject("demandId",demandId);
        return mv;
    }
    /**
     *
     * 添加康复史页面
     */
    @RequestMapping(value = "/{userId}/myDemands/{demandId}/demandDetail/addRecoveryHis")
    public ModelAndView toAddRecoveryHis(@PathVariable int demandId){
        ModelAndView mv=new ModelAndView("parentCenter/recoveryHisSingle");
        mv.addObject("demandId",demandId);
        return mv;
    }

    /**
     *添加康复史
     */
    @RequestMapping(value = "/addRecoveryHis")
    @ResponseBody
    public Map addRecoveryHis(@RequestParam("demandId") int demandId,@RequestParam("name") String name,@RequestParam("time") String time,
                          @RequestParam("count") String count,@RequestParam("detail") String detail){
        Map map=new HashMap();
        RecoveryHisDto recoveryHisDto=new RecoveryHisDto( name, time,count,detail);
        parentCenterService.addRecoveryHis(recoveryHisDto,demandId);
        return map;
    }

    /**
     *修改康复史
     */
    @RequestMapping(value = "/modifyRecoveryHis")
    @ResponseBody
    public Map modifyRecoveryHis(@RequestParam("demandId") int demandId,@RequestParam("index") int index,@RequestParam("name") String name,@RequestParam("time") String time,
                              @RequestParam("count") String count,@RequestParam("detail") String detail){
        Map map=new HashMap();
        System.out.println("index"+index);
        RecoveryHisDto recoveryHisDto=new RecoveryHisDto( index,name, time,count,detail);
        parentCenterService.modifyRecoveryHis(recoveryHisDto,demandId);
        return map;
    }

}

