package com.xq.controller;

import com.xq.dto.*;
import com.xq.model.*;
import com.xq.service.AreaService;
import com.xq.service.MessageService;
import com.xq.service.TeacherCenterService;
import com.xq.service.UserService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.List;

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
    @Autowired
    AreaService areaService;
    @Autowired
    MessageService messageService;

    /**
     * 治疗师中心首页
     */
    @RequestMapping(value = "")
    public ModelAndView teacherCenter(HttpServletRequest request){
        ModelAndView mv=new ModelAndView("teacherCenter/home");
         String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
//        String openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        User user=userService.getUserByOpenidStatus(openid,"1");
        Teacher teacher=teacherCenterService.getTeacherByUserId(user.getId());
        mv.addObject("user",user);
        mv.addObject("teacher",teacher);

        TeacherCenterCountDto teacherCenterCountDto=teacherCenterService.getCounts(user.getId(), "teacher");
        mv.addObject("number",teacherCenterCountDto);
        return mv;
    }

    /**
     * 我的
     */
    @RequestMapping(value = "/{uid}/my")
    public ModelAndView my(@PathVariable Integer uid){
        ModelAndView mv=new ModelAndView("teacherCenter/teacherCenter");
        User user=userService.getUserByUid(uid);
        Teacher teacher=teacherCenterService.getTeacherByUserId(uid);
        mv.addObject("user",user);
        mv.addObject("teacher",teacher);
        TeacherCenterCountDto teacherCenterCountDto=teacherCenterService.getCounts(user.getId(), "teacher");
        mv.addObject("number",teacherCenterCountDto);
        return mv;
    }

    /**
     *我的患者
     */
    @RequestMapping(value = "/{userId}/myDemands")
    public ModelAndView toMyDemands(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myDemands");
        Teacher teacher=teacherCenterService.getTeacherByUserId(userId);
        mv.addObject("demands",teacherCenterService.getDemands(teacher.getId()));
        mv.addObject("teacherId",teacher.getId());
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
        ModelAndView mv=new ModelAndView("teacherCenter/myMessages");
        mv.addObject("messages",teacherCenterService.getMessagesByUserId(userId));
        mv.addObject("name",teacherCenterService.getNameByUserId(userId));
        mv.addObject("user",teacherCenterService.getUserById(userId));
        return mv;
    }

    @RequestMapping(value = "/{uid}/message/{mid}/del",method = RequestMethod.GET)
    public ModelAndView delMessage(@PathVariable Integer mid,@PathVariable Integer uid){
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/"+uid+"/myMessages");
        messageService.delMessageByMid(mid);
        return mv;
    }

    /**
     *评价中心
     */
    @RequestMapping(value = "/{userId}/myComments")
    public ModelAndView myCommentsens(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myComments");
        mv.addObject("comments",teacherCenterService.getCommentsByUserId(userId));
        mv.addObject("user",teacherCenterService.getUserById(userId));
        return mv;
    }

    /**
     * 获得第几页的消息
     * @param page
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getInformMessageByPage/{page}",method = RequestMethod.GET)
    public List<Message> getInformMessageByPage(@PathVariable Integer page, HttpServletRequest request){
        return teacherCenterService.getInformMessageByPage(request,page);
    }

    /**
     * 所有通知 变已读
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/allInformRead",method = RequestMethod.POST)
    public Result allInformRead(HttpServletRequest request){
        teacherCenterService.allInformRead(request);
        return new Result(true);
    }

    @ResponseBody
    @RequestMapping(value = "/getInfromById/{mid}",method = RequestMethod.GET)
    public Result getInfromById(@PathVariable Integer mid){
        Message message=messageService.getInfromById(mid);
        return new Result(true,message);
    }

    /**
     *星级评定
     */
    @RequestMapping(value = "/{userId}/myStar")
    public ModelAndView myLevel(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myStar");
        return mv;
    }

    /**
     *我的资料 基本资料
     */
    @RequestMapping(value = "/{userId}/myInfo_base")
    public ModelAndView myInfo_base(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myInfo_base");
//        Teacher teacher=teacherCenterService.getTeacherByUserId(userId);
//        mv.addObject("teacher",teacher);
        mv.addObject("user",teacherCenterService.getUserById(userId));
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
     *我的日程安排
     */
    @RequestMapping(value = "/{userId}/myWork",method = RequestMethod.GET)
    public ModelAndView myWork(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myWork");
        Work work=teacherCenterService.getWorkByUid(userId);
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
        return new Result(true,teacherCenterService.getDayWorkByUid(uid,date));
    }

    /**
     *我的资料 实名认证
     */
    @RequestMapping(value = "/{userId}/myInfo_authentication",method = RequestMethod.GET)
    public ModelAndView myInfo_authentication(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myInfo_authentication");
        TeacherInfoAuthentication teacherInfoAuthentication=teacherCenterService.getTeacherInfoAuthenticationByUid(userId);
//        Teacher teacher=teacherCenterService.getTeacherByUserId(userId);
        mv.addObject("teacher",teacherInfoAuthentication);
        mv.addObject("uid",userId);
        return mv;
    }

    /**
     *我的资料 康复服务
     */
    @RequestMapping(value = "/{userId}/myInfo_service",method = RequestMethod.GET)
    public ModelAndView myInfo_service(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myInfo_service");
        Teacher teacher=teacherCenterService.getTeacherByUserId(userId);
        mv.addObject("teacher",teacher);
        mv.addObject("user",teacherCenterService.getUserById(userId));
        return mv;
    }

    /**
     *我的资料 康复服务  具体类型 页面
     * @param type  要获得的 字段的类型 多个以@分割
     */
    @RequestMapping(value = "/serviceInfo/{uid}/{type}",method = RequestMethod.GET)
    public ModelAndView myInfo_service_type(@PathVariable Integer uid,@PathVariable String type){
        ModelAndView mv=new ModelAndView("teacherCenter/myInfo_service_"+type.split("@")[0]);
        if(!type.equals("rule")) {
            Teacher teacher = teacherCenterService.getTeacherInfoByUid(uid, type);
            mv.addObject("teacher", teacher);
        }
        mv.addObject("user",teacherCenterService.getUserById(uid));
        return mv;
    }

    /**
     * 我的资料  康复服务 康复方式 编辑页面
     * @param uid
     * @param type
     * @return
     */
    @RequestMapping(value = "/serviceInfo/{uid}/way/{type}/edit",method =RequestMethod.GET )
    public ModelAndView way(@PathVariable Integer uid,@PathVariable String type){
        ModelAndView mv=new ModelAndView("teacherCenter/myInfo_service_way_edit");
        Teacher teacher=teacherCenterService.getTeacherWayByUserId(uid,type);
        mv.addObject("teacher",teacher);
        mv.addObject("user",teacherCenterService.getUserById(uid));
        mv.addObject("area2",areaService.getArea2());
        mv.addObject("type",(type.equals("teacher"))?"治疗师上门":((type.equals("student"))?"学生上门":"在线授课"));
        return mv;
    }

    /**
     * 我的资料：康复服务 康复方式 编辑提交
     * @param uid
     * @param type 学生上门、治疗师上门、在线授课
     * @param teacher
     * @param area1 学生上门的具体地址
     * @param area2
     * @param ctype edit 还是add
     * @return
     */
    @RequestMapping(value = "/serviceInfo/{uid}/way/{type}/{ctype}",method =RequestMethod.POST)
    public ModelAndView way_post(@PathVariable Integer uid, @PathVariable String type, Teacher teacher, String area1, String area2, @PathVariable String ctype) throws UnsupportedEncodingException {
//        type= new String(type.getBytes("ISO8859-1"), "UTF-8");
        teacherCenterService.editServiceInfoWay(uid,type,teacher,area1,area2,ctype);
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/serviceInfo/"+uid+"/way@s_ground@t_ground@price_t@price_s@price_o@detailAddress");
        return mv;
    }


    /**
     *我的资料 康复服务  具体类型 页面
     */
    @RequestMapping(value = "/editServiceInfo",method = RequestMethod.POST)
    public ModelAndView myInfo_service_type_post(Teacher teacher){
        teacherCenterService.editServiceInfo(teacher);
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/"+teacher.getUserId()+"/myInfo_service");
        return mv;
    }

//    /**
//     *
//     * 填写个人资料页面
//     */
//    @RequestMapping(value="/{userId}/fillInfoPage",method = RequestMethod.GET)
//    public ModelAndView fillInfoPage(@PathVariable Integer userId){
//        ModelAndView mv=new ModelAndView("teacherCenter/fillInfoPage");
//        mv.addObject("userId",userId);
//        return mv;
//    }




//    /**
//     *
//     * 修改字段
//     */
//    @RequestMapping(value = "/{objId}/{fieldName}/modifyPage")
//    public ModelAndView modifyPage(@PathVariable int objId,@PathVariable String fieldName)
//    {
//        ModelAndView mv=new ModelAndView("teacherCenter/modifyPage");
//        ModifyPageDto modifyPageDto=teacherCenterService.getModifyDto(objId,fieldName);
//        mv.addObject("modifyPageDto",modifyPageDto);
//        return mv;
//    }


    /**
     * 复杂 个人资料展示页面 如：成功案例
     * @param uid 用户ID
     * @param type 类型：successCase 成功案例
     * @param page 0 直接跳转到 添加页面  非0 跳转到 列表页面
     * @return
     */
    @RequestMapping(value = "/info/{uid}/{type}/{page}",method = RequestMethod.GET)
    public ModelAndView info(@PathVariable int uid,@PathVariable String type,@PathVariable int page)
    {
        ModelAndView mv;
        if(page==0){
            mv=new ModelAndView("teacherCenter/myInfo_authentication_"+((type.equals("certificate")||type.equals("other_pic"))?"award":type)+"_add");
            mv.addObject("user",userService.getUserByUid(uid));
            mv.addObject("type",type);
//            System.out.println("page:"+page);
           // if(type.equals("abstractTeacher")){
//                Object data=teacherCenterService.getInfoByTypeName(uid,type,"");
//                mv.addObject("data",data);
                       // }
        }else{
            mv=new ModelAndView("teacherCenter/myInfo_authentication_"+((type.equals("certificate")||type.equals("other_pic"))?"award":type));
            Object data=teacherCenterService.getInfoByTypeName(uid,type,"");
            mv.addObject("data",data);
            mv.addObject("type",type);
            mv.addObject("uid",uid);
        }
        return mv;
    }

    //同属性多对象绑定
    @InitBinder("teacherInfoRecoveryHis")
    public void initTeacherInfoRecoveryHis(WebDataBinder binder){
        binder.setFieldDefaultPrefix("rec.");
    }

    /**
     * 复杂 个人资料 添加
     * @param uid
     * @param type 类型：successCase 成功案例
     * @param title
     * @param detail
     * @param picUrls 荣誉证书 类别 添加的图片路径
     * @return
     */
    @RequestMapping(value = "/info/{uid}/{type}/add",method = RequestMethod.POST)
    public ModelAndView info(@PathVariable int uid, @PathVariable String type, String title, String detail, String picUrls, TeacherInfoSchool teacherInfoSchool, TeacherInfoRecoveryHis teacherInfoRecoveryHis){
        ModelAndView mv;
        mv=new ModelAndView("redirect:/wx/teacherCenter/info/"+uid+"/"+type+"/1");
        teacherCenterService.addComplexInfo(uid,type,title,detail,picUrls,teacherInfoSchool,teacherInfoRecoveryHis);
        Object result=teacherCenterService.getInfoByTypeName(uid,type,"");
        mv.addObject("data",result);
        return mv;
    }

    /**
     * 复杂个人资料 编辑页面
     * @param uid
     * @param type
     * @param index  编辑的该条的 索引
     * @param qetype 判断是查询还是编辑 query 查询 edit 编辑
     * @return
     */
    @RequestMapping(value = "/info/{uid}/{type}/{index}/{qetype}",method = RequestMethod.GET)
    public ModelAndView info_edit(@PathVariable int uid,@PathVariable String type,@PathVariable int index,@PathVariable String qetype,@RequestParam(required = false) String parent){
        ModelAndView mv=new ModelAndView("teacherCenter/myInfo_authentication_"+((type.equals("certificate")||type.equals("other_pic"))?"award":type)+"_add");
        Object data=teacherCenterService.getInfoByTypeNameIndex(uid,type,index);
        mv.addObject("data",data);
        mv.addObject("index",index);
        mv.addObject("user",userService.getUserByUid(uid));
        mv.addObject("type",type);
        mv.addObject("qetype",qetype);

        if(parent!=null){
            mv.addObject("parent",parent);//标志是从 家长预约治疗师的 地方来
        }
        return mv;
    }

    /**
     * 实名认证 复杂个人资料 编辑  简介
     * @param uid
     * @param type
     * @param index  编辑的该条的 索引
     * @return
     */
    @RequestMapping(value = "/info/{uid}/{type}/{index}/edit",method = RequestMethod.POST)
    public ModelAndView info_edit_post(@PathVariable int uid, @PathVariable String type, @PathVariable int index, String title, String detail, String picUrls, String deleteExitImg, TeacherInfoSchool teacherInfoSchool, TeacherInfoRecoveryHis teacherInfoRecoveryHis){
        ModelAndView mv;
        if(type.equals("abstractTeacher")||type.equals("name")||type.equals("pid")||type.equals("experienceAge")){
            mv=new ModelAndView("redirect:/wx/teacherCenter/"+uid+"/myInfo_authentication");
        }
        else{
         mv=new ModelAndView("redirect:/wx/teacherCenter/info/"+uid+"/"+type+"/1");
        }
        teacherCenterService.editComplexInfo(uid,type,index,title,detail,picUrls,deleteExitImg,teacherInfoSchool,teacherInfoRecoveryHis);
        return mv;
    }

    /**
     * 复杂个人资料 删除   删除 不用审核
     * @param uid
     * @param type
     * @param index  删除的该条的 索引
     * @return
     */
    @RequestMapping(value = "/info/{uid}/{type}/{index}/del",method = RequestMethod.GET)
    public ModelAndView info_del_post(@PathVariable int uid,@PathVariable String type,@PathVariable int index){
        ModelAndView mv;
        if(type.equals("abstractTeacher")||type.equals("name")||type.equals("pid")||type.equals("experienceAge")){
            mv=new ModelAndView("redirect:/wx/teacherCenter/"+uid+"/myInfo_authentication");
        }
        else{
            mv=new ModelAndView("redirect:/wx/teacherCenter/info/"+uid+"/"+type+"/1");
        }
        teacherCenterService.delComplexInfo(uid,type,index);
        return mv;
    }

    /**
     * 保存个人资料的 图片
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/img",method = RequestMethod.POST)
    public Result img(HttpServletRequest request){
        return new Result(true,teacherCenterService.addInfoImg(request));
    }

//    /**
//     *保存字段修改
//     */
//    @RequestMapping(value = "/saveModify")
//    @ResponseBody
//    public Map saveModify(@RequestParam("fieldName") String fieldName, @RequestParam("objId") Integer objId, @RequestParam("newValue") String newValue){
//        Map map=new HashMap();
//        teacherCenterService.modifyFeild(objId,newValue,fieldName);
//        return map;
//    }

//    /**
//     *
//     * 修改成功案例
//     */
//    @RequestMapping(value = "{userId}/{caseIndex}/modifyText")
//    public ModelAndView modifyPage(@PathVariable int userId,@PathVariable int caseIndex)
//    {
//        ModelAndView mv=new ModelAndView("teacherCenter/modifyText");
//        mv.addObject("userId",userId);
//        mv.addObject("cases",teacherCenterService.getTeacherByUserId(userId).getSuccessCase());
//        mv.addObject("casesIndex",caseIndex);
//        mv.addObject("case",teacherCenterService.getTeacherByUserId(userId).getSuccessCase().split("#")[caseIndex]);
//        return mv;
//    }

    /**
     * 修改头像页面
     * @param userId
     * @return
     */
    @RequestMapping(value="/{userId}/changeIconPage")
    public ModelAndView changeIconPage(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/teacherChangeIcon");
        mv.addObject("user",teacherCenterService.getUserById(userId));
        return mv;
    }
    /**
     * 修改头像
     */
    @RequestMapping(value = "/{userId}/modifyIcon",method = RequestMethod.POST)
    @ResponseBody
    public Result modifyIcon(@PathVariable int userId, HttpServletRequest request){
        teacherCenterService.uploadPhoto(request,userId);
        return new Result(true);
    }


    /**
     * 我的课程
     * @param uid
     * @param type  parent 表示  家长看的   teacher 表示治疗师自己看的
     * @return
     */
    @RequestMapping(value = "/{uid}/mySchedule/{type}",method = RequestMethod.GET)
    public ModelAndView schedule(@PathVariable Integer uid,@PathVariable String type){
        ModelAndView mv=new ModelAndView("teacherCenter/mySchedule");
        mv.addObject("uid",uid);
        mv.addObject("schedule",teacherCenterService.getInfoByTypeName(uid,"schedule",""));
        mv.addObject("period",teacherCenterService.getInfoByTypeName(uid,"period",""));
        mv.addObject("type",type);
        return mv;
    }

    /**
     * 我的课程 增加课程
     * @param uid
     * @param week
     * @param time
     * @return
     */
    @RequestMapping(value = "/{uid}/mySchedule/add",method = RequestMethod.POST)
    public ModelAndView schedule_add(@PathVariable Integer uid,String week,String time) throws ParseException {
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/"+uid+"/mySchedule/teacher");
        teacherCenterService.addSchedule(uid,week,time);
        return mv;
    }

    /**
     * 我的课程 删除课程
     * @param uid
     * @param time
     * @return
     */
    @RequestMapping(value = "/{uid}/mySchedule/del",method = RequestMethod.POST)
    public ModelAndView schedule_del(@PathVariable Integer uid,String time) throws ParseException {
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/"+uid+"/mySchedule/teacher");
        teacherCenterService.delSchedule(uid,time);
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
        Teacher teacher=teacherCenterService.getIdCardByUid(uid);
        mv.addObject("user",userService.getUserByUid(uid));
        mv.addObject("teacher",teacher);
        return mv;
    }

    @RequestMapping(value = "/info/{uid}/idcard",method = RequestMethod.POST)
    public ModelAndView idcard_post(@PathVariable Integer uid, MultipartFile peoplePidUrl,MultipartFile pidUrlFront,MultipartFile pidUrlBack,HttpServletRequest request){
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/"+uid+"/myInfo_authentication");
        teacherCenterService.editIdCard(peoplePidUrl,pidUrlBack,pidUrlFront,uid,request);
        return mv;
    }

    /**
     *日志中心
     */
    @RequestMapping(value = "/{userId}/myLog",method = RequestMethod.GET)
    public ModelAndView myLog(@PathVariable Integer userId){
        ModelAndView mv=new ModelAndView("teacherCenter/myLog");
        List<TeacherLogDto> teacherLogDtos=teacherCenterService.getLogByUid(userId);
        mv.addObject("logs",teacherLogDtos);
        mv.addObject("user",teacherCenterService.getUserById(userId));
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
        String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);

//        openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        User user=userService.getUserByOpenidStatus(openid,"1");
        mv.addObject("user",user);

        //解决中文乱码
//        if(ctype.equals("name")){
//            value= new String(value.getBytes("ISO8859-1"), "UTF-8");
//        }
        TeacherInfoEdit teacherInfoEdit=teacherCenterService.myInfoEdit(ftype,ctype,value,user.getUserStatus());
        mv.addObject("info",teacherInfoEdit);
        return mv;
    }

    @RequestMapping(value = "/myInfo/edit",method = RequestMethod.POST)
    public ModelAndView myInfo_edit_post(String ftype,String ctype,String value,HttpServletRequest request,Integer isChangeStatus,Integer uid){
        ModelAndView mv=null;
        switch (ftype){
            case "基本资料":
                mv=new ModelAndView("redirect:/wx/teacherCenter/"+uid+"/myInfo_base");
                break;
            case "实名认证":
                mv=new ModelAndView("redirect:/wx/teacherCenter/"+uid+"/myInfo_authentication");
                break;
            case "康复服务":
                mv=new ModelAndView("redirect:/wx/teacherCenter/"+uid+"/myInfo_service");
                break;
        }
        teacherCenterService.myInfoEditPost(ftype,ctype,value,isChangeStatus,request, "teacher");
        return mv;
    }

    /**
     * 治疗师 修改
     * @param userStatus
     * @param request
     * @return
     */
    @RequestMapping(value = "/userstatus/change",method = RequestMethod.POST)
    public ModelAndView userstatus(@RequestParam Integer userStatus,HttpServletRequest request){
        String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
        userService.changeUserStatus(userStatus,openid,"teacher");
        return new ModelAndView("redirect:/wx/teacherCenter");
    }

    @ResponseBody
    @RequestMapping(value = "/checkAccountReg",method = RequestMethod.GET)
    public Result check(Integer uid){
        return teacherCenterService.checkAccountReg(uid);
    }
}
