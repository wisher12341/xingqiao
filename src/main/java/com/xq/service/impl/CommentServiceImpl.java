package com.xq.service.impl;

import com.xq.dao.CommentDao;
import com.xq.dao.MessageDao;
import com.xq.dao.OrderDao;
import com.xq.dao.UserDao;
import com.xq.interceptor.WxInterceptor;
import com.xq.model.Comment;
import com.xq.model.Message;
import com.xq.model.Order;
import com.xq.service.CommentService;
import com.xq.util.CookieUtil;
import com.xq.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    @Override
    @Transactional
    public void addComment(Comment comment, String oid) {
        String pattern = "<img.*?>";
        String detai=comment.getDetail();
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(detai);
        while (m.find()){
            int begin=m.group().indexOf(".png")-5;
            int end=m.group().indexOf(".png");
            String number=m.group().substring(begin,end);
            detai=detai.replace(m.group(),"&#x"+number+";");

        }
        comment.setDetail(detai);


        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        comment.setTime(dateNowStr);
        comment.setType(1);

        commentDao.add(comment);
        orderDao.addComment(oid,comment.getId());


        Order order=orderDao.getOrderPayByOid(oid);
        Message message=new Message();
        message.setUserId(order.getUidT());
        message.setTime(dateNowStr);
        message.setMessage("<p>\n" +
                "<span style=\"color:red;\">系统消息：</span>\n" +
                "</p>\n" +
                "<p>\n" +
                "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                "    您的订单（"+oid+"），家长（"+order.getPname()+"）已评论。"+
                "</p>");

        messageDao.addMessage(message);
    }

    @Override
    public String addCommentImg(HttpServletRequest request) {
        String deleteImg= CookieUtil.checkCookie(request,"deleteImg");//获得要删除的img ID
        String picsUrl="";
        // 从请求中获取到文件信息需要将请求转换为MultipartHttpServletRequest类型
        MultipartHttpServletRequest MulRequest = request instanceof MultipartHttpServletRequest ? (MultipartHttpServletRequest) request : null;
        Iterator<String> fileNames = MulRequest.getFileNames();
        while(fileNames.hasNext()) { // 遍历请求中的信息
            String fileName = fileNames.next(); //
            //该图片 是要删除的图片  #被转义了
            String name="%23"+fileName+"%23";
            if(deleteImg.indexOf(name)!=-1){
                continue;
            }
            //图片
            try {
                String path= FileUpload.uploadFile(MulRequest.getFile(fileName), request,FileUpload.COMMENT_TEACHER_ROOT_PATH);
//                WxInterceptor.logger.info(path);
                int index = path.indexOf("img");
                picsUrl += path.substring(index, path.length()) + "#";
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (!picsUrl.equals("")) {
            picsUrl = picsUrl.substring(0, picsUrl.length() - 1);
        }
        return picsUrl;
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


    @Override
    @Transactional
    public void addReply(Comment comment, String oid) {
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);

        comment.setTime(dateNowStr);
        comment.setType(2);

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
