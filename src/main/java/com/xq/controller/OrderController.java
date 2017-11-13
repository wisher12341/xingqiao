package com.xq.controller;

import com.xq.dto.AllTypeOrder;
import com.xq.dto.OrderDto;
import com.xq.dto.Result;
import com.xq.model.Order;
import com.xq.model.User;
import com.xq.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    /**
     * 我的订单 首页
     * @return
     */
    @RequestMapping(value = "",method = RequestMethod.GET)
    public ModelAndView order(HttpServletRequest request){
        AllTypeOrder allTypeOrder=orderService.getAllOrder(request);
        ModelAndView mv=new ModelAndView("order/order");
        request.getSession().setAttribute("ss","ff");
        mv.addObject("orders",allTypeOrder);
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
     * 订单提交
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/submit",method = RequestMethod.POST)
    public Result submit(Order order, HttpSession session){
        String order_id=orderService.addOrder(order,session);
        return new Result(true,order_id);
    }

    /**
     * 订单提交成功
     * @return
     */
    @RequestMapping(value = "/{orderId}/success",method = RequestMethod.GET)
    public String success(Model model,@PathVariable("orderId") String orderId){
        OrderDto order=orderService.getOrderByOid(orderId);
        model.addAttribute("order",order);
        return "order_submit_success";
    }
}
