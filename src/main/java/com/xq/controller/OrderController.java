package com.xq.controller;

import com.xq.dto.AllTypeOrder;
import com.xq.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
        mv.addObject("orders",allTypeOrder);

        return mv;
    }
}
