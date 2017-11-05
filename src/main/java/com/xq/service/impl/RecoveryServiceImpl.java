package com.xq.service.impl;

import com.xq.dao.RecoveryLogDao;
import com.xq.service.RecoveryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * Created by netlab606 on 2017/6/30.
 */
@Service
public class RecoveryServiceImpl implements RecoveryService {

    @Autowired
    RecoveryLogDao recoveryLogDao;


    @Override
    public Integer getConfirmCountByOid(String orderId) {
        return recoveryLogDao.getConfirmCountByOid(orderId);
    }

}
