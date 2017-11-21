package com.xq.service.impl;

import com.xq.dao.DemandDao;
import com.xq.dao.MessageDao;
import com.xq.dao.TeacherCenterDao;
import com.xq.dto.RecoveryHisDto;
import com.xq.model.*;
import com.xq.service.TeacherCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
    @Autowired
    DemandDao demandDao;

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
    public List<Demand> getDemands(int teacherId){
        return teacherCenterDao.getDemandsByTeacherId(teacherId);
    }

    @Override
    public Demand getDemandDetail(int demandId){
        return demandDao.getDemandById(demandId);
    }

    @Override
    public List<RecoveryLog> getRecoveryLogs(int demandId,int teacherId){
        return teacherCenterDao.getRecoveryLogs(demandId,teacherId);
    }

    @Override
    public List<RecoveryHisDto> getRecoveryHisList(String recoveryHis){
        List<RecoveryHisDto> recoveryHisDtos=new ArrayList<RecoveryHisDto>();
        String[] strs=recoveryHis.split("@");
        for(int i=0;i<strs.length;i++){
            String[] feilds=strs[i].split("#");
            RecoveryHisDto recoveryHisDto=new RecoveryHisDto(i,feilds[0],feilds[1],feilds[2],feilds[3]);
            recoveryHisDtos.add(recoveryHisDto);
        }
        return recoveryHisDtos;
    }
}
