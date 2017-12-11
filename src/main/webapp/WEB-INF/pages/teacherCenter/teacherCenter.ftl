<#include "common/const.ftl" />
<html>
<head>
    <title>治疗师中心</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />

</head>
<body>
<div id="main">
    <div class="title">
        <span class="title_span" onclick="location.href='/wx/login/teacher/changeAccount'">切换账号</span>
    </div>

    <div class="imgDiv">
        <img src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle">
        <p>${(teacher.name)!"${(user.username)!}"}</p>
    </div>
    <div>

    </div>
    <div class="buttonDiv">
        <div class="centerBtn" onclick=location.href="/wx/teacherCenter/${user.id}/myInfo" style="height:12%">
            <i class="fa fa-user-circle fa-5x"></i><p style="font-size: 50px; display: inline;margin-left: 10px"> 个人资料</p></div>
        <div class="centerBtn" onclick=location.href="/wx/teacherCenter/${(teacher.id)!}/${(user.id)!}/myDemands" style="height:12%">
            <i class="fa fa-id-card fa-5x"></i><p style="font-size: 50px; display: inline;margin-left: 10px"> 我的患者</p></div>
        <div class="centerBtn" onclick=location.href="${path}/wx/teacherCenter/${user.id}/order" style="height:12%">
            <i class="fa fa-users fa-5x"></i><p style="font-size: 50px; display: inline;margin-left: 10px"> 我的订单</p></div>
        <div class="centerBtn" onclick=location.href="/wx/teacherCenter/${user.id}/myMessages" style="height:12%">
            <i class="fa fa-envelope-o fa-5x"></i><p style="font-size: 50px; display: inline;margin-left: 10px"> 消息中心</p></div>
        <div class="centerBtn" onclick=location.href="/wx/teacherCenter/${user.id}/myLevel" style="height:12%">
            <i class="fa fa-star-o fa-5x"></i><p style="font-size: 50px; display: inline;margin-left: 10px"> 星级评定</p></div>
    </div>
</div>
</body>
</html>
