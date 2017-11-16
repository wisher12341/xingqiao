package com.xq.service.impl;


import com.xq.dao.*;
import com.xq.dto.TeacherDto;

import com.xq.model.Demand;
import com.xq.model.Parent;
import com.xq.model.Teacher;

import com.xq.dao.DemandDao;
import com.xq.dao.OrderDao;
import com.xq.dao.ParentCenterDao;
import com.xq.model.Order;


import com.xq.model.User;
import com.xq.service.ParentCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xq.model.Message;

import javax.servlet.http.HttpSession;

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
    @Autowired
    OrderDao orderDao;

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



    public List<Demand> isexisted(HttpSession session, Integer teacheId) {
        User user = (User) session.getAttribute("USER");
        Parent parent = parentCenterDao.getParentByUserId(user.getId());
        if (parent == null) {
            return null;
        } else {
            List<Demand> demandList = demandDao.getDemandByuserId(user.getId());
            for (Demand demand : demandList) {
                //查询该订单的  需求简历   是不是第一次交易
                List<Order> orderList = orderDao.getOrder(demand.getId(), teacheId);
                if (orderList.size() > 0) {
                    demand.setFirst("no");
                } else {
                    demand.setFirst("yes");
                }
            }
            return demandList;
        }
    }

    @Override
    public void modifyParentInfo(int userId,String value,String fieldName){
        if(fieldName.equals("realName")) parentCenterDao.updateRealName(value,userId);
        else if(fieldName.equals("phone")) parentCenterDao.updatePhone(value,userId);
        else if(fieldName.equals("email")) parentCenterDao.updateEmail(value,userId);
        else if(fieldName.equals("pid")) parentCenterDao.updatePid(value,userId);
        else if(fieldName.equals("ground")) {
            String[] values=value.split(" ");
            parentCenterDao.updateGroundAndAddr(values[0],values[1],userId);
        }
        else if(fieldName.equals("gender")) {
            if(value.equals("0")) parentCenterDao.updateGender(0,userId);
            else  parentCenterDao.updateGender(1,userId);
        }

    }

    @Override
    public void modifyDemand(int demandId,String newValue,String fieldName){
        if(fieldName.equals("name")) demandDao.updateName(newValue,demandId);
        else if(fieldName.equals("gender")){
            if(newValue.equals("0")) demandDao.updateGender(0,demandId);
            else demandDao.updateGender(1,demandId);
        }
        else if(fieldName.equals("birthday")) demandDao.updateBirthday(newValue,demandId);
        else if(fieldName.equals("diseaseHis")) demandDao.updateDiseaseHis(newValue,demandId);
        else if(fieldName.equals("allergyHis")) demandDao.updateAllergyHis(newValue,demandId);
        else if(fieldName.equals("report")) demandDao.updateReport(newValue,demandId);
        else if(fieldName.equals("remark")) demandDao.updateRemark(newValue,demandId);

    }
}

