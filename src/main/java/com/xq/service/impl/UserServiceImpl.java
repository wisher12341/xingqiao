package com.xq.service.impl;

import com.xq.dao.GoodReportDao;
import com.xq.dao.TeacherCenterDao;
import com.xq.dao.UserDao;
import com.xq.model.User;
import com.xq.service.UserService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

/**
 * Created by netlab606 on 2017/11/17.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Autowired
    GoodReportDao goodReportDao;
    @Autowired
    TeacherCenterDao teacherCenterDao;

    @Override
    public User getUserByOpenid(String openid) {
        return userDao.getUserByOpenid(openid, "0");
    }

    @Override
    public Boolean checkUserByOpenid(String openid, HttpServletResponse response, String type) {
        String status=type.equals("parent")?"0":"1";
        User user=userDao.getUserByOpenidStatus(openid,status);
        if(user==null){
            return false;
        }else{
            String key=type.equals("parent")? Const.OPENID_PARENT: Const.OPENID_TEACHER;
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
                String op=user.getStatus()==0? Const.OPENID_PARENT: Const.OPENID_TEACHER;
                // 保存用openid到cookie
                Cookie cookie = new Cookie(op,user.getOpenid());
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

    @Override
    public User getUserByOpenidStatus(String openid, String s) {
        return userDao.getUserByOpenidStatus(openid,s);
    }

    @Override
    @Transactional
    public User regTeacher(User user, HttpServletResponse response) {
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        user.setTime(dateNowStr);
        user.setStatus(1);
        user.setUserStatus(0);
        userDao.register(user);
        teacherCenterDao.saveNewTeacher(user.getId());

        Cookie cookie = new Cookie(Const.OPENID_TEACHER,user.getOpenid());
        cookie.setMaxAge(60 * 60 * 24 * 7 * 100);
        cookie.setPath("/");
        response.addCookie(cookie);
        return user;
    }

    @Override
    public User bindAccount(User user) {
        userDao.bindAccount(user);
        User user_re=userDao.getUserByOpenid(user.getOpenid(),"0");
        return user_re;
    }

    @Override
    public void changeAccount(String openid, HttpServletResponse response, int status) {
        String key=status==0? Const.OPENID_PARENT: Const.OPENID_TEACHER;
        // 删除cookie
        Cookie cookie = new Cookie(key,"no");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        // 向客户端写入
        response.addCookie(cookie);
        userDao.clearOpenid(openid,status);
    }


    @Override
    public void setUserStatusDesc(User user) {
        switch (user.getUserStatus()){
            case 0:
                user.setUserStatusDesc("请完善下个人资料，待审核通过后才可下预约单");
                break;
            case 1:
            case 3:
                user.setUserStatusDesc("您的资料正在审核中，待审核通过后才可下预约单");
                break;
            case 4:
                user.setUserStatusDesc("您的资料审核不通过，请重新填写，审核通过后才可下预约单");
                break;
        }
    }

    @Override
    public User getUserByUid(Integer uid) {
        return userDao.getUserByUid(uid);
    }

    @Override
    public void changePassword(HttpServletRequest request, String password, String type) {
        String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
//        String openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        userDao.changePassword(openid,type,password);
    }

    @Override
    public void changeUserStatus(Integer userStatus, String openid, String type) {
        userDao.changeUserStatusByOpenid(openid,userStatus,type);
    }
}
