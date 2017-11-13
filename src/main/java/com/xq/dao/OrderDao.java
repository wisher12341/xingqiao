package com.xq.dao;

import com.xq.model.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by netlab606 on 2017/11/2.
 */
public interface OrderDao {
    List<Order> getAllOrderByOpenid(String openid);

    Order getOrderByOid(String oid);

    List<Order> getOrder(@Param("demandId") Integer id, @Param("teacherId") Integer teacherId);

    void addOrder(Order order);

    Integer getUserIdByOid(String id);
}
