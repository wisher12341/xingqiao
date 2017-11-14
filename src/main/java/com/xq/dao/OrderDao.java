package com.xq.dao;

import com.xq.model.Comment;
import com.xq.model.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by netlab606 on 2017/11/2.
 */
public interface OrderDao {
    List<Order> getAllOrderByOpenid(String openid);

    Order getOrderByOid(String oid);


    void orderCancel(String oid);

    Order getOrderPayByOid(String oid);

    void updateTrace(@Param("id")String oid, @Param("trace")String s);

    void orderPay(Order order);

    void stop(@Param("oid") String oid,@Param("reason") String reason);

    void agree(String oid);

    void addCommentId(Comment comment);

    List<Order> getAllOrderByUid(String uid);

    List<Order> getOrder(@Param("demandId") Integer id, @Param("teacherId") Integer teacherId);

    void addOrder(Order order);

    Integer getUserIdByOid(String id);

}
