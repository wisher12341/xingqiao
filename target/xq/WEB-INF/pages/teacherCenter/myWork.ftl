<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html>
<head>
    <title>日程安排</title>
<#include "common/head.ftl" />
    <#--<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">-->
    <link href='${path}/static/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
    <link href='${path}/static/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
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
            width: 30%;
            border-radius:100% ;
            text-align: center;
            padding:8px 14px;

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
            margin: 7% 0;
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
            padding-top: 25px;
        }

        .fc-left button{
            color: white!important;
            background-color: #20b49a!important;
            margin-left: 20px!important;
            margin-top: 5px;!important;
            background-image:none;!important;
        }
        .fc-button-group .fc-prev-button{
            color: white!important;
            background-color: #20b49a!important;
            background-image:none;!important;
            margin-top: 5px;!important;
            margin-right: 20px!important;
        }
        .fc-button-group .fc-next-button{
            color: white!important;
            background-color: #20b49a!important;
            background-image:none;!important;
            margin-top: 5px;!important;
            margin-right: 20px!important;
        }
        .sou{
            width: 100%;
            background-color: white;
            border-bottom: 1px solid #eee;
            position: relative;
        }
        .jiantou{
            height: ;
            position: absolute;
            text-align: center;
            width: 100%;
            z-index: 99;
        }
        .rili{
            font-size: 50px;
            color: dimgrey;
            font-weight: bold;
            padding: 8px;
        }
        /*.jj{*/
            /*background-color: white;*/
            /*width: 50px;*/
        /*}*/
        .fa-angle-double-down,.fa-angle-double-up{
            background-color: white;
            padding: 0 40px;
            border-bottom: 1px solid #eee;
            position: relative;
            bottom: 1px;
            border-right: 1px solid #eee;
            border-left: 1px solid #eee;
            color: dimgrey;
            border-bottom-right-radius: 10px;
            border-bottom-left-radius: 10px;
        }
        .fa-angle-double-up{
            display: none;
        }
    </style>
</head>

<body>
<div id="main">
    <div id="calendar_month"></div>

    <div class="sou" align="center">
        <p class="rili">日历表</p>
        <div class="jiantou" align="center">
        <#--<div class="jj">-->
            <i class="fa  fa-angle-double-down fa-3x" onclick="showCalendar()"></i>
            <i class="fa  fa-angle-double-up fa-3x" onclick="hideCalendar()"></i>
        <#--</div>-->
        </div>
    </div>

    <div class="buttonDiv_info">
    <#if work.workDay?? && (work.workDay)?size gt 0>
        <script>
            $(".buttonDiv_info").css("background-color","white");
        </script>
        <div class="row" >
            <p class="work_today">${work.today}</p>
        </div>
            <#list (work.workDay)! as day>
                <div>
                    <div class="row" style="position: relative">
                        <div class="col-xs-1 circle">
                            <i class="fa fa-circle-thin fa-2x icon_fa"></i>
                        </div>
                        <div class="col-xs-8" style="position: absolute;left:80px">
                            <p class="text_detail text_time"> ${day.startTime}<span style="color: white;border-top: 1px solid dimgrey;padding: 10px;margin: 10px;position: relative;top: 33px;">a</span>${day.endTime}</p>
                        </div>
                    </div>
                    <div class="row" style="height: 6%;">
                        <div class="col-xs-1" style="${day_has_next?string('border-left:2px solid #ccc;','')}height: 100%;position: relative;left: 50px">
                            <p style="color: white">aa</p>
                        </div>
                        <div class="col-xs-11">
                            <p class="text_p">${day.order.demand.name}&nbsp;&nbsp;&nbsp;家长：${day.order.parent.realName}</p>
                        </div>
                    </div>
                    <div class="row" style="height: 4%;">
                        <div class="col-xs-1" style="${day_has_next?string('border-left:2px solid #ccc;','')}height: 100%;position: relative;left: 50px">
                            <p style="color: white">aa</p>
                        </div>
                        <div class="col-xs-11" style="${day_has_next?string('border-bottom:1px solid #ccc;','')}">
                            <p class="text_detail" style="color: #a0a0a0">${day.order.way}<span style="font-size: 40px;font-weight: bold;padding: 5px">·</span>${day.order.recoverOb}</p>
                        </div>
                    </div>
                    <#if day_has_next>
                        <div class="row" style="border-left:2px solid #ccc;height: 2%;margin-left: 50px!important;">
                        </div>
                    </#if>
                </div>
            </#list>
    <#else >
        <script>
            $(".buttonDiv_info").addClass("noneDiv");
        </script>
        <div class="row" style="margin-top: 150px;width: 100%">
            <div class="col-xs-2">
            </div>
            <div class="col-xs-2">
                <img src="/static/img/kong.png" width="150">
            </div>
            <div class="col-xs-6">
                <p style="font-size: 45px;color: dimgrey;font-weight: bold">您当天没有安排</p>
                <p style="font-size: 38px;color: grey">可点击日历上标记的日期查看该天安排</p>
            </div>
        </div>
    </#if>
</div>


</div>

<#include "common/foot.ftl" />
</body>
<script>
    function showCalendar() {
        $('#calendar_month').slideDown();
        $(".rili").hide();
        $(".fa-angle-double-down").hide();
        $(".fa-angle-double-up").show();

    }
    function hideCalendar() {
        $('#calendar_month').slideUp();
        $(".rili").show();
        $(".fa-angle-double-up").hide();
        $(".fa-angle-double-down").show();
    }

    $(function () {
        var selectTime;//用于记录选中的有安排的日期
        var events=[];
        <#list (work.monthWork)! as item>
            events.push({start:"${item.start}",title:"${item.title}",className:"schedule_title"});
        </#list>
//        alert(JSON.stringify(events));

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
            monthNames: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
            monthNamesShort: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
            dayNames: ["日", "一", "二", "三", "四", "五", "六"],
            dayNamesShort: ["日", "一", "二", "三", "四", "五", "六"],
            today: ["今天"],
            eventClick : function( event ) {
                var date = event.start.toString();
                $(".select").removeClass("select");
                $(this).addClass("select");
                $.ajax({
                    type: "POST",
                    url: "/wx/teacherCenter/${user.id}/myWork/getDayWork",
                    dataType: "json",
                    data: {
                        date: date
                    },
                    success: function (data) {
                        $(".buttonDiv_info").removeClass("noneDiv").css("background-color","white");
                        $(".buttonDiv_info").empty();
                        var $target=$(".buttonDiv_info");
                        $target.append($('<div class="row" ><p class="work_today">'+data.data.today+'</p></div>'));
                        for(var i=0;i<data.data.work.length;i++){
                            $target.append($('<div> <div class="row" style="position: relative"> <div class="col-xs-1 circle"> <i class="fa fa-circle-thin fa-2x icon_fa"></i> </div> <div class="col-xs-8" style="position: absolute;left:80px"> <p class="text_detail text_time"> '+data.data.work[i].startTime+'<span style="color: white;border-top: 1px solid dimgrey;padding: 10px;margin: 10px;position: relative;top: 33px;">a</span>'+data.data.work[i].endTime+'</p> </div> </div> <div class="row" style="height: 6%;"> <div class="col-xs-1" style="'+((i!=data.data.work.length-1)?'border-left:2px solid #ccc;':'')+'height: 100%;position: relative;left: 50px"> <p style="color: white">aa</p> </div> <div class="col-xs-11"> <p class="text_p">'+data.data.work[i].order.demand.name+'&nbsp;&nbsp;&nbsp;家长：'+data.data.work[i].order.parent.realName+'</p> </div> </div> <div class="row" style="height: 4%;"> <div class="col-xs-1" style="'+((i!=data.data.work.length-1)?'border-left:2px solid #ccc;':'')+'height: 100%;position: relative;left: 50px"> <p style="color: white">aa</p> </div> <div class="col-xs-11" style="'+((i!=data.data.work.length-1)?'border-bottom:2px solid #ccc;':'')+'"> <p class="text_detail" style="color: #a0a0a0">'+data.data.work[i].order.way+'<span style="font-size: 40px;font-weight: bold;padding: 5px">·</span>'+data.data.work[i].order.recoverOb+'</p> </div> </div>'));
                            if(i!=data.data.work.length-1){
                                $target.append($('<div class="row" style="border-left:2px solid #ccc;height: 2%;margin-left: 50px!important;"> </div>'));
                            }
                        }
                        var day=date.toString().split(" ")[2];
                        var today = new Date().getDate()+"";
                        if(parseInt(day)!=parseInt(today)){
                            $(".fa-circle-thin").eq(0).removeClass("fa-circle-thin").addClass("fa-circle").addClass("sss");
                        }
                    }
                });
            }
        });
        $("#calendar_month").hide();
        $(".fc-center h2").html($(".fc-center h2").text().split(" ")[1]+"-"+$(".fc-center h2").text().split(" ")[0]);
        $(".fc-button-group button").click(function () {
            $(".fc-center h2").html($(".fc-center h2").text().split(" ")[1]+"-"+$(".fc-center h2").text().split(" ")[0]);
        });
        $(".fc-left button").click(function () {
            $(".fc-center h2").html($(".fc-center h2").text().split(" ")[1]+"-"+$(".fc-center h2").text().split(" ")[0]);
        });

        <#if (work.workDay)??>
            var day=$(".schedule_title").eq(0).text();
            var today = new Date().getDate()+"";
            if(parseInt(day)==parseInt(today)){
                $(".schedule_title").eq(0).addClass("select");
            }

            $(".text_time").each(function () {
                var startTime=$(this).text().split("a")[0];
                var myDate = new Date();
                var now="";
                if(myDate.getHours().toString().length==1){
                    now+="0"+myDate.getHours()+":";
                }else{
                    now+=myDate.getHours()+":";
                }
                if(myDate.getMinutes().toString().length==1){
                    now+="0"+myDate.getMinutes();
                }else{
                    now+=myDate.getMinutes();
                }

                var s=parseInt(startTime.replace(":",""));
                var n=parseInt(now.replace(":",""));
                if(s>n){
                    $(this).parent().prev().children().addClass("sss").removeClass("fa-circle-thin").addClass("fa-circle");
                    return;
                }
            });
        </#if>
    });


</script>
</html>