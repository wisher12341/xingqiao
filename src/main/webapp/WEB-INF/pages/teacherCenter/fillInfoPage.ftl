<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>填写个人资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/teacherCenter/teacherCenter.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/parentCenter/parentCenter.js" type="text/javascript" ></script>
</head>
<body>
<div id="main">
    <form id="infoForm" class="modify-group" action="/wx/teacherCenter/${userId}/fillInfo">
        <ul id="fillInfoTab" class="nav nav-tabs">
            <li>
                <a href="#basic" data-toggle="tab">
                    基本信息
                </a>
            </li>
            <li class="active">
                <a href="#service" data-toggle="tab">康复服务</a></li>
            <li><a href="#identity" data-toggle="tab">身份认证</a></li>
        </ul>
        <div id="fillInfoTabContent" class="tab-content">
            <div class="tab-pane fade" id="basic">
                <div class="demandModifyDiv">
                    <label for="input" class="row control-label">姓名</label>
                    <div class="row">
                        <input type="text" class="form-control" id="name" name="name" value="" >
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
                    <label for="input" class="row control-label">毕业院校</label>
                    <div class="row">
                        <input type="text" class="form-control" id="school" name="school" value="" >
                    </div>
                </div>
                <div class="saveBtn" onclick="$('#fillInfoTab li:eq(1) a').tab('show');"> 下一步</div>
            </div>
            <div class="tab-pane fade in active" id="service">
                <div class="demandModifyDiv">
                    <label for="input" class="row control-label">康复项目</label>
                    <div class="row">
                        <input type="text" class="form-control" id="domain" name="domain" value="" >
                    </div>
                </div>
                <div class="demandModifyDiv">
                    <label for="input" class="row control-label">康复经验年限</label>
                    <div class="row">
                        <input type="text" class="form-control" id="experienceAge" name="experienceAge" value="" >
                    </div>
                </div>
                <div class="demandModifyDiv">
                    <label for="input" class="row control-label">康复对象</label>
                    <div class="checkbox-inline-div">
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox1" value="option1"></label>
                        <div class="checkbox-text"> 0-3岁</div>
                    </div>
                    <div class="checkbox-inline-div">
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox2" value="option2"></label>
                        <div class="checkbox-text"> 3-6岁</div>
                    </div>
                    <div class="checkbox-inline-div">
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox3" value="option3"></label>
                        <div class="checkbox-text"> 6-18岁</div>
                    </div>
                    <div class="checkbox-inline-div">
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox4" value="option4"></label>
                        <div class="checkbox-text"> 成人</div>
                    </div>
                </div>
                <div class="demandModifyDiv">
                    <label for="input" class="row control-label">授课方式</label>
                    <div class="row">
                        <div class="col-sm-5"><input style="height: 50px" class="checkbox" type="checkbox" name="way">
                            <div class="checkbox-text2">治疗师上门</div></div>
                        <div class="input-group col-sm-4">
                            <input type="text" class="form-control" style="margin-top: 0">
                            <span class="input-group-addon" style="font-size: 40px">元/课时</span>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-5"><input style="height: 50px" class="checkbox" type="checkbox" name="way">
                            <div class="checkbox-text2">学生上门</div></div>
                        <div class="input-group col-sm-4">
                            <input type="text" class="form-control" style="margin-top: 0">
                            <span class="input-group-addon" style="font-size: 40px">元/课时</span>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-5"><input style="height: 50px" class="checkbox" type="checkbox" name="way">
                            <div class="checkbox-text2">线上授课</div></div>
                        <div class="input-group col-sm-4">
                            <input type="text" class="form-control" style="margin-top: 0">
                            <span class="input-group-addon" style="font-size: 40px">元/课时</span>
                        </div>
                    </div>
                </div>
                <div class="saveBtn" onclick="$('#fillInfoTab li:eq(2) a').tab('show');"> 下一步</div>
            </div>
            <div class="tab-pane fade" id="identity">
                <div class="demandModifyDiv">
                    <label for="input" class="row control-label">身份证号</label>
                    <div class="row">
                        <input type="text" class="form-control" id="pid" name="pid"  value="" >
                    </div>
                </div>
                <div class="demandModifyDiv">
                    <label for="input" class="row control-label">身份证正面照片</label>
                    <div class="row" >
                        <img src="../../../static/img/parentCenter/upload.png" id="pFrontImg" style="height: 300px;margin-top: 30px" onclick="$('#changeIcon').trigger('click');">
                        <input id="changeIcon" type="file" class="upfile" style="display: none"  onchange="previewFront()">
                    </div>
                </div>
                <div class="demandModifyDiv">
                    <label for="input" class="row control-label">身份证反面照片</label>
                    <div class="row" >
                        <img src="../../../static/img/parentCenter/upload.png" id="pBackImg" style="height: 300px;margin-top: 30px" onclick="$('#changeIcon2').trigger('click');">
                        <input id="changeIcon2" type="file" class="upfile" style="display: none"  onchange="previewBack()">
                    </div>
                </div>
                <div class="saveBtn" onclick="$('#fillInfoTab li:eq(2) a').tab('show');"> 保存</div>
            </div>
        </div>
    </form>





</body>
<script>
    $(document).ready(function () {
        if(" ${(user.gender)!}"=="男") $("input[name='gender']").get(0).checked=true;
        else  $("input[name='gender']").get(1).checked=true;
    });
    function submitInfo() {
        if($("#name").val()==null || $("#name").val()==""){
            alert("姓名不能为空！");
        }
        else if($("#phone").val()==null || $("#phone").val()==""){
            alert("手机不能为空！");
        }
        else if($("#email").val()==null || $("#email").val()==""){
            alert("邮箱不能为空！");
        }
        else if($("#school").val()==null || $("#school").val()==""){
            alert("毕业院校不能为空！");
        }


        else if($("#domain").val()==null || $("#domain").val()==""){
            alert("康复项目不能为空！");
        }
        else if($("#experienceAge").val()==null || $("#experienceAge").val()==""){
            alert("康复经验年限不能为空！");
        }
        else if($("#object").val()==null || $("#object").val()==""){
            alert("康复对象不能为空！");
        }
        else if($("#pid").val()==null || $("#pid").val()==""){
            alert("身份证号不能为空！");
        }
        else if($("#pid").val()==null || $("#pid").val()==""){
            alert("身份证号不能为空！");
        }
        else if($("#pid").val()==null || $("#pid").val()==""){
            alert("身份证号不能为空！");
        }
//
        else{
            var name=$("#name").val();
            var gender=$('input[name="gender"]').filter(':checked').val();
            var phone=$("#phone").val();
            var email=$("#email").val();
            var school=$("#school").val();


            var pid=$("#pid").val();

        }
    }

    var formDataBack=new FormData();
    var formDataFront=new FormData();

    function previewBack() {
        var preview = document.querySelector('#pBackImg');
        var file  = document.querySelector('#changeIcon2').files[0];
        formDataBack.append("img",file);
        var reader = new FileReader();
        reader.onloadend = function () {
            preview.src = reader.result;
        }
        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
    function previewFront() {
        var preview = document.querySelector('#pFrontImg');
        var file  = document.querySelector('input[type=file]').files[0];
        formDataFront.append("img",file);
        var reader = new FileReader();
        reader.onloadend = function () {
            preview.src = reader.result;
        }
        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
</script>
</html>
