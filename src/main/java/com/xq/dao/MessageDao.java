package com.xq.dao;

import com.xq.model.Message;

import java.util.List;

/**
 * Created by Administrator on 2017/8/13.
 */
public interface MessageDao {
    List<Message> getMessageByUid(Integer id);

    void addMessage(Message message);

    void addMessageAdmin(Message message);
}
