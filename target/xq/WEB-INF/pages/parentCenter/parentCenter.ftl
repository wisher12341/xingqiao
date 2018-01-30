<#include "common/const.ftl" />
<html>
<head>
    <title>家长中心</title>
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
                    ${(user.nickname)!}
                    </span>
                  </p>
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
                    <div class="i1"><a href="${path}/wx/parentCenter/${user.id}/myInfo"><i class="glyphicon glyphicon-cog"  style="color:white;display: inline"></i><span style="font-size: 40px;color: white;margin-left: 5px">设置</span></a></div>
                </div>
            </div>
        </div>
    </div>



    <div style="background-color: white; border-bottom: 1px solid #ccc;" align="center">
            <div class="row" style="width: 95%">
                <div class="col-xs-4" onclick=location.href="/wx/teacherCenter/${user.id}/mySchedule">
                    <div>
                        <span class="glyphicon glyphicon-heart icon_mid"></span>
                    </div>
                    <div class="text_div">
                        <span class="text_mid">我的需求</span>
                    </div>
                </div>

                <div class="col-xs-4" onclick=location.href="parentCenter/${user.id}/myTeacher">
                    <div>
                        <span class="fa fa-users icon_mid"></span>
                    </div>
                    <div class="text_div">
                        <span class="text_mid">我的治疗师</span>
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
        <div class="info row" onclick=location.href="parentCenter/${user.id}/myInfo" >
                <div class="col-xs-1">
                    <i class="fa fa-user-circle fa-4x icon_fa"></i>
                </div>
                <div class="col-xs-10">
                    <p class="text_p"> 个人资料</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
        </div>
    </div>

    <div class="buttonDiv_info" >
        <div class="info row">
            <div class="col-xs-1">
                <i class="fa fa-envelope-o fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 评价中心</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row">
            <div class="col-xs-1">
                <i class="fa fa-pencil-square-o fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 消息中心</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info" >
        <div class="info row">
            <div class="col-xs-1">
                <i class="fa fa-exclamation-circle fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 问题反馈</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row">
            <div class="col-xs-1">
                <i class="fa fa-heart fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 帮助中心</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row">
            <div class="col-xs-1">
                <i class="glyphicon glyphicon-star fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 关于星桥</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>
</div>

</body>
</html>
