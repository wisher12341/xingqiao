package com.xq.service.impl;

import com.xq.dao.MessageDao;
import com.xq.model.Message;
import com.xq.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    MessageDao messageDao;

    @Override
    public Message getInfromById(Integer mid) {
        Message message=messageDao.getMessagesByMid(mid);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        if(message.getTime().split(" ")[0].equals(dateNowStr)){
            message.setTime(message.getTime().split(" ")[1]);
        }else{
            message.setTime(message.getTime().split(" ")[0]);
        }
        return message;
    }

    @Override
    public void delMessageByMid(Integer mid) {
        messageDao.deleteMessage(mid);
    }
}
