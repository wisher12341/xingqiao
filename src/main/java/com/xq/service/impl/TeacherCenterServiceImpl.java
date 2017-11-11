package com.xq.service.impl;

import com.xq.dao.MessageDao;
import com.xq.dao.TeacherCenterDao;
import com.xq.model.Demand;
import com.xq.model.Message;
import com.xq.model.Teacher;
import com.xq.model.User;
import com.xq.service.TeacherCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 86761 on 2017/11/10.
 */
@Service
public class TeacherCenterServiceImpl implements TeacherCenterService{
    @Autowired
TeacherCenterDao teacherCenterDao;
    @Autowired
    MessageDao messageDao;
    @Override
    public String getNameByUserId(int userId){
        return teacherCenterDao.getNameByUserId(userId);
    }

    @Override
    public User getUserById(int userId){
        return teacherCenterDao.getUserById(userId);
    }

    @Override
    public Teacher getTeacherByUserId(int userId){
        return teacherCenterDao.getTeacherByUserId(userId);
    }

    @Override
    public List<Message> getMessagesByUserId(int userId){
        return messageDao.getMessagesByUserId(userId);
    }

    @Override
    public List<Demand> getDemands(int userId){
        return teacherCenterDao.getDemandsByTeacherUserId(userId);
    }
}
