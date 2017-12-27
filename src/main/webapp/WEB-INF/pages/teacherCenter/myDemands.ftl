<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html>
<head>
    <title>我的患者</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
    <style>
        body{
            background-color: #f5f5f5;
        }
    </style>
</head>

<body>
<div id="main">

    <#--<div class="info-header">-->
        <#--<div class="info-header-img col-sm-4">-->
            <#--<img src="${user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}")}" class="img-circle">-->
        <#--</div>-->
        <#--<div class="col-sm-7">-->
            <#--<div class="row">-->
                <#--<div class="col-sm-11">-->
                    <#--<p class="info-header-name">${(name)!}</p>-->
                <#--</div>-->
                <#--<div class="col-sm-1">-->
                    <#--<div class="i1"><a href="${path}/wx/teacherCenter/${user.id}/myInfo"><span><i class="fa fa-angle-right fa-5x"  style="color:white;display: inline"></i></span></a></div>-->
                <#--</div>-->
            <#--</div>-->
            <#--<div class="row">-->
                <#--<div class="col-sm-10">-->
                    <#--<p class="info-header-other" style="font-size: 40px">-->
                   <#--</p>-->
                <#--</div>-->
                <#--<div class="col-sm-2">-->
                    <#--<div class="i2" style="margin-top: 40px"><a href="${path}/wx/teacherCenter/${user.id}/myMessages"><span><i class="fa fa-envelope-o fa-5x"  style="color:white;display: inline"></i></span></a></div>-->
                <#--</div>-->
            <#--</div>-->
        <#--</div>-->
    <#--</div>-->


    <#if demands??>
        <div class="demands-div">
            <#list demands as demand>
                <div class="col-sm-6">
                    <div class="demand-div"  style="background-color: white">
                        <div class="row">
                        <div class="demand-img col-sm-4"><img src="/static/img/parentCenter/demandIcon.png"></div>
                        <div class="demand-info col-sm-8">
                            <p style="font-size: 50px;font-weight: bold">${demand.name!}</p>
                            <p style="font-size: 40px;">${demand.disease!}</p>
                        </div>
                        </div>
                        <div class="demand-btn">
                            <div onclick=location.href="${path}/wx/teacherCenter/${teacherId}/${user.id}/${demand.id}/demandDetail">详情</div>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    <#else>
        <p>您还没有患者</p>
    </#if>
    </div>
<#include "common/foot.ftl" />
</body>
</html>