package com.xq.service;


import com.xq.dto.RecoveryLogDto;
import com.xq.model.RecoveryLog;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by netlab606 on 2017/6/30.
 */
public interface RecoveryLogService {

    Integer getConfirmCountByOid(String orderId);

    RecoveryLogDto getLogsByDto(RecoveryLogDto recoveryLogDto, HttpServletRequest request);

    RecoveryLogDto getMyTeachersAndDemandsNoConfirmLogByUid(HttpServletRequest request);

    void allConfirmByOrderId(String orderId);

    void confirmById(Integer id, String oid);

    void remind(Integer lid, String oid);

    void addRecovery(RecoveryLog recoveryLog);

    RecoveryLog getLogByRid(Integer rid);
}
