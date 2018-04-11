<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>实名认证</title>
    <meta charset="UTF-8">
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <style>
        body{
            background-color: #f5f5f5;
        }
        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .info,.info_head{
            background-color: white;
            margin: 4px 0;
        }
        .info{
            height: 120px;
            padding-top: 30px;
        }
        .info_head{
            height: 200px;
            padding-top: 60px;
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
        .text_ppp{
            font-size: 35px;
            display: inline;
            float: right;
            position: relative;
            top:5px;
        }
        .icon_fa{
            /*position: relative;*/
            /*top: 5px;*/
            color: dimgrey;
        }
        .number{
            background-color: #20b49a;
            color: white;
            padding: 10px 20px;
            border-radius: 50%;
            font-weight: bold;
        }
        .foot{
            /*position: fixed;*/
            /*width: 100%;*/
            /*bottom: 0;*/
            background-color: #f5f5f5;
        }
        .foot button{
            /*background-color:#94e6c8 ;*/
            background-color: #20b49a;
            color: white !important;
            font-size: 45px;
            font-weight: bold;
            padding: 20px;
            margin: 3% auto;
            border-radius: 15px;
            height:6%;
            opacity:0.5;
            border: none;
        }
    </style>
</head>
<body>


<div id="main">


    <div class="buttonDiv_info">
        <div class="info row" onclick=location.href="${path}/wx/parentCenter/authentication/realName/${(((parent.realName)!'')!="")?string(parent.realName,"none")}/edit">
            <div class="col-xs-3">
                <p class="text_p"> 真实姓名</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"> ${(((parent.realName)!'')!="")?string(parent.realName,'<span style="color:red;font-size:35px">未填写</span>')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/parentCenter/authentication/pid/${(((parent.pid)!'')!="")?string(parent.pid,"none")}/edit">
            <div class="col-xs-3">
                <p class="text_p"> 证件号</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"> ${(((parent.pid)!'')!="")?string(parent.pid,'<span style="color:red;font-size:35px">未填写</span>')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/parentCenter/info/${user.id}/idcard">
            <div class="col-xs-3">
                <p class="text_p"> 证件照</p>
            </div>
            <div class="col-xs-8">
                <p class="text_ppp"> ${(parent.pidFrontUrl?? && parent.pidFrontUrl!='' )?string('','<span style="color:red">未上传</span>')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info">
        <div class="info row" onclick=location.href="${path}/wx/parentCenter/info/${user.id}/address">
            <div class="col-xs-3">
                <p class="text_p"> 地址</p>
            </div>
            <div class="col-xs-8">
                 ${(((parent.ground)!'')!="")?string("<p class='text_pp'>"+parent.ground+"-"+parent.address+"</p>",'<p class="text_ppp"><span style="color:red;font-size:35px">未填写</span><p class="text_pp">')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>
<#if user.userStatus==0>
    <div class="foot" align="center">
        <form action="/wx/parentCenter/userstatus/change" method="post">
            <input type="hidden" value="1" name="userStatus">
            <button style="width: 95% !important;">提交审核</button>
        </form>
    </div>
</#if>


</div>
</body>
</html>
