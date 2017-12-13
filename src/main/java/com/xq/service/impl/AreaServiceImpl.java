package com.xq.service.impl;

import com.xq.dao.AreaDao;
import com.xq.model.Area2;
import com.xq.model.Area3;
import com.xq.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by netlab606 on 2017/7/29.
 */
@Service
public class AreaServiceImpl implements AreaService {

    @Autowired
    AreaDao areaDao;

    public List<Area2> getArea2(){
        List<Area2> area2List= areaDao.getArea2();
        for(Area2 area2:area2List){
                area2.setArea3List(areaDao.getArea3ByArea2Name(area2.getName()));
        }
        return area2List;
    }
    public List<Area3> getArea3ByArea2Name(String area2_name) {
        return areaDao.getArea3ByArea2Name(area2_name);
    }
}
