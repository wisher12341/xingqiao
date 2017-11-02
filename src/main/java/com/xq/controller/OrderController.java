package com.xq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 我的订单
 * Created by netlab606 on 2017/11/2.
 */
@Controller
@RequestMapping("")
public class OrderController {

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public ModelAndView order(){
        ModelAndView mv=new ModelAndView("order/index");
        mv.addObject("username","你好,freemarker!");
        return mv;
//        model.addAttribute("username","aaa");
//        return "index.ftl";

    }
}
