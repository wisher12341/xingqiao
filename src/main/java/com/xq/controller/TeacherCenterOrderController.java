package com.xq.controller;

import com.xq.dto.AllTypeOrder;
import com.xq.dto.OrderDto;
import com.xq.dto.Result;
import com.xq.model.Comment;
import com.xq.model.RecoveryLog;
import com.xq.service.CommentService;
import com.xq.service.OrderTeacherService;
import com.xq.service.RecoveryLogService;
import com.xq.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

/**
 * 治疗师中心 我的订单
 * Created by netlab606 on 2017/11/11.
 */
@Controller
@RequestMapping("/wx/teacherCenter")
public class TeacherCenterOrderController {

    @Autowired
    OrderTeacherService orderTeacherService;
    @Autowired
    RecoveryLogService recoveryLogService;
    @Autowired
    CommentService commentService;

    /**
     * 我的订单首页
     * @return
     */
    @RequestMapping(value = "/{uid}/order",method = RequestMethod.GET)
    public ModelAndView order(@PathVariable String uid){
        AllTypeOrder allTypeOrder=orderTeacherService.getAllOrder(uid);
        ModelAndView mv=new ModelAndView("teacherCenter/order/order");
        mv.addObject("orders",allTypeOrder);
        mv.addObject("teacher","yes");
        return mv;
    }

    /**
     * 订单详情
     */
    @RequestMapping(value = "/order/{oid}/detail",method = RequestMethod.GET)
    public ModelAndView detail(@PathVariable String oid){
        OrderDto orderDto=orderTeacherService.getOrderByOid(oid);
        ModelAndView mv=new ModelAndView("teacherCenter/order/detail");
        mv.addObject("order",orderDto);
        return mv;
    }

    /**
     * 更新康复日志页面
     */
    @RequestMapping(value = "/{oid}/updateLog",method = RequestMethod.GET)
    public ModelAndView updatelog(@PathVariable String oid){
        ModelAndView mv=new ModelAndView("order/comment");
        mv.addObject("title","更新康复日志");
        mv.addObject("submit","/wx/teacherCenter/updateLog");
        mv.addObject("oid",oid);
        mv.addObject("type","log");
        return mv;
    }

    /**
     * 更新康复日志
     */
    @RequestMapping(value = "/updateLog",method = RequestMethod.POST)
    public ModelAndView updatelog_post(RecoveryLog recoveryLog)  {
        recoveryLogService.addRecovery(recoveryLog);
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/order/"+recoveryLog.getOrderId()+"/detail");
        return mv;
    }
    /**
     * 康复日志提醒
     */
    @ResponseBody
    @RequestMapping(value = "/log/remind",method = RequestMethod.POST)
    public Result remind(@RequestParam Integer lid, @RequestParam String oid){
        recoveryLogService.remind(lid,oid);
        return new Result(true);
    }

    /**
     * 待处理 订单  确认
     * @param orderId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/order/{orderId}/affirm",method = RequestMethod.GET)
    public ModelAndView affirm(@PathVariable String orderId){
        orderTeacherService.orderAffirm(orderId);
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/order/"+orderId+"/detail");
        return mv;
    }

    /**
     * 待处理 订单  拒绝 页面
     * @param oid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/order/{oid}/reject",method = RequestMethod.GET)
    public ModelAndView reject_get(@PathVariable String oid){
//        ModelAndView mv=new ModelAndView("teacherCenter/order/reason");
        ModelAndView mv=new ModelAndView("order/comment");
        mv.addObject("title","订单拒绝");
        mv.addObject("submit","/wx/teacherCenter/order/"+oid+"/reject");
        mv.addObject("type","order_reject");
        return mv;
    }

    /**
     * 待处理 订单  拒绝
     * @param orderId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/order/{orderId}/reject",method = RequestMethod.POST)
    public ModelAndView reject(@PathVariable String orderId,String reason){
        orderTeacherService.orderReject(orderId,reason);
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/order/"+orderId+"/detail");
        return mv;
    }

    /**
     * 订单完成
     * @param oid
     * @return
     */
    @RequestMapping(value = "/order/{oid}/finish",method = RequestMethod.GET)
    public ModelAndView finish(@PathVariable String oid){
        orderTeacherService.orderFinish(oid);
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/order/"+oid+"/detail");
        return mv;
    }

    /**
     * 订单终止页面
     * @param oid
     * @return
     */
    @RequestMapping(value = "/order/{oid}/stop",method = RequestMethod.GET)
    public ModelAndView stop_get(@PathVariable String oid){
//        ModelAndView mv=new ModelAndView("teacherCenter/order/reason");
        ModelAndView mv=new ModelAndView("order/comment");
        mv.addObject("title","订单终止");
        mv.addObject("submit","/wx/teacherCenter/order/"+oid+"/stop");
        mv.addObject("type","order_stop");
        return mv;
    }

    /**
     * 订单终止
     * @param oid
     * @return
     */
    @RequestMapping(value = "/order/{oid}/stop",method = RequestMethod.POST)
    public ModelAndView stop(@PathVariable String oid,String reason){
        orderTeacherService.orderStop(oid,reason);
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/order/"+oid+"/detail");
        return mv;
    }

    /**
     * 同意家长终止
     * @param oid
     * @return
     */
    @RequestMapping(value = "/order/{oid}/agree",method = RequestMethod.GET)
    public ModelAndView stopAgree(@PathVariable String oid){
        orderTeacherService.agree(oid);
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/order/"+oid+"/detail");
        return mv;
    }

    /**
     * 治疗师回应评论页面
     * @param cid
     * @return
     */
    @RequestMapping(value = "/order/{oid}/{cid}/comment",method = RequestMethod.GET)
    public ModelAndView comment(@PathVariable String cid,@PathVariable String oid){
//        Comment comment=commentService.getCommentByOid(cid);
        ModelAndView mv=new ModelAndView("order/comment");
        mv.addObject("title","回复评论");
        mv.addObject("submit","/wx/comment/"+oid+"/teacherReply");
        mv.addObject("cid",cid);
        mv.addObject("type","order_reply");

//        mv.addObject("type","teacher");
        return mv;
    }

//    /**
//     * 回应提交
//     * @param reply
//     * @param oid
//     * @param pid
//     * @return
//     */
//    @RequestMapping(value = "/order/comment/addReply",method = RequestMethod.POST)
//    public ModelAndView reply(@RequestParam String reply,@RequestParam String oid,@RequestParam Integer pid){
//        commentService.addReply(reply,oid,pid);
//        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/order/"+oid+"/detail");
//        return mv;
//    }

}
