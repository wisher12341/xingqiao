package com.xq.controller;
import com.xq.model.Comment;
import com.xq.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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

    /**
     * 评论页面
     * @param oid
     * @return
     */
    @RequestMapping(value = "/{oid}",method = RequestMethod.GET)
    public ModelAndView comment(@PathVariable String oid){
        ModelAndView mv=new ModelAndView("order/comment");
        mv.addObject("oid",oid);
        return mv;
    }

    /**
     * 评论
     * @param comment
     * @return
     */
    @RequestMapping(value = "",method = RequestMethod.POST)
    public ModelAndView comment_post(Comment comment, @RequestParam("pics")MultipartFile[] pics, HttpServletRequest request){
        ModelAndView mv=new ModelAndView("redirect:order/order");
        commentService.addComment(comment,request,pics);
        return mv;
    }

    /**
     * 获取某一订单的 评论
     * @param oid
     * @return
     */
    @RequestMapping(value = "/{oid}/getCommentByOid",method = RequestMethod.GET)
    public ModelAndView getCommentByOid(@PathVariable String oid){
        Comment comment=commentService.getCommentByOid(oid);
        ModelAndView mv=new ModelAndView("order/comment");
        mv.addObject("comment",comment);
        return mv;
    }
}
