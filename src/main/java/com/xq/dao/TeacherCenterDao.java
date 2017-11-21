package com.xq.dao;

import com.xq.model.Demand;
import com.xq.model.RecoveryLog;
import com.xq.model.Teacher;
import com.xq.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 86761 on 2017/11/10.
 */
public interface TeacherCenterDao {
    List<Demand> getDemandsByTeacherId(int teacherId);
    String getNameByUserId(int userId);
    User getUserById(int userId);
    Teacher getTeacherByUserId(int userId);
    List<RecoveryLog> getRecoveryLogs(@Param("demandId") int demandId,@Param("teacherId") int teacherId);
}
