<#include "common/const.ftl" />
<html>
<head>
    <title>简历详情</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
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
        <div style="height: 30px;background-color: #e6ece3"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p  style="color: #20b49a">基本信息</p>
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/name/demand/modifyPage">
                        <div class="list-item-title">姓名： </div>
                        <div class="list-item-text">${(demand.name)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>

                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/birthday/demand/modifyPage">
                        <div class="list-item-title">出生日期： </div>
                        <div class="list-item-text">${(demand.birthday)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/report/demand/modifyPage">
                        <div class="list-item-title">诊断报告： </div>
                        <div class="list-item-text">${(demand.report)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/diseaseHis/demand/modifyPage">
                        <div class="list-item-title">病史： </div>
                        <div class="list-item-text">${(demand.diseaseHis)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/allergyHis/demand/modifyPage">
                        <div class="list-item-title">过敏史： </div>
                        <div class="list-item-text">${(demand.allergyHis)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/remark/demand/modifyPage">
                        <div class="list-item-title">备注： </div>
                        <div class="list-item-text">${(demand.remark)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
            </ul>
        </div>
        <div style="height: 30px;background-color: #e6ece3"></div>
        <div class="info-part-item" style=";padding-top: 30px">
              <p style="color: #20b49a">康复史 </p>
        <#if recoveryHisList??>
            <table class="table recoveryHis-table table-striped">
                <thead>
                <tr>
                    <th>历史康复机构</th>
                    <th>康复起止时间</th>
                    <th>康复频次(周)</th>
                    <th>康复形式及康复内容</th>
                    <th></th>
                </tr>
                </thead>

                <tbody> <#list recoveryHisList as recoveryHis>
                <tr>
                    <td>
                        <div>
                            <span>${recoveryHis.name}</span>
                        </div>
                    </td>
                    <td>
                        <div>
                            <span>${recoveryHis.time}</span>
                        </div>
                    </td>
                    <td>
                        <div>
                            <span>${recoveryHis.count}</span>
                        </div>
                    </td>
                    <td>
                        <div>
                            <span>${recoveryHis.detail}</span>
                        </div>
                    </td>
                    <td>
                        <a class="fa fa-edit" onclick=location.href="${path}/wx/parentCenter/${userId}/myDemands/${demand.id}/demandDetail/${recoveryHis.toString()}/modifyRecoveryHis"></a>
                    </td>
                </tr>

                </#list>
                </tbody>
            </table>
            <#else>
            <div style="text-align: center"><p style="color: #1a1a1a">您还没有添加过康复史。</p></div>
        </#if>
            <div style="margin-top: 200px"></div>

            <div class="addBtn" style="text-align: center" onclick=location.href="${path}/wx/parentCenter/${userId}/myDemands/${demand.id}/demandDetail/addRecoveryHis">添加康复史</div>
        </div>
        <div style="height: 30px;background-color: #dff0d8"></div>
</div>
</body>
</html>