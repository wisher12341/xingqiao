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
}
