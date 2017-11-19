package com.xq.service;


import com.xq.dto.RecoveryHisDto;
import com.xq.dto.TeacherDto;
import com.xq.model.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 86761 on 2017/11/5.
 */
public interface ParentCenterService {
    Parent getParentByUserId(int userId);

    List<Demand> getDemands(int userId);

    List<Teacher> getTeachersByParent(int userId);

    TeacherDto getTeacherDetail(int teacherId);

    Demand getDemandDetail(int demandId);

    List<Message> getMessagesByUserId(int userId);

    User getUserById(int userId);

    String getUserNameById(int userId);


    List<Demand> isexisted(HttpSession session, Integer teacheId);

    void modifyFeild(int objId,String newValue,String fieldName,String table);

    void modifyParentInfo(int userId, String value, String fieldName);

    void modifyDemand(int demandId,String newValue,String fieldName);

    List<RecoveryHisDto> getRecoveryHisList(String recoveryHis);

    void addRecoveryHis(RecoveryHisDto recoveryHisDto,int demandId);

    void modifyRecoveryHis(RecoveryHisDto recoveryHisDto,int demandId);

}
