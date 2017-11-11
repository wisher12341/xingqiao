package com.xq.service.impl;

import com.xq.dao.CommentDao;
import com.xq.dao.OrderDao;
import com.xq.dao.UserDao;
import com.xq.model.Comment;
import com.xq.model.User;
import com.xq.service.CommentService;
import com.xq.util.ConstOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

/**
 * Created by netlab606 on 2017/9/6.
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentDao commentDao;
    @Autowired
    OrderDao orderDao;
//    @Autowired
//    CommonService commonService;
    @Autowired
    UserDao userDao;

    @Transactional
    public void addComment(Comment comment, HttpServletRequest request, MultipartFile[] pics) {

//        String openid=commonService.checkCookie(request, ConstOrder.OPENID);
        String openid="123";
        User user=userDao.getUserByOpenid(openid);

        comment.setUser(user);
        String picsUrl="";
//        if(pics!=null && pics.length>0) {
//            for (MultipartFile pic : pics) {
//                String path = "";
//                int index = 0;
//                if (!pic.isEmpty()) {
//                    try {
//                        path = FileUpload.uploadFile(pic, request, "business");
//                        index = path.indexOf("img");
//                    } catch (IOException e) {
//                        e.printStackTrace();
//                    }
//                    picsUrl += path.substring(index, path.length()) + "#";
//                }
//            }
//            picsUrl=picsUrl.substring(0,picsUrl.length()-1);
//            comment.setPicsUrl(picsUrl);
//        }
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        comment.setTime(dateNowStr);
        commentDao.addComment(comment);
        orderDao.addCommentId(comment);
    }


    public Comment getCommentByOid(String oid) {
        return commentDao.getCommentByOid(oid);
    }

}
