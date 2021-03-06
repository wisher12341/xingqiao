package com.xq.controller;

import com.xq.dto.AllTypeOrder;
import com.xq.dto.OrderDto;
import com.xq.dto.Result;
import com.xq.model.Order;
import com.xq.model.User;
import com.xq.service.OrderService;
import com.xq.service.RecoveryLogService;
import com.xq.service.UserService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 我的订单
 * Created by netlab606 on 2017/11/2.
 */
@Controller
@RequestMapping("/wx/order")
public class OrderController {

    @Autowired
    OrderService orderService;
    @Autowired
    RecoveryLogService recoveryLogService;
    @Autowired
    UserService userService;

    /**
     * 我的订单 首页
     * @return
     */
    @RequestMapping(value = "",method = RequestMethod.GET)
    public ModelAndView order(HttpServletRequest request){
        AllTypeOrder allTypeOrder=orderService.getAllOrder(request);
        ModelAndView mv=new ModelAndView("order/order");
        mv.addObject("orders",allTypeOrder);
        //用于提醒 家长有需要确认的康复日志
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
        User user=userService.getUserByOpenidStatus(openid,"0");
        int needCkeckLogNum=recoveryLogService.getNeedCheckLogNumByUid(user.getId());
        mv.addObject("needCkeckLogNum", needCkeckLogNum);
        return mv;
    }

    /**
     * 订单详情
     * @param oid 订单ID
     * @return
     */
    @RequestMapping(value = "/{oid}/detail",method = RequestMethod.GET)
    public ModelAndView detail(@PathVariable String oid){
        OrderDto order=orderService.getOrderByOid(oid);
        ModelAndView mv=new ModelAndView("order/detail");
        mv.addObject("order",order);
        return mv;
    }

    /**
     * 取消 预约
     * @return
     */
    @RequestMapping(value = "/{oid}/cancel",method = RequestMethod.GET)
    public ModelAndView cancel(@PathVariable String oid){
        orderService.orderCancel(oid);
//        ModelAndView mv=new ModelAndView("redirect:/wx/order");
        ModelAndView mv=new ModelAndView("redirect:/wx/common/success");
        mv.addObject("title","订单");
        mv.addObject("content","已取消预约");
        mv.addObject("url","/wx/order");
        return mv;
    }

    /**
     * 订单终止页面
     * @return
     */
    @RequestMapping(value = "/{oid}/stop",method = RequestMethod.GET)
    public ModelAndView stop(@PathVariable String oid){
        ModelAndView mv=new ModelAndView("order/comment");
        mv.addObject("title","订单终止");
        mv.addObject("submit","/wx/order/"+oid+"/stop");
        mv.addObject("type","order_stop");
        return mv;
    }

    /**
     * 订单终止
     * @param oid
     * @return
     */
    @RequestMapping(value = "/{oid}/stop",method = RequestMethod.POST)
    public ModelAndView stop(@PathVariable String oid, String reason){
        orderService.orderStop(oid,reason);
//        ModelAndView mv=new ModelAndView("redirect:/wx/order/"+oid+"/detail");
        ModelAndView mv=new ModelAndView("redirect:/wx/common/success");
        mv.addObject("title","订单");
        mv.addObject("content","订单已终止，待治疗师同意");
        mv.addObject("url","/wx/order/"+oid+"/detail");
        return mv;
    }

    /**
     * 同意治疗终师止
     * @param oid
     * @return
     */
    @RequestMapping(value = "/{oid}/agree",method = RequestMethod.GET)
    public ModelAndView stopAgree(@PathVariable String oid){
        orderService.agree(oid);
//        ModelAndView mv=new ModelAndView("redirect:/wx/order/"+oid+"/detail");
        ModelAndView mv=new ModelAndView("redirect:/wx/common/success");
        mv.addObject("title","订单");
        mv.addObject("content","订单已终止，正在审核中");
        mv.addObject("url","/wx/order/"+oid+"/detail");
        return mv;
    }


    /**
     * 订单提交
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/submit",method = RequestMethod.POST)
    public Result submit(Order order, HttpServletRequest request){
        String orderId=orderService.addOrder(order,request);
        Result result = new Result(true, orderId);
        if (orderId == null || (StringUtils.equals(orderId, "-1") || StringUtils.equals(orderId, "-2"))){
            result.setSuccess(false);
            result.setError(orderId);
        }
        return result;
    }

    /**
     * 订单提交成功
     * @return
     */
    @RequestMapping(value = "/{orderId}/success",method = RequestMethod.GET)
    public ModelAndView success(@PathVariable("orderId") String orderId){
        OrderDto order=orderService.getOrderByOid(orderId);
        ModelAndView mv=new ModelAndView("order/results/success");
        mv.addObject("order",order);
        return mv;
    }
    /**
     * 订单提交失败
     * @return
     */
    @RequestMapping(value = "/failure",method = RequestMethod.GET)
    public ModelAndView failure(){
        ModelAndView mv=new ModelAndView("order/results/failure");
        return mv;
    }

    /**
     * 订单提交冲突
     * @return
     */
    @RequestMapping(value = "/conflict",method = RequestMethod.GET)
    public ModelAndView conflict(){
        ModelAndView mv=new ModelAndView("order/results/conflict");
        return mv;
    }
}
