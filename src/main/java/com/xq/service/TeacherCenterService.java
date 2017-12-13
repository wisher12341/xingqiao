package com.xq.service;

import com.xq.dto.ModifyPageDto;
import com.xq.dto.RecoveryHisDto;
import com.xq.model.*;

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
}
