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

    void updateName(@Param("name") String name,@Param("userId") int userId);
    void updateGender(@Param("gender") Integer gender,@Param("userId") int userId);
    void updatePhone(@Param("phone") String phone,@Param("userId") int userId);
    void updateEmail(@Param("email") String email,@Param("userId") int userId);
    void updateSchool(@Param("school") String school,@Param("userId") int userId);
    void updateDomain(@Param("domain") String domain,@Param("userId") int userId);
    void updateObject(@Param("object") String object,@Param("userId") int userId);
    void updateWay(@Param("way") String way,@Param("userId") int userId);
    void updateTGround(@Param("tGround") String tGround,@Param("userId") int userId);
    void updateSGround(@Param("sGround") String sGround,@Param("userId") int userId);
    void updatePid(@Param("pid") String pid,@Param("userId") int userId);

    void updateUserStatus(@Param("status") int status,@Param("userId") int userId);

}
