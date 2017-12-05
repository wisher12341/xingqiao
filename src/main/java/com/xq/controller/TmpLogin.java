package com.xq.controller;

import com.xq.model.User;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by joy12 on 2017/11/5.
 */
public class TmpLogin {
    public static void tmpLogin(HttpServletRequest request){
        User user = new User("user","123");
        user.setId(2);
        user.setHeadimgurl("static/img/usertouxiang.jpg");
        request.getSession().setAttribute("USER",user);

    }
}
