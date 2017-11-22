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

    void add(Comment comment);


    List<Comment> getCommentByTid(Integer id);

    void updateGRCount(@Param("id") Integer cid, @Param("good") int good_add, @Param("report") int report_add);


    Comment getCommentById(Integer cid);

    void addReply(Comment comment);

    List<Comment> getMainTeacherCommentsByTid(Integer tid);

    Comment getCommentByCid(Integer cid);
}
