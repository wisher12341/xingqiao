<#include "../parentCenter/common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>修改密码</title>
<#include "../parentCenter/common/head.ftl" />
    <#--<link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />-->
    <#--<link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />-->
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
        .foot button{
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
</head>
<body>


<div id="main">
<form action="/wx/login/changePwd/${(user.status)!}" method="post">
    <div class="buttonDiv_info">
        <div class="info row" >
            <div class="col-xs-1" style="text-align: right;width: 10%!important;">
                <i class="fa fa-phone"></i>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"> ${(user.username)!}</p>
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
</form>
    <div class="foot" align="center">
        <button style="width: 95% !important;" onclick="reset()">重置密码</button>
    </div>



</div>
</body>

<script>
    function reset() {
        var flag=0;
        $(".textInput").each(function () {
            if($(this).val().trim()==""){
                flag=1;
            }
        });
        if(flag==1){
            alert("信息填写不完整");
            return;
        }
        if(number==null || number=='' || number!=$('.code').val()){
            alert("验证码错误");
            return;
        }
        if($('input[name="password"]').val()!=$('.pw').val()){
            alert("两次密码不一致");
            return;
        }
        $("form").submit();
    }

    var number;//用于存储验证码
    var second = 60,
            timePromise = undefined;

    function sendphonecode() {
        $('#sendCode').attr("class","btn disabled");

        $.ajax({
            method: 'POST',
            url: '/wx/login/getNumber/change',
            data: {
                'phone': '${(user.username)!}'
            }
        }).success(function (data) {
            if(data.success==true) {
                number = data.data;
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
            $('#sendCode').attr("class","btn");
            $("#sendCode").prop("disabled",false);
        }else{
            $('#sendCode').val(second + "秒后可重发");
            second--;
        }
    }
</script>
</html>
