<#include "common/const.ftl" />
<html>
<head>
    <title>我的治疗师</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="main">
    <div id="title">
        <p>我的治疗师</p>
    </div>
    <div class="panel panel-default">

        <table class="table">
            <thead>
            <tr>
                <th>姓名</th>
                <th>联系方式</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <#if teachers??>
                <#list teachers as teacher>
                <tr>
                    <td>${teacher.name!}</td>
                    <td>${teacher.user.phone!}</td>
                    <td><button type="button" class="btn btn-default" onclick=location.href="${path}/wx/parentCenter/${teacher.id}/teacherDetail">查看详情</td>
                </tr>
                </#list>
            </#if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>