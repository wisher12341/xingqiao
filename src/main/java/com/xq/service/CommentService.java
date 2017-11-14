package com.xq.service;


import com.xq.model.Comment;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by netlab606 on 2017/9/6.
 */
public interface CommentService {
    void addComment(Comment comment, HttpServletRequest request, MultipartFile[] pics);

    Comment getCommentByOid(String oid);

    void addReply(String reply, String oid, Integer pid);
}
