<#include "../order/common/const.ftl" />
<html>
<head>
    <title>康复日志</title>
<#include "../order/common/head.ftl" />
    <link href="${path}/static/css/log/log.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/common/calendar/css/mobiscroll.custom-2.17.1.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="${path}/static/common/calendar/js/mobiscroll.custom-2.17.1.min.js"></script>
    <script type="text/javascript" src="${path}/static/js/log/log.js"></script>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<#--单选框-->
    <link type="text/css" href="/static/common/box/build.css" rel="stylesheet" />
    <script src="http://twemoji.maxcdn.com/twemoji.min.js"></script>
    <style>
        .demand-div{
            /*border:5px solid #20b49a;*/
            /*border-radius: 20%;*/
            height:350px;
            margin: 15px;
        }
        .demand-div .demand-img img{
            width: 80%;
            border:5px solid #8ad4c7;
            border-top-left-radius: 10%;
            border-top-right-radius:10% ;
        }
        .demand-btn {
            text-align: center;
            width: 80%;
            opacity: 0.5;
        }
        .demand-btn div{
            background-color:  #20b49a;
            color: white;
            height: 80px;
            font-size: 40px;
            border-bottom-left-radius: 10%;
            border-bottom-right-radius:10% ;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .demands-div{
            padding: 20px;
        }

        .ob-div .ob-img img{
            width: 80%;
        }
        .ob-btn {
            text-align: center;
            width: 80%;
        }
        .ob-div{
            opacity: 0.5;
        }
        .ob-btn div{
            color:dimgrey;
            height: 80px;
            font-size: 40px;
            border-bottom-left-radius: 10%;
            border-bottom-right-radius:10% ;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .selectTeacher{
            opacity: 1!important;
        }
        .selectTeacherImg{
            border:5px solid #20b49a!important;
        }
        .selectTitle{
            font-size: 50px;
            font-weight: bold;
            padding: 15px;
            color: white;
            background-color: #20b49a;
            width: 100%;
            text-align: center;
            height: 6%;
        }
        .openSpan{
            font-size: 50px;
            color: darkgrey;
        }
        .demand_div{
            background-color: white;
            padding: 10px;
        }
        .checkbox label::after {
            display: inline-block;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 999;
            margin-left: -12px;
            padding-top: 12px;
            font-size: 30px;
            color: #555555;
        }
        .checkbox label::before {
            content: "";
            display: inline-block;
            position: static;
            width: 40px;
            height: 40px;
            left: 0;
            margin-left: -20px;
            border: 1px solid #cccccc;
            border-radius: 3px;
            background-color: #fff;
            -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
            -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
            transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
        }
        .checkbox-success input[type="checkbox"]:checked + label::before, .checkbox-success input[type="radio"]:checked + label::before {
            background-color: #20b49a;
            border-color: #20b49a;
        }
        .checkbox label{
            width: 80%;
        }
        .selectOb{
            opacity: 1;
        }

        #selectTeacher,#selectOb,#selectDemand,#selectConfirm{
            position: absolute;
            z-index: 99;
            top:100%;
        }
    </style>
</head>
<body>
<div id="main">
    <form action="${path}/wx/log/index" method="post">
        <div class="obD">
            <i class="glyphicon glyphicon-circle-arrow-left" onclick="history.go(-1)" style="position: absolute;top:1%;left: 4%;font-size: 60px;color: white"></i>
            <span class="ob_title_top">条件筛选</span>
            <div class="ob_title">
                <div style="display: inline;position: relative;left: 30%;">
                    <i class="glyphicon glyphicon-search" style="font-size: 40px;color: white"></i>
                    <input type="submit" value="查找" onclick="addName()" class="input_button_search"/>
                </div>
            </div>

        </div>
        <div id="search">
            <div class="search_div row">
                <div class="col-xs-5" align="center" style="width: 48%!important;">
                    <span style="font-size: 40px;color: grey;padding-right: 10px;padding-top: 10px" onclick="selectTeacher()" class="t_name">选择治疗师</span>
                    <input type="hidden" name="teacher.id" class="t_val">
                    <#--<select name="teacher.id" class="select_teacher" onclick="$('.select_teacher .select_hide').remove();">-->
                        <#--<option class="select_hide" selected>选择治疗师</option>-->
                    <#--<#if (recoveryLogDto.teacherList)??>-->
                        <#--<option value="0">不限</option>-->
                        <#--<#list recoveryLogDto.teacherList as teacher>-->
                            <#--<option value="${teacher.id}">${teacher.name}</option>-->
                        <#--</#list>-->
                    <#--</#if>-->
                    <#--</select>-->
                    <i class="glyphicon glyphicon-chevron-down" style="font-size: 30px;color: grey;"></i>
                </div>
                <input type="hidden" name="teacher.name" />
                <div class="col-xs-1" style="width: 3%">
                    <span style="border-right:solid 1px black"></span>
                </div>
                <div class="col-xs-5" align="center" style="width: 48%!important;">
                    <span style="font-size: 40px;color: grey;padding-right: 10px;padding-top: 10px" onclick="selectDemand()" class="d_name">选择简历</span>
                    <input type="hidden" name="demand.id" class="d_val">
                    <#--<select name="demand.id" class="select_demand" onclick="$('.select_demand .select_hide').remove();">-->
                        <#--<option class="select_hide" selected>选择简历</option>-->
                    <#--<#if (recoveryLogDto.demandList)??>-->
                        <#--<#list recoveryLogDto.demandList as demand>-->
                            <#--<option value="${demand.id}">${demand.name}</option>-->
                        <#--</#list>-->
                    <#--</#if>-->
                    <#--</select>-->
                    <i class="glyphicon glyphicon-chevron-down" style="font-size: 30px;color: grey;"></i>
                </div>
                <input type="hidden" name="demand.name" />
            </div>

            <div class="search_exact">

                <div class="search_exact_div" onclick="selectOb()">
                    <span class="search_title">康复领域：</span>
                    <div style="display: inline" id="ob_div">
                    <#list (recoveryLogDto.obs)! as ob>
                        <input  type="hidden" value="${ob}" name="ob">
                        <span class="search_label">${ob}</span>
                    </#list>
                    </div>
                    <i class="glyphicon glyphicon-chevron-right" style="font-size: 40px;float: right"></i>
                </div>
                <div class="search_exact_div" onclick="selectTime()">
                    <span class="search_title">时间段：<span class="search_exact_time">不限</span></span>
                    <i class="glyphicon glyphicon-chevron-right" style="font-size: 40px;float: right"></i>
                <#--<div align="center">-->
                <input name="startTime" type="hidden" >
                <input name="endTime" type="hidden" >
                <#--</div>-->
                </div>
            <#--<div class="search_exact_div">-->
            <#--<span class="search_title">结束时间：</span>-->
            <#--<input name="endTime" type="text" class="search_time">-->
            <#--<i class="glyphicon glyphicon-chevron-right" style="font-size: 40px;float: right"></i>-->
            <#--</div>-->
                <div class="search_exact_div" onclick="selectConfirm()">
                    <span class="search_title">康复日志是否确认：<span class="c_name">不限</span></span>
                    <input type="hidden" name="isConfirm" class="c_val" value="2">
                    <#--<select name="isConfirm" class="select_confirm">-->
                        <#--<option value="2" >不限</option>-->
                        <#--<option value="0">未确认</option>-->
                        <#--<option value="1">已确认</option>-->
                    <#--</select>-->
                    <i class="glyphicon glyphicon-chevron-down" style="font-size: 30px"></i>
                </div>
            </div>
        </div>
    </form>


<#if (recoveryLogDto.recoveryLogList)??>
    <div id="log">
        <#--<p class="search_factor_title">康复日志</p>-->
        <div class="track-list" style="width: 100%; margin-bottom: 20px;background-color: white">
            <ul id="logUl">
                <#list recoveryLogDto.recoveryLogList as log>
                    <li style=" list-style-type: none;">
                        <div>
                            <#if log_index==0>
                                <span class="glyphicon glyphicon-record" style="margin-left: -7px; color: red;font-size: 40px"></span>
                            <#else>
                                <span class="glyphicon glyphicon-record" style="margin-left: -7px; color: #e8e8e8;font-size: 40px"></span>
                            </#if>
                            <span class="date" style="margin-left: 20px">${log.time}
                                <#if recoveryLogDto.teacher.id==0>
                                ${log.teacherName}（${log.recoverOb}）
                                </#if>
                                </span>
                            <div class="txt" >
                            ${log.content}
                                <div>
                                    <#if log.picUrls??>
                                        <#list log.picUrls?split("#") as pic>
                                            <img src="/${pic}" width="160px" height="160px" style="margin:20px 20px 0 0">
                                        </#list>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
</#if>
</div>



<div id="selectOb" style="display: none;background-color: white;height:100%;width: 100%">
    <i class="glyphicon glyphicon-circle-arrow-left" onclick='backSelect(this)' style="position: absolute;top:1%;left: 4%;font-size: 60px;color: white"></i>
    <p class="selectTitle">选择康复领域</p>
<#if (recoveryLogDto.obs)??>
    <#list (recoveryLogDto.obs)! as ob>
    <div class="col-sm-4" style="margin-top: 10%">
        <div class="ob-div" align="center" onclick="ob_select(this)">
            <div class="ob-img">
                <img src="${path}/static/img/log/icon.png">
            </div>
            <div class="ob-btn">
                <div style="width: 100%" class="ob">${ob}</div>
            </div>
        </div>
    </div>
    </#list>


    <button style="background-color: #20b49a;font-size: 40px;padding: 15px;color: white;position: fixed;bottom: 0;width: 100%;text-align: center;height: 8%" onclick="selectObs()">确定</button>
<#else >
    <span>您还没有康复领域</span>
</#if>
</div>

    <div id="selectTeacher" style="display: none;background-color: white;height:100%;width: 100%">
        <i class="glyphicon glyphicon-circle-arrow-left" onclick='backSelect(this)' style="position: absolute;top:1%;left: 4%;font-size: 60px;color: white"></i>
        <p class="selectTitle">选择治疗师</p>
        <#if (recoveryLogDto.teacherList)??>
            <div class="demands-div">
                <div class="col-sm-6" style="margin-top:  10%" onclick="selectTeacherEnd('全部老师',0)">
                    <div class="demand-div" align="center">
                        <div class="demand-img">
                            <img src="/static/img/touxiang.svg">
                        </div>
                        <div class="demand-btn">
                            <div onclick="" style="width: 100%" class="tname">全部老师</div>
                        </div>
                    </div>
                </div>
                <#list recoveryLogDto.teacherList as teacher>
                    <div class="col-sm-6" style="margin-top: 10%">
                        <div class="demand-div" align="center" onclick="selectTeacherEnd('${teacher.name!}',${teacher.id})">
                            <div class="demand-img">
                                <img src="${(teacher.headimgurl?contains("wx.qlogo.cn")?string("${teacher.headimgurl}","/${teacher.headimgurl}"))!}">
                            </div>
                            <div class="demand-btn">
                                <div style="width: 100%" class="tname">${teacher.name!}</div>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
    <#else>
        <span>您还没有治疗师</span>
    </#if>
    </div>

<div id="selectDemand" style="display: none;background-color: #f5f5f5;height: 100%;width: 100%">
    <i class="glyphicon glyphicon-circle-arrow-left" onclick='backSelect(this)' style="position: absolute;top:1%;left: 4%;font-size: 60px;color: white"></i>
    <p class="selectTitle">选择简历</p>
<#if (recoveryLogDto.demandList)??>
    <#list recoveryLogDto.demandList as demand>
        <div class="checkbox checkbox-success demand_div" onclick="selectDemandEnd('${demand.name}',${demand.id})">
            <input type="radio" name="open" class="radio3" id="radio${demand.id}" value="${demand.id}">
            <label for="radio${demand.id}" class="openSpan">
                ${demand.name}
            </label>
        </div>
    </#list>
<div class="checkbox checkbox-success demand_div" style="display: none">
    <input type="radio" name="open" class="radio3" checked>
</div>
<#else >
    <span>您还没有简历</span>
</#if>
</div>

<div id="selectConfirm" style="display: none;background-color: #f5f5f5;height: 100%;width: 100%">
    <i class="glyphicon glyphicon-circle-arrow-left" onclick='backSelect(this)' style="position: absolute;top:1%;left: 4%;font-size: 60px;color: white"></i>
    <p class="selectTitle">选择康复日志是否确认</p>
        <div class="checkbox checkbox-success demand_div" onclick="selectConfirmEnd('不限',2)">
            <input type="radio" name="c"  class="radioC" id="radioC2" value="2">
            <label for="radioC2" class="openSpan">
            不限
            </label>
        </div>
    <div class="checkbox checkbox-success demand_div" onclick="selectConfirmEnd('未确认',0)">
        <input type="radio" name="c"  class="radioC" id="radioC0" value="0">
        <label for="radioC0" class="openSpan">
            未确认
        </label>
    </div>
    <div class="checkbox checkbox-success demand_div" onclick="selectConfirmEnd('已确认',1)">
        <input type="radio" name="c" class="radioC" id="radioC1" value="1">
        <label for="radioC1" class="openSpan">
            已确认
        </label>
    </div>
</div>


    <input id="calendarMultiday-demo" style="display: none"/>

</body>
<script>

    twemoji.parse(document.getElementById('main'), {size: 36});
    function selectConfirm() {
        $('.radioC').each(function () {
            if($(this).val()==$('.c_val').val()){
                $(this).prop("checked","true");
                return;
            }
        });

//        $('#main').hide();
//        $('#selectConfirm').slideDown();
//        $('#selectConfirm').show();
//        $('#main').slideUp();
        $('#selectConfirm').show();
        $('#selectConfirm').animate({top:"0"},function () {
            $('#main').hide();
        });

    }

    function backSelect(obj) {
        $('#main').show();
        $(obj).parent().animate({top:"100%"},function () {
            $(obj).parent().hide();
        });
    }

    function selectConfirmEnd(cname,cid) {
        $(".c_val").val(cid);
        $(".c_name").html(cname);
//        $('#selectConfirm').hide();
//        $('#main').slideDown();
//        $("#selectConfirm").slideUp();
        $('#main').show();
        $('#selectConfirm').animate({top:"100%"},function () {
            $('#selectConfirm').hide();
        });
    }

    function selectTeacher() {

        $(".selectTeacher").removeClass("selectTeacher");
//        $(".selectTeacherImg").removeClass("selectTeacherImg");
        $(".tname").each(function () {
            if($(".t_name").html()==$(this).html()){
                $(this).parent().addClass("selectTeacher");
//                $(this).parent().prev().find("img").addClass("selectTeacherImg");
            }
        });

//        $("body").css("background-color","white");
//        $('#main').hide();
        $('#selectTeacher').show();
        $('#selectTeacher').animate({top:"0"},function () {
            $('#main').hide();
        });


    }

    function selectTeacherEnd(tname,tid) {
//        $("body").css("background-color","#f5f5f5");
        $(".t_val").val(tid);
        $(".t_name").html(tname);
//        $('#selectTeacher').hide();
//        $('#main').slideDown();
        $('#main').show();
        $('#selectTeacher').animate({top:"100%"},function () {
            $('#selectTeacher').hide();
        });
//        $("#selectTeacher").slideUp();

    }

    function selectDemand() {
        $('.radio3').each(function () {
            if($(this).val()==$('.d_val').val()){
                $(this).prop("checked","true");
                return;
            }
        });

//        $('#selectDemand').show();
//        $('#main').slideUp();
//        $('#main').hide();
//        $('#selectDemand').slideDown();
        $('#selectDemand').show();
        $('#selectDemand').animate({top:"0"},function () {
            $('#main').hide();
        });

    }
    function selectDemandEnd(dname,did) {
        $(".d_val").val(did);
        $(".d_name").html(dname);
//        $('#selectDemand').hide();
//        $('#main').slideDown();

//        $("#selectDemand").slideUp();
        $('#main').show();
        $('#selectDemand').animate({top:"100%"},function () {
            $('#selectDemand').hide();
        });
    }

    function selectOb() {
        $(".selectOb").removeClass("selectOb");
        var selectObs;
        $("input[name='ob']").each(function () {
           selectObs+=$(this).val()+"#";
        });
        $(".ob-div").each(function () {
            if(selectObs.indexOf($(this).find(".ob").html())!=-1){
                $(this).addClass("selectOb");
            }
        });
//        $('#selectOb').show();
//        $('#main').slideUp();
//        $('#main').hide();
//        $('#selectOb').slideDown();
        $('#selectOb').show();
        $('#selectOb').animate({top:"0"},function () {
            $('#main').hide();
        });
    }
</script>

</html>