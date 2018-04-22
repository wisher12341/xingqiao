<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>治疗师资料</title>
<#include "common/head.ftl" />
    <script src='${path}/static/fullcalendar2/fullcalendar.min.js'></script>
    <link href='${path}/static/fullcalendar2/fullcalendar.css' rel='stylesheet' />
    <link href='${path}/static/fullcalendar2/fullcalendar.print.css' rel='stylesheet' media='print' />
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
            <div class="addBtn" id="calendarBtn">工作时间表</div>
            <div class="addBtn" id="calendarBtnCopy" style="display: none">工作时间表</div>
            <div class="addBtn" id="scheduleCloseBtn" style="display: none">关闭</div>

            <div id="title" style="display: none"><h3></h3></div>
            <div id='calendar' style="margin-bottom: 100px"></div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $("#calendarBtn").click(function () {
        var b=new Date();
        var c=b.getDate();
        var a=b.getMonth();
        var e=b.getFullYear();
        var day=b.getDay();  //星期天：0
        if(day=='0') day=7;
        var str="${teacher.schedule}";
        var arr=0;
        if(str!=""){
            arr=str.split('#');
        }

        this.setAttribute("style","display:none");
        $("#calendar").fullCalendar({
            header:{left:"",center:"",right:""},

            defaultView:"agendaWeek",
            firstDay:1,
            minTime:6,
            maxTime:22,
            navLinks: true,
            displayEventTime:false

        });
        if(arr!=null) {
            for(var i=0;i<arr.length;i++){
                if(arr[i]!='0'&&arr[i].indexOf('@')==-1){
                    var start=arr[i].split('-')[0].split(':');
                    var end=arr[i].split('-')[1].split(':');

                    var schdata={start:new Date(e,a,c-day+1+i,start[0],start[1]),end:new Date(e,a,c-day+1+i,end[0],end[1]),allDay:false};
                    $('#calendar').fullCalendar('renderEvent', schdata, true);
                }
                else if(arr[i]=='0'){}
                else{
                    //alert(i+"有多个时间段");
                    var subArr=arr[i].split('@');
                    //alert(subArr.length);
                    for(j=0;j<subArr.length;j++){
                        var start=subArr[j].split('-')[0].split(':');
                        var end=subArr[j].split('-')[1].split(':');

                        var schdata={start:new Date(e,a,c-day+1+i,start[0],start[1]),end:new Date(e,a,c-day+1+i,end[0],end[1]),allDay:false};
                        $('#calendar').fullCalendar('renderEvent', schdata, true);
                    }

                }
            }
        }
        setCalendarStyle();
        document.getElementById("scheduleCloseBtn").setAttribute("style","display:flex");
        this.setAttribute("style","display:none");
    });

    function setCalendarStyle() {
        document.getElementsByClassName("fc-col0")[0].innerHTML="一";
        document.getElementsByClassName("fc-col1")[0].innerHTML="二";
        document.getElementsByClassName("fc-col2")[0].innerHTML="三";
        document.getElementsByClassName("fc-col3")[0].innerHTML="四";
        document.getElementsByClassName("fc-col4")[0].innerHTML="五";
        document.getElementsByClassName("fc-col5")[0].innerHTML="六";
        document.getElementsByClassName("fc-col6")[0].innerHTML="日";

        var allday=document.getElementsByClassName("fc-agenda-allday")[0];
        allday.parentNode.removeChild(allday);

        var eventTimes=document.getElementsByClassName("fc-event-time");
        for(var e=0;e<eventTimes.length;e++){
            document.getElementsByClassName("fc-event-time")[e].setAttribute("style","font-size:35px;white-space: pre-wrap;");
        }
    }

    $("#scheduleCloseBtn").click(function () {
        document.getElementById("calendar").setAttribute("style","display:none");
        document.getElementById("calendarBtnCopy").setAttribute("style","display:flex");
        this.setAttribute("style","display:none");
    });

    $("#calendarBtnCopy").click(function () {
        document.getElementById("calendar").setAttribute("style","display:block");
        document.getElementById("scheduleCloseBtn").setAttribute("style","display:flex");
        this.setAttribute("style","display:none");
    });

</script>
</html>