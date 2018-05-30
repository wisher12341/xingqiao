<#include "common/const.ftl" />

<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>个人资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <style>
        body{
            background-color: #f5f5f5;
        }
        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .info,.info_head{
            background-color: white;
            margin: 4px 0;
        }
        .info{
            height: 120px;
            padding-top: 30px;
        }
        .info_head{
            height: 200px;
            padding-top: 60px;
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
        .text_ppp{
            font-size: 35px;
            display: inline;
            float: right;
            position: relative;
            top:5px;
        }
        .foot{
            position: fixed;
            width: 100%;
            bottom: 0;
            background-color: #f5f5f5;
        }
        .foot button{
            /*background-color:#94e6c8 ;*/
            background-color: #20b49a;
            color: white !important;
            font-size: 45px;
            font-weight: bold;
            padding: 20px;
            margin: 0 auto;
            border-radius: 15px;
            height:6%
        }
    </style>
</head>
<body>


<div id="main">
<#--<form action="" method="post">-->
    <div class="buttonDiv_info" onclick=location.href="${path}/wx/parentCenter/${user.id}/changeIconPage" >
        <div class="info_head row">
            <div class="col-xs-4">
                <p class="text_p"> 头像<span style="color: red;position: relative;top: 8px;left: 10px">*</span></p>
            </div>
            <div class="col-xs-7">
                <img style="height: 150px;width: 150px;position: relative;top: -35px;"  src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle">
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info">
        <div class="info row" >
            <div class="col-xs-4">
                <p class="text_p"> 用户ID</p>
            </div>
            <div class="col-xs-7">
                <p class="text_pp"> ${(user.id)!}</p>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/parentCenter/base/nickname/${(user.nickname)!''}/edit">
            <div class="col-xs-4">
                <p class="text_p"> 昵称<span style="color: red;position: relative;top: 8px;left: 10px">*</span></p>
            </div>
            <div class="col-xs-7">
                <p class="text_pp"> ${(user.nickname)!'<span style="color:red;font-size:35px">未填写</span>'}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/parentCenter/base/gender/${(user.gender)!''}/edit">
            <div class="col-xs-4">
                <p class="text_p"> 性别<span style="color: red;position: relative;top: 8px;left: 10px">*</span></p>
            </div>
            <div class="col-xs-7">
                <p class="text_pp"> ${(user.gender==0)?string('男','女')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>
    <div class="buttonDiv_info">
        <div class="info row" <#if (user.username)?? && (user.username)!=''><#else >onclick=location.href="/wx/login/parent/bindAccount"</#if>>
            <div class="col-xs-4">
                <p class="text_p"> 手机号<span style="color: red;position: relative;top: 8px;left: 10px">*</span></p>
            </div>
            <div class="col-xs-7">
                <p class="text_pp"> ${((user.username)?? && ((user.username)!'')=="")?string('<p class="text_ppp"> <span style="color:red">未认证</span></p>',"<p class='text_pp'> "+user.username+"</p>")}</p></p>
            </div>
            <#if (user.username)?? && (user.username)!=''>
            <#else >
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </#if>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/parentCenter/base/email/${((user.email)??)?string((user.email)!,"none")}/edit">
            <div class="col-xs-4">
                <p class="text_p"> 邮箱</p>
            </div>
            <div class="col-xs-7">
                ${((user.email)??)?string("<p class='text_pp'> "+(user.email)!''+"</p>",'<p class="text_ppp"> <span style="color:red">未填写</span></p>')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>


</div>

<div class="foot" align="center">
    <button style="width: 100% !important;" onclick=location.href="/wx/parentCenter">回到个人中心</button>
</div>
</body>
</html>
