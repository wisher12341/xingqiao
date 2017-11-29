<#include "../order/common/const.ftl" />
<html>
<head>
    <title>康复日志</title>
<#include "../order/common/head.ftl" />
    <link href="${path}/static/css/log/log.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/common/calendar/css/mobiscroll.custom-2.17.1.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="${path}/static/common/calendar/js/mobiscroll.custom-2.17.1.min.js"></script>
    <script type="text/javascript" src="${path}/static/js/log/log.js"></script>
</head>
<body>
<div id="main">
    <form action="${path}/wx/log/index" method="post">
        <div class="ob">
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
                    <select name="teacher.id" class="select_teacher" onclick="$('.select_teacher .select_hide').remove();">
                        <option class="select_hide" selected>选择治疗师</option>
                    <#if (recoveryLogDto.teacherList)??>
                        <option value="0">不限</option>
                        <#list recoveryLogDto.teacherList as teacher>
                            <option value="${teacher.id}">${teacher.name}</option>
                        </#list>
                    </#if>
                    </select>
                    <i class="glyphicon glyphicon-chevron-down" style="font-size: 30px;color: grey;"></i>
                </div>
                <input type="hidden" name="teacher.name" />
                <div class="col-xs-1" style="width: 3%">
                    <span style="border-right:solid 1px black"></span>
                </div>
                <div class="col-xs-5" align="center" style="width: 48%!important;">
                    <select name="demand.id" class="select_demand" onclick="$('.select_demand .select_hide').remove();">
                        <option class="select_hide" selected>选择简历</option>
                    <#if (recoveryLogDto.demandList)??>
                        <#list recoveryLogDto.demandList as demand>
                            <option value="${demand.id}">${demand.name}</option>
                        </#list>
                    </#if>
                    </select>
                    <i class="glyphicon glyphicon-chevron-down" style="font-size: 30px;color: grey;"></i>
                </div>
                <input type="hidden" name="demand.name" />
            </div>

            <div class="search_exact">

                <div class="search_exact_div" onclick="$('#obModal').modal()">
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
                <div class="search_exact_div">
                    <span class="search_title">是否确认：</span>
                    <select name="isConfirm" class="select_confirm">
                        <option value="2" >不限</option>
                        <option value="0">未确认</option>
                        <option value="1">已确认</option>
                    </select>
                    <i class="glyphicon glyphicon-chevron-down" style="font-size: 30px"></i>
                </div>
            </div>
        </div>
    </form>


<#if (recoveryLogDto.recoveryLogList)??>
    <div id="log">
        <p class="search_factor_title">康复日志</p>
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
                            </div>
                        </div>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
</#if>

    <div class="modal fade"  id="obModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">
                        筛选康复领域
                    </h4>

                </div>
                <div class="modal-body" id="divContent">
                    <table align="center">
                        <tr>
                        <#list (recoveryLogDto.obs)! as ob>
                            <#if ob_index&lt;3>
                                <td>
                                    <div class="ob_select" align="center" onclick="ob_select(this)">
                                        <img src="${path}/static/img/log/icon.png" width="150px"><br>
                                        <span>${ob}</span>
                                    </div>
                                </td>
                            </#if>
                        </#list>
                        </tr>
                        <tr>
                        <#list (recoveryLogDto.obs)! as ob>
                            <#if ob_index&gt;2>
                                <td>
                                    <div class="ob_select" align="center" onclick="ob_select(this)">
                                        <img src="${path}/static/img/log/icon.png" width="150px"><br>
                                        <span>${ob}</span>
                                    </div>
                                </td>
                            </#if>
                        </#list>
                        </tr>
                    </table>

                    <button  class="btn btn-primary" onclick="selectObs()">确定</button>
                    <button  class="btn btn-default" data-dismiss="modal">关闭</button>

                </div>
            </div>
        </div>
    </div>

</div>


    <input id="calendarMultiday-demo" style="display: none"/>

</body>


</html>