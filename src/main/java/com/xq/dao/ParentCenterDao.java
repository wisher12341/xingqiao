package com.xq.dao;

import com.xq.model.Parent;
import org.apache.ibatis.annotations.Param;

/**
 * Created by 86761 on 2017/11/5.
 */
public interface ParentCenterDao {
    Parent getParentByUserId(@Param(value = "userId") int userId);

    String getUserNameById(int userId);


    void updateRealName(@Param("realName") String realName, @Param("userId") int userId);

    void updatePhone(@Param("phone") String phone, @Param("userId") int userId);
    void updateEmail(@Param("email") String email, @Param("userId") int userId);
    void updatePid(@Param("pid") String pid, @Param("userId") int userId);
    void updateGroundAndAddr(@Param("ground") String ground, @Param("address") String address, @Param("userId") int userId);
    void updateGender(@Param("gender") int gender, @Param("userId") int userId);

    void updateUserStatus(@Param("status") int status, @Param("userId") int userId);

    void addParent(@Param("userId") int userId);

    }
