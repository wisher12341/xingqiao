package com.xq.service;

import com.xq.model.Area2;
import com.xq.model.Area3;

import java.util.List;

/**
 * Created by netlab606 on 2017/7/29.
 */
public interface AreaService {
    List<Area2> getArea2();
    List<Area3> getArea3ByArea2Name(String area2_name);
}
