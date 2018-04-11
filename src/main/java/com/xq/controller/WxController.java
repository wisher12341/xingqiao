package com.xq.controller;


import com.xq.interceptor.WxInterceptor;
import com.xq.model.User;
import com.xq.model.WxUserInfo;
import com.xq.service.UserService;
import com.xq.service.WxService;
import com.xq.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 微信平台回调
 * Created by netlab606 on 2017/9/14.
 */
@Controller
@RequestMapping("/wx/callback")
public class WxController {

    @Autowired
    WxService wxService;
    @Autowired
    UserService userService;

    /**
     * 接受家长用户openid的回调地址
     * @param request
     * @return
     */
    @RequestMapping("/openid/parent")
    public ModelAndView openid(HttpServletRequest request,HttpServletResponse response) {
        String code = request.getParameter("code");
        //获取openid
        String openid=wxService.getOpenId(code);
        Boolean user=userService.checkUserByOpenid(openid,response,"parent");
        if(user){
            //该微信已注册但是没有cookie
            String url= (String) request.getSession().getAttribute(Const.URL_BACK);
            ModelAndView mv=new ModelAndView("redirect:"+url);
            return mv;
        }else {
            ModelAndView mv = new ModelAndView("login_parent");
            mv.addObject("openid", openid);
            return mv;
        }
    }

    /**
     * 接受治疗师用户openid的回调地址
     * @param request
     * @return
     */
    @RequestMapping("/openid/teacher")
    public ModelAndView openid_teacher(HttpServletRequest request,HttpServletResponse response) {
        String code = request.getParameter("code");
        //获取openid
        String openid=wxService.getOpenId(code);
        Boolean user=userService.checkUserByOpenid(openid,response,"teacher");
        if(user){
            //该微信已注册但是没有cookie
            String url= (String) request.getSession().getAttribute(Const.URL_BACK);
            ModelAndView mv=new ModelAndView("redirect:"+url);
            return mv;
        }else {
            ModelAndView mv = new ModelAndView("login_teacher");
            mv.addObject("openid", openid);
            return mv;
        }
    }


    /**
     * 家长新用户注册
     */
    @RequestMapping(value = "/new")
    public ModelAndView reg(HttpServletRequest request,HttpServletResponse response){
        WxUserInfo wxUserInfo=wxService.getUserInfo(request,response);
        String url= "/wx/parentCenter";
        ModelAndView mv=new ModelAndView("redirect:"+url);
        return mv;
    }


}
