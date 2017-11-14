package com.xq.dao;

import com.xq.model.Parent;
import com.xq.model.Teacher;
import org.apache.ibatis.annotations.Param;


import java.util.List;

/**
<<<<<<< HEAD
 * Created by 86761 on 2017/11/5.
 */
public interface ParentCenterDao {
    Parent getParentByUserId(@Param(value="userId") int userId);

    String getUserNameById(int userId);

}
