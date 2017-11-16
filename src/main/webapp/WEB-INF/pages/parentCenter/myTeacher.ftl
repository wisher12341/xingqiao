<#include "common/const.ftl" />
<html>
<head>
    <title>我的治疗师</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="main">
    <div id="title" class="row">
        <div class="col-sm-2" style="text-align: center"><a id="backBtn" class="fa fa-mail-reply fa-4x" href="${path}/wx/parentCenter"></a></div>
        <div class="col-sm-8 titleText"><p>我的治疗师</p></div>
        <div class="col-sm-2"></div>
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
                    <td><button type="button" class="btn btn-default" onclick=location.href="${path}/wx/parentCenter//${userId}/myTeacher/${teacher.id}/teacherDetail">查看详情</td>
                </tr>
                </#list>
            </#if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>