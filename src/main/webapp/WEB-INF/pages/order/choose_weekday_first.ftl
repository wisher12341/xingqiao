<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html>
<head>
    <title>选择上课时间</title>
<#include "common/head.ftl" />
<#--<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">-->
    <link href='${path}/static/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
    <link href='${path}/static/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <link href='${path}/static/css/jcy.css' rel='stylesheet' />
    <link href='${path}/static/css/teacher/slider.css' rel='stylesheet' />
    <script src='${path}/static/fullcalendar/moment.min.js'></script>
    <script src='${path}/static/fullcalendar/fullcalendar.js'></script>
    <style>
        body{
            background-color: #f5f5f5;
        }
        .glyphicon-calendar,.text_calendar{
            color: #20b49a!important;
        }

        /**
        日历插件 CSS修改
         */
        #calendar_month{
            background-color: white;
            font-size: 40px!important;
            border-bottom:1px solid #ccc ;
        }
        .fc-view-container{
            height: 50%;
        }
        .fc-day-grid-container{
            height: 100%!important;
        }
        .fc-center h2{
            font-size: 40px!important;
        }
        .fc td, .fc th{
            border-style:none!important;
        }
        .fc-day-number{
            position: relative;
            top:50px;
            float: none!important;
            color: dimgrey!important;
        }
        .fc-day-top{
            text-align: center;
        }
        .schedule_title{

            border: none;
        }
        .fc-content{
            border: 1px solid #20b49a;
            background-color: #20b49a;
            color: white;
            font-size: 40px;
            width: 20px;
            height: 20px;
            margin-top: 50%;
            border-radius:100% ;
            text-align: center;

        }
        .fc-button{
            opacity: 100;
            background-color: #20b49a;
            color: #ffffff;
            background-image: unset;
        }
        .fc-time{
            display: none;
        }
        .fc-basic-view .fc-body .fc-row{
            min-height: 3em!important;
        }
        .fc-content-skeleton table thead tr td{
            height: 10px!important;
        }
        .fc-past{
            opacity: 0.3;
        }
        .fc-day-top{
            line-height: 1px!important;
        }
        .fc-event-container{
            line-height: 50px!important;
        }
        .fc-widget-header{
            opacity: 0.8;
        }
        .select .fc-content{
            background-color:orange!important;
        }
        .fc-event, .fc-event-dot{
            background-color: transparent!important;
        }

        /**
        今日安排
         */
        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
            padding-bottom: 10px;
            margin-bottom: 20%;
        }
        .text_p{
            font-size: 40px;
            display: inline;
            color: dimgrey;
            font-weight: bold;
            position: relative;
            top:25px;
        }
        .icon_fa{
            /*position: relative;*/
            /*top: 5px;*/
            color: dimgrey;
        }
        .text_detail{
            color: dimgrey;
            font-size: 35px;
            margin-right: 100px;
            margin-bottom: 15px;
        }
        .circle{
            position: relative;
            left: 25px;
            padding-top:10px;
            padding-bottom: 5px;
        }
        .fa-circle-thin{
            color: #bbb;
        }
        .sss{
            color: #20b49a;
        }
        .nonediv{
            margin: 4% 0 20%;
            border-bottom: 0px solid #ccc;
            border-top: 0px solid #ccc;
        }
        .work_today,.fc-center h2{
            font-size: 45px!important;
            color: dimgrey;
            padding: 10px;
            text-align: center;
        }
        .fc-center h2{
            padding-top: 15px;
        }
        .time-selector{
            padding: 20px 40px;
            margin: 0px;
            width: 100%;
            background-color: #FFFFFF;
        }
        .time-pill{
            font-size: 36px;
            margin: 15px 0px;
        }

        .time-selector-title{
            font-size: 40px;
            font-weight: bold;
            color: #696969;
            text-align: center;
        }

        .orderN{
            background:url("${path}/static/img/tag.png") no-repeat right top;
        }

        .selected-time{
            font-size: 36px;
            text-align: center;
        }

        #btnNextStep{
            height: 100%;
            font-size: 40px;
            width: 100%;
            text-align: center;
            line-height: 120px;
        }

        #mobile-menu-selected{
            z-index: 9990;
            height: auto;
            padding-bottom: 120px;
            max-height: 60%;
        }
        .time-item{
            padding: 10px 30px;
        }


    </style>
</head>

<body>
<div id="main">
    <div class="container time-selector">
        <div class="row">
            <div class="col-xs-12 time-selector-title" >
                已选课时开始日期
            </div>
        </div>
        <br>
        <#assign weekdayStrs = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]>
        <#list order.serverTime?split("#") as time>
            <#assign weekdayIndex = time?substring(time?index_of("@")-1,time?index_of("@"))>
            <#assign timestr = time?substring(time?index_of("@")+1)>
            <div class="inline-wrapper time-item" data-time="${time}" data-timestr="${timestr}">
                <div class="selected-time" style="color: #696969">${weekdayStrs[weekdayIndex?number]} &nbsp; ${timestr?replace("%","-")} </div>
                <div class="selected-time date-text">点击查看可选日期</div>
            </div>
            <hr>
        </#list>
        <div class="row">
            <div class="col-xs-12 time-selector-title" >
                可选日期<span></span>
            </div>
        </div>
    </div>

    <div id="calendar_month"></div>
    <div class="bottom-multiple-btn inline-wrapper" style="height: 120px;z-index: 10000">
        <div id="btnNextStep" class="bottom-btn-item">下一步</div>
    </div>
</div>


<form id="toCheckTimeForm" action="${path}/wx/teacher/toCheckTimes" method="post">
    <input hidden name="teacher.userId"/>
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

        $(".time-item").click(function () {
            if ($('#calendar_month').html() != null) {
                $('#calendar_month').remove();
                $('#main').append('<div id="calendar_month"></div>');
            }
            var condition = $(this).data("time");
            var dateTextDiv = $(this).children(".date-text");

            $.ajax({
                method: 'POST',
                url: '${path}/wx/teacher/getAvailableDateByWeekday',
                data: {
                    tid : ${order.teacher.id},
                    condition : condition
                },
                success: function (data) {
                    var events=[];
                    var time = null;
                    var starts = data.data;
                    for (var i=0; i<starts.length; i++){
                        time = {start: starts[i] ,title:"", className:"schedule_title"};
                        events.push(time);
                    }

                    $('#calendar_month').fullCalendar({
                        header: {
                            right: 'prev,next',
                            center: 'title',
                            left: 'today'
                        },
                        buttonText:{
                            today:"返回今天"
                        },
                        navLinks: false, // can click day/week names to navigate views
                        weekNumbers: false,
                        weekNumbersWithinDays: true,
                        weekNumberCalculation: 'ISO',
                        weekMode:"liquid",
                        eventLimit: true, // allow "more" link when too many events
                        events: events,
                        monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                        monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                        dayNames: ["日", "一", "二", "三", "四", "五", "六"],
                        dayNamesShort: ["日", "一", "二", "三", "四", "五", "六"],
                        today: ["今天"],
                        eventClick : function( event ) {
                            var date=event.start.toString();
                            $.ajax({
                                method: 'POST',
                                url: '${path}/wx/teacher/formatDate',
                                data: {
                                    date: date
                                },
                                success: function (data) {
                                    dateTextDiv.html(data.data);
                                }
                            });
                        }
                    });

                }
            });
        });


        $("#btnNextStep").click(function () {

            var isComplete = true;
            var serviceTimes = "";
            $(".time-item").each(function () {
                if (!isComplete) return;
                var dateText = $(this).children(".date-text").html();
                if (dateText == "点击查看可选日期"){
                    alert("您还没选完哦~");
                    isComplete = false;
                    return;
                } else {
                    serviceTimes += dateText + " " + $(this).data("timestr") + "#";
                }
            });

            if (!isComplete){
                return;
            }

            if (serviceTimes.length>0 && serviceTimes.charAt(serviceTimes.length-1) == "#"){
                serviceTimes = serviceTimes.slice(0,serviceTimes.length-1);
            }

            var pay = "${order.totalpay}";
            pay = pay.replace(/,/,"");

            $("input[name='teacher.userId']").val(${order.teacher.userId});
            $("input[name='teacher.id']").val(${order.teacher.id});
            $("input[name='teacher.name']").val("${order.teacher.name}");
            $("input[name='demandId']").val("${order.demandId}");
            $("input[name='way']").val("${order.way}");
            $("input[name='recoverOb']").val("${order.recoverOb}");
            $("input[name='remark']").val("${order.remark}");
            $("input[name='totalpay']").val(pay);
            $("input[name='amount']").val(${order.amount});
            $("input[name='isFirst']").val("${order.isFirst}");
            $("input[name='timeOpt']").val("${order.timeOpt}");
            $("input[name='serverTime']").val(serviceTimes);
            $("#toCheckTimeForm").submit();

        })

    });

    function getWeekday(date) {
        var arys1 = date.split('-');     //日期为输入日期，格式为 2013-3-10
        var ssdate=new Date(arys1[0],parseInt(arys1[1]-1),arys1[2]);
        return ssdate.getDay();  //就是你要的星期几
    }



</script>
</html>