package com.xq.dao;

import com.xq.model.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by netlab606 on 2017/9/7.
 */
public interface CommentDao {
    void add(Comment comment);

    Comment getCommentByOid(String oid);

    List<Comment> getCommentByTid(Integer id);

    void updateGRCount(@Param("id") Integer cid, @Param("good") int good_add, @Param("report") int report_add);

    void addComment(Comment comment);

    Comment getCommentById(Integer cid);

    void addReply(Comment comment);
}
