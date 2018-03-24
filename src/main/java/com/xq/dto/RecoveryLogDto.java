package com.xq.dto;

import com.xq.model.Demand;
import com.xq.model.RecoveryLog;
import com.xq.model.Teacher;

import java.util.List;

/**
 * 康复日志 条件查询  以及返回值
 * Created by netlab606 on 2017/11/7.
 */
public class RecoveryLogDto {
    private List<RecoveryLog> recoveryLogList;
    private List<RecoveryLog> recoveryLogNoConfirmList;//未确认的康复日志
    private Teacher teacher;//治疗师 空值的话表示不限
    private Demand demand;//需求简历

    private String startTime;//开始时间  年月日  开始 时分秒： 00:00:00  结束：23:59:59
    private String endTime;//结束时间
    private Integer isConfirm;//是否确认  0未确认  1确认  2 表示不限


    private List<Teacher> teacherList;//我的治疗师
    private List<Demand> demandList;//我的需求简历

    private String[] ob;//康复领域

    private List<String> obs;//该家长所有孩子 有过的康复领域

    public List<RecoveryLog> getRecoveryLogNoConfirmList() {
        return recoveryLogNoConfirmList;
    }

    public void setRecoveryLogNoConfirmList(List<RecoveryLog> recoveryLogNoConfirmList) {
        this.recoveryLogNoConfirmList = recoveryLogNoConfirmList;
    }

    public List<String> getObs() {
        return obs;
    }

    public void setObs(List<String> obs) {
        this.obs = obs;
    }

    public String[] getOb() {
        return ob;
    }

    public void setOb(String[] ob) {
        this.ob = ob;
    }

    public List<RecoveryLog> getRecoveryLogList() {
        return recoveryLogList;
    }

    public void setRecoveryLogList(List<RecoveryLog> recoveryLogList) {
        this.recoveryLogList = recoveryLogList;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Demand getDemand() {
        return demand;
    }

    public void setDemand(Demand demand) {
        this.demand = demand;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Integer getIsConfirm() {
        return isConfirm;
    }

    public void setIsConfirm(Integer isConfirm) {
        this.isConfirm = isConfirm;
    }

    public List<Teacher> getTeacherList() {
        return teacherList;
    }

    public void setTeacherList(List<Teacher> teacherList) {
        this.teacherList = teacherList;
    }

    public List<Demand> getDemandList() {
        return demandList;
    }

    public void setDemandList(List<Demand> demandList) {
        this.demandList = demandList;
    }
}
