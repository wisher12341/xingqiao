<#include "common/const.ftl" />
<html>
<head>
    <title>需求管理</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
    <style>
        body{
            background-color: #f5f5f5;
        }

        .buttonDiv_info{
            margin: 2% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .info,.info_head{
            background-color: white;
            margin: 4px 0;
        }
        .info{
            height: 250px;
            padding-top: 30px;
        }

        .text_p{
            font-size: 55px;
            display: block;
            color: dimgrey;
            font-weight: bold;
            margin-top: 20px;
        }
        .text_pp{
            font-size: 40px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            position: relative;
            top:5px;
        }
        .text_ppp{
            display: block;
            font-size: 40px;
            top:5px;
        }
        .icon_fa{
            /*position: relative;*/
            /*top: 5px;*/
            color: dimgrey;
        }
        .number{
            background-color: #20b49a;
            color: white;
            padding: 10px 20px;
            border-radius: 50%;
            font-weight: bold;
        }
    </style>
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

    <#list demands as demand>
        <div class="buttonDiv_info" onclick=location.href="${path}/wx/parentCenter/${user.id}/myDemands/${demand.id}/demandDetail">
            <div class="info row" onclick=location.href="">
                <div class="col-xs-3">
                    <div><img src="../../../static/img/parentCenter/demandIcon.png" style="width: 150px;margin: 20px"></div>
                </div>
                <div class="col-xs-8">
                    <p class="text_p"> ${demand.name!}</p>
                    <p class="text_ppp">${demand.disease!}</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa" style="margin-top: 50px"></i>
                </div>
            </div>
        </div>

    </#list>

<#else>
    <p>您还未添加任何需求简历</p>
</#if>

</div>


<div class="addBtn" style="text-align: center;margin-bottom: 120px" onclick=location.href="${path}/wx/parentCenter/${user.id}/addDemandPage">添加需求简历</div>
<div class="addBtn" style="text-align: center" onclick=location.href="/wx/parentCenter">回到个人中心</div>
</body>
</html>