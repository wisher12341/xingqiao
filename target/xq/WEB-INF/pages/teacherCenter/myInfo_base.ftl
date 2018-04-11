<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>基本资料</title>
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
    <div class="buttonDiv_info" onclick=location.href="${path}/wx/teacherCenter/${user.id}/changeIconPage" >
        <div class="info_head row">
            <div class="col-xs-3">
                <p class="text_p"> 头像</p>
            </div>
            <div class="col-xs-8">
                <img style="height: 150px;width: 150px;position: relative;top: -35px;"  src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle" >
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
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/base/gender/${(user.gender)!'0'}/edit">
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
        <#--<div class="info row" onclick="$('#genderSelecter').trigger('click');">-->
            <#--<div class="col-xs-3">-->
                <#--<p class="text_p"> 年龄</p>-->
            <#--</div>-->
            <#--<div class="col-xs-8">-->
                <#--<p class="text_pp">35</p>-->
            <#--</div>-->
            <#--<div class="col-xs-1">-->
                <#--<i class="fa fa-angle-right fa-4x icon_fa"></i>-->
            <#--</div>-->
        <#--</div>-->
    </div>
    <div class="buttonDiv_info">
        <div class="info row" >
            <div class="col-xs-3">
                <p class="text_p"> 手机号</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"> ${(user.username)!}</p>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/base/email/${(((user.email)!'')=="")?string("none",user.email)}/edit">
            <div class="col-xs-3">
                <p class="text_p"> 邮箱</p>
            </div>
            <div class="col-xs-8">
            ${(((user.email)!'')!="")?string("<p class='text_pp'> "+((user.email)!)+"</p>","<p class='text_ppp'><span style='color:red;font-size:35px'>未填写</span></p>")}
                <#--<p class="text_pp"> ${(user.email)!'<span style="color:red">未填写</span>'}</p>-->
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <#--<div>-->
        <#--<input type="submit" class="butt" onclick="" value="${(user.userStatus==0)?string('保存','提交审核')}">-->
    <#--</div>-->
<#--</form>-->


    <#--<div class="myInfoDiv">-->
        <#--<div class="info-part-item" >-->
            <#--<ul class="list-group">-->
                <#--<li class="list-group-item" style="">-->
                    <#--<div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/name/modifyPage">-->
                        <#--<div class="list-item-title">头像 </div>-->
                        <#--<div class="list-item-text">-->
                            <#--<img src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle" onclick=location.href="${path}/wx/teacherCenter/${user.id}/changeIconPage">-->
                        <#--</div>-->
                        <#--<span><i class="fa fa-angle-right fa-4x"></i></span>-->
                    <#--</div>-->
                <#--</li>-->

                <#--<li class="list-group-item">-->
                    <#--<div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/name/modifyPage">-->
                        <#--<div class="list-item-title">性别 </div>-->
                        <#--<div class="list-item-text">${(user.gender==0)?string('男','女')}</div>-->
                        <#--<span><i class="fa fa-angle-right fa-4x"></i></span>-->
                    <#--</div>-->
                <#--</li>-->

                <#--<li class="list-group-item">-->
                    <#--<div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/email/modifyPage">-->
                        <#--<div class="list-item-title">邮箱 </div>-->
                        <#--<div class="list-item-text">${(user.email)!}</div>-->
                        <#--<span><i class="fa fa-angle-right fa-4x"></i></span>-->
                    <#--</div>-->
                <#--</li>-->
            <#--</ul>-->
        <#--</div>-->
    <#--</div>-->
</div>
</body>
</html>
