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
            width: 20%;
            text-align: center;
            line-height: 120px;
        }

        #mobile-menu-selected{
            z-index: 9990;
            height: auto;
            padding-bottom: 120px;
            max-height: 60%;
        }
        #timePillContainerRemindText{
            font-size: 36px;
            text-align: center;
            line-height: 100px;
        }


    </style>
</head>

<body>
<div id="main">

    <div id="calendar_month"></div>
    <div class="container time-selector">
        <div class="row">
            <div class="col-xs-12 time-selector-title" >
                可选时间<span></span>
            </div>
        </div>
        <br>
        <div class="row time-pill-container">
        </div>
        <div class="row" id="timePillContainerRemindText">
            该日暂无可选时间
        </div>
    </div>
    <br>

</div>

<div id="mobile-menu-selected" class="mobile-nav mobile-menu-bottom visible-xs visible-sm hide-nav-bottom">
    <div class="inline-wrapper" style="font-size: 36px; background-color: #eeeeee; color: #696969; padding: 10px 30px;">
        <div>已选时间</div>
        <div id="btnClear"><img style="width: 36px;" src="${path}/static/img/clear.svg"/>&nbsp<span>清空</span></div>
    </div>
    <div class="slider-body" id="selectedTimesContainer">

    </div>
</div>

<div class="bottom-multiple-btn inline-wrapper" style="height: 120px;padding-left: 2%;z-index: 10000">
    <div id="btnShowList"><img style="height:80%" src="${path}/static/img/list.svg"></div>
    <div class="selected-time">
        <div>还需选择<span id="remainingTimes" data-remain="${order.amount}">${order.amount}</span>次</div>
        <div style="font-size: 28px; color: #aaaaaa">共${order.amount}次课</div>
    </div>
    <div id="btnNextStep" class="bottom-btn-item">下一步</div>
</div>

<div class="mask" id="mask" style="z-index:9980;display: none"></div>

<form id="toCheckTimeForm" action="${path}/wx/teacher/toCheckTimes" method="post">
    <input hidden name="teacher.id"/>
    <input hidden name="teacher.userId"/>
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
        var selectTimeList = [];//用于记录选中的有安排的日期

        function addSelectTime(timeFormatted) {
            selectTimeList.push(timeFormatted);
            var old = $("#remainingTimes").data("remain");
            $("#remainingTimes").data("remain", old-1);
            $("#remainingTimes").html(old-1);
            selectTimeList.sort();
            loadSelectedTimes();
        }

        function deleteSelectTime(timeFormatted) {
            for (var i=0; i<selectTimeList.length; i++){
                if (selectTimeList[i] ==  timeFormatted){
                    selectTimeList.splice(i,1);
                    var old = $("#remainingTimes").data("remain");
                    $("#remainingTimes").data("remain", old+1);
                    $("#remainingTimes").html(old+1);
                    selectTimeList.sort();
                    loadSelectedTimes();
                    break;
                }
            }
        }


        function isSelected(timeFormatted) {
            for (var i=0; i<selectTimeList.length; i++){
                if (selectTimeList[i] == timeFormatted){
                    return true;
                }
            }
            return false;
        }

        function loadSelectedTimes() {
            $("#selectedTimesContainer").html("");
            for (var i=0; i<selectTimeList.length; i++){
                var textTime = selectTimeList[i].replace(/%/g, "-");
                var str = '<div class="inline-wrapper time-item" data-time="' + selectTimeList[i] +'">' +
                        '<div class="selected-time" style="color: #696969">第' + (i+1) +'节课</div>' +
                        '<div class="selected-time">' + textTime +
                        '</div>' +
                        '<img class="delete-btn" style="width: 36px;margin:0rem 1rem;" src="${path}/static/img/minus.svg">'+
                        '</div><hr>';
                $("#selectedTimesContainer").append(str);
            }
            $(".delete-btn").click(function () {
                var time = $(this).parent().data("time");
                $(this).parent().remove();
                deleteSelectTime(time);
                $(".border-pill-active").each(function () {
                    if ($(this).data("time") == time){
                        $(this).addClass("border-pill").removeClass("border-pill-active");
                    }
                })
            })
        }

        $("#btnClear").click(function () {
            var old = $("#remainingTimes").data("remain");
            $("#remainingTimes").data("remain", old+selectTimeList.length);
            $("#remainingTimes").html(old+selectTimeList.length);
            selectTimeList.splice(0,selectTimeList.length);
            loadSelectedTimes();
            $(".border-pill-active").removeClass("border-pill-active").addClass("border-pill");
        });

        $("#btnShowList").click(function () {
            if ($("#mobile-menu-selected").hasClass("hide-nav-bottom")){
                $("#mobile-menu-selected").addClass("show-nav-bottom").removeClass("hide-nav-bottom");
                $("#mask").show();
            } else {
                $("#mobile-menu-selected").addClass("hide-nav-bottom").removeClass("show-nav-bottom");
                $("#mask").hide();
            }
        });

        $("#mask").click(function () {
            if ($("#mobile-menu-selected").hasClass("show-nav-bottom")) {
                $("#mobile-menu-selected").addClass("hide-nav-bottom").removeClass("show-nav-bottom");
                $("#mask").hide();
            }
        });

        var events=[];
        var time = null;
        <#list starts as day>
            time = {start:"${day}",title:"",className:"schedule_title"};
            events.push(time);
        </#list>

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
            dayClick : function () {
                $(".time-selector-title > span").html("(" + $(this).data("date") + ")");
                $(".time-pill-container").html("");
                $("#timePillContainerRemindText").show();
                $("td.fc-day").css("background","");
                $(this).css("background","#eeeeee");
            },

            eventClick : function( event ) {
                var date=event.start.toString();
                $.ajax({
                    type: "POST",
                    url: "${path}/wx/teacher/${order.teacher.id}/orderTime/day",
                    dataType: "json",
                    data: {
                        date: date
                    },
                    success: function (data) {
                        var periods = data.data.period;
                        var classNames = data.data.className;
                        var day = data.data.start[0].split("T")[0];
                        var start = data.data.start;
                        var end = data.data.end;
                        var dataTime = day + ' ' + start[0].split("T")[1] + '%' + end[0].split("T")[1];
                        $(".time-pill-container").html("");
                        $("#timePillContainerRemindText").hide();

                        for (var i=0; i<periods.length; i++){
                            dataTime = day + ' ' + start[i].split("T")[1] + '%' + end[i].split("T")[1];

                            var str = '<div class="col-xs-3">' +
                                    '<div class="border-pill';
                            if (isSelected(dataTime)){
                                str += "-active";
                            }
                            str += ' time-pill ' + classNames[i] +'"' + 'data-time="' + dataTime + '">' +
                                    periods[i] +
                                    '</div>' +
                                    '</div>';
                            $(".time-pill-container").append(str);
                        }

                        $(".time-pill").click(function () {
                            if ($(this).hasClass("orderY") && !$(this).hasClass("border-pill-active")){
                                if ($("#remainingTimes").data("remain") <= 0){
                                    alert("您的课时已经选完咯~");
                                    return;
                                }
                                $(this).addClass("border-pill-active").removeClass("border-pill");
                                addSelectTime($(this).data("time"));
                            }
                        })
                    }
                });
            }
        });

        $(".fc-day-number").click(function () {

            var target = -1;
            var day = $(this).text();

            $(".time-selector-title > span").html("(" + $(this).parent().data("date") + ")");
            $(".time-pill-container").html("");
            $("#timePillContainerRemindText").show();

            //找到点击的是这一行中第几个日历块
            $(this).parent().parent().children().each(function(index,element){
                if (element.firstChild.innerText == day){
                    target = index;
                    return false;
                }
            });

            if (target >= 0) {
                $(this).parents("table").eq(0).children('tbody').find("td").eq(target).children('a').click();
                $("td.fc-day").css("background","");
                $(this).parents(".fc-week").children(".fc-bg").find("td.fc-day").eq(target).css("background","#eeeeee");
            }
        });

        $("#btnNextStep").click(function () {
            if ($("#remainingTimes").data("remain") > 0){
                alert("您的课时还没选完哦~");
                return;
            }

            var serviceTimes = "";
            for (var i=0; i<selectTimeList.length; i++){
                serviceTimes += selectTimeList[i] + "#";
            }

            if (serviceTimes.length>0 && serviceTimes.charAt(serviceTimes.length-1) == "#"){
                serviceTimes = serviceTimes.slice(0,serviceTimes.length-1);
            }

            var pay = "${order.totalpay}";
            pay = pay.replace(/,/,"");

            $("input[name='teacher.id']").val(${order.teacher.id});
            $("input[name='teacher.userId']").val(${order.teacher.userId});
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


</script>
</html>