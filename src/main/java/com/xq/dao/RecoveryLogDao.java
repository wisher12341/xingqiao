package com.xq.dao;

import com.xq.dto.RecoveryLogDto;
import com.xq.model.RecoveryLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by netlab606 on 2017/7/25.
 */
public interface RecoveryLogDao {
    List<RecoveryLog> getLogByOrderId(String id);
    Integer getConfirmCountByOid(String oid);

    List<RecoveryLog> getLogsByDto(RecoveryLogDto recoveryLogDto);

    void allConfirmByOrderId(@Param("oid") String orderId, @Param("time") String dateNowStr);

    void confirmById(@Param("id") Integer id,@Param("time") String dateNowStr);
}
