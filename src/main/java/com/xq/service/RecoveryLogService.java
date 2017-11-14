package com.xq.service;


import com.xq.dto.RecoveryLogDto;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by netlab606 on 2017/6/30.
 */
public interface RecoveryLogService {

    Integer getConfirmCountByOid(String orderId);

    RecoveryLogDto getLogsByDto(RecoveryLogDto recoveryLogDto, HttpServletRequest request);

    RecoveryLogDto getMyTeachersAndDemandsByUid(HttpServletRequest request);

    void allConfirmByOrderId(String orderId);

    void confirmById(Integer id, String oid);

    void remind(Integer lid, String oid);
}
