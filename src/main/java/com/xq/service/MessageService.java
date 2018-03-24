package com.xq.service;

import com.xq.model.Message;

public interface MessageService {
    Message getInfromById(Integer mid);

    void delMessageByMid(Integer mid);
}
