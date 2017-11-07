package com.xq.service.impl;

import com.xq.dao.CommentDao;
import com.xq.dao.TeacherDao;
import com.xq.model.Comment;
import com.xq.model.Teacher;
import com.xq.model.User;
import com.xq.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

/**
 * Created by joy12 on 2017/11/6.
 */
@Service
public class TeacherServiceImpl implements TeacherService{

    @Autowired
    TeacherDao teachersDao;
    @Autowired
    CommentDao commentDao;


    public List<Teacher> getTeachers(Teacher teacher, String years, String priceSelect) {
        Integer minY=0;
        Integer maxY=0;

        Integer minP=0;
        Integer maxP=0;

        Integer flag=0;//用于标记 上门方式 跟价格区间 都进行了筛选 则查询时  按照特定的规则 0无 1治疗师上门 2学生上门 3在线授课

        //教学经验
        if(years!=null&&!years.equals("")) {
            if (years.equals("3年以下")) {
                maxY=3;
            }else if(years.equals("3-5年")){
                minY=3;
                maxY=5;
            }else  if(years.equals("5年以上")){
                minY=5;
            }
        }
        //价格区间
        if(priceSelect!=null&&!priceSelect.equals("")&&!priceSelect.equals("不限")) {
            if(teacher.getWay()!= null && !teacher.getWay().equals("") && !teacher.getWay().equals("不限")){
                if(teacher.getWay().equals("治疗师上门")) {
                    flag = 1;
                }else if(teacher.getWay().equals("学生上门")){
                    flag=2;
                }else{
                    flag=3;
                }
            }
            if (priceSelect.equals("80-150元")) {
                maxP=150;
                minP=80;
            }else if(priceSelect.equals("150-300元")){
                minP=150;
                maxP=300;
            }else  if(priceSelect.equals("300-500元")){
                minP=300;
                maxP=500;
            }else  if(priceSelect.equals("500元以上")){
                minP=500;
                maxP=10000;
            }
        }



        List<Teacher> teacherList=teachersDao.getTeachers(teacher,minY,minP,maxP,maxY,flag);
        for(Teacher teacher1:teacherList){
            if(teacher1.getGender().equals("0")){
                teacher1.setGender("男");
            }else {
                teacher1.setGender("女");
            }

            //显示 价格区间
            int max=teacher1.getPriceMax(),min=teacher1.getPriceMin();

            if(max!=min){
                teacher1.setPrice(min+"-"+max);
            }else{
                teacher1.setPrice(min+"");
            }
        }
        return teacherList;
    }

    public Teacher getTeacher(Integer teacher_id) {
        Teacher teacher=teachersDao.getTeacher(teacher_id);
        teacher.setCommentList(commentDao.getCommentByTid(teacher.getId()));
        return teacher;
    }

    @Override
    public void addComment(Comment comment, HttpServletRequest request) {
        User user= (User) request.getSession().getAttribute("USER");
        comment.setUid(user.getId());

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);

        comment.setTime(dateNowStr);

        commentDao.addComment(comment);
    }

    @Override
    public List<String> getCommentPics(Integer cid, Integer index) {
        Comment comment=commentDao.getCommentById(cid);
        List<String> pics=new ArrayList<String>();
        String[] str=comment.getPicUrls().split("#");
        for(int i=0;i<str.length;i++){
            pics.add(str[i]);
        }
        return pics;
    }
}
