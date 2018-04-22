<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html>
<head>
    <title>治疗师订单</title>
    <#include "common/head.ftl" />
    <#--<link href="${path}/static/css/order/order.css" type="text/css" rel="stylesheet" />-->
    <style>
        .glyphicon-list-alt,.text_order{
            color: #20b49a!important;
        }
        body{
            background-color: #f5f5f5;
        }
        #main{
            margin-top: 4%;
            margin-bottom: 10%;
        }
        .buttonDiv_info{
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
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
            position: relative;
            bottom:2px;
        }
        .flow > p {
            font-size: 45px;
            color: #dff0d8;
            text-align: center;
            font-weight: bold;
        }
        .search_label{
            background-color: white;
            font-size: 35px;
            color: #20b49a;
            padding: 5px;
            margin-right: 10px;
            border: solid 1px #20b49a;
            border-radius: 5px;
        }
        .text_detail{
            color: dimgrey;
            font-size: 35px;
            margin-left: 20px;
            margin-right: 100px;
            margin-top: 20px;
            padding-bottom: 20px;
            padding-left: 5%;
        }
        .row{
            margin: 0!important;
        }
        .p_t{
            width: 20%;
        }
    </style>
</head>
<body>
    <div id="main">
    <#if logs?size==0>
        <div >
                <div class="row" style="margin-top: 30%!important;width: 100%">
                    <div class="col-xs-2">
                    </div>
                    <div class="col-xs-2">
                        <img src="/static/img/kong.png" width="150">
                    </div>
                    <div class="col-xs-6">
                        <p style="font-size: 45px;color: dimgrey;font-weight: bold">抱歉</p>
                        <p style="font-size: 38px;color: grey;font-weight: bold">您还没有要填写的康复日志</p>
                    </div>
                </div>
            <#else>
            <div class="buttonDiv_info" style="background-color: white;" >
                <#list logs as log>
                    <div onclick="location.href='${path}/wx/teacherCenter/${log.order.id}/updateLog'">
                        <div class="row" style="height: 7%;padding-top:3.5%;">
                            <div class="col-xs-4">
                                <p class="text_p">${log.order.demand.name}</p>
                            </div>
                            <div class="col-xs-5">
                                <p class="text_pp">
                                    <span style="color: orange">${log.count}/${log.order.amount}</span>
                                </p>
                            </div>
                            <div class="col-xs-2">
                                <p class="text_ppp"> 更新</p>
                            </div>
                            <div class="col-xs-1">
                                <i class="fa fa-angle-right fa-4x icon_fa icon_fa"></i>
                            </div>
                        </div>
                        <div class="row" style="border-bottom:1px solid #ccc;">
                            <div class="col-xs-12">
                                <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">康复时间</span><span class="col-xs-8">${log.time}</span></p>
                                <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">康复项目</span><span class="col-xs-8">${log.order.recoverOb}</span></p>
                                <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">上门方式</span><span class="col-xs-8">${log.order.way}</span></p>
                                <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">订单号</span><span class="col-xs-8">${log.order.id}</span></p>
                            </div>
                        </div>
                    </div>
                </#list>
            </#if>
        </div>
    </div>
</body>
</html>
