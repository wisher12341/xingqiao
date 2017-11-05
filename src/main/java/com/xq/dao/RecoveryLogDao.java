package com.xq.dao;

import com.xq.model.RecoveryLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by netlab606 on 2017/7/25.
 */
public interface RecoveryLogDao {
    List<RecoveryLog> getLogByOrderId(String id);
    Integer getConfirmCountByOid(String oid);
}
