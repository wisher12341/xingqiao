<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html>
<head>
    <title>已选时间</title>
<#include "common/head.ftl" />
<#--<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">-->
    <link href='${path}/static/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
    <link href='${path}/static/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <link href='${path}/static/css/jcy.css' rel='stylesheet' />
    <link href='${path}/static/css/teacher/slider.css' rel='stylesheet' />
    <script src='${path}/static/fullcalendar/moment.min.js'></script>
    <script src='${path}/static/fullcalendar/fullcalendar.js'></script>
</head>
<style>
    .selected-time{
        font-size: 36px;
        text-align: center;
    }

    .bottom-btn-item{
        height: 100%;
        font-size: 40px;
        width: 50%;
        text-align: center;
        line-height: 120px;
    }

    .time-selector{
        padding: 20px 40px;
        margin: 0px;
        width: 100%;
        background-color: #FFFFFF;
    }

    .time-selector-title{
        font-size: 40px;
        font-weight: bold;
        color: #696969;
        text-align: center;
    }
</style>

<body>
<div id="main">
    <div class="container time-selector" id="timeContainer">
        <div class="row">
            <div class="col-xs-12 time-selector-title" >
                以下为您的课程安排<span></span>
            </div>
        </div>
        <br>
        <br>
    </div>

</div>


<div class="bottom-multiple-btn inline-wrapper" style="height: 120px;padding-left: 2%;z-index: 10000">
    <div id="btnCancel" class="bottom-btn-item" style="background-color: transparent;">返回</div>
    <div id="btnSubmitOrder" class="bottom-btn-item">确认</div>
</div>

<form id="toCancelForm" action="${path}/wx/teacher/toSelectTime" method="post">
    <input hidden name="teacher.id"/>
    <input hidden name="teacher.name"/>
    <input hidden name="demandId"/>
    <input hidden name="way"/>
    <input hidden name="recoverOb"/>
    <input hidden name="remark"/>
    <input hidden name="totalpay"/>
    <input hidden name="amount"/>
    <input hidden name="isFirst"/>
    <input hidden name="timeOpt"/>
    <input hidden name="serverTime"/>
</form>

</body>
<script>
    $(function () {
            var servertime = "${order.serverTime}";
            var tmp = servertime.split("#");
            for (var i=0; i< tmp.length; i++){
                var str = '<div class="row">' +
                                '<div class="col-xs-3 selected-time">第' + (i+1) + '节课</div>' +
                        '<div class="col-xs-9 selected-time">' + tmp[i].replace(/%/, "-") + '</div></div><hr/>';
                $("#timeContainer").append(str);
            }

            $("#btnSubmitOrder").click(function () {
                var pay = "${order.totalpay}";
                pay = pay.replace(/,/,"");
                $.ajax({
                    method: 'POST',
                    url: '${path}/wx/order/submit',
                    data: {
                        'teacher.id': '${order.teacher.id}',
                        'teacher.name':'${order.teacher.name}',
                        'demandId':'${order.demandId}',
                        'way':'${order.way}',
                        'recoverOb':'${order.recoverOb}',
                        'serverTime':'${order.serverTime}',
                        'remark':'${order.remark}',
                        'totalpay':pay,
                        'amount':'${order.amount}',
                        'isFirst':'${order.isFirst}',
                        'timeOpt':'${order.timeOpt}'
                    },
                    success:function (data, status, headers, config) {
                        if (data.success==true) {
                            //alert(data['data']['order_id'])
//                    setCookie('order_id',data.data,1);//小时
//                    ipCookie('order_id', data['data']['order_id'], {path: '/', expires: 14});
                            document.location = '${path}/wx/order/'+data.data+'/success';
                        } else{
                            alert('发生错误');
                        }
                    }
                });
            });

            $("#btnCancel").click(function () {
                var pay = "${order.totalpay}";
                pay = pay.replace(/,/,"");

                $("input[name='teacher.id']").val(${order.teacher.id});
                $("input[name='teacher.name']").val("${order.teacher.name}");
                $("input[name='demandId']").val("${order.demandId}");
                $("input[name='way']").val("${order.way}");
                $("input[name='recoverOb']").val("${order.recoverOb}");
                $("input[name='remark']").val("${order.remark}");
                $("input[name='totalpay']").val(pay);
                $("input[name='amount']").val("${order.amount}");
                $("input[name='isFirst']").val("${order.isFirst}");
                $("input[name='timeOpt']").val("${order.timeOpt}");
                $("input[name='serverTime']").val(serviceTimes);
                $("#toCheckTimeForm").submit();
            });
    });

</script>
</html>