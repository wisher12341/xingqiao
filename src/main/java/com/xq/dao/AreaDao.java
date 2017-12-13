package com.xq.dao;

import com.xq.model.Area2;
import com.xq.model.Area3;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by netlab606 on 2017/7/29.
 */
public interface AreaDao {
    List<Area2> getArea2();

    List<Area3> getArea3ByArea2Name(@Param("name") String area2_name);
}
