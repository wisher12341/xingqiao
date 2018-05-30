<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>我的成功案例</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="main">

    <div class="modifyDiv">
        <label for="input" class="col-sm-2 control-label">标题</label>
        <div>
            <textarea id="text1" class="form-control" rows="3" style="font-size: 40px">${case?split("@")[0]}</textarea>
        </div>
            <label for="input" class="col-sm-2 control-label">详情</label>
            <div>
                <textarea id="text2" class="form-control" rows="15" style="font-size: 40px">${case?split("@")[1]}</textarea>
            </div>
    </div>
    <div class="saveBtn fa fa-save fa-4x" onclick="saveSuccessCase('${cases}',${casesIndex},${userId})"> 保存</div>

</div>
</body>
<script>
    function saveSuccessCase(cases,casesIndex,userId){
        var text1=$("#text1").val();
        var text2=$("#text2").val();
        var strs=cases.split("#");
        strs[casesIndex]=text1+"@"+text2;
        var newValue=strs.join("#");

        $.ajax({
            url: "/wx/teacherCenter/saveModify",
            type: 'post',
            dataType: 'json',
            data: {
                "newValue": newValue,
                "objId": userId,
                "fieldName":"successCase"
            },
            success: function(){
                window.location.href=document.referrer;
            },
            error: function(){

            }
        });
    }
</script>
</html>
