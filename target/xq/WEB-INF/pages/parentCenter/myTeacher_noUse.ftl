<#include "common/const.ftl" />
<html>
<head>
    <title>我的治疗师</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myTeachers.css" type="text/css" rel="stylesheet" />
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
    <div class="panel panel-default">
    <#if teachers??>
        <table class="table teacher-table">
            <thead>
            <tr>
                <th>姓名</th>
                <th>联系方式</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
                <#list teachers as teacher>
                <tr>
                    <td>${teacher.name!}</td>
                    <td>${(teacher.user.phone)!}</td>
                    <td><button type="button" class="btn btn-default" style="background-color: #20b49a;color: white" onclick=location.href="${path}/wx/parentCenter/${userId}/myTeacher/${teacher.id}/teachersDetail">查看详情</td>
                </tr>
                </#list>
            </tbody>
        </table>
            <#else>
                <p>您还未订购治疗师的课程。</p>
            </#if>
    </div>
</div>
</body>
</html>