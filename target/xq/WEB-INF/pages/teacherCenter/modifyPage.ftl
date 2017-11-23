<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>修改</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="main">

    <div class="modifyDiv">
      <label for="input" class="col-sm-2 control-label">${modifyPageDto.uiName}</label>
    <div class="col-sm-10">
        <#if modifyPageDto.fieldName=="gender">
            <div class="radio-input" style="font-size: 50px;margin-top: 10px">
                <input type="radio" name="optionsRadiosinline" value="0" style=" height: 50px;width: 50px;"> 男
                <input type="radio"  name="optionsRadiosinline" value="1" style=" height: 50px;width: 50px;"> 女
            </div>
        <#else>
        <input type="text" class="form-control" id="input" value="${modifyPageDto.oldValue}" >
        </#if>
    </div>
        <div class="saveBtn"style="text-align: center"><button class="btn btn-block btn-default fa fa-save fa-4x" onclick="saveTeacherModify('${modifyPageDto.objId}','${modifyPageDto.fieldName}');"> 保存</button></div>

    </div>


</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        if("${modifyPageDto.fieldName}"=="gender"){
            if(${modifyPageDto.oldValue}==0) $("input[name='optionsRadiosinline']").get(0).checked=true;
            else  $("input[name='optionsRadiosinline']").get(1).checked=true;
        }
    });
    function saveTeacherModify(objId,fieldName){
        var newValue= $("input").val();
        $.ajax({
            url: "/wx/teacherCenter/saveModify",
            type: 'post',
            dataType: 'json',
            data: {
                "newValue": newValue,
                "objId": objId,
                "fieldName":fieldName
            },
            success: function(){
                window.location.href=document.referrer;
            },
            error: function(){

            }
        });
    }

</script>