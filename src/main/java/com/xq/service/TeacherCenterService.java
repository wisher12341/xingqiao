package com.xq.service;

import com.xq.dto.*;
import com.xq.model.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

/**
 * Created by 86761 on 2017/11/10.
 */
public interface TeacherCenterService {
   /**
    * 个人中心
    */
   String getNameByUserId(int userId);

   User getUserById(int userId);

   Teacher getTeacherByUserId(int userId);

   List<Demand> getDemands(int teacherId);

   List<Message> getMessagesByUserId(int userId);

   Demand getDemandDetail(int demandId);

   List<RecoveryLog> getRecoveryLogs(int demandId, int userId);

   List<RecoveryHisDto> getRecoveryHisList(String recoveryHis);

   ModifyPageDto getModifyDto(int objId, String fieldName);

   void modifyFeild(int userId, String value, String fieldName);

   void uploadPhoto(HttpServletRequest request, int userId);

    TeacherInfoAuthentication getTeacherInfoAuthenticationByUid(Integer userId);

    Object getInfoByTypeName(int uid, String type,String string);

    void addComplexInfo(int uid, String type, String title, String detail, String picUrls, TeacherInfoSchool teacherInfoSchool, TeacherInfoRecoveryHis teacherInfoRecoveryHis);

    void editComplexInfo(int uid, String type, int index, String title, String detail, String picUrls, String deleteExitImg, TeacherInfoSchool teacherInfoSchool, TeacherInfoRecoveryHis teacherInfoRecoveryHis);

    Object getInfoByTypeNameIndex(int uid, String type, int index);

    String addInfoImg(HttpServletRequest request);

    Work getWorkByUid(Integer userId);

    WorkDayDto getDayWorkByUid(Integer uid, String date) throws ParseException;

    Teacher getTeacherInfoByUid(Integer uid, String type);

    void editServiceInfo(Teacher teacher);

    Teacher getTeacherWayByUserId(Integer uid, String type);

    void editServiceInfoWay(Integer uid, String type, Teacher teacher, String area1, String area2, String ctype);

    void addSchedule(Integer uid, String week, String time) throws ParseException;

    void delSchedule(Integer uid, String time) throws ParseException;

    void editIdCard(MultipartFile peoplePidUrl, MultipartFile pidUrlBack, MultipartFile pidUrlFront, Integer uid, HttpServletRequest request);

    Teacher getIdCardByUid(Integer uid);
}
