package com.xq.controller;

import com.xq.dto.Result;
import com.xq.model.Comment;
import com.xq.service.CommentService;
import com.xq.service.UserService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by netlab606 on 2017/9/28.
 */
@Controller
@RequestMapping(value = "/wx/comment")
public class CommentController {

    @Autowired
    CommentService commentService;
    @Autowired
    UserService userService;
    /**
     * 评论页面
     * @param oid
     * @return
     */
    @RequestMapping(value = "/{oid}",method = RequestMethod.GET)
    public ModelAndView comment(@PathVariable String oid){
        ModelAndView mv=new ModelAndView("order/comment");
        mv.addObject("title","订单评论");
        mv.addObject("submit","/wx/comment/"+oid);
        mv.addObject("type","order");
        return mv;
    }

    /**
     * 订单评论
     * @return
     */
    @RequestMapping(value = "/{oid}",method = RequestMethod.POST)
    public ModelAndView comment_post(Comment comment, @PathVariable String oid){
//        ModelAndView mv=new ModelAndView("redirect:/wx/order/"+oid+"/detail");
        commentService.addComment(comment,oid);
        ModelAndView mv=new ModelAndView("redirect:/wx/common/success");
        mv.addObject("title","订单");
        mv.addObject("content","订单评论成功");
        mv.addObject("url","/wx/order/"+oid+"/detail");
        return mv;
    }

    /**
     * 治疗师回应评论
     * @return
     */
    @RequestMapping(value = "/{oid}/teacherReply",method = RequestMethod.POST)
    public ModelAndView comment_reply(Comment comment, @PathVariable String oid, HttpServletRequest request){
        String openid= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
//        openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
//        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/"+userService.getUserByOpenidStatus(openid,"1").getId()+"/myComments");
        commentService.addReply(comment,oid);
        ModelAndView mv=new ModelAndView("redirect:/wx/common/success");
        mv.addObject("title","订单");
        mv.addObject("content","回应评论成功");
        mv.addObject("url","/wx/teacherCenter/"+userService.getUserByOpenidStatus(openid,"1").getId()+"/myComments");
        return mv;
    }

    /**
     *评论添加时先上传照片
     */
    @ResponseBody
    @RequestMapping(value = "/img",method = RequestMethod.POST)
    public Result comment_img(HttpServletRequest request){
        return new Result(true,commentService.addCommentImg(request));
    }

//    /**
//     * 获取某一订单的 评论
//     * @param oid
//     * @param type 用于标记 身份 家长 治疗师
//     * @return
//     */
//    @RequestMapping(value = "/{oid}/getCommentByOid/{type}",method = RequestMethod.GET)
//    public ModelAndView getCommentByOid(@PathVariable String oid,@PathVariable String type){
//        Comment comment=commentService.getCommentByOid(oid);
//        ModelAndView mv=new ModelAndView("order/comment_read");
//        mv.addObject("comment",comment);
//        mv.addObject("type",type);//用于标志从家长身份
//        return mv;
//    }
}
