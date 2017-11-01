package com.xq.model;

import java.util.List;

/**
 * 订单
 * Created by netlab606 on 2017/7/13.
 */
public class Order {
    private String id;
    private Integer teacherId;
    private Integer parentId;
    private Integer demandId;
    private String recoverOb;
    private Integer statusP;// (1：待治疗师确认， 2：代付款（治疗师已确认）， 3：进行中， 4.家长终止审核中  5.治疗师终止审核中，6.家长终止退款处理中  9.治疗师终止退款处理中   7.治疗师终止待同意 8.家长终止待治疗师同意 11：家长已取消的订单 12：治疗师逾期未处理的订单 13：被治疗师终止的历史订单，14：被家长中途终止的历史订单，15：完成的历史订单 16：治疗师拒绝的订单）
    private Integer statusT;//（1：待处理， 2-治疗师已确认 3：进行中，4.家长终止审核中 5.治疗师终止审核中 6.家长终止退款处理中 9.治疗师终止退款处理中  7.治疗师终止待家长同意 8.治疗师终止待家长同意  11：家长已取消的订单 12：治疗师逾期未处理的订单，13：被治疗师终止的历史订单， 14：被家长中途终止的历史订单，15：完成的历史订单，16：治疗师拒绝的订单）
    private String sTime;
    private String eTime;
    private String isdeleted;
    private String initialevaluated;
    private String effectevaluated;
    private String amount;
    private Integer preferential;//优惠 ID  方便插入
    private String integral;
    private String remark;
    private Double realpay;
    private String serverTime;
    private String way;
    private Double totalpay;
    private String complete;
    private String tradeNo;//支付宝交易号
    private Integer pay;
    private String payWay;//支付方式
    private Integer cid;//评论ID

    private Integer period;//课时
    private Integer isFirst;//是否享受  首次 预约

    private Integer uidP;//用于消息中心  订单 家长的账号Id
    private Integer uidT;//订单 老师的账号Id
    private String  pname;//用于消息中心  订单 家长姓名
    private String tname;//订单 老师姓名

    private String reason;//家长、治疗师、取消订单的理由

    private List<RecoveryHis> recoveryHisList;//康复史

    private String trace;//订单追踪 #时间@内容#时间@内容

    private String statusDesc;//订单状态描述

//    家长信息表
    private Parent parent;

    //治疗师 信息表
    private Teacher teacher;

    private Preferential preferentialE;

    private Demand demand;


    private List<String> timeline;//用于 订单追踪的 时间轴的 刻度

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", teacherId=" + teacherId +
                ", parentId=" + parentId +
                ", demandId=" + demandId +
                ", recoverOb='" + recoverOb + '\'' +
                ", statusP=" + statusP +
                ", statusT=" + statusT +
                ", sTime='" + sTime + '\'' +
                ", eTime='" + eTime + '\'' +
                ", isdeleted='" + isdeleted + '\'' +
                ", initialevaluated='" + initialevaluated + '\'' +
                ", effectevaluated='" + effectevaluated + '\'' +
                ", amount='" + amount + '\'' +
                ", preferential=" + preferential +
                ", integral='" + integral + '\'' +
                ", remark='" + remark + '\'' +
                ", realpay=" + realpay +
                ", serverTime='" + serverTime + '\'' +
                ", way='" + way + '\'' +
                ", totalpay=" + totalpay +
                ", complete='" + complete + '\'' +
                ", tradeNo='" + tradeNo + '\'' +
                ", pay=" + pay +
                ", payWay='" + payWay + '\'' +
                ", cid=" + cid +
                ", isFirst=" + isFirst +
                ", uidP=" + uidP +
                ", uidT=" + uidT +
                ", pname='" + pname + '\'' +
                ", tname='" + tname + '\'' +
                ", reason='" + reason + '\'' +
                ", recoveryHisList=" + recoveryHisList +
                ", trace='" + trace + '\'' +
                ", statusDesc='" + statusDesc + '\'' +
                ", parent=" + parent +
                ", teacher=" + teacher +
                ", preferentialE=" + preferentialE +
                ", demand=" + demand +
                ", timeline=" + timeline +
                '}';
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public List<String> getTimeline() {
        return timeline;
    }

    public void setTimeline(List<String> timeline) {
        this.timeline = timeline;
    }

    public Integer getIsFirst() {
        return isFirst;
    }

    public void setIsFirst(Integer isFirst) {
        this.isFirst = isFirst;
    }

    public String getStatusDesc() {
        return statusDesc;
    }

    public void setStatusDesc(String statusDesc) {
        this.statusDesc = statusDesc;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Integer getUidP() {
        return uidP;
    }

    public void setUidP(Integer uidP) {
        this.uidP = uidP;
    }

    public Integer getUidT() {
        return uidT;
    }

    public void setUidT(Integer uidT) {
        this.uidT = uidT;
    }

    public String getTrace() {
        return trace;
    }

    public void setTrace(String trace) {
        this.trace = trace;
    }

    public Integer getCid() {
        return cid;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getPayWay() {
        return payWay;
    }

    public void setPayWay(String payWay) {
        this.payWay = payWay;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }

    public List<RecoveryHis> getRecoveryHisList() {
        return recoveryHisList;
    }

    public void setRecoveryHisList(List<RecoveryHis> recoveryHisList) {
        this.recoveryHisList = recoveryHisList;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getDemandId() {
        return demandId;
    }

    public void setDemandId(Integer demandId) {
        this.demandId = demandId;
    }

    public String getRecoverOb() {
        return recoverOb;
    }

    public void setRecoverOb(String recoverOb) {
        this.recoverOb = recoverOb;
    }

    public Integer getStatusP() {
        return statusP;
    }

    public void setStatusP(Integer statusP) {
        this.statusP = statusP;
    }

    public Integer getStatusT() {
        return statusT;
    }

    public void setStatusT(Integer statusT) {
        this.statusT = statusT;
    }

    public String getsTime() {
        return sTime;
    }

    public void setsTime(String sTime) {
        this.sTime = sTime;
    }

    public String geteTime() {
        return eTime;
    }

    public void seteTime(String eTime) {
        this.eTime = eTime;
    }

    public String getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(String isdeleted) {
        this.isdeleted = isdeleted;
    }

    public String getInitialevaluated() {
        return initialevaluated;
    }

    public void setInitialevaluated(String initialevaluated) {
        this.initialevaluated = initialevaluated;
    }

    public String getEffectevaluated() {
        return effectevaluated;
    }

    public void setEffectevaluated(String effectevaluated) {
        this.effectevaluated = effectevaluated;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public Integer getPreferential() {
        return preferential;
    }

    public void setPreferential(Integer preferential) {
        this.preferential = preferential;
    }

    public String getIntegral() {
        return integral;
    }

    public void setIntegral(String integral) {
        this.integral = integral;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Double getRealpay() {
        return realpay;
    }

    public void setRealpay(Double realpay) {
        this.realpay = realpay;
    }

    public String getServerTime() {
        return serverTime;
    }

    public void setServerTime(String serverTime) {
        this.serverTime = serverTime;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public Double getTotalpay() {
        return totalpay;
    }

    public void setTotalpay(Double totalpay) {
        this.totalpay = totalpay;
    }

    public String getComplete() {
        return complete;
    }

    public void setComplete(String complete) {
        this.complete = complete;
    }

    public Parent getParent() {
        return parent;
    }

    public void setParent(Parent parent) {
        this.parent = parent;
    }

    public Demand getDemand() {
        return demand;
    }

    public void setDemand(Demand demand) {
        this.demand = demand;
    }

    public Preferential getPreferentialE() {
        return preferentialE;
    }

    public void setPreferentialE(Preferential preferentialE) {
        this.preferentialE = preferentialE;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Integer getPay() {
        return pay;
    }

    public void setPay(Integer pay) {
        this.pay = pay;
    }
}
