package com.xq.service;

import com.xq.dto.TeacherDto;
import com.xq.model.*;

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
}
