<#include "common/const.ftl" />
<html>
<head>
    <title>个人中心</title>
    <#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />

</head>
<body>
    <div id="main">
        <div class="imgDiv">
            <img src="${user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}")}" class="img-circle">
            <p>用户名：${user.nickname}</p>
        </div>


        <div>

        </div>
        <div class="buttonDiv">
            <button type="button" class="btn btn-default btn-lg btn-block" onclick=location.href="parentCenter/${user.id}/myInfo" style="height:12%">
                <i class="fa fa-user-circle fa-5x"></i><p style="font-size: 50px; display: inline;"> 个人资料</p></button>
            <button type="button" class="btn btn-default btn-lg btn-block"  onclick=location.href="parentCenter/${user.id}/myDemands" style="height:12%">
                <i class="fa fa-id-card fa-5x"></i><p style="font-size: 50px; display: inline;"> 需求管理</p></button>
            <button type="button" class="btn btn-default btn-lg btn-block"  onclick=location.href="parentCenter/${user.id}/myTeacher" style="height:12%">
                <i class="fa fa-users fa-5x"></i><p style="font-size: 50px; display: inline;"> 我的治疗师</p></button>
            <button type="button" class="btn btn-default btn-lg btn-block"  onclick=location.href="parentCenter/${user.id}/myMessages" style="height:12%">
                <i class="fa fa-envelope-o fa-5x"></i><p style="font-size: 50px; display: inline;"> 消息中心</p></button>
        </div>
    </div>
</body>
</html>
