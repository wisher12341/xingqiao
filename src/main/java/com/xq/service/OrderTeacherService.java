package com.xq.service;

import com.xq.dto.AllTypeOrder;
import com.xq.dto.OrderDto;

/**
 * Created by netlab606 on 2017/11/2.
 */
public interface OrderTeacherService {
    AllTypeOrder getAllOrder(String request);

    OrderDto getOrderByOid(String oid);

    void orderAffirm(String orderId);

    void orderReject(String orderId, String reason);

    void orderFinish(String oid);

    void orderStop(String oid, String reason);

    void agree(String oid);
}
