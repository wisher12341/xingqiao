package com.xq.service.impl;

/**
 * Created by joy12 on 2017/11/4.
 */

import com.xq.dao.*;
import com.xq.model.Message;
import com.xq.model.ReportReason;
import com.xq.model.User;
import com.xq.model.UserGoodReport;
import com.xq.service.GoodReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
@Service
public class GoodReportServiceImpl implements GoodReportService {

    @Autowired
    GoodReportDao goodReportDao;
    @Autowired
    OrganCommentDao organCommentDao;
    @Autowired
    MessageDao messageDao;
    @Autowired
    ReportReasonDao reportReasonDao;
    @Autowired
    CommentDao commentDao;

    @Override
    public UserGoodReport getOrganGoodReportByUid(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("USER");
        if(user==null){
            return new UserGoodReport();
        }
        UserGoodReport userGoodReport=goodReportDao.getOrganGoodReportByUid(user.getId());
        return userGoodReport;
    }

    @Override
    public UserGoodReport getTeacherGoodReportByUid(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("USER");
        if(user==null){
            return new UserGoodReport();
        }
        UserGoodReport userGoodReport=goodReportDao.getTeacherGoodReportByUid(user.getId());
        return userGoodReport;
    }

    @Override
    @Transactional
    public void add(HttpServletRequest request, Integer type, Integer cid, Integer flag, String reason) {
        User user = (User) request.getSession().getAttribute("USER");
        UserGoodReport userGoodReport=new UserGoodReport();
        userGoodReport.setUid(user.getId());

        int good=0;//点赞变化数  -1 少一  0不变 1加一
        int report=0;//举报变化数
        if(flag==0){
//            机构评论
            if(type==0){
                //点赞
                userGoodReport.setOrgCommentGood("#"+cid+"#");
                good=1;
            }else{
                //举报
                userGoodReport.setOrgCommentReport("#"+cid+"#");
                report=1;

                Date d = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
                String dateNowStr = sdf.format(d);


                //存储举报理由
                ReportReason reportReason=new ReportReason();
                reportReason.setoCid(cid);
                reportReason.setReason(reason);
                reportReason.setTime(dateNowStr);
                reportReason.settCid(0);

                reportReasonDao.add(reportReason);

                //通知后台
                Message message=new Message();
                message.setTime(dateNowStr);
                message.setMessage("<p>\n" +
                        "<span style=\"color:red;\">系统消息：</span>\n" +
                        "</p>\n" +
                        "<p>\n" +
                        "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                        "    机构评论（"+cid+"）被举报。举报理由："+reason+
                        "</p>");
                messageDao.addMessageAdmin(message);


            }
//            更新 点赞、举报数
            organCommentDao.updateGRCount(cid,good,report);
        }else {
            //治疗师评论
            if(type==0){
                //点赞
                userGoodReport.setTeacherCommentGood("#"+cid+"#");
                good=1;
            }else{
                //举报
                userGoodReport.setTeacherCommentReport("#"+cid+"#");
                report=1;
                Date d = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
                String dateNowStr = sdf.format(d);


                //存储举报理由
                ReportReason reportReason=new ReportReason();
                reportReason.setoCid(0);
                reportReason.setReason(reason);
                reportReason.setTime(dateNowStr);
                reportReason.settCid(cid);

                reportReasonDao.add(reportReason);

                //通知后台
                Message message=new Message();
                message.setTime(dateNowStr);
                message.setMessage("<p>\n" +
                        "<span style=\"color:red;\">系统消息：</span>\n" +
                        "</p>\n" +
                        "<p>\n" +
                        "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                        "    治疗师评论（"+cid+"）被举报。举报理由："+reason+
                        "</p>");
                messageDao.addMessageAdmin(message);
            }
//            更新 点赞、举报数
            commentDao.updateGRCount(cid,good,report);
        }
//        更新 用户参与的点赞、举报的 评论id
        goodReportDao.add(userGoodReport);
    }


    @Override
    @Transactional
    public void del(HttpServletRequest request, Integer cid, Integer flag) {
        User user = (User) request.getSession().getAttribute("USER");
        UserGoodReport userGoodReport=goodReportDao.getOrganGoodReportByUid(user.getId());
        String str="";
        if(flag==0){
            //机构评论
            str=userGoodReport.getOrgCommentGood();
            str=str.replaceAll("#"+cid+"#","");
            organCommentDao.updateGRCount(cid,-1,0);
        }else{
            //治疗师评论
            str=userGoodReport.getTeacherCommentGood();
            str=str.replaceAll("#"+cid+"#","");
            commentDao.updateGRCount(cid,-1,0);
        }
        goodReportDao.del(str,flag,user.getId());
    }
}

