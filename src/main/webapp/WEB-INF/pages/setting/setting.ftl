<#include "../parentCenter/common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>设置</title>
<#include "../parentCenter/common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <#--<link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />-->
    <style>
        body{
            background-color: #f5f5f5;
        }
        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .info{
            height: 120px;
            padding-top: 30px;
            background-color: white;
            margin: 4px 0;
        }
        .text_p{
            font-size: 45px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            font-weight: bold;
        }
        .text_pp{
            font-size: 40px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            position: relative;
            top:5px;
        }
        .icon_fa{
            position: relative;
            top: 5px;
            color: dimgrey;
        }
        .foot{
            background-color: #f5f5f5;
        }
        .foot button{
            /*background-color:#94e6c8 ;*/
            background-color: #20b49a;
            color: white !important;
            font-size: 45px;
            font-weight: bold;
            padding: 20px;
            margin: 2% auto;
            border-radius: 15px;
            height:7%;
            border: none;
        }
    </style>
</head>
<body>


<div id="main">

    <div class="buttonDiv_info">
        <div class="info row" <#if (user.username)?? && (user.username)!=''><#else >onclick=location.href="/wx/login/parent/bindAccount"</#if>>
            <div class="col-xs-3">
                <p class="text_p"> 手机号码</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"><#if (user.username)?? && (user.username)!=''>${user.username}<#else ><span style="color:red;float:right;padding-top: 5px">尚未绑定手机</span</#if></p>
            </div>
            <#if (user.username)??  && (user.username)!=''>
            <#else >
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </#if>
        </div>
        <div class="info row" <#if (user.username)?? && (user.username)!=''>onclick=location.href="${path}/wx/login/changePwd/${user.status}"</#if>>
            <div class="col-xs-3">
                <p class="text_p"> 修改密码</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"><#if (user.username)?? && (user.username)!=''><#else ><span style="color:red;float:right;padding-top: 5px">请先绑定手机</span</#if> </p>
            </div>
            <#if (user.username)?? && (user.username)!=''>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
            </#if>
        </div>
    </div>
    <div class="foot" align="center">
        <button style="width: 95% !important;" onclick="changeAccount()">退出登陆</button>
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
</div>
</body>

<script>
    function changeAccount() {
        if('${(user.username)!}'!=''){
            location.href='/wx/login/${user.status}/changeAccount';
        }else{
            $("#modal").modal();
        }
    }
</script>
</html>
