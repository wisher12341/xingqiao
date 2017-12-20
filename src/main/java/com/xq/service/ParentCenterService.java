package com.xq.service;


import com.xq.dto.ModifyPageDto;
import com.xq.dto.ParentInfoDto;
import com.xq.dto.RecoveryHisDto;
import com.xq.model.*;

import javax.servlet.http.HttpServletRequest;
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

    //int myInfoStatus(int userId);
    void fillInfo(ParentInfoDto parentInfoDto);

    void uploadPhoto(HttpServletRequest request,int userId);

}
