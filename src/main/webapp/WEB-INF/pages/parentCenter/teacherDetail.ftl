<#include "common/const.ftl" />
<html>
<head>
    <title>个人资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="main">

    <div id="title">
        <p>治疗师详情</p>
    </div>
    <div class="imgDiv">
        <img src="../../../static/img/parentCenter/parentIcon.jpg" class="img-circle">
    </div>
    <div>
        <ul class="list-group">
            <li class="list-group-item">id: ${(teacher.teacher.id)!}</li>
            <li class="list-group-item">真实姓名：${(teacher.teacher.name)!}</li>
            <li class="list-group-item">手机：${(teacher.teacher.phone)!}</li>
            <li class="list-group-item">邮箱：${(teacher.teacher.email)!}</li>
            <#if teacher.teacher.gender=="1">
                <li class="list-group-item">性别：女</li>
            <#else>
                 <li class="list-group-item">性别：男</li>
            </#if>
            <li class="list-group-item">康复项目：${(teacher.teacher.domain)!}</li>
            <li class="list-group-item">康复经验年限：${(teacher.teacher.experienceAge)!}</li>
            <li class="list-group-item">康复对象：${(teacher.teacher.object)!}</li>

        </ul>
    </div>
</div>
</body>
</html>