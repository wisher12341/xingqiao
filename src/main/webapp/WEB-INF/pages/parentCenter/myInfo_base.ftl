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
    </style>
</head>
<body>


<div id="main">
<#--<form action="" method="post">-->
    <div class="buttonDiv_info" onclick=location.href="${path}/wx/parentCenter/${user.id}/changeIconPage" >
        <div class="info_head row">
            <div class="col-xs-3">
                <p class="text_p"> 头像</p>
            </div>
            <div class="col-xs-8">
                <img style="height: 150px;width: 150px;position: relative;top: -35px;"  src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle">
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info">
        <div class="info row" >
            <div class="col-xs-3">
                <p class="text_p"> 用户ID</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"> ${(user.id)!}</p>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/parentCenter/base/nickname/${(user.nickname)!''}/edit">
            <div class="col-xs-3">
                <p class="text_p"> 昵称</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"> ${(user.nickname)!'<span style="color:red;font-size:35px">未填写</span>'}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/parentCenter/base/gender/${(user.gender)!''}/edit">
            <div class="col-xs-3">
                <p class="text_p"> 性别</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"> ${(user.gender==0)?string('男','女')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>
    <div class="buttonDiv_info">
        <div class="info row" <#if (user.username)?? && (user.username)!=''><#else >onclick=location.href="/wx/login/parent/bindAccount"</#if>>
            <div class="col-xs-3">
                <p class="text_p"> 手机号</p>
            </div>
            <div class="col-xs-8">
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
            <div class="col-xs-3">
                <p class="text_p"> 邮箱</p>
            </div>
            <div class="col-xs-8">
                ${((user.email)??)?string("<p class='text_pp'> "+(user.email)!''+"</p>",'<p class="text_ppp"> <span style="color:red">未填写</span></p>')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>


</div>
</body>
</html>
