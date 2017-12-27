package com.xq.service.impl;

import com.xq.dao.DemandDao;
import com.xq.dao.MessageDao;
import com.xq.dao.TeacherCenterDao;
import com.xq.dto.ModifyPageDto;
import com.xq.dto.RecoveryHisDto;
import com.xq.model.*;
import com.xq.service.TeacherCenterService;
import com.xq.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by 86761 on 2017/11/10.
 */
@Service
public class TeacherCenterServiceImpl implements TeacherCenterService {
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
    public List<RecoveryLog> getRecoveryLogs(int demandId, int teacherId){
        return teacherCenterDao.getRecoveryLogs(demandId,teacherId);
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
    public ModifyPageDto getModifyDto(int objId, String fieldName) {

        if (getTeacherByUserId(objId) == null) teacherCenterDao.addTeacher(objId);
        Teacher teacher = getTeacherByUserId(objId);
        User user = getUserById(objId);
        switch (fieldName) {
            case "name":
                return new ModifyPageDto(teacher.getName(), fieldName, "姓名", objId);
            case "gender":
                return new ModifyPageDto(user.getGender() == 0 ? "男" : "女", fieldName, "性别",objId);
            case "phone":
                return new ModifyPageDto(user.getPhone(), fieldName, "手机", objId);
            case "email":
                return new ModifyPageDto(user.getEmail(), fieldName, "邮箱", objId);
            case "school":
                return new ModifyPageDto(teacher.getSchool(), fieldName, "毕业院校", objId);
            case "domain":
                return new ModifyPageDto(teacher.getDomain(), fieldName, "康复类型", objId);
            case "object":
                return new ModifyPageDto(teacher.getObject(), fieldName, "康复对象", objId);
            case "way":
                return new ModifyPageDto(teacher.getWay(), fieldName, "上门方式", objId);
            case "tGround":
                return new ModifyPageDto(teacher.gettGround(), fieldName, "治疗师上门区域", objId);
            case "sGround":
                return new ModifyPageDto(teacher.getsGround(), fieldName, "学生上门区域", objId);
            case "pid":
                return new ModifyPageDto(teacher.getPid(), fieldName, "身份证号", objId);
            default:
                return null;
        }
    }

    @Override
    @Transactional
    public void modifyFeild(int userId,String value,String fieldName){
        switch (fieldName) {
            case "name":
                teacherCenterDao.updateName(value, userId);
                break;
            case "gender":
                Integer integerValue = Integer.parseInt(value);
                teacherCenterDao.updateGender(integerValue, userId);
                break;
            case "phone":
                teacherCenterDao.updatePhone(value, userId);
                break;
            case "email":
                teacherCenterDao.updateEmail(value, userId);
                break;
            case "school":
                teacherCenterDao.updateSchool(value, userId);
                break;
            case "domain":
                teacherCenterDao.updateDomain(value, userId);
                break;
            case "object":
                teacherCenterDao.updateObject(value, userId);
                break;
            case "way":
                teacherCenterDao.updateWay(value, userId);
                break;
            case "tGround":
                teacherCenterDao.updateTGround(value, userId);
                break;
            case "sGround":
                teacherCenterDao.updateSGround(value, userId);
                break;
            case "pid":
                teacherCenterDao.updatePid(value, userId);
                break;
            case "successCase":
                teacherCenterDao.updateSuccessCase(value,userId);
                break;
        }
        teacherCenterDao.updateUserStatus(3, userId);
    }

    public void uploadPhoto(HttpServletRequest request, int userId){
        String picUrl="";
        MultipartHttpServletRequest MulRequest = request instanceof MultipartHttpServletRequest ? (MultipartHttpServletRequest) request : null;
        Iterator<String> fileNames = MulRequest.getFileNames();
        while(fileNames.hasNext()) { // 遍历请求中的信息
            String fileName = fileNames.next();

            //图片
            try {
                String path= FileUpload.uploadFile(MulRequest.getFile(fileName), request,FileUpload.ICON_TEACHER_ROOT_PATH);
                picUrl=path.substring(path.indexOf("img"),path.length());
                System.out.println(picUrl);
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
        teacherCenterDao.updateIcon(picUrl,userId);
    }
}
