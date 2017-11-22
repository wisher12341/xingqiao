package com.xq.service.impl;


import com.xq.dao.*;
import com.xq.dto.RecoveryHisDto;

import com.xq.model.*;

import com.xq.dao.DemandDao;
import com.xq.dao.OrderDao;
import com.xq.dao.ParentCenterDao;


import com.xq.service.ParentCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Arrays;
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
    public Teacher getTeacherDetail(int teacherId){
        Teacher teacher=teacherDao.getTeacherDetail(teacherId);
        return teacher;
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
    public void modifyFeild(int objId,String newValue,String fieldName,String table){
        if(table.equals("parent")) modifyParentInfo(objId,newValue, fieldName);
        else if(table.equals("demand")) modifyDemand(objId,newValue,fieldName);
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

        parentCenterDao.updateUserStatus(3,userId);

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

    @Override
    public List<RecoveryHisDto> getRecoveryHisList(String recoveryHis){
        if(recoveryHis==null) return null;
        List<RecoveryHisDto> recoveryHisDtos=new ArrayList<RecoveryHisDto>();
        String[] strs=recoveryHis.split("@");
        for(int i=0;i<strs.length;i++){
            String[] feilds=strs[i].split("#");
            RecoveryHisDto recoveryHisDto=new RecoveryHisDto(i,feilds[0],feilds[1],feilds[2],feilds[3]);
            recoveryHisDtos.add(recoveryHisDto);
        }
        return recoveryHisDtos;
    }

    @Override
    public void addRecoveryHis(RecoveryHisDto recoveryHisDto,int demandId){
        String recoveryHisStr=demandDao.getRecoveryHis(demandId);
        String newRecoveryHis="@"+recoveryHisDto.getName()+"#"+recoveryHisDto.getTime()+"#"+recoveryHisDto.getCount()+"#"+recoveryHisDto.getDetail();
        recoveryHisStr+=newRecoveryHis;
        demandDao.updateRecoveryHis(recoveryHisStr,demandId);
    }

    @Override
    public void modifyRecoveryHis(RecoveryHisDto recoveryHisDto,int demandId){
        String recoveryHisStr=demandDao.getRecoveryHis(demandId);
        List<String> strs= Arrays.asList(recoveryHisStr.split("@"));
        String newRecoveryHis=recoveryHisDto.toFeildStr();
        for(int j=0;j<strs.size();j++){
            System.out.println(strs.get(j));
        }
        strs.set(recoveryHisDto.getIndex(),newRecoveryHis);
        StringBuilder stringBuilder=new StringBuilder();
        for(int i=0;i<strs.size()-1;i++){
            stringBuilder.append(strs.get(i));
            stringBuilder.append("@");
        }
        stringBuilder.append(strs.get(strs.size()-1));
        demandDao.updateRecoveryHis(stringBuilder.toString(),demandId);
    }

    @Override
    public void addDemand( int userId,String name,int gender,String birthday,String report,String diseaseHis,
                    String allergyHis,String remark){
        demandDao.addDemand(userId,name,gender,birthday,report,diseaseHis,allergyHis,remark);
    }
}

