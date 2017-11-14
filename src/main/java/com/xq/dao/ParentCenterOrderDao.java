package com.xq.dao;

import com.xq.model.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by netlab606 on 2017/6/30.
 */
public interface ParentCenterOrderDao {

    List<Order> getAllOrderByUserId(Integer id);

    Order getOrderByOrderId(String id);

    void orderCancel(String id);

    void orderPay(Order order);

    void agree(String oid);

//    void orderStop(@Param("oid") String oid, @Param("reason") String reason);

//    List<Order> getAllOrderDemandByUserId(Integer id);
}
