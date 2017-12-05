package com.xq.service;

import com.xq.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by netlab606 on 2017/11/17.
 */
public interface UserService {
    User getUserByOpenid(String openid);

    Boolean checkUserByOpenid(String openid, HttpServletResponse response, String type);

    Boolean checkLogin(User user, HttpServletRequest request, HttpServletResponse response);


    User getUserByOpenidStatus(String openid, String s);

    User regTeacher(User user, HttpServletResponse response);

    void changeAccount(String openid, HttpServletResponse response, int status);

    User bindAccount(User user);
}
