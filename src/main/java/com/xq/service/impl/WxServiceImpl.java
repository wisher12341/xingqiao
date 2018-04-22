package com.xq.service.impl;

import com.alibaba.fastjson.JSON;
import com.xq.dao.GoodReportDao;
import com.xq.dao.ParentCenterDao;
import com.xq.dao.UserDao;
import com.xq.interceptor.WxInterceptor;
import com.xq.model.User;
import com.xq.model.WxUserInfo;
import com.xq.service.UserService;
import com.xq.service.WxService;
import com.xq.util.Const;
import com.xq.util.HttpRequestor;
import com.xq.wxpay.config.WxConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.TimeZone;

/**
 * Created by netlab606 on 2017/11/17.
 */
@Service
public class WxServiceImpl implements WxService{

    @Autowired
    UserDao userDao;
    @Autowired
    GoodReportDao goodReportDao;
    @Autowired
    ParentCenterDao parentCenterDao;

    public String getOpenId(String code) {
        String appid= WxConfig.APPID;
        String secret = WxConfig.APPSECRET;
        String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appid + "&secret=" + secret + "&code=" + code + "&grant_type=authorization_code";
        String  json="";
//        WxInterceptor.logger.info(code);
        try {
            json = new HttpRequestor().doGet(requestUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        WxInterceptor.logger.info(json);
//        json="{'dsad':'dasdsa','dsfsa':'cdsvs','openid':'3543csdcuuwd89','cds':'cdcs'}";
        int start=json.indexOf("openid")+9;
        int end=json.indexOf(",",start)-1;
        String openid=json.substring(start,end);//提取openid

        return  openid;
    }

    @Override
    @Transactional
    public WxUserInfo getUserInfo(HttpServletRequest request, HttpServletResponse response) {
        String code = request.getParameter("code");
        String appid= WxConfig.APPID;
        String secret = WxConfig.APPSECRET;
        String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appid + "&secret=" + secret + "&code=" + code + "&grant_type=authorization_code";
        String  json="";
        try {
            json = new HttpRequestor().doGet(requestUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        WxInterceptor.logger.info(json);
//        json="{'dsad':'dasdsa','dsfsa':'cdsvs','openid':'3543csdcuuwd89','cds':'cdcs'}";
        int start=json.indexOf("openid")+9;
        int end=json.indexOf(",",start)-1;
        String openid=json.substring(start,end);//提取openid
        int start_acc=json.indexOf("access_token")+15;
        int end_acc=json.indexOf(",",start_acc)-1;
        String access_token=json.substring(start_acc,end_acc);//提取access_token
        String infoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
        String  info="";
        try {
            info = new HttpRequestor().doGet(infoUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        WxInterceptor.logger.info(info);
        Map mapTypes = JSON.parseObject(info);
        WxUserInfo wxUserInfo=new WxUserInfo();
        wxUserInfo.setHeadimgurl((String) mapTypes.get("headimgurl"));
        wxUserInfo.setNickname((String) mapTypes.get("nickname"));
        Integer sex= (Integer) mapTypes.get("sex");
        //微信是 1男2女  系统是0男1女
        if(sex==1){
            sex=0;
        }else{
            sex=1;
        }
        wxUserInfo.setSex(sex.toString());
        wxUserInfo.setOpenid((String) mapTypes.get("openid"));

        // 保存用openid到cookie
        Cookie cookie = new Cookie(Const.OPENID_PARENT,wxUserInfo.getOpenid());
        // 设置过期时间，以秒为单位  设为100个星期
        cookie.setMaxAge(60 * 60 * 24 * 7 * 100);
        // cookie有效路径是网站根目录
        cookie.setPath("/");
//                cookie.setDomain("www.lj-service.com");
        // 向客户端写入
        response.addCookie(cookie);

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        wxUserInfo.setTime(dateNowStr);

        User user=new User();
        user.setNickname(wxUserInfo.getNickname());
        user.setHeadimgurl(wxUserInfo.getHeadimgurl());
        user.setOpenid(wxUserInfo.getOpenid());
        user.setGender(Integer.parseInt(wxUserInfo.getSex()));
        user.setTime(wxUserInfo.getTime());

        userDao.saveNewUser(user);
        goodReportDao.addUser(user.getId());
        parentCenterDao.saveNewParent(user.getId());
        return wxUserInfo;
    }
}
