package com.xq.controller;

import com.xq.service.WxPayService;
import com.xq.wxpay.config.WxSendData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;

/**
 * 微信支付
 * Created by netlab606 on 2017/9/22.
 */
@Controller
@RequestMapping("/wx/order/wxpay")
public class WxPayController {

    @Autowired
    WxPayService wxPayService;


    /**
     * 支付
     * @return
     */
    @RequestMapping(value = "/{oid}/pay",method = RequestMethod.GET)
    public ModelAndView pay(@PathVariable String oid,HttpServletRequest request){
        WxSendData wxSendData=wxPayService.pay(oid,request);
        ModelAndView mv=new ModelAndView("order/wx_pay");
        mv.addObject("data",wxSendData);
        return mv;
    }

    /**
     * 异步通知
     * @param request
     * @param response
     * @throws ParseException
     */
    @RequestMapping(value = "/notify_url",method = RequestMethod.POST)
    public void notify_url(HttpServletRequest request,HttpServletResponse response) throws ParseException {
        wxPayService.notufy_url(request,response);
    }

}
