package com.xq.service;

import com.xq.model.Demand;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by joy12 on 2017/11/10.
 */
public interface ParentCenterService {
    List<Demand> isexisted(HttpSession session, Integer teacheId);
}
