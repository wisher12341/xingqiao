<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>需求管理</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/parentCenter/parentCenter.js" type="text/javascript" ></script>
</head>
<body>
<div id="main">

    <div class="demandAddDiv">
        <label for="input" class="col-sm-3 control-label">姓名</label>
        <div class="col-sm-9 text-input">
            <input type="text" class="form-control" id="name" >
        </div>
    </div>
    <div class="demandAddDiv">
        <label for="input" class="col-sm-3 control-label">性别</label>
        <div class="col-sm-9 radio-input">
            <input type="radio" name="optionsRadiosinline" value="1"> 男
            <input type="radio"  name="optionsRadiosinline" value="2"> 女
        </div>
    </div>
    <div class="demandAddDiv">
        <label for="input" class="col-sm-3 control-label">出生日期</label>
        <div class="col-sm-9 text-input">
            <input type="text" class="form-control" id="birthday">
        </div>
    </div>
    <div class="demandAddDiv">
        <label for="input" class="col-sm-3 control-label">诊断报告</label>
        <div class="col-sm-9 text-input">
            <input type="text" class="form-control" id="report" >
        </div>
    </div>
    <div class="demandAddDiv">
        <label for="input" class="col-sm-3 control-label">病史</label>
        <div class="col-sm-9 text-input">
            <input type="text" class="form-control" id="diseaseHis" >
        </div>
    </div>
    <div class="demandAddDiv">
        <label for="input" class="col-sm-3 control-label">过敏史</label>
        <div class="col-sm-9 text-input">
            <input type="text" class="form-control" id="allergyHis" >
        </div>
    </div>
    <div class="demandAddDiv">
        <label for="input" class="col-sm-3 control-label">备注</label>
        <div class="col-sm-9 text-input">
            <input type="text" class="form-control" id="remark" >
        </div>
    </div>

    <div class="saveBtn fa fa-save fa-4x" onclick="addDemand(${userId})">添加需求简历</div>

</div>
</body>
</html>
<script>
    function addDemand(userId) {
        var name=$("#name").val();
        var gender;
        if($("input[type='radio']:checked")===undefined) {
            gender = "";
        }else{
            gender = $("input[type='radio']:checked").val();
        }
        var birthday=$("#birthday").val();
        var report=$("#report").val();
        var diseaseHis=$("#diseaseHis").val();
        var allergyHis=$("#allergyHis").val();
        var remark=$("#remark").val();
        if(name==""||gender==""||birthday==""||report==""||diseaseHis==""||allergyHis==""||remark=="") {
            if(name=="") alert("姓名不能为空！");
            else if(gender=="") alert("性别不能为空！");
            else if(birthday=="") alert("生日不能为空！");
            else if(report=="") alert("诊断报告不能为空！");
            else if(diseaseHis=="") alert("病史不能为空！");
            else if(allergyHis=="") alert("过敏史不能为空！");
            else if(remark=="") alert("备注不能为空！");

        }
        else {
            $.ajax({
                url: "/wx/parentCenter/addDemand",
                type: 'post',
                dataType: 'json',
                data: {
                    "userId": userId,
                    "name": name,
                    "gender": gender,
                    "birthday": birthday,
                    "report": report,
                    "diseaseHis": diseaseHis,
                    "allergyHis": allergyHis,
                    "remark": remark
                },
                success: function () {
                    window.location.href = document.referrer;
                },
                error: function () {

                }
            });
        }
    }
</script>
