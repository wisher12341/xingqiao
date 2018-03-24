package com.xq.service.impl;


import com.xq.dao.UserDao;
import com.xq.model.User;
import com.xq.service.SmsService;
import com.xq.sms.SMSParam;
import com.xq.sms.SMSUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Random;

/**
 * Created by netlab606 on 2017/10/20.
 */
@Service
public class SmsServiceImpl implements SmsService {

    @Autowired
    UserDao userDao;

    @Override
    public String getNumber(String phone, String type) {
        if(type.equals("login")) {
            User user = userDao.findUserByName(phone);
            if (user != null) {
                //手机号已注册
                return null;
            }
        }

        Random random = new Random();
        String number="";
        for(int i=0;i<4;i++){
            number+=random.nextInt(10);
        }
        SMSParam smsParam=new SMSParam();
        smsParam.setNumber(number);
        String result="";
        try {
            result= SMSUtil.sendMsg(phone,smsParam);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return number+"";
    }
}
