<#include "common/const.ftl" />
<html>
<head>
    <title>治疗师中心</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <style>
        .icon_mid{
            font-size: 60px;
            padding:20px 0 8px;
            color: #20b49a;
        }
        .text_mid{
            font-size: 45px;
            color: dimgrey;
        }
        .text_div{
            margin-bottom: 15px;
        }
        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .info{
            background-color: white;
            margin: 4px 0;
            height: 7%;
            padding: 20px 40px;
        }
        .text_p{
            font-size: 45px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
        }
        .icon_fa{
            position: relative;
            top: 5px;
            color: dimgrey;
        }
        .userstatus{
            font-size: 35px;
            margin-left: 10px;
        }
        .glyphicon-exclamation-sign,.glyphicon-record,.glyphicon-ok-circle,.glyphicon-remove-circle{
            font-size: 35px;
            margin-top: 30px;
            position: relative;
            top:3px;
        }
        .cog{
            position: absolute;
            top:-10%;
            right: -15%;
        }
        .glyphicon-cog{
            font-size: 40px;
            position: relative;
            top:3px;
         }
        .glyphicon-user{
            color: #20b49a!important;
        }
        .text_my{
            color: #20b49a!important;
        }
    </style>
</head>
<body style="background-color: #f5f5f5">
<div id="main">
    <div class="info-header">
        <div class="info-header-img col-sm-4">
            <img src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle">
        </div>
        <div class="col-sm-7">
            <div class="row">
                <div class="col-sm-11">
                    <p class="info-header-name"><span>
                    ${(teacher.name)!user.name}
                    </span>
                    <#list 1..teacher.star as i>
                        <span class="glyphicon glyphicon-star" style="font-size: 38px;color: orange;position: relative;top:5px;${(i==1)?string('margin-left:10px','')}"></span>
                    </#list></p>
                        <#if user.userStatus==0>
                            <i class="glyphicon glyphicon-exclamation-sign" style="color: orange"></i><span class="userstatus" style="color: orange">个人资料未认证</span>
                        <#elseif user.userStatus==1 || user.userStatus==3>
                            <i class="glyphicon glyphicon-record" style="color: burlywood"></i><span class="userstatus" style="color:  burlywood">个人资料正在审核中</span>
                        <#elseif user.userStatus==2>
                            <i class="glyphicon glyphicon-ok-circle" style="color: #dff0d8"></i><span class="userstatus" style="color: #dff0d8">个人资料已通过认证</span>
                        <#elseif user.userStatus==4>
                            <i class="glyphicon glyphicon-remove-circle" style="color:red;"></i><span class="userstatus" style="color:red;">个人资料未通过认证</span>
                        </#if>
                </div>
                <div class="cog">
                    <div class="i1"><a href="${path}/wx/teacherCenter/${user.id}/myInfo"><i class="glyphicon glyphicon-cog"  style="color:white;display: inline"></i><span style="font-size: 40px;color: white;margin-left: 5px">设置</span></a></div>
                </div>
            </div>
            <#--<div class="row">-->
                <#--<div class="col-sm-10">-->
                    <#--<p class="info-header-other" style="font-size: 40px">-->
                    <#--</p>-->
                <#--</div>-->
                <#--<div class="col-sm-2">-->
                    <#--<div class="i2" style="margin-top: 40px"><a href="${path}/wx/teacherCenter/${user.id}/myMessages"><span><i class="fa fa-envelope-o fa-5x"  style="color:white;display: inline"></i></span></a></div>-->
                <#--</div>-->
            <#--</div>-->
        </div>
    </div>


    <#--<div class="title">-->
        <#--<span class="title_span" onclick="location.href='/wx/login/1/changeAccount'">切换账号</span>-->
    <#--</div>-->

    <#--<div class="imgDiv">-->
        <#--<img src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle">-->

        <#--<p>${(teacher.name)!"${(user.username)!}"}</p>-->
    <#--</div>-->
    <#--<div>-->

    <#--</div>-->
    <div style="background-color: white; border-bottom: 1px solid #ccc;" align="center">
            <div class="row" style="width: 95%">
                <div class="col-xs-4" onclick=location.href="/wx/teacherCenter/${user.id}/mySchedule">
                    <div>
                        <span class="fa fa-calendar-check-o icon_mid"></span>
                    </div>
                    <div class="text_div">
                        <span class="text_mid">我的课表</span>
                    </div>
                </div>

                <div class="col-xs-4">
                    <div>
                        <span class="fa fa-star-o icon_mid"></span>
                    </div>
                    <div class="text_div">
                        <span class="text_mid">我的星级</span>
                    </div>
                </div>

                <div class="col-xs-4">
                    <div>
                        <span class="fa fa-line-chart icon_mid"></span>
                    </div>
                    <div class="text_div">
                        <span class="text_mid">我的数据</span>
                    </div>
                </div>
            </div>
    </div>

    <div class="buttonDiv_info">
        <div class="info row" onclick=location.href="/wx/teacherCenter/${user.id}/myInfo_base" >
                <div class="col-xs-1">
                    <i class="fa fa-user-circle fa-4x icon_fa"></i>
                </div>
                <div class="col-xs-10">
                    <p class="text_p"> 基本资料</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
        </div>
        <div class="info row" onclick=location.href="/wx/teacherCenter/${user.id}/myInfo_authentication">
            <div class="col-xs-1">
                <i class="fa fa-id-card fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 实名认证</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="/wx/teacherCenter/${user.id}/myInfo_service">
            <div class="col-xs-1">
                <i class="fa fa-heartbeat fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 康复服务</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <#--<div class="centerBtn" onclick=location.href="/wx/teacherCenter/${(teacher.id)!}/${(user.id)!}/myDemands" style="height:12%">-->
            <#--<i class="fa fa-id-card fa-5x"></i><p style="font-size: 50px; display: inline;margin-left: 10px"> 我的患者</p></div>-->
        <#--<div class="centerBtn" onclick=location.href="${path}/wx/teacherCenter/${user.id}/order" style="height:12%">-->
            <#--<i class="fa fa-users fa-5x"></i><p style="font-size: 50px; display: inline;margin-left: 10px"> 我的订单</p></div>-->
        <#--<div class="centerBtn" onclick=location.href="/wx/teacherCenter/${user.id}/myLevel" style="height:12%">-->
            <#--<i class="fa fa-star-o fa-5x"></i><p style="font-size: 50px; display: inline;margin-left: 10px"> 星级评定</p></div>-->
    </div>

    <div class="buttonDiv_info" onclick=location.href="/wx/teacherCenter/${user.id}/myMessages">
        <div class="info row">
            <div class="col-xs-1">
                <i class="fa fa-envelope-o fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 消息中心</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info" onclick=location.href="/wx/teacherCenter/${user.id}/myMessages">
        <div class="info row">
            <div class="col-xs-1">
                <i class="fa fa-pencil-square-o fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 评价中心</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>
</div>
<#include "common/foot.ftl" />
</body>
</html>
