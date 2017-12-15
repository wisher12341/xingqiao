package com.xq.service.impl;

import com.xq.dao.OrganCommentDao;
import com.xq.dao.OrganizationDao;
import com.xq.dao.UserDao;
import com.xq.model.OrganComment;
import com.xq.model.Organization;
import com.xq.model.User;
import com.xq.service.OrganizationService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import com.xq.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by joy12 on 2017/11/3.
 */
@Service
public class OrganizationServiceImpl implements OrganizationService {
    @Autowired
    OrganizationDao organizationDao;
    @Autowired
    OrganCommentDao organCommentDao;
    @Autowired
    UserDao userDao;

    @Override
    public List<Organization> getOrganizations() {
        return organizationDao.getOrganizations();
    }

    @Override
    public Organization getOrganization(Integer id) {
        return organizationDao.getOrganization(id);
    }

    @Override
    public boolean addComment(OrganComment organComment, HttpServletRequest request) {
//        User user= (User) request.getSession().getAttribute("USER");
        String pattern = "<img.*?>";
        String detai=organComment.getDetail();
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(detai);
        while (m.find()){
            int begin=m.group().indexOf(".png")-5;
            int end=m.group().indexOf(".png");
            String number=m.group().substring(begin,end);
            detai=detai.replace(m.group(),"&#x"+number+";");

        }
        organComment.setDetail(detai);


        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
//        String openid="123";
        User user=userDao.getParentByOpenid(openid);
        if (user==null){
            return false;
        }
        organComment.setUid(user.getId());


        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);

        organComment.setTime(dateNowStr);

        organizationDao.addComment(organComment);
        return true;
    }

    @Override
    public List<String> getCommentPics(Integer cid, Integer index) {
        OrganComment organComment=organCommentDao.getCommentById(cid);
        List<String> pics=new ArrayList<String>();
        String[] str=organComment.getPicurls().split("#");
        for(int i=0;i<str.length;i++){
            pics.add(str[i]);
        }
        return pics;
    }

    @Override
    public List<OrganComment> getOrganizationComments(Integer oid){
        return organCommentDao.getMainOrgCommentsByOid(oid);
    }

    @Override
    public List<OrganComment> getOrganizationCommentsByPage(Integer oid, Integer page, Integer size){
        Integer start = (page-1)*size;
        return organCommentDao.getMainOrgCommentsByOidAndPage(oid,start,size);
    }

    @Override
    public OrganComment getOrganCommentByCid(Integer cid){
        return organCommentDao.getOrgCommentByCid(cid);
    }

}
