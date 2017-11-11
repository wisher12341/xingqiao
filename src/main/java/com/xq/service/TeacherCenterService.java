package com.xq.service;

import com.xq.model.Demand;
import com.xq.model.Message;
import com.xq.model.Teacher;
import com.xq.model.User;

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

   List<Demand> getDemands(int userId);

   List<Message> getMessagesByUserId(int userId);

}
