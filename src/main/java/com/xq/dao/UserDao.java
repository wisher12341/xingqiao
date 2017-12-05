package com.xq.dao;

import com.xq.model.User;
import com.xq.model.WxUserInfo;
import org.apache.ibatis.annotations.Param;

/**

 * Created by netlab606 on 2017/11/10.
 */
public interface UserDao {
    User getUserByOpenid(String openid);
    User getUserById(Integer id);
    User findUserByNameType(@Param("username") String username, @Param("type") Integer type);
    String getParentNameById(Integer id);
    String getTeacherNameById(Integer id);
    User getUserByUid(Integer id);
    void save(User user);
    User findUserByName(String username);

    void addOpenid(User user);

    void saveNewUser(WxUserInfo wxUserInfo);

    User getUserByOpenidStatus(@Param("openid") String openid,@Param("status") String status);

    void register(User user);

    void clearOpenid(@Param("openid") String openid,@Param("status") int status);

    void bindAccount(User user);
}
