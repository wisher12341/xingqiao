<#include "common/const.ftl" />
<html>
<head>
    <title>我的治疗师</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myTeachers.css" type="text/css" rel="stylesheet" />
    <style>
        .demand-div{
            /*border:5px solid #20b49a;*/
            /*border-radius: 20%;*/
            height:350px;
            margin: 15px;
        }
        .demand-div .demand-img img{
            width: 80%;
            border:5px solid #8ad4c7;
            border-top-left-radius: 10%;
            border-top-right-radius:10% ;
        }
        .demand-btn {
            text-align: center;
            width: 80%;
            /*opacity: 0.5;*/
        }
        .demand-btn div{
            background-color:  #20b49a;
            color: white;
            height: 80px;
            font-size: 40px;
            border-bottom-left-radius: 10%;
            border-bottom-right-radius:10% ;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .demands-div{
            padding: 20px;
        }
        body{
            background-color: #f5f5f5;
        }
        .foot{
            position: fixed;
            width: 100%;
            bottom: 0;
            background-color: #f5f5f5;
        }
        .foot button{
            /*background-color:#94e6c8 ;*/
            background-color: #20b49a;
            color: white !important;
            font-size: 45px;
            font-weight: bold;
            padding: 20px;
            margin: 0 auto;
            border-radius: 15px;
            height:6%
        }
    </style>
</head>
<body>
<div id="main">
    <#if teachers?? && teachers?size &gt; 0 >
        <div class="demands-div">
            <#list teachers as teacher>
                <div class="col-sm-6" style="margin-top: 10%">
                    <div class="demand-div" align="center" onclick=location.href="${path}/wx/teacher/${teacher.id}/detail">
                        <div class="demand-img">
                            <img src="${(teacher.user.headimgurl?contains("wx.qlogo.cn")?string("${teacher.user.headimgurl}","/${teacher.user.headimgurl}"))!}">
                        </div>
                        <div class="demand-btn">
                            <div style="width: 100%" class="tname">${teacher.name!}</div>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    <#else>
        <div class="row" style="margin-top: 30%!important;width: 100%">
            <div class="col-xs-3">
            </div>
            <div class="col-xs-2">
                <img src="/static/img/kong.png" width="150">
            </div>
            <div class="col-xs-6">
                <p style="font-size: 45px;color: dimgrey;font-weight: bold">抱歉</p>
                <p style="font-size: 38px;color: grey;font-weight: bold">您还没有治疗师</p>
            </div>
        </div>
    </#if>
    </div>

<div class="foot" align="center">
    <button style="width: 100% !important;" onclick=location.href="/wx/parentCenter" >回到个人中心</button>
</div>
</div>
</body>
</html>