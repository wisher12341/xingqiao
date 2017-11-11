<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html>
<head>
    <title>我的患者</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="main">

    <div id="title">
        <p>我的患者</p>
    </div>
    <div class="panel panel-default">

    <table class="table">
        <thead>
        <tr>
            <th>姓名</th>
            <th>症状</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#if demands??>
        <#list demands as demand>
        <tr>
            <td>${demand.name!}</td>
            <td>${demand.disease!}</td>
            <td><button type="button" class="btn btn-default"  onclick=location.href="${path}/wx/teacherCenter/${demand.id}/demandDetail">查看详情</td>
        </tr>
        </#list>
        </#if>
        </tbody>
    </table>
    </div>
</div>
</body>
</html>