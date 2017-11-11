package com.xq.dao;

import com.xq.model.User;

/**
 * Created by netlab606 on 2017/11/10.
 */
public interface UserDao {
    User getUserByOpenid(String openid);
}
