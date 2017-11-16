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

    <div id="title" class="row">
        <div class="col-sm-2" style="text-align: center"><a id="backBtn" class="fa fa-mail-reply fa-4x" href="${path}/wx/parentCenter"></a></div>
        <div class="col-sm-8 titleText"><p>我的需求简历</p></div>
        <div class="col-sm-2"></div>
    </div>
    <div class="panel panel-default">

    <table class="table demand-table">
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
            <td><a class="more"  href="${path}/wx/parentCenter/${userId}/myDemands/${demand.id}/demandDetail">更多...</a></td>
        </tr>
        </#list>
        </#if>
        </tbody>
    </table>
    </div>
</div>
</body>
</html>