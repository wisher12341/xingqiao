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
        width: 100%;
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

    .weekday-pill{
        font-size: 36px;
        margin: 15px 0px;
        padding: 20px;
    }

    .time-pill{
        font-size: 36px;
        margin: 15px 0px;
    }

    .time-pills-container{
        display: none;
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

    .time-item{
        padding: 10px 30px;
    }
</style>

<body>
<#assign weekdayStrs = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]>
<div id="main">
    <div class="container time-selector" id="timeContainer">
        <div class="row">
            <div class="col-xs-12 time-selector-title" >
                请选择每周上课日(可多选)
            </div>
        </div>
        <br>
        <br>
        <div class="row" id="weekdayPillList">
        <#list schedule as times>
            <#if times != "0">
                <div class="col-xs-3">
                    <div class="border-pill weekday-pill" data-weekday="${times_index}">${weekdayStrs[times_index]}</div>
                </div>
            </#if>
        </#list>
        </div>
        <hr>
        <br>
        <br>
        <div class="row">
            <div class="col-xs-12 time-selector-title" >
                该日可选时间(可多选)
            </div>
        </div>
        <br>
        <br>
        <#list schedule as times>
            <#if times != "0">
                <div class="row time-pills-container" id="pills${times_index}">
                    <#list times?split("@") as t>
                    <div class="col-xs-3">
                        <div class="border-pill time-pill" data-time="${times_index}@${t?replace("-","%")}">${t}</div>
                    </div>
                    </#list>
                </div>
            </#if>
        </#list>

    </div>

</div>


<div id="mobile-menu-selected" class="mobile-nav mobile-menu-bottom visible-xs visible-sm hide-nav-bottom">
    <div class="inline-wrapper" style="font-size: 36px; background-color: #eeeeee; color: #696969; padding: 10px 30px;">
        <div>已选每周上课时间</div>
        <div id="btnClear"><img style="width: 36px;" src="${path}/static/img/clear.svg"/>&nbsp<span>清空</span></div>
    </div>
    <div class="slider-body" id="selectedTimesContainer">

    </div>
</div>

<div class="bottom-multiple-btn inline-wrapper" style="height: 120px;padding-left: 2%;z-index: 10000">
    <div id="btnShowList"><img style="height:80%" src="${path}/static/img/list.svg"></div>
    <div class="selected-time">
        <div>每周已选<span id="timeChosen">0</span>次</div>
        <div style="font-size: 28px; color: #aaaaaa">共${order.amount}次课</div>
    </div>
    <div id="btnNextStep" class="bottom-btn-item">下一步</div>
</div>

<div class="mask" id="mask" style="z-index:9980;display: none"></div>

<form id="toChooseFirstClassForm" action="${path}/wx/teacher/toChooseFirstClass" method="post">
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
    var weekdayStrs = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];
    var amount = ${order.amount};
    var timeChosen = 0;
    $(function () {
        var selectTimeList = [];//用于记录选中的有安排的日期 带weekday@start%end

        function addSelectTime(timeFormatted) {
            if (timeChosen < amount){
                timeChosen++;
                $("#timeChosen").html(timeChosen);
                selectTimeList.push(timeFormatted);
                selectTimeList.sort();
                loadSelectedTimes();
                return true;
            } else {
                alert("您选的课程太多咯！");
                return false;
            }
        }

        function deleteSelectTime(timeFormatted) {
            for (var i=0; i<selectTimeList.length; i++){
                if (selectTimeList[i] ==  timeFormatted){
                    selectTimeList.splice(i,1);
                    selectTimeList.sort();
                    timeChosen--;
                    $("#timeChosen").html(timeChosen);
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
                var tmpArr = selectTimeList[i].split("@");
                var textTime = tmpArr[1].replace(/%/g, "-");
                var weekday = weekdayStrs[tmpArr[0]];
                var str = '<div class="inline-wrapper time-item" data-time="' + selectTimeList[i] +'">' +
                        '<div class="selected-time" style="color: #696969">' + weekday +'</div>' +
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
                $(".time-pill.border-pill-active").each(function () {
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
            $(".time-pill.border-pill-active").removeClass("border-pill-active").addClass("border-pill");
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

        $(".weekday-pill").click(function () {
            if ($(this).hasClass("border-pill-active")){
                $(this).removeClass("border-pill-active").addClass("border-pill");
            } else {
                $(".weekday-pill.border-pill-active").removeClass("border-pill-active").addClass("border-pill");
                $(this).removeClass("border-pill").addClass("border-pill-active");

                $(".time-pills-container").hide();
                var containerId = "#pills" + $(this).data("weekday");
                $(containerId).show();
            }
        });

        $(".time-pill").click(function () {
            if ($(this).hasClass("border-pill-active")){
                $(this).removeClass("border-pill-active").addClass("border-pill");
                deleteSelectTime($(this).data("time"))
            } else {
                if (addSelectTime($(this).data("time"))){
                    $(this).removeClass("border-pill").addClass("border-pill-active");
                }
            }
        });
        $("#btnNextStep").click(function () {
            if (timeChosen <= 0){
                alert("您还未选择上课日哦~");
                return;
            }

            var serviceTimes = "";
            for (var i=0; i<selectTimeList.length; i++){
                serviceTimes += selectTimeList[i] + "#";
            }
            serviceTimes = serviceTimes.slice(0,serviceTimes.length-1);
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
            $("#toChooseFirstClassForm").submit();
        })

    });

</script>
</html>