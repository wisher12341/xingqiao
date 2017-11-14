package com.xq.service;

/**
 * Created by joy12 on 2017/11/4.
 */

import com.xq.model.UserGoodReport;
import javax.servlet.http.HttpServletRequest;

public interface GoodReportService {
    UserGoodReport getOrganGoodReportByUid(HttpServletRequest request);

    void add(HttpServletRequest request, Integer type, Integer cid, Integer flag, String reason);

    void del(HttpServletRequest request, Integer cid, Integer flag);

    UserGoodReport getTeacherGoodReportByUid(HttpServletRequest request);
}

