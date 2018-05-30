<#include "common/const.ftl" />
<html>
<head>
    <title>个人中心</title>
    <#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />

</head>
<body>
    <div id="main">
        <div class="title">
            <span class="title_span" onclick="changeAccount()">切换账号</span>
        </div>

        <div class="imgDiv">
            <img src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle">
            <p>${(user.nickname)!}</p>
        </div>


        <div>

        </div>
        <div class="buttonDiv">
            <div class="centerBtn" onclick=location.href="parentCenter/${user.id}/myInfo" style="height:12%">
                <i class="fa fa-user-circle fa-5x"></i><p style="font-size: 50px; display: inline; margin-left: 10px"> 个人资料</p>
            <#if user.infoStatus==0> <p style="color: red;display: inline;font-size: 40px">资料未完善</p>
            <#elseif user.infoStatus==1>
                <p style="color: blue">审核中</p>
            </#if>
            </div>

            <div class="centerBtn" onclick=location.href="parentCenter/${user.id}/myDemands" style="height:12%">
                <i class="fa fa-id-card fa-5x"></i><p style="font-size: 50px; display: inline;margin-left: 10px">  需求管理</p></div>

            <div class="centerBtn"  onclick=location.href="parentCenter/${user.id}/myTeacher" style="height:12%">
                <i class="fa fa-users fa-5x"></i><p style="font-size: 50px; display: inline; margin-left: 10px"> 我的治疗师</p></div>

            <div class="centerBtn"  onclick=location.href="parentCenter/${user.id}/myMessages" style="height:12%">
                <i class="fa fa-envelope-o fa-5x"></i><p style="font-size: 50px; display: inline;margin-left: 10px"> 消息中心</p></div>

        </div>
    </div>


    <div class="modal fade"  id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" align="center">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body" id="divContent">
                    <p class="modal_p">您的账号当前尚未绑定，若不绑定，则当前账号被注销</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" onclick="location.href='/wx/login/0/changeAccount'">继续切换</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='/wx/login/parent/bindAccount'">前往设置</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    function changeAccount() {
        if('${(user.username)!}'!=''){
            location.href='/wx/login/0/changeAccount';
        }else{
            $("#modal").modal();
        }
    }
</script>
</html>
