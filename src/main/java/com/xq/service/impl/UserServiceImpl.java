package com.xq.service.impl;

import com.xq.dao.UserDao;
import com.xq.model.User;
import com.xq.service.UserService;
import com.xq.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by netlab606 on 2017/11/17.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public User getUserByOpenid(String openid) {
        return userDao.getUserByOpenid(openid);
    }

    @Override
    public Boolean checkUserByOpenid(String openid, HttpServletResponse response, String type) {
        User user=userDao.getUserByOpenid(openid);
        if(user==null){
            return false;
        }else{
            String key=type.equals("parent")?Const.OPENID_PARENT:Const.OPENID_TEACHER;
            // 保存用openid到cookie
            Cookie cookie = new Cookie(key,openid);
            // 设置过期时间，以秒为单位  设为100个星期
            cookie.setMaxAge(60 * 60 * 24 * 7 * 100);
            // cookie有效路径是网站根目录
            cookie.setPath("/");
            // 向客户端写入
            response.addCookie(cookie);
            return true;
        }
    }

    @Override
    public Boolean checkLogin(User user, HttpServletRequest request, HttpServletResponse response) {
        User user_re = userDao.findUserByName(user.getUsername());
        if (user_re == null) {
            return false;
        }else {
            if (user_re.getPassword().equals(user.getPassword())) {
                user_re.setOpenid(user.getOpenid());
                userDao.addOpenid(user_re);

                // 保存用openid到cookie
                Cookie cookie = new Cookie(Const.OPENID_PARENT,user.getOpenid());
                // 设置过期时间，以秒为单位  设为100个星期
                cookie.setMaxAge(60 * 60 * 24 * 7 * 100);
                // cookie有效路径是网站根目录
                cookie.setPath("/");
//                cookie.setDomain("www.lj-service.com");
                // 向客户端写入
                response.addCookie(cookie);
//                WxSystemController.logger.info("5");
                return true;
            }else {
//                WxSystemController.logger.info("6");
                return false;
            }
        }
    }


}
