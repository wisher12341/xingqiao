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
    <div id="title" class="row">
        <div class="col-sm-2" style="text-align: center"></div>
        <div class="col-sm-8 titleText"><p>添加需求简历</p></div>
        <div class="col-sm-2" style="text-align: center">

            <a id="saveBtn" class="fa fa-save fa-4x" onclick="addDemand(${userId})"></a>

        </div>
    </div>
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

</div>
</body>
</html>
<script>
    function addDemand(userId) {
        var name=$("#name").val();
        var gender=$("input[type='radio']:checked").val();
        var birthday=$("#birthday").val();
        var report=$("#report").val();
        var diseaseHis=$("#diseaseHis").val();
        var allergyHis=$("#allergyHis").val();
        var remark=$("#remark").val();

        $.ajax({
            url: "/wx/parentCenter/addDemand",
            type: 'post',
            dataType: 'json',
            data: {
                "userId":userId,
                "name": name,
                "gender": gender,
                "birthday":birthday,
                "report":report,
                "diseaseHis": diseaseHis,
                "allergyHis":allergyHis,
                "remark":remark
            },
            success: function(){
                window.location.href=document.referrer;
            },
            error: function(){

            }
        });
    }
</script>
