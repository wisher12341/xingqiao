package com.xq.service;


import com.xq.dto.*;
import com.xq.model.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

/**
 * Created by 86761 on 2017/11/5.
 */
public interface ParentCenterService {
    Parent getParentByUserId(int userId);

    List<Demand> getDemands(int userId);

    List<Teacher> getTeachersByParent(int userId);

    Teacher getTeacherDetail(int teacherId);

    Demand getDemandDetail(int demandId);

    List<Message> getMessagesByUserId(int userId);

    void deleteMessage(int messageId);

    User getUserById(int userId);

    String getUserNameById(int userId);


    List<Demand> isexisted(HttpServletRequest request, Integer teacheId);

    ModifyPageDto getModifyDto(int userId, String fieldName, String table);

    void modifyFeild(int objId, String newValue, String fieldName, String table);

    List<RecoveryHisDto> getRecoveryHisList(String recoveryHis);

    void addRecoveryHis(RecoveryHisDto recoveryHisDto, int demandId);

    void modifyRecoveryHis(RecoveryHisDto recoveryHisDto, int demandId);

    void addDemand(int userId, String name, int gender, String birthday, String report, String diseaseHis,
                   String allergyHis, String remark);

    void deleteDemand(int demandId);

    //int myInfoStatus(int userId);
    void fillInfo(ParentInfoDto parentInfoDto);

    void uploadPhoto(HttpServletRequest request,int userId);

    void allInformRead(HttpServletRequest request);

    PCommentsDto getCommentsByUserId(Integer userId);

    TeacherInfoEdit myInfoEdit(String ftype, String ctype, String value, Integer userStatus);

    Parent getIdCardByUid(Integer uid);

    Work getWorkByUid(Integer userId);

   WorkDayDto getDayWorkByUid(Integer uid, String date) throws ParseException;

    void changeInfo(Parent parent);

    Result checkAccountReg(Integer uid);

    List<Message> getInformMessageByPage(HttpServletRequest request, Integer page);
}
