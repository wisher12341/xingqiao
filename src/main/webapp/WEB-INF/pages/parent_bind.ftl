<#include "order/common/const.ftl" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <#--<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">-->
<#include "parentCenter/common/head.ftl" />
    <title>账号绑定</title>
    <style>
        body{
            background-color: #f5f5f5;
        }
        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .info{
            height: 120px;
            padding-top: 25px;
            background-color: white;
            margin: 4px 0;
        }
        .text_p{
            font-size: 45px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            font-weight: bold;
        }
        .text_pp{
            font-size: 40px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            position: relative;
            top:5px;
        }
        .icon_fa{
            position: relative;
            top: 5px;
            color: dimgrey;
        }
        .foot{
            background-color: #f5f5f5;
        }
        .foot input{
            /*background-color:#94e6c8 ;*/
            background-color: #20b49a;
            color: white !important;
            font-size: 45px;
            font-weight: bold;
            padding: 20px;
            margin: 2% auto;
            border-radius: 15px;
            height:7%;
            border: none;
        }
        .textInput{
            font-size: 40px;
            border: none;
            border-radius: 10px;
            width: 100%;
        }
        .fa{
            font-size: 48px!important;
            color: grey;
            margin-top: 10px;
            margin-left: 30px;
            opacity: 0.6;
        }
        .btn{
            font-size: 42px!important;
            background-color: white!important;
            color: #20b49a!important;
            border: 1px solid #20b49a;
            border-radius: 10%;
        }
    </style>
    <#--<link href="${path}/static/css/login.css" type="text/css" rel="stylesheet" />-->
</head>
<body>
<div id="main">
    <form action="${path}/wx/login/parent/bindAccount" id="regAccount" method="post">
        <div class="buttonDiv_info">
            <div class="info row" >
                <div class="col-xs-1" style="text-align: right;width: 10%!important;">
                    <i class="fa fa-phone"></i>
                </div>
                <div class="col-xs-10">
                    <input placeholder="手机号" type="text" class="textInput" name="username">
                </div>
            </div>
            <div class="info row" >
                <div class="col-xs-1" style="text-align: right;width: 10%!important;">
                    <i class="fa fa-id-badge" > </i>
                </div>
                <div class="col-xs-6">
                    <input placeholder="请输入收到的验证码" type="text" class="textInput code">
                </div>
                <div class="col-xs-3">
                    <input type="button" onclick="sendphonecode()" class="btn" value="获取验证码" id="sendCode">
                </div>
            </div>
            <div class="info row">
                <div class="col-xs-1" style="text-align: right;width: 10%!important;">
                    <i class="fa fa-lock"> </i>
                </div>
                <div class="col-xs-10">
                    <input placeholder="创建新密码（6-20位数字或英文字符）" type="password" class="textInput" name="password">
                </div>
            </div>
            <div class="info row">
                <div class="col-xs-1" style="text-align: right;width: 10%!important;">
                    <i class="fa fa-repeat"> </i>
                </div>
                <div class="col-xs-10">
                    <input placeholder="再次输入密码" type="password" class="textInput pw">
                </div>
            </div>
            <input type="hidden" name="openid" value="${openid!}">
        </div>
    <div class="foot" align="center">
        <input type="button" style="width: 95% !important;" onclick="reg()" value="重置密码">
    </div>


    </form>
</div>



</body>
<script type="text/javascript">

    var number;//用于存储验证码
    var second = 60,
            timePromise = undefined;

    function sendphonecode() {
        if($('input[name="username"]').val()==''){
            alert("手机号不能为空");
            return;
        }
        $('#sendCode').attr("class","btn btn-primary disabled");

        $.ajax({
            method: 'POST',
            url: '/wx/login/getNumber/login',
            data: {
                'phone': $('#regAccount input[name="username"]').val()
            }
        }).success(function (data) {
            if(data.success==true) {
                number = data.data;
            }else{
                alert(data.data);
            }
        }).error(function (data) {

        });
        $("#sendCode").prop("disabled",true);
        timePromise=setInterval("daojishi()",1000,100);
    }


    function daojishi() {
        if(second<=0){
            clearInterval(timePromise);
            timePromise = undefined;
            second = 60;
            $('#sendCode').val("重发验证码");
            $('#sendCode').attr("class","btn btn-primary");
            $("#sendCode").prop("disabled",false);
        }else{
            $('#sendCode').val(second + "秒后可重发");
            second--;

        }
    }

    function reg() {
        var flag=0;
        $("#regAccount .textInput").each(function () {
            if($(this).val().trim()==""){
                flag=1;
            }
        });
        if(flag==1){
            alert("信息填写不完整");
            return;
        }
        if(number==null || number=='' || number!=$('#regAccount .code').val()){
            alert("验证码错误");
            return;
        }
        if($('#regAccount input[name="password"]').val()!=$('#regAccount .pw').val()){
            alert("两次密码不一致");
            return;
        }
        $("#regAccount").submit();
    }

</script>
</html>