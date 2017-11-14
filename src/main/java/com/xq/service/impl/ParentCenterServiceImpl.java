package com.xq.service.impl;


import com.xq.dao.*;
import com.xq.dto.TeacherDto;
import com.xq.model.Demand;
import com.xq.model.Parent;
import com.xq.model.Teacher;

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

import com.xq.model.Message;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 86761 on 2017/11/5.
 */
@Service
public class ParentCenterServiceImpl implements ParentCenterService{


    @Autowired
    ParentCenterDao parentCenterDao;
    @Autowired
    DemandDao demandDao;
    @Autowired
    TeacherDao teacherDao;
    @Autowired
    UserDao userDao;
    @Autowired
    MessageDao messageDao;

    @Override
    public Parent getParentByUserId(int userId){
        return parentCenterDao.getParentByUserId(userId);
    }

    @Override
    public List<Demand> getDemands(int userId){
        return demandDao.getDemandByUserId(userId);
    }

    @Override
    public List<Teacher> getTeachersByParent(int userId){
        return teacherDao.getTeachersByUserId(userId);
    }

    @Override
    public TeacherDto getTeacherDetail(int teacherId){
        Teacher teacher=teacherDao.getTeacher(teacherId);
        TeacherDto teacherDto=new TeacherDto(teacher);
        System.out.println("userId:" +teacher.getUserId());
        User user=userDao.getUserById(teacher.getUserId());
        if(user==null){ System.out.println("user空");}
        else{
        teacherDto.setHeadimgurl(user.getHeadimgurl());
        }
        return teacherDto;
    }

    @Override
    public Demand getDemandDetail(int demandId){
        return demandDao.getDemandById(demandId);
    }

    @Override
    public List<Message> getMessagesByUserId(int userId){
        return messageDao.getMessagesByUserId(userId);
    }

    @Override
    public User getUserById(int userId){
        return userDao.getUserById(userId);
    }

    @Override
    public String getUserNameById(int userId){
        return parentCenterDao.getUserNameById(userId);
    }


    OrderDao orderDao;

    public List<Demand> isexisted(HttpSession session, Integer teacheId) {
        User user=(User) session.getAttribute("USER");
        Parent parent=parentCenterDao.getParentByUserId(user.getId());
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

