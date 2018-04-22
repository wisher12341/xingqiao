package com.xq.dao;

import com.xq.model.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 86761 on 2017/11/8.
 */
public interface MessageDao {
    List<Message> getMessagesByUserId(int userId);

    void addMessage(Message messageT);


    void addMessageAdmin(Message message);
    void deleteMessage(int messageId);

    List<Message> getReadInformByUid(@Param("uid") int uid, @Param("start") int s);

    List<Message> getNoReadInformByUid(int uid);

    void allInformRead(Integer id);

    Message getMessagesByMid(Integer mid);

    int getNoReadInformCountByUid(Integer id);
}
