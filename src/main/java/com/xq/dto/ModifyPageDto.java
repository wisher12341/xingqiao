package com.xq.dto;

/**
 * Created by 86761 on 2017/11/13.
 */
public class ModifyPageDto {
    private String oldValue;
    private String fieldName;
    private String uiName;
    private int objId;
    private String table;



    public ModifyPageDto(String oldValue, String fieldName, String uiName, int objId) {
        this.oldValue = oldValue;
        this.fieldName = fieldName;
        this.uiName=uiName;
        this.objId = objId;
    }
    public ModifyPageDto(String oldValue, String fieldName, String uiName, int objId,String table) {
        this.oldValue = oldValue;
        this.fieldName = fieldName;
        this.uiName=uiName;
        this.objId = objId;
        this.table=table;
    }

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
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

    public int getObjId() {
        return objId;
    }

    public void setObjId(int objId) {
        this.objId = objId;
    }




}
