<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>填写个人资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/parentCenter/parentCenter.js" type="text/javascript" ></script>
</head>
<body>
<div id="main">
    <form id="infoForm" class="modify-group" action="/wx/parentCenter/${userId}/fillInfo">
        <div class="demandModifyDiv">
            <label for="input" class="row control-label">姓名</label>
            <div class="row">
                <input type="text" class="form-control" id="realName" name="realName" value="" >
            </div>
        </div>
        <div class="demandModifyDiv">
            <label for="input" class="row control-label">性别</label>
            <div class="row">
                <div class="radio-input">
                    <input type="radio" name="gender" value="0" style="height: 50px"> 男
                    <input type="radio"  name="gender" value="1" style="height: 50px"> 女
                </div>
            </div>
        </div>
        <div class="demandModifyDiv">
            <label for="input" class="row control-label">手机</label>
            <div class="row">
                <input type="text" class="form-control" id="phone" name="phone"  value="" >
            </div>
        </div>
        <div class="demandModifyDiv">
            <label for="input" class="row control-label">邮箱</label>
            <div class="row">
                <input type="text" class="form-control" id="email" name="email" value="" >
            </div>
        </div>
        <div class="demandModifyDiv">
            <label for="input" class="row control-label">身份证号</label>
            <div class="row">
                <input type="text" class="form-control" id="pid" name="pid"  value="" >
            </div>
        </div>
        <div class="demandModifyDiv">
            <label for="input" class="row control-label">住址</label>
            <div class="row">
                <input type="text" class="form-control" id="ground" name="ground"  value="" >
            </div>
            <div class="row">
                <input type="text" class="form-control" id="address" name="address"  value="" >
            </div>
        </div>
    </form>

    <div class="saveBtn fa fa-save fa-4x" onclick="submitInfo()"> 保存</div></div>



</body>
<script>
    function submitInfo() {
        if($("#realName").val()==null || $("#realName").val()==""){
            alert("姓名不能为空！");
        }
        else if($("#phone").val()==null || $("#phone").val()==""){
            alert("手机不能为空！");
        }
        else if($("#email").val()==null || $("#email").val()==""){
            alert("邮箱不能为空！");
        }
        else if($("#pid").val()==null || $("#pid").val()==""){
            alert("身份证号不能为空！");
        }
//        else if($("#address").val()==null || $("#address").val()=="" ||$("#ground").val()==null || $("#ground").val()=="" ){
//            alert("住址不能为空！");
//        }
        else{
            $("#infoForm").submit();
        }
    }
</script>
</html>
