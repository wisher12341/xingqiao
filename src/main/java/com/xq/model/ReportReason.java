package com.xq.model;

/**
 * 治疗师评论、机构评论 举报的理由
 * Created by netlab606 on 2017/10/5.
 */
public class ReportReason {
    private Integer id;
    private Integer oCid;//机构评论的id
    private Integer tCid;//治疗师评论的id
    private String reason;//理由
    private String time;//举报时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getoCid() {
        return oCid;
    }

    public void setoCid(Integer oCid) {
        this.oCid = oCid;
    }

    public Integer gettCid() {
        return tCid;
    }

    public void settCid(Integer tCid) {
        this.tCid = tCid;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
