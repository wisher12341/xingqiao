package com.xq.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * 操作cookie
 * Created by netlab606 on 2017/11/3.
 */
public class CookieUtil {

    public static String checkCookie(HttpServletRequest request, String key) {
        Cookie[] cookie = request.getCookies();
        if(cookie!=null) {
            for (int i = 0; i < cookie.length; i++) {
                Cookie cook = cookie[i];
                if (cook.getName().equalsIgnoreCase(key)) { //获取键
                    return cook.getValue().toString();
                }
            }
        }
        return null;
    }
}
