package com.xq.service;

import com.xq.model.WxUserInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by netlab606 on 2017/11/17.
 */
public interface WxService {
    String getOpenId(String code);

    WxUserInfo getUserInfo(HttpServletRequest request, HttpServletResponse response);
}
