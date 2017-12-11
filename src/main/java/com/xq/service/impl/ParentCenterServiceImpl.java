package com.xq.service.impl;


import com.xq.dao.*;
import com.xq.dto.ModifyPageDto;
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
    public ModifyPageDto getModifyDto(int objId, String fieldName, String table){
        if(table.equals("parent")){
            if(getParentByUserId(objId)==null) {
                parentCenterDao.addParent(objId);
            }
            Parent parent=getParentByUserId(objId);
            switch (fieldName){
                case "realName":
                    return new ModifyPageDto(parent.getRealName(), fieldName, "姓名", objId,table);
                case "pid":
                    return new ModifyPageDto(parent.getPid(), fieldName, "身份证号", objId,table);
                case "ground":
                    return new ModifyPageDto(parent.getGround()+"_"+parent.getAddress(), fieldName, "地址", objId,table);
                default:
                    return null;
            }
        }
        else if(table.equals("user")){
            User user=getUserById(objId);
            switch (fieldName){
                case "phone":
                    return new ModifyPageDto(user.getPhone(), fieldName, "手机", objId,table);
                case "email":
                    return new ModifyPageDto(user.getEmail(), fieldName, "邮箱", objId,table);
                case "gender":
                    return new ModifyPageDto(user.getGender()==0?"男":"女", fieldName, "邮箱", objId,table);
                default:
                    return null;
            }
        }
        else if(table.equals("demand")){
            Demand demand=getDemandDetail(objId);
            switch (fieldName){
                case "name":
                    return new ModifyPageDto(demand.getName(),fieldName,"姓名",objId,table);
                case "birthday":
                    return new ModifyPageDto(demand.getBirthday(),fieldName,"出生日期",objId,table);
                case "report":
                    return new ModifyPageDto(demand.getReport(),fieldName,"诊断报告",objId,table);
                case "diseaseHis":
                    return new ModifyPageDto(demand.getDiseaseHis(),fieldName,"病史",objId,table);
                case "allergyHis":
                    return new ModifyPageDto(demand.getAllergyHis(),fieldName,"过敏史",objId,table);
                case "remark":
                    return new ModifyPageDto(demand.getRemark(),fieldName,"备注",objId,table);
                default:
                    return null;
            }
        }
        else
            return null;
    }

    @Override
    public void modifyFeild(int objId,String newValue,String fieldName,String table){
        switch (table) {
            case "parent":
                modifyParent(objId, newValue, fieldName);
            case "user":
                modifyUser(objId, newValue, fieldName);
            case "demand":
                modifyDemand(objId, newValue, fieldName);
        }
    }

    private void modifyUser(int userId,String value,String fieldName){
        switch (fieldName){
            case "phone":
                parentCenterDao.updatePhone(value,userId);
                break;
            case "email":
                parentCenterDao.updateEmail(value,userId);
                break;
            case "gender":
                if(value.equals("0")) parentCenterDao.updateGender(0,userId);
                else  parentCenterDao.updateGender(1,userId);
                break;
         }
        parentCenterDao.updateUserStatus(3,userId);
    }


    private void modifyParent(int userId,String value,String fieldName){

        switch(fieldName){
            case "realName":
                parentCenterDao.updateRealName(value,userId);
                break;
            case "pid":
                parentCenterDao.updatePid(value,userId);
                break;
            case "ground":
                String[] values=value.split("_");
                parentCenterDao.updateGroundAndAddr(values[0],values[1],userId);
                break;
        }
        parentCenterDao.updateUserStatus(3,userId);
    }

    private void modifyDemand(int demandId,String newValue,String fieldName) {
        switch (fieldName) {
            case "name":
                demandDao.updateName(newValue, demandId);
                break;
            case "gender":
                if (newValue.equals("0")) demandDao.updateGender(0, demandId);
                else demandDao.updateGender(1, demandId);
                break;
            case "birthday":
                demandDao.updateBirthday(newValue, demandId);
                break;
            case "diseaseHis":
                demandDao.updateDiseaseHis(newValue, demandId);
            case "allergyHis":
                demandDao.updateAllergyHis(newValue, demandId);
            case "report":
                demandDao.updateReport(newValue, demandId);
            case "remark":
                demandDao.updateRemark(newValue, demandId);
        }
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

    @Override
    public int myInfoStatus(int userId){ //0.未完成 1.审核中 2.完成
        User user=getUserById(userId);
        if(user.getUserStatus()==0) return 0;
        else if(user.getUserStatus()==1) return 1;
        if(user.getPhone()==null || user.getEmail()==null || user.getGender() ==null){
            return 0;
        }
        Parent parent=getParentByUserId(userId);
        if(parent==null) return 0;
        else if(parent.getAddress()==null || parent.getGround()==null || parent.getPid()==null){
            return 0;
        }
        return 2;
    }
}

