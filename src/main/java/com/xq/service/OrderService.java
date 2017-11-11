package com.xq.service;

import com.xq.dto.AllTypeOrder;
import com.xq.dto.OrderDto;
import com.xq.model.Order;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by netlab606 on 2017/11/2.
 */
public interface OrderService {
    AllTypeOrder getAllOrder(HttpServletRequest request);

    OrderDto getOrderByOid(String oid);

    void orderCancel(String oid);

    void orderStop(String oid, String reason);

    void agree(String oid);
}
