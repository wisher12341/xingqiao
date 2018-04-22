<#include "common/const.ftl" />
<html>
<head>
    <title>需求管理</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />

</head>
<body>
<div id="main">
    <div class="info-header">
        <div class="info-header-img col-sm-4">
            <img src="${user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}")}" class="img-circle">
        </div>
        <div class="col-sm-7">
            <div class="row">
                <div class="col-sm-11">
                    <p class="info-header-name">${(name)!}</p>
                </div>
                <div class="col-sm-1">
                    <div class="i1"><a href="${path}/wx/parentCenter/${user.id}/myInfo"><span><i class="fa fa-angle-right fa-5x"  style="color:white;display: inline"></i></span></a></div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-10">
                </div>
                <div class="col-sm-2">
                    <div class="i2" style="margin-top: 40px"><a href="${path}/wx/parentCenter/${user.id}/myMessages"><span><i class="fa fa-envelope-o fa-5x"  style="color:white;display: inline"></i></span></a></div>
                </div>
            </div>
        </div>
    </div>

<#if demands??>
<div class="demands-div">
    <#list demands as demand>
    <div class="col-sm-6">
        <div class="demand-div">
            <div class="row">
            <div class="demand-img col-sm-4"><img src="../../../static/img/parentCenter/demandIcon.png"></div>
            <div class="demand-info col-sm-8">
                <p style="font-size: 50px;font-weight: bold">${demand.name!}</p>
                <p style="font-size: 40px;">${demand.disease!}</p>
            </div>
            </div>
            <div class="demand-btn">
                <div onclick=location.href="${path}/wx/parentCenter/${user.id}/myDemands/${demand.id}/demandDetail">详情</div>
            </div>
        </div>
    </div>
    </#list>
</div>
<#else>
    <p>您还未添加任何需求简历</p>
</#if>

</div>
<div class="row col-sm-12"><p style="margin-top: 100px"> </p></div>
<div class="addBtn" style="text-align: center" onclick=location.href="${path}/wx/parentCenter/${user.id}/addDemandPage">添加需求简历</div>

</body>
</html>