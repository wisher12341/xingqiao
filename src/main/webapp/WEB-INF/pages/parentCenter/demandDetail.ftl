<#include "common/const.ftl" />
<html>
<head>
    <title>简历详情</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
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
                    <p class="info-header-other" style="font-size: 40px">
                   </p>
                </div>
                <div class="col-sm-2">
                    <div class="i2" style="margin-top: 40px"><a href="${path}/wx/parentCenter/${user.id}/myMessages"><span><i class="fa fa-envelope-o fa-5x"  style="color:white;display: inline"></i></span></a></div>
                </div>
            </div>
        </div>
    </div>
    <div class="myInfoDiv">

        <div class="buttonDiv_info">

            <div class="info row" onclick=location.href="${path}/wx/parentCenter/${demand.id}/name/demand/modifyPage">
                <div class="col-xs-3">
                    <p class="text_p"> 姓名</p>
                </div>
                <div class="col-xs-8">
                    <p class="text_pp"> ${(demand.name)!}</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
            <div class="info row" onclick=location.href="${path}/wx/parentCenter/${demand.id}/birthday/demand/modifyPage">
                <div class="col-xs-3">
                    <p class="text_p"> 出生日期</p>
                </div>
                <div class="col-xs-8">
                    <p class="text_pp"> ${(demand.birthday)!}</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
            <div class="info row" onclick=location.href="${path}/wx/parentCenter/${demand.id}/gender/demand/modifyPage">
            <div class="col-xs-3">
                <p class="text_p"> 性别</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"><#if (demand.gender)??> ${(demand.gender==1)?string("男","女")}</#if></p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
            <div class="info row" onclick=location.href="${path}/wx/parentCenter/${demand.id}/report/demand/modifyPage">
                <div class="col-xs-3">
                    <p class="text_p"> 诊断报告</p>
                </div>
                <div class="col-xs-8">
                    <p class="text_pp"> ${(demand.report)!}</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>

            <div class="info row" onclick=location.href="${path}/wx/parentCenter/${demand.id}/diseaseHis/demand/modifyPage">
                <div class="col-xs-3">
                    <p class="text_p"> 病史</p>
                </div>
                <div class="col-xs-8">
                    <p class="text_pp"> ${(demand.diseaseHis)!}</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
            <div class="info row" onclick=location.href="${path}/wx/parentCenter/${demand.id}/allergyHis/demand/modifyPage">
                <div class="col-xs-3">
                    <p class="text_p"> 过敏史</p>
                </div>
                <div class="col-xs-8">
                    <p class="text_pp"> ${(demand.allergyHis)!}</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
            <div class="info row" onclick=location.href="${path}/wx/parentCenter/${demand.id}/remark/demand/modifyPage">
                <div class="col-xs-3">
                    <p class="text_p"> 备注</p>
                </div>
                <div class="col-xs-8">
                    <p class="text_pp"> ${(demand.remark)!}</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
            </div>

        <div class="buttonDiv_info">
            <div class="info row" onclick=location.href="/wx/parentCenter/${demand.id}/recoveryHis">
                <div class="col-xs-1">
                    <i class="fa fa-user-circle fa-4x icon_fa"></i>
                </div>
                <div class="col-xs-10">
                    <p class="text_p"> 康复史</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
        </div>


        <#--<div class="info-part-item" style=";padding-top: 30px">-->
              <#--<p style="color: #20b49a">康复史 </p>-->
        <#--<#if recoveryHisList??>-->
            <#--<table class="table recoveryHis-table table-striped">-->
                <#--<thead>-->
                <#--<tr>-->
                    <#--<th>历史康复机构</th>-->
                    <#--<th>康复起止时间</th>-->
                    <#--<th>康复频次(周)</th>-->
                    <#--<th>康复形式及康复内容</th>-->
                    <#--<th></th>-->
                <#--</tr>-->
                <#--</thead>-->

                <#--<tbody> <#list recoveryHisList as recoveryHis>-->
                <#--<tr>-->
                    <#--<td>-->
                        <#--<div>-->
                            <#--<span>${recoveryHis.name}</span>-->
                        <#--</div>-->
                    <#--</td>-->
                    <#--<td>-->
                        <#--<div>-->
                            <#--<span>${recoveryHis.time}</span>-->
                        <#--</div>-->
                    <#--</td>-->
                    <#--<td>-->
                        <#--<div>-->
                            <#--<span>${recoveryHis.count}</span>-->
                        <#--</div>-->
                    <#--</td>-->
                    <#--<td>-->
                        <#--<div>-->
                            <#--<span>${recoveryHis.detail}</span>-->
                        <#--</div>-->
                    <#--</td>-->
                    <#--<td>-->
                        <#--<a class="fa fa-edit" onclick=location.href="${path}/wx/parentCenter/${userId}/myDemands/${demand.id}/demandDetail/${recoveryHis.toString()}/modifyRecoveryHis"></a>-->
                    <#--</td>-->
                <#--</tr>-->

                <#--</#list>-->
                <#--</tbody>-->
            <#--</table>-->
            <#--<#else>-->
            <#--<div style="text-align: center"><p style="color: #1a1a1a">您还没有添加过康复史。</p></div>-->
        <#--</#if>-->
            <#--<div style="margin-top: 200px"></div>-->

            <#--<div class="addBtn" style="text-align: center" onclick=location.href="${path}/wx/parentCenter/${userId}/myDemands/${demand.id}/demandDetail/addRecoveryHis">添加康复史</div>-->
        <#--</div>-->
        <#--<div style="height: 30px;background-color: #dff0d8"></div>-->
</div>
</body>
</html>