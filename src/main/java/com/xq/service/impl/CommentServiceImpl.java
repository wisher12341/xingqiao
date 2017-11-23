package com.xq.service.impl;

import com.xq.dao.CommentDao;
import com.xq.dao.MessageDao;
import com.xq.dao.OrderDao;
import com.xq.dao.UserDao;
import com.xq.model.Comment;
import com.xq.model.Message;
import com.xq.model.Order;
import com.xq.model.User;
import com.xq.service.CommentService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    @Autowired
    MessageDao messageDao;

    @Transactional
    public void addComment(Comment comment, HttpServletRequest request, MultipartFile[] pics) {

        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
//        String openid="123";
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
    @Transactional
    public void addReply(String reply, String oid, Integer pid) {
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);


        Comment comment=new Comment();
        comment.setTime(dateNowStr);
        comment.setType(2);
        comment.setDetail(reply);
        comment.setPid(pid);
        commentDao.addReply(comment);


        Order order=orderDao.getOrderPayByOid(oid);
        Message message=new Message();
        message.setUserId(order.getUidP());
        message.setTime(dateNowStr);
        message.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    您的订单（"+oid+"），治疗师（"+order.getPname()+"）已回复。"+
                "</p>");

        messageDao.addMessage(message);
    }
}
