<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>个人资料</title>
    <#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />

</head>
<body>
<div id="main">

    <div class="imgDiv">
        <img src="../../../${user.headimgurl}" class="img-circle">
    </div>

    <div class="myInfoDiv">
        <div class="info-part-item">
        <p>基本信息</p>
        <ul class="list-group">
            <li class="list-group-item">
                <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${user.id}/${"姓名"}/${parent.realName}/${"realName"}/${"parent"}/modifyPage">
                    <div class="list-item-title">姓名</div>
                    <div class="list-item-text">${(parent.realName)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div"  onclick=location.href="${path}/wx/parentCenter/${user.id}/${"性别"}/${user.gender}/${"gender"}/${"parent"}/modifyPage">
                    <div class="list-item-title">性别</div>
                    <#if user.gender==1>
                        <div class="list-item-text">女</div>
                    <#else>
                        <div class="list-item-text">男</div>
                    </#if>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>

            <li class="list-group-item">
                <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${user.id}/${"手机"}/${user.phone}/${"phone"}/${"parent"}/modifyPage">
                    <div class="list-item-title">手机</div>
                    <div class="list-item-text">${(user.phone)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${user.id}/${"邮箱"}/${user.email}/${"email"}/${"parent"}/modifyPage">
                    <div class="list-item-title">邮箱</div>
                    <div class="list-item-text">${(user.email)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
        </ul>
    </div>
    <div class="info-part-item">
        <p>个人资料</p>
        <ul class="list-group">
            <li class="list-group-item">
                <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${user.id}/${"身份证号"}/${parent.pid}/${"pid"}/${"parent"}/modifyPage">
                    <div class="list-item-title">身份证号</div>
                    <div class="list-item-text">${(parent.pid)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${user.id}/${"住址"}/${parent.ground} ${parent.address}/${"pid"}/${"parent"}/modifyPage">
                    <div class="list-item-title">住址</div>
                    <div class="list-item-text">${(parent.ground)!} ${(parent.address)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
        </ul>
    </div>
    </div>
</div>
</body>
</html>