<#include "order/common/const.ftl" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <#--<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">-->
<#include "parentCenter/common/head.ftl" />
    <title>治疗师登录</title>
    <#--<link href="${path}/static/css/login.css" type="text/css" rel="stylesheet" />-->
    <script src="${path}/static/js/login.js" type="text/javascript" ></script>
    <style>
        body{
            /*background-color: #f5f5f5;*/
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
        .foot{
            /*background-color: #f5f5f5;*/
        }
        .foot input,.foot button{
            /*background-color:#94e6c8 ;*/
            background-color: #20b49a;
            color: white !important;
            font-size: 45px;
            font-weight: bold;
            padding: 20px 100px;
            margin: 2% 1%;
            border-radius: 15px;
            height:7%;
            border: none;
        }
        #select{
            margin-top: 20%;
        }

        #select .but{
            width: 80%;
            font-size: 45px;
            border: none;
            border-radius: 20px;
            background-color: #20b49a;
            color: white;
            padding: 25px;
            margin: 40px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div id="logo" align="center" style="margin-top: 15%">
    <img src="/static/img/logo.jpg" width="40%">
</div>
<div id="select" align="center">
    <#--<div class="foot">-->
        <button class="but" onclick="$('#select').hide();$('#accountBind').show()">登录</button>
        <button class="but" onclick="$('#select').hide();$('#regAccount').show()">注册</button>
    <#--</div>-->
</div>

<div id="accountBind" style="display: none" align="center">
    <form action="${path}/wx/login" method="post">
        <div class="buttonDiv_info">
            <div class="info row" >
                <div class="col-xs-1" style="text-align: right;width: 10%!important;">
                    <i class="fa fa-phone"></i>
                </div>
                <div class="col-xs-10">
                    <input placeholder="手机号" type="text" class="textInput" name="username">
                </div>
            </div>
            <div class="info row">
                <div class="col-xs-1" style="text-align: right;width: 10%!important;">
                    <i class="fa fa-lock"> </i>
                </div>
                <div class="col-xs-10">
                    <input placeholder="密码" type="password" class="textInput" name="password">
                </div>
            </div>
            <#if message??>
                <div class="info row">
                    <div class="col-xs-1" style="text-align: right;width: 10%!important;">
                    <#--<i class="fa fa-lock"> </i>-->
                    </div>
                    <div class="col-xs-10">
                        <span style="color: red;text-align: center">${message!}</span>
                    </div>
                </div>
            </#if>
        </div>


        <#--<div class="group">-->
            <#--<span class="la">账号：</span><input type="text" name="username" class="textInput" placeholder="手机号"/>-->
        <#--</div>-->
        <#--<div class="group">-->
            <#--<span class="la">密码：</span><input type="password" name="password" class="textInput" placeholder="password"/>-->
        <#--</div>-->
        <#--<div class="group">-->
            <#--<span style="color: red;text-align: center">${message!}</span>-->
        <#--</div>-->
        <input type="hidden" name="openid" value="${openid!}">
        <input type="hidden" name="status" value="1">
        <div class="foot">
            <input type="submit" value="登录"  class="submit">
            <input type="button" value="返回"  class="submit" onclick="$('#accountBind').hide();$('.textInput').val('');$('#select').show();">
        </div>
    </form>
</div>
<div id="regAccount" style="display: none" align="center">
    <form action="${path}/wx/login/teacher/reg" method="post" id="regForm">
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
        </div>
        <input type="hidden" name="openid" value="${openid!}">
        <div class="foot">
            <input onclick="reg()" type="button" value="注册"  class="submit">
            <input type="button" value="返回"  class="submit" onclick="$('#regAccount').hide();$('.textInput').val('');$('#select').show();">
        </div>
    </form>
</div>

<#if message??>
<script>
    $('#select').hide();
    $('#accountBind').show();
</script>
</#if>
</body>
<script type="text/javascript">

    var number;//用于存储验证码
    var second = 60,
            timePromise = undefined;

        function sendphonecode() {
            if($('#regAccount input[name="username"]').val()==''){
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
                    alert("该手机号已注册");
                }
            }).error(function (data) {

            });

            timePromise=setInterval("daojishi()",1000,100);
        }


    function daojishi() {
        if(second<=0){
            clearInterval(timePromise);
            timePromise = undefined;
            second = 60;
            $('#sendCode').val("重发验证码");
            $('#sendCode').attr("class","btn btn-primary");

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
        $("#regForm").submit();
    }

</script>
</html>