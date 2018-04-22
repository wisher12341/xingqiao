package com.xq.dto;

import com.xq.model.Comment;

import java.util.List;

//治疗师 评论中心
public class TCommentsDto {
    List<Comment> noReplyComments;//未回复
    List<Comment> hisComments;//历史 不包括未回复的

    public List<Comment> getNoReplyComments() {
        return noReplyComments;
    }

    public void setNoReplyComments(List<Comment> noReplyComments) {
        this.noReplyComments = noReplyComments;
    }

    public List<Comment> getHisComments() {
        return hisComments;
    }

    public void setHisComments(List<Comment> hisComments) {
        this.hisComments = hisComments;
    }
}
