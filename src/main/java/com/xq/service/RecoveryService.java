package com.xq.service;


import com.xq.model.RecoveryLog;

/**
 * Created by netlab606 on 2017/6/30.
 */
public interface RecoveryService {

    Integer getConfirmCountByOid(String orderId);

}
