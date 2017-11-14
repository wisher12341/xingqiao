<#include "common/const.ftl" />
<html>
<head>
    <title>个人资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="main">

    <div id="title" class="row">
        <div class="col-sm-2" style="text-align: center"><a id="backBtn" class="fa fa-mail-reply fa-4x" href="${path}/wx/parentCenter/${userId}/myDemands"></a></div>
        <div class="col-sm-8 titleText"><p>简历详情</p></div>
        <div class="col-sm-2"></div>
    </div>

    <div class="myInfoDiv">
        <div class="info-part-item">
            <p>基本信息</p>
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${userId}/${demand.id}/姓名/${demand.name}/name/demandModify">
                        <div class="list-item-title">姓名</div>
                        <div class="list-item-text">${(demand.name)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div">
                        <div class="list-item-title">性别</div>
                    <#if demand.gender==1>
                        <div class="list-item-text">女</div>
                    <#else>
                        <div class="list-item-text">男</div>
                    </#if>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${userId}/${"出生日期"}/${demand.birthday}/${"birthday"}/modifyPage">
                        <div class="list-item-title">出生日期</div>
                        <div class="list-item-text">${(demand.birthday)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${userId}/${"诊断报告"}/${(demand.report)!}/${"report"}/demandModify">
                        <div class="list-item-title">诊断报告</div>
                        <div class="list-item-text">${(demand.report)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${userId}/${demand.id}/${"病史"}/${demand.diseaseHis}/${"diseaseHis"}/demandModify">
                        <div class="list-item-title">病史</div>
                        <div class="list-item-text">${(demand.diseaseHis)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${userId}/${"过敏史"}/${demand.allergyHis}/${"allergyHis"}/modifyPage">
                        <div class="list-item-title">过敏史</div>
                        <div class="list-item-text">${(demand.allergyHis)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${userId}/${"备注"}/${demand.remark}/${"remark"}/modifyPage">
                        <div class="list-item-title">备注</div>
                        <div class="list-item-text">${(demand.remark)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
            </ul>
        </div>



</div>
</body>
</html>