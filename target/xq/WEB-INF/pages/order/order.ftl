<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html>
<head>
    <title>我的订单</title>
    <#include "common/head.ftl" />
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
        .btn{
            width: 49.4%;
            height: 80px;
        }
        .modal-dialog{
            margin-top: 150px;
            width: 90%!important;
        }
        .modal-body{
            font-size: 45px!important;
            color: dimgrey;!important;
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
                <#if (orders.orderList_wait)?size==0>
                    <div class="row" style="margin-top: 30%!important;width: 100%">
                        <div class="col-xs-2">
                        </div>
                        <div class="col-xs-2">
                            <img src="/static/img/kong.png" width="150">
                        </div>
                        <div class="col-xs-6">
                            <p style="font-size: 45px;color: dimgrey;font-weight: bold">抱歉</p>
                            <p style="font-size: 38px;color: grey;font-weight: bold">您还没有待处理的订单</p>
                        </div>
                    </div>
                <#else >
                    <@orderlist param1=orders.orderList_wait />
                </#if>
            </div>
            <div class="tab-pane fade" id="doing">
                <#if (orders.orderList_doing)?size==0>
                    <div class="row" style="margin-top: 30%!important;width: 100%">
                        <div class="col-xs-2">
                        </div>
                        <div class="col-xs-2">
                            <img src="/static/img/kong.png" width="150">
                        </div>
                        <div class="col-xs-6">
                            <p style="font-size: 45px;color: dimgrey;font-weight: bold">抱歉</p>
                            <p style="font-size: 38px;color: grey;font-weight: bold">您还没有进行中的订单</p>
                        </div>
                    </div>
                <#else >
                    <@orderlist param1=orders.orderList_doing />
                </#if>
            </div>
            <div class="tab-pane fade" id="history">
                <#if (orders.orderList_history_noComment)?size==0 && (orders.orderList_history)?size==0>
                    <div class="row" style="margin-top: 30%!important;width: 100%">
                        <div class="col-xs-2">
                        </div>
                        <div class="col-xs-2">
                            <img src="/static/img/kong.png" width="150">
                        </div>
                        <div class="col-xs-6">
                            <p style="font-size: 45px;color: dimgrey;font-weight: bold">抱歉</p>
                            <p style="font-size: 38px;color: grey;font-weight: bold">您还没有历史订单</p>
                        </div>
                    </div>
                <#else >
                    <div style="margin-bottom: 50px">
                    <#--<div class="comment">待评价</div>-->
                    <@orderlist param1=orders.orderList_history_noComment />
                    </div>
                <#--<div class="comment">历史订单</div>-->
                    <@orderlist param1=orders.orderList_history />
                </#if>

            </div>
        </div>
    </div>

    <div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    您有<span style="padding: 15px;color: red;font-size: 50px">${needCkeckLogNum}</span>条康复日志需要确认！
                </div>
                <div class="modal-footer">
                    <input type="button" onclick="$('#delModal').modal('hide')" class="btn" value="取消" style="background-color: orange!important;color: white!important;font-size: 40px!important;"/>
                    <input type="buttont" class="btn btn-primary" value="前往确认" style="background-color: #20b49a!important;font-size: 40px!important;border-color: white!important;"  onclick="location.href='${path}/wx/log/index'">
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <#if (needCkeckLogNum) &gt;0>
    <script>
        $('#delModal').modal();
    </script>
    </#if>
</body>
</html>
