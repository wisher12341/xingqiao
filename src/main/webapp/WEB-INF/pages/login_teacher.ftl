<#include "order/common/const.ftl" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<#include "order/common/head.ftl" />
    <title>治疗师登录</title>
    <link href="${path}/static/css/login.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/login.js" type="text/javascript" ></script>
</head>
<body>
<div id="logo" align="center">
    <img src="/static/img/logo.jpg" width="40%">
</div>
<div id="select" align="center">
    <button class="but" onclick="$('#select').hide();$('#accountBind').show()">登录</button>
    <button class="but" onclick="$('#select').hide();$('#regAccount').show()">注册</button>
</div>

<div id="accountBind" style="display: none" align="center">
    <form action="${path}/wx/login" method="post">
        <div class="group">
            <span class="la">账号：</span><input type="text" name="username" class="textInput" placeholder="手机号"/>
        </div>
        <div class="group">
            <span class="la">密码：</span><input type="password" name="password" class="textInput" placeholder="password"/>
        </div>
        <div class="group">
            <span style="color: red;text-align: center">${message!}</span>
        </div>
        <input type="hidden" name="openid" value="${openid!}">
        <input type="hidden" name="status" value="1">
        <input type="submit" value="登录"  class="submit">
        <input type="button" value="返回"  class="submit" onclick="$('#accountBind').hide();$('.textInput').val('');$('#select').show();">
    </form>
</div>
<div id="regAccount" style="display: none" align="center">
    <form action="${path}/wx/login/teacher/reg" method="post" id="regForm">
        <div class="container">
            <div class="row">
                <div class="col-xs-4 la_div">
                    <span class="la">账号：</span>
                </div>
                <div class="col-xs-8">
                    <input type="text" name="username" class="textInput" placeholder="手机号"/>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 la_div">
                    <span class="la">验证码：</span>
                </div>
                <div class="col-xs-4">
                    <input class="textInput code"/>
                </div>
                <div class="col-xs-4">
                    <input type="button" onclick="sendphonecode()" class="btn btn-primary" value="获取验证码" id="sendCode">
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 la_div">
                    <span class="la">密码：</span>
                </div>
                <div class="col-xs-8">
                    <input type="password" name="password" class="textInput" />
                </div>
            </div>
            <div class="row" style="margin-bottom: 20px">
                <div class="col-xs-4 la_div">
                    <span class="la">确认密码：</span>
                </div>
                <div class="col-xs-8">
                    <input type="password"  class="textInput pw" />
                </div>
            </div>
        </div>

        <input type="hidden" name="openid" value="${openid!}">
        <input onclick="reg()" type="button" value="注册"  class="submit">
        <input type="button" value="返回"  class="submit" onclick="$('#regAccount').hide();$('.textInput').val('');$('#select').show();">
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
            if($('input[name="username"]').val()==''){
                alert("手机号不能为空");
                return;
            }
            $('#sendCode').attr("class","btn btn-primary disabled");

            $.ajax({
                method: 'POST',
                url: '/wx/login/getNumber',
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