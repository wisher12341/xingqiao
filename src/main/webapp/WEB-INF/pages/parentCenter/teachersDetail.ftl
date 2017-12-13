<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>治疗师资料</title>
<#include "common/head.ftl" />
    <script src='${path}/static/fullcalendar/fullcalendar.js'></script>
    <link href='${path}/static/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
    <link href='${path}/static/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="main">
    <div class="imgDiv2">
        <img src="${(teacher.user.headimgurl?contains("wx.qlogo.cn")?string("${teacher.user.headimgurl}","/${teacher.user.headimgurl}"))!}" class="img-circle">
    </div>
    <div class="myInfoDiv">
        <div style="height: 30px;background-color: #e6ece3"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p class="info-part-title" style="color: #20b49a">基本信息</p>
            <ul class="list-group">
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">姓名</div>
                    <div class="list-item-text">${(teacher.name)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">手机</div>
                    <div class="list-item-text">${(teacher.user.phone)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">邮箱</div>
                    <div class="list-item-text">${(teacher.user.email)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">性别</div>
                <#if teacher.user.gender==1>
                    <div class="list-item-text"> 女</div>
                <#else>
                    <div class="list-item-text"> 男</div>
                </#if>
                </div>
            </li>

            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">康复项目</div>
                    <div class="list-item-text"> ${(teacher.domain)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">康复经验年限</div>
                    <div class="list-item-text"> ${(teacher.experienceAge)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">康复对象</div>
                    <div class="list-item-text"> ${(teacher.object)!}</div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">康复问题</div>
                    <div class="list-item-text"> ${(teacher.question)!}</div>
                </div>
            </li>
        </ul>
        <div class="addBtn" onclick="getSchedule('${teacher.schedule}','${teacher.name}')">工作时间表</div>
        <div id="title" style="display: none"><h3></h3></div>
        <div id='calendar'></div>
        <div id="schedule" style="display: none"><button onclick="location.reload()">返回</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function getSchedule(schedule,name) {


        $("#title h3").html("一周工作安排表："+name);
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
                    var time = {start: "", end: ""};
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
//    alert(JSON.stringify(events));
        $('#calendar').fullCalendar({
            columnFormat:'ddd',
            minTime:"07:00:00",
            maxTime:"21:00:00",
            header: false,
            defaultDate: '2017-09-12',
            navLinks: false, // can click day/week names to navigate views
            defaultView:"agendaWeek",
            // weekNumbers: true,
            weekNumbersWithinDays: false,
            weekNumberCalculation: 'ISO',
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            allDaySlot:false,
            eventStartEditable:false,
            editable:false,
            events: events
        });
        $("#main_patient").hide();
        $("#schedule").show();
        $("#calendar").show();
        $('#title').show();
    }
</script>
</html>