<#include "../common/const.ftl" />
<#include "../../order/common/var.ftl" />
<html>
<head>
    <title>治疗师订单</title>
    <#include "../common/head.ftl" />
    <link href="${path}/static/css/order/order.css" type="text/css" rel="stylesheet" />
    <style>
        .glyphicon-list-alt,.text_order{
            color: #20b49a!important;
        }
        .number{
            background-color: red;
            color: white;
            padding:2px 17px;
            font-size: 38px;
            font-weight: bold;
            border-radius: 100%;
            position: relative;
            border: 2px solid white;
            /*top:-25%;*/
            /*right: 10%;*/
            bottom: 20px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div id="main">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#wait" data-toggle="tab">
                    待处理<span class="number">${(orders.orderList_wait)?size}</span>
                </a>
            </li>
            <li>
                <a href="#doing" data-toggle="tab">
                    进行中<span class="number">${(orders.orderList_doing)?size}</span>
                </a>
            </li>
            <li>
                <a href="#history" data-toggle="tab">
                    历史
                </a>
            </li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="wait">
                <@orderlist param1=orders.orderList_wait />
            </div>
            <div class="tab-pane fade" id="doing">
                <@orderlist param1=orders.orderList_doing />
            </div>
            <div class="tab-pane fade" id="history">
                <@orderlist param1=orders.orderList_history />
            </div>
        </div>
    </div>
    <#include "../common/foot.ftl" />
</body>
</html>
