package com.xq.controller;
import com.xq.dto.Result;
import com.xq.model.Comment;
import com.xq.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
    public ModelAndView comment_post(Comment comment,@PathVariable String oid){
        ModelAndView mv=new ModelAndView("redirect:/wx/order/"+oid+"/detail");
        commentService.addComment(comment,oid);
        return mv;
    }

    /**
     * 治疗师回应评论
     * @return
     */
    @RequestMapping(value = "/{oid}/teacherReply",method = RequestMethod.POST)
    public ModelAndView comment_reply(Comment comment,@PathVariable String oid){
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/order/"+oid+"/detail");
        commentService.addReply(comment,oid);
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
