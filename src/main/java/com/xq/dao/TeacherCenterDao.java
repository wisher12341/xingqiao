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
    List<RecoveryLog> getRecoveryLogs(@Param("demandId") int demandId, @Param("teacherId") int teacherId);
    void addTeacher(int userId);

    void updateName(@Param("name") String name, @Param("userId") int userId);
    void updateGender(@Param("gender") Integer gender, @Param("userId") int userId);
    void updatePhone(@Param("phone") String phone, @Param("userId") int userId);
    void updateEmail(@Param("email") String email, @Param("userId") int userId);
    void updateSchool(@Param("school") String school, @Param("userId") int userId);
    void updateDomain(@Param("domain") String domain, @Param("userId") int userId);
    void updateObject(@Param("object") String object, @Param("userId") int userId);
    void updateWay(@Param("way") String way, @Param("userId") int userId);
    void updateTGround(@Param("tGround") String tGround, @Param("userId") int userId);
    void updateSGround(@Param("sGround") String sGround, @Param("userId") int userId);
    void updatePid(@Param("pid") String pid, @Param("userId") int userId);
    void updateSuccessCase(@Param("successCase") String successCase, @Param("userId") int userId);

    void updateUserStatus(@Param("status") int status, @Param("userId") int userId);
    void updateIcon(@Param("headimgurl") String headimgurl, @Param("userId") int userId);

    String getInfoByTypeName(@Param("uid") int uid, @Param("type") String type);

    void updateComplexInfo(@Param("type") String t, @Param("data") String data,@Param("uid") int uid);

    void addComplexInfo(@Param("type") String t, @Param("data") String data,@Param("uid") int uid);

    Teacher getTeacherInfoByUid(@Param("uid") Integer uid,@Param("types") String[] type);

    void editServiceInfo(Teacher teacher);

    void editServiceInfoWay(Teacher teacher);

    void editIdCard(@Param("p1") String path1, @Param("p2") String path2, @Param("p3") String path3,@Param("uid") Integer uid);
}
