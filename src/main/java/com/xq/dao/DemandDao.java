package com.xq.dao;


import com.xq.model.Demand;

import java.util.List;

/**
 * Created by netlab606 on 2017/6/30.
 */
public interface DemandDao {

    List<Demand> getMyDemandsByOpenid(String openid);
}
