package com.xq.dao;

import com.xq.model.Message;
import java.util.List;

/**
 * Created by 86761 on 2017/11/8.
 */
public interface MessageDao {
    List<Message> getMessagesByUserId(int userId);

    void addMessage(Message messageT);


    void addMessageAdmin(Message message);
    void deleteMessage(int messageId);
}
