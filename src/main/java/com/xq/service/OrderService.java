package com.xq.service;

import com.xq.dto.AllTypeOrder;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by netlab606 on 2017/11/2.
 */
public interface OrderService {
    AllTypeOrder getAllOrder(HttpServletRequest request);
}
