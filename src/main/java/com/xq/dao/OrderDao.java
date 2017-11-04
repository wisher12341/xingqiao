package com.xq.dao;

import com.xq.model.Order;

import java.util.List;

/**
 * Created by netlab606 on 2017/11/2.
 */
public interface OrderDao {
    List<Order> getAllOrderByOpenid(String openid);
}
