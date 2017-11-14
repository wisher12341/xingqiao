<#include "../order/common/const.ftl" />
<html>
<head>
    <title>康复日志</title>
<#include "../order/common/head.ftl" />
    <link href="${path}/static/css/log/log.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="${path}/static/js/log/log.js"></script>
</head>
<body>
    <form action="${path}/wx/log" method="post">
        <div class="ob">
            <div class="ob_title">
                <div style="display: inline;position: relative;left: 30%;">
                    <i class="glyphicon glyphicon-search" style="font-size: 40px;color: grey"></i>
                    <input type="submit" value="查找" onclick="addName()" class="input_button_search"/>
                </div>
            </div>

         <table class="ob_table">
             <tr>
                 <td rowspan="2" style="background-color: #56c078">
                     <p class="ob_p">筛选<br>康复<br>领域</p>
                 </td>
                 <td>
                     <div class="row" style="margin-top:20px ">
                         <div class="ob_select col-xs-4" align="center" onclick="ob_select(this)">
                             <img src="${path}/static/img/log/icon.png" width="150px"><br>
                             <span>言语</span>
                             <input type="checkbox" name="ob" style="display: none" checked value="言语">
                         </div>
                         <div class="ob_select col-xs-4" align="center" onclick="ob_select(this)">
                             <img src="${path}/static/img/log/icon.png" width="150px"><br>
                             <span>听觉</span>
                             <input type="checkbox" name="ob" style="display: none" checked value="听觉">
                         </div>
                         <div class="ob_select col-xs-4" align="center" onclick="ob_select(this)">
                             <img src="${path}/static/img/log/icon.png" width="150px"><br>
                             <span>认知</span>
                             <input type="checkbox" name="ob" style="display: none" checked value="认知">
                         </div>
                     </div>
                 </td>
             </tr>
             <tr>
                 <td>
                     <div class="row">
                         <div class="ob_select col-xs-4" align="center" onclick="ob_select(this)">
                             <img src="${path}/static/img/log/icon.png" width="150px"><br>
                             <span>情绪行为</span>
                             <input type="checkbox" name="ob" style="display: none" checked value="情绪行为">
                         </div>
                         <div class="ob_select col-xs-4" align="center" onclick="ob_select(this)">
                             <img src="${path}/static/img/log/icon.png" width="150px"><br>
                             <span>运动</span>
                             <input type="checkbox" name="ob" style="display: none" checked value="运动">
                         </div>
                         <div class="ob_select col-xs-4" align="center" onclick="ob_select(this)">
                             <img src="${path}/static/img/log/icon.png" width="150px"><br>
                             <span>心理</span>
                             <input type="checkbox" name="ob" style="display: none" checked value="心理">
                         </div>
                     </div>
                 </td>
             </tr>
         </table>

        </div>


        <div id="search">
            <div class="search_div row">
                <div class="col-xs-3" align="center">
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
                <div class="col-xs-1" style="width: 3.1%">
                    <span style="border-right:solid 1px black"></span>
                </div>
            <#--</div>-->
            <#--<div class="search_div">-->
                <div class="col-xs-3" align="center">
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
                <div class="col-xs-1" style="width: 3.1%">
                    <span style="border-right:solid 1px black"></span>
                </div>
                <input type="hidden" name="demand.name" />
                <div class="col-xs-3" align="center">
                    <input type="button" value="精确查找" onclick="exact()" class="input_button"/>
                    <i class="glyphicon glyphicon-hand-up" style="font-size: 30px;color: grey;"></i>
                </div>
                <#--<div class="col-xs-1" style="width: 3.1%">-->
                    <#--<span style="border-right:solid 1px black"></span>-->
                <#--</div>-->
            </div>
            <div style="display: none" class="search_exact">
                <input type="hidden" name="isExactSearch" value="0">
                <div style="margin: 20px">
                    <span class="search_title">时间段：</span>
                    <input name="startTime" type="text" class="search_time">—
                    <input name="endTime" type="text" class="search_time">
                </div>
                <div style="margin: 20px">
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

    <#if (recoveryLogDto.demand.id)??>
        <div class="search_factor">
            <p class="search_factor_title" style="text-align: center">查找条件</p>
            <table align="center" class="search_factor_table">
                <tr>
                    <td>
                        <span class="search_label_title">治疗师：</span><span class="search_label">${recoveryLogDto.teacher.name}</span>
                    </td>
                    <td>
                        <span class="search_label_title">简历：</span><span class="search_label">${recoveryLogDto.demand.name}</span>
                    </td>
                    <#if (recoveryLogDto.isConfirm)?? && (recoveryLogDto.isExactSearch)?? && recoveryLogDto.isExactSearch==1>
                    <td>
                        <span class="search_label_title">是否确认：</span>
                        <#switch recoveryLogDto.isConfirm>
                            <#case 0>
                                <span class="search_label">未确认</span>
                                <#break>
                            <#case 0>
                                <span class="search_label">已确认</span>
                                <#break>
                            <#case 2>
                                <span class="search_label">不限</span>
                                <#break>
                        </#switch>
                    </td>
                    </#if>
                </tr>
                <tr>
                    <td colspan="3">
                        <span class="search_label_title">康复领域：</span>
                        <#list (recoveryLogDto.ob)! as ob>
                            <span class="search_label">${ob}</span>
                        </#list>
                    </td>
                </tr>
                <#if (recoveryLogDto.startTime)?? && (recoveryLogDto.endTime)?? && recoveryLogDto.startTime!="" && recoveryLogDto.endTime!="">
                    <tr>
                        <td colspan="3">
                            <span class="search_label_title">查询时间段：</span>${recoveryLogDto.startTime}--${recoveryLogDto.endTime}
                        </td>
                    </tr>
                </#if>
            </table>
        </div>
    </#if>

    <div id="log">
        <div class="track-list" style="width: 100%; margin-bottom: 20px">
            <ul style="margin-top: 10px;padding-top: 10px" id="logUl">
                <#if (recoveryLogDto.recoveryLogList)??>
                    <#list recoveryLogDto.recoveryLogList as log>
                        <li style=" list-style-type: none;">
                            <div>
                                <span class="glyphicon glyphicon-record" style="margin-left: -7px; color: #e8e8e8;font-size: 40px"></span>
                                <span class="date" style="margin-left: 20px">${log.time}
                                    <#if recoveryLogDto.teacher.id==0>
                                        ${log.teacherName}（${log.recoverOb}）
                                    </#if>
                                </span>
                            <#--<#if log.confirmStatus==0>-->
                            <#--<input class="btn btn-default" onclick="logConfirm(${log.id},'${order.order.id}')" value="确认" style="float: right;margin-right: 20px;width: 15%;margin-top: 6px;background-color: #b6a073;color: #fff;font-size: 40px;font-weight: 400;">-->
                            <#--<#else>-->
                            <#--<span  style="float: right;margin-right: 20px;width: 15%; color: #aaa;font-size:40px">已确认</span>-->
                            <#--</#if>-->
                                <div class="txt" >
                                    ${log.content}
                                </div>
                            </div>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>
    </div>
</body>


</html>