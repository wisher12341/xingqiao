package com.xq.dto;

import com.xq.model.Comment;
import com.xq.model.Order;

import java.util.List;

//治疗师 评论中心
public class PCommentsDto {
    List<Order> noCommentOrders;//未回复
    List<Comment> hisComments;//历史 不包括未回复的


    public List<Order> getNoCommentOrders() {
        return noCommentOrders;
    }

    public void setNoCommentOrders(List<Order> noCommentOrders) {
        this.noCommentOrders = noCommentOrders;
    }

    public List<Comment> getHisComments() {
        return hisComments;
    }

    public void setHisComments(List<Comment> hisComments) {
        this.hisComments = hisComments;
    }
}
