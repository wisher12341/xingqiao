package com.xq.service;

import com.xq.wxpay.config.WxSendData;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;

/**
 * Created by netlab606 on 2017/11/10.
 */
public interface WxPayService {
    WxSendData pay(String oid, HttpServletRequest request);

    String notufy_url(HttpServletRequest request, HttpServletResponse response) throws ParseException;
}
