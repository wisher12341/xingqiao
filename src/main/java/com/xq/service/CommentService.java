package com.xq.service;


import com.xq.model.Comment;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by netlab606 on 2017/9/6.
 */
public interface CommentService {

    Comment getCommentByOid(String oid);


    String addCommentImg(HttpServletRequest request);

    void addComment(Comment comment, String oid);

    void addReply(Comment comment, String oid);
}
