package com.xq.controller;


import com.xq.dto.*;
import com.xq.model.*;
import com.xq.service.*;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
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
    @Autowired
    UserService userService;
    @Autowired
    AreaService areaService;
    @Autowired
    TeacherCenterService teacherCenterService;
    @Autowired
    MessageService messageService;

    /**
     * 个人中心首页
     */
    @RequestMapping(value = "")
    public ModelAndView parentCenter(HttpServletRequest request){
        ModelAndView mv=new ModelAndView("parentCenter/parentCenter");
//             String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
        String openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";

        User user=userService.getUserByOpenidStatus(openid,"0");
        // user.setInfoStatus(parentCenterService.myInfoStatus(user.getId()));
        mv.addObject("user",user);
        TeacherCenterCountDto teacherCenterCountDto=teacherCenterService.getCounts(user.getId(),"parent");
        mv.addObject("number",teacherCenterCountDto);
        return mv;
    }




    /**
     *我的治疗师
     */
    @RequestMapping(value = "/{userId}/myTeacher")
    public ModelAndView toMyTeacher(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myTeacher");
        List<Teacher> teachers=parentCenterService.getTeachersByParent(userId);
        mv.addObject("teachers",teachers);
        mv.addObject("userId",userId);
        mv.addObject("user",parentCenterService.getUserById(userId));
        mv.addObject("name",parentCenterService.getParentByUserId(userId).getRealName());
        return mv;
    }

    /**
     *治疗师详情
     */
    @RequestMapping(value = "/{userId}/myTeacher/{tid}/teachersDetail",method = RequestMethod.GET)
    public ModelAndView toTeacherDetail(@PathVariable Integer userId,@PathVariable Integer tid){
        Teacher teacher=parentCenterService.getTeacherDetail(tid);
        ModelAndView mv=new ModelAndView("parentCenter/teachersDetail");
        mv.addObject("teacher",teacher);
        mv.addObject("userId",userId);
        mv.addObject("user",parentCenterService.getUserById(userId));
        return mv;
    }

    /**
     *需求管理
     */
    @RequestMapping(value = "/{userId}/myDemands")
    public ModelAndView toMyDemands(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myDemands");
        mv.addObject("demands",parentCenterService.getDemands(userId));
        mv.addObject("user",parentCenterService.getUserById(userId));
        mv.addObject("name",parentCenterService.getParentByUserId(userId).getRealName());
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
        mv.addObject("user",parentCenterService.getUserById(userId));
        mv.addObject("name",parentCenterService.getParentByUserId(userId).getRealName());
        return mv;
    }


    /**
     *添加简历页面
     */
    @RequestMapping(value = "/{userId}/addDemandPage",method = RequestMethod.GET)
    public ModelAndView toAddDemandPage(@PathVariable int userId){
        ModelAndView mv=new ModelAndView("parentCenter/myDemands_addDemand");
        mv.addObject("user",userService.getUserByOpenidStatus("oxsEYwlPAa-fVc9fVyzVBYBed9n8","0"));
        return mv;
    }

    /**
     *添加简历
     */
    @RequestMapping(value = "/mydemands/{userId}/addDemand",method = RequestMethod.POST)
    public ModelAndView addRecoveryHis(@PathVariable Integer userId, @RequestParam("name") String name, @RequestParam("gender") Integer gender,
                              @RequestParam("birthday") String birthday,@RequestParam("report") String report, @RequestParam("diseaseHis") String diseaseHis,
                              @RequestParam("allergyHis") String allergyHis, @RequestParam("remark") String remark){
        ModelAndView mv=new ModelAndView("redirect:/wx/parentCenter/"+userId+"/myDemands");
        parentCenterService.addDemand( userId,name,gender,birthday,report,diseaseHis,allergyHis,remark);
        return mv;
    }


//    /**
//     *消息中心
//     */
//    @RequestMapping(value = "/{userId}/myMessages")
//    public ModelAndView myMessages(@PathVariable Integer userId){
//        ModelAndView mv=new ModelAndView("parentCenter/myMessages");
//        mv.addObject("messages",parentCenterService.getMessagesByUserId(userId));
//        mv.addObject("user",parentCenterService.getUserById(userId));
//        mv.addObject("name",parentCenterService.getParentByUserId(userId).getRealName());
//        return mv;
//    }

    /**
     *消息中心
     */
    @RequestMapping(value = "/{userId}/myMessages")
    public ModelAndView myMessages(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myMessages");
        mv.addObject("messages",teacherCenterService.getMessagesByUserId(userId));
//        mv.addObject("name",teacherCenterService.getNameByUserId(userId));
        mv.addObject("user",teacherCenterService.getUserById(userId));
        return mv;
    }

    @RequestMapping(value = "/{uid}/message/{mid}/del",method = RequestMethod.GET)
    public ModelAndView delMessage(@PathVariable Integer mid,@PathVariable Integer uid){
        ModelAndView mv=new ModelAndView("redirect:/wx/parentCenter/"+uid+"/myMessages");
        messageService.delMessageByMid(mid);
        return mv;
    }

    /**
     * 所有通知 变已读
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/allInformRead",method = RequestMethod.POST)
    public Result allInformRead(HttpServletRequest request){
        parentCenterService.allInformRead(request);
        return new Result(true);
    }


    @RequestMapping(value="/deleteMessage")
    @ResponseBody
    public Result deleteMessage(@RequestParam int messageId) {
        parentCenterService.deleteMessage(messageId);
        return new Result(true);
    }
    /**
     *我的资料 基础资料
     */
    @RequestMapping(value = "/{userId}/myInfo_base")
    public ModelAndView myInfo_base(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myInfo_base");
        mv.addObject("parent",parentCenterService.getParentByUserId(userId));
        mv.addObject("user",parentCenterService.getUserById(userId));
        return mv;
    }

    /**
     *实名认证
     */
    @RequestMapping(value = "/{userId}/myInfo_authentication")
    public ModelAndView myInfo(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myInfo_authentication");
        Parent parent=parentCenterService.getParentByUserId(userId);
        mv.addObject("parent",parent);
        mv.addObject("user",parentCenterService.getUserById(userId));
        return mv;
    }

    /**
     * 个人资料  单项 编辑页面
     * @param ftype 父类型 base service authentication
     * @param ctype 子类型 email等等
     * @param value 值
     * @return
     */
    @RequestMapping(value = "/{ftype}/{ctype}/{value}/edit",method = RequestMethod.GET)
    public ModelAndView myInfo_edit(@PathVariable String ftype,@PathVariable String ctype,@PathVariable String value,HttpServletRequest request) throws UnsupportedEncodingException {
        ModelAndView mv=new ModelAndView("teacherCenter/myInfo_edit");
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
//        openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        User user=userService.getUserByOpenidStatus(openid,"0");
        mv.addObject("user",user);
//        WxInterceptor.logger.info(user.toString());
        //解决中文乱码
        if(ctype.equals("name")){
            value= new String(value.getBytes("ISO8859-1"), "UTF-8");
        }
        TeacherInfoEdit teacherInfoEdit=parentCenterService.myInfoEdit(ftype,ctype,value,user.getUserStatus());
        mv.addObject("info",teacherInfoEdit);
        mv.addObject("parent","dd");//标志  是家长的请求
        return mv;
    }

    @RequestMapping(value = "/myInfo/edit",method = RequestMethod.POST)
    public ModelAndView myInfo_edit_post(String ftype,String ctype,String value,HttpServletRequest request,Integer isChangeStatus,Integer uid){
        ModelAndView mv=null;
        switch (ftype){
            case "基本资料":
                mv=new ModelAndView("redirect:/wx/parentCenter/"+uid+"/myInfo_base");
                break;
            case "实名认证":
                mv=new ModelAndView("redirect:/wx/parentCenter/"+uid+"/myInfo_authentication");
                break;
        }
        teacherCenterService.myInfoEditPost(ftype,ctype,value,isChangeStatus,request,"parent");
        return mv;
    }

    /**
     * 身份证 页面
     * @param uid
     * @return
     */
    @RequestMapping(value = "/info/{uid}/idcard",method = RequestMethod.GET)
    public ModelAndView idcard(@PathVariable Integer uid){
        ModelAndView mv=new ModelAndView("teacherCenter/myInfo_authentication_idcard");
        Parent parent=parentCenterService.getIdCardByUid(uid);
        mv.addObject("user",userService.getUserByUid(uid));
        mv.addObject("parent",parent);
        return mv;
    }

    @RequestMapping(value = "/info/{uid}/idcard",method = RequestMethod.POST)
    public ModelAndView idcard_post(@PathVariable Integer uid, MultipartFile peoplePidUrl, MultipartFile pidUrlFront, MultipartFile pidUrlBack, HttpServletRequest request){
        ModelAndView mv=new ModelAndView("redirect:/wx/parentCenter/"+uid+"/myInfo_authentication");
        teacherCenterService.editIdCard(peoplePidUrl,pidUrlBack,pidUrlFront,uid,request);
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
    public Result isexisted(HttpServletRequest request, @RequestParam Integer teacherId){
        List<Demand> demandList=parentCenterService.isexisted(request,teacherId);
//        System.out.print("成功" + demandList.size());
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
     * 填写个人资料页面
     */
    @RequestMapping(value="/{userId}/fillInfoPage")
    public ModelAndView fillInfoPage(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/fillInfoPage");
        mv.addObject("userId",userId);
        return mv;
    }

    /**
     * 提交个人资料
     */
    @RequestMapping(value = "{userId}/fillInfo")
    public String fillInfo(@PathVariable int userId, ParentInfoDto parentInfoDto){
        System.out.println(parentInfoDto.getRealName()+parentInfoDto.getEmail());
        parentInfoDto.setUserId(userId);
        parentCenterService.fillInfo(parentInfoDto);
        return "redirect:/wx/parentCenter/"+userId+"/myInfo";
    }
    /**
     *
     * 修改字段
     */
    @RequestMapping(value = "/{userId}/{fieldName}/{table}/modifyPage")
    public ModelAndView modifyPage(@PathVariable int userId,@PathVariable String fieldName, @PathVariable String table)
    {
        ModelAndView mv=new ModelAndView("parentCenter/modifyPage");
        ModifyPageDto modifyPageDto=parentCenterService.getModifyDto(userId,fieldName,table);
        //ModifyPageDto modifyPageDto=new ModifyPageDto(parentCenterService.getParentByUserId(userId).getRealName(),fieldName,"姓名",userId,table);
        mv.addObject("modifyPageDto",modifyPageDto);
        List<Area2> area2List=areaService.getArea2();
        mv.addObject("area2List",area2List);
        return mv;
    }


//    @RequestMapping(value = "/{objId}/{uiName}/{oldValue}/{fieldName}/{table}/modifyPage")
//    public ModelAndView modifyPage(@PathVariable int objId,@PathVariable String uiName, @PathVariable String oldValue,@PathVariable String fieldName,@PathVariable String table)
//    {
//        ModelAndView mv=new ModelAndView("parentCenter/modifyPage");
//        ModifyPageDto modifyPageDto=new ModifyPageDto(oldValue,fieldName,uiName,objId,table);
//        mv.addObject("modifyPageDto",modifyPageDto);
//        List<Area2> area2List=areaService.getArea2();
//        mv.addObject("area2List",area2List);
//        return mv;
//    }


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
     * 康复史页面
     */
    @RequestMapping(value = "/{demandId}/recoveryHis")
    public ModelAndView toRecovery(@PathVariable int demandId,HttpServletRequest request)
    {
        Demand demand=parentCenterService.getDemandDetail(demandId);
        ModelAndView mv=new ModelAndView("parentCenter/myDemands_recoveryHis");
        mv.addObject("recoveryHisList",parentCenterService.getRecoveryHisList(demand.getRecoveryHis()));
        String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
        mv.addObject("user",userService.getUserByOpenidStatus(openid,"0"));
        return mv;
    }

    /**
     *
     * 修改康复史页面
     */
    @RequestMapping(value = "/recoveryHis/{demandId}/{recoveryHis}/editPage")
    public ModelAndView toModifyRecovery(@PathVariable int demandId, @PathVariable String recoveryHis,HttpServletRequest request)
    {
        ModelAndView mv=new ModelAndView("parentCenter/myDemands_recoveryHis_edit");
        RecoveryHisDto recoveryHisDto=new RecoveryHisDto(recoveryHis);
        //时间转换为前端显示要求的格式
        recoveryHisDto.setEndTime(recoveryHisDto.getEndTime().replace('.','-'));
        recoveryHisDto.setBeginTime(recoveryHisDto.getBeginTime().replace('.','-'));

        System.out.println("recoveryHis");
        mv.addObject("data",recoveryHisDto);
        mv.addObject("demandId",demandId);
        String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
        mv.addObject("user",userService.getUserByOpenidStatus(openid,"0"));
        return mv;
    }
    /**
     *
     * 添加康复史页面
     */
    @RequestMapping(value = "/recoveryHis/{demandId}/addRecoveryHis")
    public ModelAndView toAddRecoveryHis(@PathVariable int demandId,HttpServletRequest request){
        ModelAndView mv=new ModelAndView("parentCenter/myDemands_recoveryHis_edit");

        mv.addObject("demandId",demandId);
        String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
        mv.addObject("user",userService.getUserByOpenidStatus(openid,"0"));
        return mv;
    }

    /**
     *添加康复史
     */
    @RequestMapping(value = "/mydemands/recoveryHis/{demandId}/add",method = RequestMethod.POST)
    public ModelAndView addRecoveryHis(@PathVariable int demandId, RecoveryHisDto recoveryHisDto){
        ModelAndView mv=new ModelAndView("redirect:/wx/parentCenter/"+demandId+"/recoveryHis");
        //时间转换为数据库存储要求的格式
        recoveryHisDto.setEndTime(recoveryHisDto.getEndTime().replace('-','.'));
        recoveryHisDto.setBeginTime(recoveryHisDto.getBeginTime().replace('-','.'));
        parentCenterService.addRecoveryHis(recoveryHisDto,demandId);
        return mv;
    }

    /**
     *修改康复史
     */
    @RequestMapping(value = "/mydemands/recoveryHis/{demandId}/{index}/edit",method = RequestMethod.POST)
    public ModelAndView modifyRecoveryHis(@PathVariable int index,@PathVariable int demandId,  RecoveryHisDto recoveryHisDto){
        ModelAndView mv=new ModelAndView("redirect:/wx/parentCenter/"+demandId+"/recoveryHis");
        //时间转换为数据库存储要求的格式
        recoveryHisDto.setEndTime(recoveryHisDto.getEndTime().replace('-','.'));
        recoveryHisDto.setBeginTime(recoveryHisDto.getBeginTime().replace('-','.'));
        parentCenterService.modifyRecoveryHis(recoveryHisDto,demandId);
        return mv;
    }



    /**
     * 修改头像页面
     * @param userId
     * @return
     */
    @RequestMapping(value="/{userId}/changeIconPage")
    public ModelAndView changeIconPage(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/changeIcon");
        mv.addObject("user",parentCenterService.getUserById(userId));
        return mv;
    }

    /**
     * 修改头像
     */
    @RequestMapping(value = "/{userId}/modifyIcon",method = RequestMethod.POST)
    @ResponseBody
    public Result modifyIcon(@PathVariable int userId, HttpServletRequest request){
        parentCenterService.uploadPhoto(request,userId);
        return new Result(true);
    }

    /**
     *评价中心
     */
    @RequestMapping(value = "/{userId}/myComments")
    public ModelAndView myCommentsens(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myComments");
        mv.addObject("comments",parentCenterService.getCommentsByUserId(userId));
        mv.addObject("user",parentCenterService.getUserById(userId));
        mv.addObject("comment","dd");//无实际意义 只用于标记
        return mv;
    }


    /**
     *我的日程安排
     */
    @RequestMapping(value = "/{userId}/myWork",method = RequestMethod.GET)
    public ModelAndView myWork(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("parentCenter/myWork");
        Work work=parentCenterService.getWorkByUid(userId);
        mv.addObject("work",work);
        mv.addObject("user",teacherCenterService.getUserById(userId));
        return mv;
    }

    /**
     * 我的日程安排  获得具体某一天的安排
     * @param uid
     * @param date
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/{uid}/myWork/getDayWork",method = RequestMethod.POST)
    public Result getDayWork(@PathVariable Integer uid, String date) throws ParseException {
        return new Result(true,parentCenterService.getDayWorkByUid(uid,date));
    }

    /**
     * 用户状态 修改
     * @param userStatus
     * @param request
     * @return
     */
    @RequestMapping(value = "/userstatus/change",method = RequestMethod.POST)
    public ModelAndView userstatus(@RequestParam Integer userStatus,HttpServletRequest request){
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
        userService.changeUserStatus(userStatus,openid,"parent");
        return new ModelAndView("redirect:/wx/parentCenter");
    }

    /**
     * 实名认证 地址 ground+address
     * @param uid
     * @return
     */
    @RequestMapping(value = "/info/{uid}/address",method = RequestMethod.GET)
    public ModelAndView address(@PathVariable Integer uid){
        ModelAndView mv=new ModelAndView("parentCenter/myInfo_authentication_address");
        Parent parent=parentCenterService.getParentByUserId(uid);
        mv.addObject("user",userService.getUserByUid(uid));
        mv.addObject("parent",parent);
        mv.addObject("area2",areaService.getArea2());
        return mv;

    }

    @RequestMapping(value = "/info/{uid}/address",method = RequestMethod.POST)
    public ModelAndView address_post(@PathVariable Integer uid,@RequestParam String area1,@RequestParam String area2,@RequestParam String address){
        ModelAndView mv=new ModelAndView("redirect:/wx/parentCenter/"+uid+"/myInfo_authentication");
        Parent parent=new Parent();
        parent.setUserId(uid);
        parent.setGround(area1+"-"+area2);
        parent.setAddress(address);
        parentCenterService.changeInfo(parent);
        return mv;

    }
}

