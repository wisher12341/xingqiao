package com.xq.service.impl;

import com.xq.dao.DemandDao;
import com.xq.dao.OrderDao;
import com.xq.dao.ParentCenterDao;
import com.xq.model.Demand;
import com.xq.model.Order;
import com.xq.model.Parent;
import com.xq.model.User;
import com.xq.service.ParentCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by joy12 on 2017/11/10.
 */
@Service
public class ParentCenterServiceImpl implements ParentCenterService {

    @Autowired
    ParentCenterDao parentCenterDao;
    @Autowired
    DemandDao demandDao;
    @Autowired
    OrderDao orderDao;

    public List<Demand> isexisted(HttpSession session, Integer teacheId) {
        User user=(User) session.getAttribute("USER");
        Parent parent=parentCenterDao.getParentByuserId(user.getId());
        if(parent==null){
            return null;
        }else{
            List<Demand> demandList=demandDao.getDemandByuserId(user.getId());
            for(Demand demand:demandList){
                //查询该订单的  需求简历   是不是第一次交易
                List<Order> orderList=orderDao.getOrder(demand.getId(),teacheId);
                if(orderList.size()>0){
                    demand.setFirst("no");
                }else{
                    demand.setFirst("yes");
                }
            }
            return demandList;
        }
    }
}