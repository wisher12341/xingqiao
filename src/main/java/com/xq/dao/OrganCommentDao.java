package com.xq.dao;

import com.xq.model.OrganComment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by joy12 on 2017/11/3.
 */
public interface OrganCommentDao {
    void updateGRCount(@Param("id") Integer cid, @Param("good") int good_add, @Param("report") int report_add);

    OrganComment getCommentById(Integer cid);

    List<OrganComment> getMainOrgCommentsByOid(Integer oid);

    List<OrganComment> getMainOrgCommentsByOidAndPage(@Param("oid") Integer oid, @Param("start") Integer start,@Param("size")  Integer size);

    OrganComment getOrgCommentByCid(Integer commentid);
}
