package com.xq.service.impl;

import com.xq.dao.*;
import com.xq.dto.TeacherDto;
import com.xq.model.*;
import com.xq.service.ParentCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 86761 on 2017/11/5.
 */
@Service
public class ParentCenterServiceImpl implements ParentCenterService {
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

    @Override
    public void modifyParentInfo(int userId,String value,String fieldName){
        if(fieldName.equals("realName")) parentCenterDao.updateRealName(value,userId);

    }
}
