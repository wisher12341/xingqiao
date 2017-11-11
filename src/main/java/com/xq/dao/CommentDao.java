package com.xq.dao;

import com.xq.model.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by netlab606 on 2017/8/20.
 */
public interface CommentDao {


    void addComment(Comment comment);

    Comment getCommentByOid(String oid);

}
