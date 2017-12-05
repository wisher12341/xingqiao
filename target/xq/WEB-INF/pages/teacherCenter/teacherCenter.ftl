<#include "common/const.ftl" />
<html>
<head>
    <title>治疗师中心</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/teacherCenter/teacherCenter.css" type="text/css" rel="stylesheet" />

</head>
<body>
<div id="main">
    <div class="title">
        <span class="title_span" onclick="location.href='/wx/login/1/changeAccount'">切换账号</span>
    </div>

    <div class="imgDiv">
        <img src="${user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}")}" class="img-circle">
        <p>${(teacher.name)!"${(user.username)!}"}</p>
    </div>
    <div>

    </div>
    <div class="buttonDiv">
        <button type="button" class="btn btn-default btn-lg btn-block" onclick=location.href="/wx/teacherCenter/${user.id}/myInfo" style="height:12%">
            <i class="fa fa-user-circle fa-5x"></i><p style="font-size: 50px; display: inline;"> 个人资料</p></button>
        <button type="button" class="btn btn-default btn-lg btn-block"  onclick=location.href="/wx/teacherCenter/${(teacher.id)!}/myDemands" style="height:12%">
            <i class="fa fa-id-card fa-5x"></i><p style="font-size: 50px; display: inline;"> 我的患者</p></button>
        <button type="button" class="btn btn-default btn-lg btn-block"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/order" style="height:12%">
            <i class="fa fa-users fa-5x"></i><p style="font-size: 50px; display: inline;"> 我的订单</p></button>
        <button type="button" class="btn btn-default btn-lg btn-block"  onclick=location.href="/wx/teacherCenter/${user.id}/myMessages" style="height:12%">
            <i class="fa fa-envelope-o fa-5x"></i><p style="font-size: 50px; display: inline;"> 消息中心</p></button>
        <button type="button" class="btn btn-default btn-lg btn-block"  onclick=location.href="/wx/teacherCenter/${user.id}/myLevel" style="height:12%">
            <i class="fa fa-star-o fa-5x"></i><p style="font-size: 50px; display: inline;"> 星级评定</p></button>
    </div>
</div>
</body>
</html>
