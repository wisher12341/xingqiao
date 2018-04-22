package com.xq.dto;

//治疗师 个人资料 编辑
public class TeacherInfoEdit {

    private String ftype; //base authentication service
    private String ctype; //资料类型  name  gender。。。
    private String value;
    private Integer isChangeStatus=0;//是否更改 用户状态 0不更改 1更改
    private String ctypeDesc;//类型的 中文

    public TeacherInfoEdit(String value, String ctype) {
        this.value=value;
        this.ctype=ctype;
    }

    public String getCtypeDesc() {
        return ctypeDesc;
    }

    public void setCtypeDesc(String ctypeDesc) {
        this.ctypeDesc = ctypeDesc;
    }

    public Integer getIsChangeStatus() {
        return isChangeStatus;
    }

    public void setIsChangeStatus(Integer isChangeStatus) {
        this.isChangeStatus = isChangeStatus;
    }

    public String getFtype() {
        return ftype;
    }

    public void setFtype(String ftype) {
        this.ftype = ftype;
    }

    public String getCtype() {
        return ctype;
    }

    public void setCtype(String ctype) {
        this.ctype = ctype;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
