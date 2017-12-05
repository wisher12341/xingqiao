package com.xq.controller;

import com.xq.model.User;
import com.xq.util.Const;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by joy12 on 2017/11/5.
 */
public class TmpLogin {
    public static void tmpLogin(HttpServletRequest request, HttpServletResponse response){
        User user = new User("user","123");
        user.setId(2);
        user.setHeadimgurl("static/img/usertouxiang.jpg");
        request.getSession().setAttribute("USER",user);
        Cookie cookie = new Cookie(Const.OPENID_PARENT,"oxsEYwlPAa-fVc9fVyzVBYBed9n8");
        cookie.setPath("/");
        response.addCookie(cookie);
        response.setHeader("Access-Control-Allow-Credentials","true");
        response.setHeader("Access-Control-Allow-Origin","https://open.weixin.qq.com/");
    }
}
