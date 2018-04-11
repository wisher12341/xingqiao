<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>康复服务</title>
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
        .info{
            background-color: white;
            margin: 4px 0;
            height: 120px;
            padding-top: 30px;
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

            color: dimgrey;
        }
        #img .icon-head {
            display: inline-block;
            padding: 0;
            text-align: center;
            width: 16%;
        }
        #img .icon-head img {
            width: 100%;
            margin-top: 20px;
        }
        .flow{
            background-color: #20b49a;
            padding: 30px 0;
        }
        .flow > p {
            font-size: 45px;
            color: #dff0d8;
            text-align: center;
            font-weight: bold;
        }
        .sss{
            padding-top: 10px;
            font-size: 35px;
            color: #dff0d8;
        }
        .search_label{
            /*background-color: #20b49a;*/
            font-size: 40px;
            color: #20b49a;
            padding: 5px;
            margin-right: 10px;
            border: solid 1px #20b49a;
            border-radius: 5px;
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
    <div class="flow">
        <p>开课流程</p>
        <div id="img" align="center">
            <div class="icon-head">
                <img src="${path}/static/img/order/Submitonline.png">
                <p class="sss">提交资料</p>
            </div>
            <div class="icon-head">
                <div style="border-top: 5px solid #dff0d8;position: relative;bottom: 100px"></div>
                <#--<img  src="${path}/static/img/order/line.png">-->
                <p style="color: #20b49a;!important;">待服务</p>
            </div>
            <div class="icon-head">
                <img  src="${path}/static/img/order/people.png">
                <p class="sss">线下面试</p>
            </div>
            <div class="icon-head">
                <div style="border-top: 5px solid #dff0d8;position: relative;bottom: 100px"></div>
                <#--<img  src="${path}/static/img/order/line.png">-->
                <p style="color: #20b49a;!important;">待服务</p>
            </div>
            <div class="icon-head">
                <img  src="${path}/static/img/order/pass.png" style="width: 92%">
                <p class="sss">审核通过</p>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info">
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/service/period/${(teacher.period)!'none'}/edit" >
            <div class="col-xs-3">
                <p class="text_p"> 课时</p>
            </div>
            <div class="col-xs-8">
            ${((teacher.period)??)?string("<p class='text_pp'> "+((teacher.period)!)+"</p>","<p class='text_ppp'><span style='color:red;font-size:35px'>未填写</span></p>")}
                <#--<p class="text_pp">-->
                <#--${(teacher.period)!}</p>-->
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/serviceInfo/${user.id}/domain">
            <div class="col-xs-3">
                <p class="text_p"> 康复项目</p>
            </div>
            <div class="col-xs-8">
                    <#if teacher.domain??>
                        <#list teacher.domain?split("、") as domain>
                        <#if domain_index<=3>
                            <span class="search_label">${domain}</span>
                        </#if>
                        <#if domain_index==4>
                            <span class="search_label">...</span>
                        </#if>
                        </#list>
                        <#else >
                            <p class="text_ppp"><span style="color:red">未设置</span></p>
                    </#if>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/serviceInfo/${user.id}/object">
            <div class="col-xs-3">
                <p class="text_p"> 康复对象</p>
            </div>
            <div class="col-xs-8">
            <#if teacher.object??>
                <#list teacher.object?split("、") as ob>
                        <span class="search_label">${ob}</span>
                </#list>
            <#else >
                <p class="text_ppp"><span style="color:red">未设置</span></p>
            </#if>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/serviceInfo/${user.id}/way@s_ground@t_ground@price_t@price_s@price_o@detailAddress">
            <div class="col-xs-3">
                <p class="text_p"> 康复方式</p>
            </div>
            <div class="col-xs-8">
            <#if teacher.way??>
                <#list teacher.way?split("、") as way>
                    <span class="search_label">${way}</span>
                </#list>
            <#else >
                <p class="text_ppp"><span style="color:red">未设置</span></p>
            </#if>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info" onclick=location.href="${path}/wx/teacherCenter/serviceInfo/${user.id}/rule">
        <div class="info row" >
            <div class="col-xs-3">
                <p class="text_p"> 平台准则</p>
            </div>
            <div class="col-xs-8">

            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

<#if user.userStatus==0>
    <div class="foot" align="center">
        <form action="/wx/teacherCenter/userstatus/change" method="post">
            <input type="hidden" value="1" name="userStatus">
            <button style="width: 95% !important;">提交审核</button>
        </form>
    </div>
</#if>
</div>
</body>
</html>
