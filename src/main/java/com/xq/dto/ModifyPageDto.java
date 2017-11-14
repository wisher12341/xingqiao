package com.xq.dto;

/**
 * Created by 86761 on 2017/11/13.
 */
public class ModifyPageDto {
    private String oldValue;
    private String fieldName;
    private String uiName;
    private int userId;

    public ModifyPageDto(String oldValue, String fieldName, String uiName, int userId) {
        this.oldValue = oldValue;
        this.fieldName = fieldName;
        this.uiName=uiName;
        this.userId = userId;
    }

    public String getOldValue() {
        return oldValue;
    }

    public void setOldValue(String oldValue) {
        this.oldValue = oldValue;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getUiName() {
        return uiName;
    }

    public void setUiName(String uiName) {
        this.uiName = uiName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }




}
