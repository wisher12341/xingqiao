package com.xq.dto;

import com.xq.model.Message;

import java.util.List;

//消息中心
public class MessageDto {
    private List<Message> readInform;//已读通知
    private List<Message> noReadInform;//未读通知
    private Integer isNoneInform=0;//是否没有通知  0有 1没有  没有的话  显示抱歉页面

    public List<Message> getReadInform() {
        return readInform;
    }

    public void setReadInform(List<Message> readInform) {
        this.readInform = readInform;
    }

    public List<Message> getNoReadInform() {
        return noReadInform;
    }

    public void setNoReadInform(List<Message> noReadInform) {
        this.noReadInform = noReadInform;
    }

    public Integer getIsNoneInform() {
        return isNoneInform;
    }

    public void setIsNoneInform(Integer isNoneInform) {
        this.isNoneInform = isNoneInform;
    }
}
