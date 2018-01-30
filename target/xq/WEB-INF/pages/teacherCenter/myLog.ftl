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
        <div class="buttonDiv_info" style="background-color: white;" >
            <div>
                <div class="row" style="height: 7%;padding-top:3.5%;">
                    <div class="col-xs-4">
                        <p class="text_p"> 小岳岳</p>
                    </div>
                    <div class="col-xs-5">
                        <p class="text_pp">
                            <span style="color: orange">1/3</span>
                        </p>
                    </div>
                    <div class="col-xs-2">
                        <p class="text_ppp"> 更新</p>
                    </div>
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-4x icon_fa icon_fa"></i>
                    </div>
                </div>
                <div class="row" style="border-bottom:1px solid #ccc; ">
                    <div class="col-xs-12">
                        <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">康复时间</span><span class="col-xs-8">2018-01-05 14:00-15:40</span></p>
                        <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">康复项目</span><span class="col-xs-8">心理</span></p>
                        <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">上门方式</span><span class="col-xs-8">治疗师上门</span></p>
                        <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">订单号</span><span class="col-xs-8">13151515445</span></p>
                    </div>
                </div>
            </div>
            <div>
                <div class="row" style="height: 7%;padding-top:3.5% ">
                    <div class="col-xs-4">
                        <p class="text_p"> 小月月</p>
                    </div>
                    <div class="col-xs-5">
                        <p class="text_pp">
                            <span style="color: orange">2/3</span>
                        </p>
                    </div>
                    <div class="col-xs-2">
                        <p class="text_ppp"> 更新</p>
                    </div>
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-4x icon_fa"></i>
                    </div>
                </div>
                <div class="row" style="border-bottom:1px solid #ccc; ">
                    <div class="col-xs-12">
                        <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">康复时间</span><span class="col-xs-8">2018-01-05 14:00-15:40</span></p>
                        <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">康复项目</span><span class="col-xs-8">心理</span></p>
                        <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">上门方式</span><span class="col-xs-8">治疗师上门</span></p>
                        <p class="text_detail row"><span class="col-xs-3" style="font-weight: bold">订单号</span><span class="col-xs-8">13151515445</span></p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
