<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>我的课表</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<#include "common/head.ftl" />
    <link href='${path}/static/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
    <link href='${path}/static/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <script src='${path}/static/fullcalendar/moment.min.js'></script>
    <script src='${path}/static/fullcalendar/fullcalendar.js'></script>
    <script src="/static/js/datePicker.js" ></script>
    <style>
        .fc-time-grid-container{
            height: 100%!important;
        }
        .fc-time-grid-event .fc-time{
            white-space: normal;!important;
        }
        body{
            background-color: #f5f5f5;
        }
        #calendar{
            background-color: white;
        }
        .fc-unthemed .fc-divider, .fc-unthemed .fc-list-heading td, .fc-unthemed .fc-popover .fc-header{
            background: white!important;
        }
        .fc-unthemed .fc-content, .fc-unthemed .fc-divider, .fc-unthemed .fc-list-heading td, .fc-unthemed .fc-list-view, .fc-unthemed .fc-popover, .fc-unthemed .fc-row, .fc-unthemed tbody, .fc-unthemed td, .fc-unthemed th, .fc-unthemed thead{
            border-top-color: #f5f5f5;!important;
            border-right-color: white;!important;
        }
        .schedule{
            background-color: #20b49a;
            border-color:#20c59a;
            padding-top: 2px;
            /*font-size: 15px;*/
            /*line-height: 10px;*/
        }
        .fc-axis{
            color: dimgrey;!important;
        }
        .fc-day-header{
            color: dimgrey;!important;
            font-weight: bold;
        }

        .foot{
            /*position: fixed;*/
            width: 100%;
            bottom: 0;
            background-color: #f5f5f5;
        }
        .foot input{
            /*background-color:#94e6c8 ;*/
            background-color: #20b49a;
            color: white !important;
            font-weight: bold;
            font-size: 18px;
            padding: 12px;
            margin: 0 auto;
            border-radius: 2px;
            border-color:white ;
        }
        .fc-time-grid-event .fc-time{
            font-size: 1.1em!important;
        }
        .fc-event{
            line-height: 1!important;
        }



        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .info{
            height: 50px;
            padding-top: 10px;
            background-color: white;
        }
        .text_p{
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            font-weight: bold;
            font-size: 18px;
            position: relative;
            right: 12px;
            top:4px;
        }
        .icon_fa{
            /*position: relative;*/
            /*top: 5px;*/
            color: dimgrey;
        }
        .title_input{
            border-style: none;
            color: dimgrey;
            /*position: relative;*/
            /*top:-6px;*/
            font-size: 18px;
            position: relative;
            right: 8px;
        }
        .selectXueli{
            border-style: none;
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            color: #8c8c8c;
            opacity: 0.8;
            padding-top: 5px;
            width: 100%;
        }
        #add{
            display: none;
            position: absolute;
            z-index: 99;
            top:100%;
            width: 100%;
            height: 100%;
            background-color: #f5f5f5;
        }
        #add .row{
            margin-right: 0!important;
            margin-left: 0!important;
        }
        .btn{
            width: 49.4%;
            height: 45px;
        }
        .modal-dialog{
           margin-top: 150px;
        }
        .modal-body{
            font-size: 18px!important;
            color: dimgrey;!important;
        }
        .delClass{
            color: orange;!important;
        }
        input[type=time] {
            background-color:transparent;
            /*!*FILTER: alpha(opacity=0); !*androd*!*!*/
            /*appearance:none;  !*下拉框去掉右侧图标*!*/
            /*-moz-appearance:none;*/
            /*-webkit-appearance:none;*/
        }
        #main{
            margin-bottom: 3%;
        }
        .ym_roll>div, .date_roll>div, .datetime_roll>div, .time_roll>div{
            font-size: 1.2em;
        }
        .date_btn{
            font-size: 1.3em;
        }
    </style>
</head>
<body>
<div id="main">
    <div id='calendar'></div>
</div>
<#if type=="teacher">
<div class="foot" align="center">
    <input type="button" style="width: 49% !important;" value="添加" onclick="showAdd()">
    <input type="button" style="width: 49% !important;" value="返回" onclick=location.href="/wx/teacherCenter/${uid}/my">
</div>
</#if>

<div id="add">
    <form action="/wx/teacherCenter/${uid}/mySchedule/add" method="post" id="addForm">
        <div class="buttonDiv_info" >
            <div class="info row" >
                <div class="col-xs-4">
                    <p class="text_p"> 星期</p>
                </div>
                <div class="col-xs-6">
                    <select class="selectXueli title_input" name="week" onchange="$(this).css('color','dimgrey').css('opacity','1')">
                        <option value="" style="display: none;" disabled selected>选择星期</option>
                        <option value="1">一</option>
                        <option value="2">二</option>
                        <option value="3">三</option>
                        <option value="4">四</option>
                        <option value="5">五</option>
                        <option value="6">六</option>
                        <option value="7">日</option>
                    </select>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-2x icon_fa"></i>
                </div>
            </div>
                <div class="info row" style="  margin-top: 2px;">
                    <div class="col-xs-4">
                        <p class="text_p"> 具体时间</p>
                    </div>
                    <div class="col-xs-6">
                        <input placeholder="选择时间" type="text" id="demo1" class="title_input" name="time" style="width: 100%">
                    </div>
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-2x icon_fa"></i>
                    </div>
                </div>
        </div>


        <div class="foot" align="center">
            <input type="button" style="width: 49% !important;" onclick='$("#main").show();$("#add").animate({top:"100%"},function () {$("#add").hide();});' value="返回" />
            <input type="button" onclick="val()" style="width: 49% !important;" value="添加" />
        </div>
    </form>
</div>

<div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                删除&nbsp;&nbsp;&nbsp;<span class="delClass"></span>&nbsp;&nbsp;&nbsp;课程
            </div>
            <div class="modal-footer">
                <form action="/wx/teacherCenter/${uid}/mySchedule/del" method="post">
                    <input type="button" onclick="$('#delModal').modal('hide')" class="btn" value="取消" style="background-color: orange!important;color: white!important;font-size: 18px!important;">
                    <input type="hidden" name="time" >
                    <input type="submit" class="btn btn-primary" value="删除" style="background-color: #20b49a!important;font-size: 18px!important;border-color: white!important;">
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

</body>
<script>
    function val() {
        var flag=0;
        if("${period!}"==""){
            alert("请前往康复服务，添加课程时间");
        }else{
            $(".title_input").each(function () {
                if($.trim($(this).val())==""){
                    flag=1;
                }
            });
            if(flag==0){
                var t=$("input[name='time']").val().split(":");
                var hour=t[0];
                var min=t[1];
                if(hour<8){
                    alert("课程开始时间不得早于8点，请重新填写");
                }
                var add=parseInt(min)+parseInt("${period!}");
                var addh=add/60;
                var addm=add%60;
                hour=parseInt(hour)+parseInt(addh);
                if(hour>21 || (hour==21 && addm>0)){
                    alert("课程结束时间超过9点，请重新填写");
                }else{
                    //TODO 课程冲突检测
                    $("#addForm").submit();
                }
            }else{
                alert("资料未填写完整");
            }
        }
    }




        var schedule="${schedule!}";
        var list=[[],[],[],[],[],[],[]];
        var week=schedule.split("#");
        for(var i=0;i<week.length;i++){
            if(week[i]=="0"){
                continue;
            }else{
                var day=week[i].split("@");
                for(var j=0;j<day.length;j++){
                    list[i].push(day[j]);
                }
            }
        }
        var events=[];
//        alert(schedule);
//        alert(JSON.stringify(list));
        for(var i=0;i<list.length;i++){
            if(list[i].length==0){
                continue;
            }else{
                for(var j=0;j<list[i].length;j++) {
                    var time = {start: "", end: "",className:"schedule"};
                    switch (i) {
                        case 0:
                            time.start = "2017-09-11T" + list[i][j].split("-")[0];
                            time.end = "2017-09-11T" + list[i][j].split("-")[1];
                            break;
                        case 1:
                            time.start = "2017-09-12T" + list[i][j].split("-")[0];
                            time.end = "2017-09-12T" + list[i][j].split("-")[1];
                            break;
                        case 2:
                            time.start = "2017-09-13T" + list[i][j].split("-")[0];
                            time.end = "2017-09-13T" + list[i][j].split("-")[1];
                            break;
                        case 3:
                            time.start = "2017-09-14T" + list[i][j].split("-")[0];
                            time.end = "2017-09-14T" + list[i][j].split("-")[1];
                            break;
                        case 4:
                            time.start = "2017-09-15T" + list[i][j].split("-")[0];
                            time.end = "2017-09-15T" + list[i][j].split("-")[1];
                            break;
                        case 5:
                            time.start = "2017-09-16T" + list[i][j].split("-")[0];
                            time.end = "2017-09-16T" + list[i][j].split("-")[1];
                            break;
                        case 6:
                            time.start = "2017-09-17T" + list[i][j].split("-")[0];
                            time.end = "2017-09-17T" + list[i][j].split("-")[1];
                            break;
                    }
                    events.push(time);
                }
            }
        }

        $('#calendar').fullCalendar({
            columnFormat:'ddd',
            minTime:"08:00:00",
            maxTime:"21:00:00",
            header: false,
            defaultDate: '2017-09-12',
            navLinks: false, // can click day/week names to navigate views
            defaultView:"agendaWeek",
            weekNumbersWithinDays: false,
            weekNumberCalculation: 'ISO',
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            allDaySlot:false,
            eventStartEditable:false,
            events: events,
            dayNames: ["日", "一", "二", "三", "四", "五", "六"],
            dayNamesShort: ["日", "一", "二", "三", "四", "五", "六"],
            eventClick : function( event ) {
            <#if type=="teacher">
                var start = event.start.format('E HH:mm');
                var week;
                switch (start.split(" ")[0]){
                    case "1":
                        week="一";
                        break;
                    case "2":
                        week="二";
                        break;
                    case "3":
                        week="三";
                        break;
                    case "4":
                        week="四";
                        break;
                    case "5":
                        week="五";
                        break;
                    case "6":
                        week="六";
                        break;
                    case "7":
                        week="日";
                        break;
                }
                $(".delClass").html("周"+week+"  "+start.split(" ")[1]+"  -  "+event.end.format('HH:mm'));
                $('#delModal').modal();
                $('input[name="time"]').val(event.start.toString());
                </#if>
            },

        });

        function showAdd() {
            $('input[name="time"]').val("");
            $(".selectXueli option:selected").prop("selected","false");

            $('#add').show();
            $('#add').animate({top:"0"},function () {
                $('#main').hide();
            });
        }

    var calendar = new datePicker();
    calendar.init({
        'trigger': '#demo1', /*按钮选择器，用于触发弹出插件*/
        'type': 'time',/*模式：date日期；datetime日期时间；time时间；ym年月；*/
        'minDate':'1900-1-1',/*最小日期*/
        'maxDate':'2100-12-31',/*最大日期*/
        'onSubmit':function(){/*确认时触发事件*/
            var theSelectData=calendar.value;
        },
        'onClose':function(){/*取消时触发事件*/
        }
    });

    $("#demo1").focus(function(){
        document.activeElement.blur();
    });
</script>
</html>