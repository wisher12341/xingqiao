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


    <div class="myInfoDiv">
        <div class="info-part-item" style="margin-top: 30px">
            <p>基本信息</p>
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/${"姓名"}/${demand.name}/${"name"}/${"demand"}/modifyPage">
                        <div class="list-item-title">姓名  </div>
                        <div class="list-item-text">${(demand.name)!}</div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/${"性别"}/${demand.gender}/${"gender"}/${"demand"}/modifyPage">
                        <div class="list-item-title">性别  </div>
                    <#if demand.gender==1>
                        <div class="list-item-text">女</div>
                    <#else>
                        <div class="list-item-text">男</div>
                    </#if>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/${"出生日期"}/${demand.birthday}/${"birthday"}/${"demand"}/modifyPage">
                        <div class="list-item-title">出生日期  </div>
                        <div class="list-item-text">${(demand.birthday)!}</div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/${"诊断报告"}/${(demand.report)!}/${"report"}/${"demand"}/modifyPage">
                        <div class="list-item-title">诊断报告  </div>
                        <div class="list-item-text">${(demand.report)!}</div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/${"病史"}/${demand.diseaseHis}/${"diseaseHis"}/${"demand"}/modifyPage">
                        <div class="list-item-title">病史  </div>
                        <div class="list-item-text">${(demand.diseaseHis)!}</div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${demand.id}/${"过敏史"}/${demand.allergyHis}/${"allergyHis"}/${"demand"}/modifyPage">
                        <div class="list-item-title">过敏史  </div>
                        <div class="list-item-text">${(demand.allergyHis)!}</div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${"备注"}/${demand.remark}/${"remark"}/${"demand"}/modifyPage">
                        <div class="list-item-title">备注  </div>
                        <div class="list-item-text">${(demand.remark)!}</div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="info-part-item">
            <div class="row">
                <p style="display: inline;">康复史 </p>
            </div>
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

                </tr>

                </#list>

                </tbody>
            </table>

        </div>

        <div id="log" class="info-part-item">
            <p>康复日志</p>
            <div class="track-list" style="width: 100%; margin-bottom: 20px;background-color: white">
                <ul id="logUl">
                <#list recoveryLogList as log>
                    <li style=" list-style-type: none;">
                        <div>
                            <#if log_index==0>
                                <span class="glyphicon glyphicon-record" style="margin-left: -7px; color: red;font-size: 40px"></span>
                            <#else>
                                <span class="glyphicon glyphicon-record" style="margin-left: -7px; color: #e8e8e8;font-size: 40px"></span>
                            </#if>
                            <span class="date" style="margin-left: 20px">${log.time}
                                </span>
                            <div class="txt" >
                                ${log.content}
                            </div>
                        </div>
                    </li>
                </#list>
                </ul>
            </div>
        </div>

    </div>
</body>
</html>