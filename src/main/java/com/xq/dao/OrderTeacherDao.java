package com.xq.dao;

import com.xq.model.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by netlab606 on 2017/11/13.
 */
public interface OrderTeacherDao {
    List<Order> getAllOrderByUid(String uid);
    void orderAffirm(String orderId);

    void orderReject(@Param("oid") String orderId, @Param("reason") String reason);

    void orderFinish(String oid);

    void agree(String oid);

    void orderStop(@Param("oid") String oid, @Param("reason") String reason);

    List<Order> getAllDoingOrderByUid(Integer userId);

    List<Order> getAllDoingDayOrderByUid(@Param("uid") Integer uid, @Param("day") String day);

    List<Order> getLogByUid(Integer userId);
}
