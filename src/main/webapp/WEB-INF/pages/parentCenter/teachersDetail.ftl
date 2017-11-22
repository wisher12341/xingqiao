<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>治疗师资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="main">

    <div class="imgDiv">
        <img src="../../../"+"${(teacher.user.headimgurl)!}" class="img-circle">
    </div>
    <div class="myInfoDiv">
        <ul class="list-group">
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">姓名</div>
                    <div class="list-item-text">${(teacher.name)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">手机</div>
                    <div class="list-item-text">${(teacher.user.phone)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">邮箱</div>
                    <div class="list-item-text">${(teacher.user.email)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">性别</div>
                <#if teacher.user.gender==1>
                    <div class="list-item-text"> 女</div>
                <#else>
                    <div class="list-item-text"> 男</div>
                </#if>
                </div>
            </li>

            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">康复项目</div>
                    <div class="list-item-text"> ${(teacher.domain)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">康复经验年限</div>
                    <div class="list-item-text"> ${(teacher.experienceAge)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">康复对象</div>
                    <div class="list-item-text"> ${(teacher.object)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">康复问题</div>
                    <div class="list-item-text"> ${(teacher.question)!}</div>
                </div>
            </li>
        </ul>
    </div>
</div>
</body>
</html>