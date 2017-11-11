package com.xq.dao;


import com.xq.model.Demand;
import com.xq.model.Parent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by netlab606 on 2017/6/30.
 */
public interface DemandDao {


    List<Demand> getMyDemandsByOpenid(String openid);

    List<Demand> getDemandByUserId(Integer id);

    List<Demand> getDemandByIds(List<Integer> dids);

    Demand getDemandById(@Param("id") Integer demandId);

    void editorDemand(Demand demand);

    void addDemand(Demand demand);

    String getParenntNameByUid(Integer id);

}
