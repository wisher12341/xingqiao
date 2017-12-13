<#include "../common/const.ftl" />
<html>
<head>
  <title>订单详情</title>
    <#include "../common/head.ftl" />
    <link href="${path}/static/css/order/detail.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/order/detail_teacher.js" type="text/javascript" ></script>
    <link type="text/css" href="${path}/static/css/order/star-rating.css" media="all" rel="stylesheet" />
    <script type="text/javascript" src="${path}/static/js/order/star-rating.js"></script>
</head>
<body>
    <div id="main">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active title_li" ><a href="#order" data-toggle="tab">订单详情</a></li>
            <li class="title_li"><a href="#parent" data-toggle="tab">家长详情</a></li>
            <li class="title_li"><a href="#patient" data-toggle="tab">患者简历</a></li>
            <li class="title_li"><a href="#log" data-toggle="tab">康复计划</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="order">
                <div class="div_0">
                    <p class="ptitle">订单追踪</p>
                    <div id="img" align="center">
                        <div class="icon-head">
                            <img src="${path}/static/img/trace/yuyue${(order.order.statusT>=2 && order.order.statusT!=11 && order.order.statusT!=16)?string('','_no')}.png">
                            <p class="sss">预约</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/order/line${(order.order.statusT>=3 && order.order.statusT!=11 && order.order.statusT!=16)?string('','_no')}.png">
                            <p style="color: #fff;!important;">待服务</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/trace/fuwu${(order.order.statusT>=3 && order.order.statusT!=11 && order.order.statusT!=16)?string('','_no')}.png">
                            <p class="sss">服务</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/order/line${(order.order.statusT==15)?string('','_no')}.png">
                            <p style="color: #fff;!important;">待服务</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/trace/wancheng${(order.order.statusT==15)?string('','_no')}.png" style="width: 92%">
                            <p class="sss">完成</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/order/line${((order.order.statusT==15) && (order.order.comment)?exists)?string('','_no')}.png">
                            <p style="color: #fff;!important;">待服务</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/trace/pingjia${((order.order.statusT==15) && (order.order.comment)?exists)?string('','_no')}.png" style="width: 95%">
                            <p class="sss">评价</p>
                        </div>
                    </div>
                </div>
                <#if order.order.statusT==3>
                    <div class="div_0">
                        <p class="ptitle">订单进度</p>
                        <div class="leftdiv">
                            <h3 class="progressbar-title" style="padding-left:50px;font-size: 40px!important;color: #9d9d9d!important;"><span class="now_cishu">${(order.count)!}</span>/${(order.order.amount)!}</h3>
                            <div class="progress" style="width: 90%;margin: 0 auto;">
                                <div class="progress-bar" style="background:#20b49a;">
                                    <script>
                                        $(".progress-bar").css("width","${order.percent}");
                                    </script>
                                </div>
                            </div>
                            <div class="llend"><p  class="llend">下次服务时间：</p><span class="next_time llend">${(order.nextTime)!}</span></div>
                        </div>
                    </div>
                </#if>
                <div class="div_1">
                    <div>
                        <div class="faline">
                            <p class="ptitle">订单详情</p>
                            <p class="ll">订单号：${(order.order.id)!}</p>
                            <p class="ll">订单状态：${(order.order.statusDesc)!}</p>
                            <p class="llend">下单时间：${(order.order.sTime)!}</p>
                        </div>
                        <div class="faline">
                            <p class="ptitle">服务详情</p>
                            <p class="ll">服务时间：<br>
                                <#list order.order.serverTime?split('#') as time>
                                    <br><span style="margin-left: 20px;line-height: 40px">${time}</span>
                                </#list>
                            </p>
                            <p class="ll">康复项目：${(order.order.recoverOb)!}</p>
                            <p class="ll">上门方式：${(order.order.way)!}</p>
                            <p class="llend">备注：${(order.order.remark)!}</p>
                        </div>
                        <#if order.order.statusT&gt;2>
                            <div class="faline">
                                <p class="ptitle">支付详情：</p>
                                <p class="ll">支付方式：${(order.order.payWay)!}</p>
                                <p class="ll">课程总价：${(order.order.totalpay)!}</p>
                                <p class="ll">实付：${(order.order.realpay)!}</p>
                            </div>
                        </#if>
                    <#if (order.order.comment)??>
                        <div class="faline">
                            <p class="ptitle">订单评论：</p>
                            <table style="border-bottom:3px solid #f5f5f5;width: 100%">
                                <tr>
                                    <td >
                                        <p class="ll">星级：</p>
                                    </td>
                                    <td style="position: relative;right: 19%;">
                                        <input id="input-22a" type="number" class="rating" min=0 max=5 step=1 data-size="lg"  value="${order.order.comment.level}" disabled="disabled">
                                    </td>
                                </tr>
                            </table>
                        <#--<p class="ll">星级：<input id="input-22a" type="number" class="rating" min=0 max=5 step=1 data-size="xs"  value="${order.order.comment.level}" disabled="disabled"></p>-->
                            <p class="ll">展示：${(order.order.comment.isOpen==1)?string('公开','匿名')}</p>
                            <p class="llend" style="color: #4e794f !important;">评论内容：</p>
                            <p class="llend">${(order.order.comment.detail)!}</p>
                            <#if order.order.comment.picUrls??>
                                <p class="llend">
                                    <#list  order.order.comment.picUrls?split("#") as src>
                                        <img src="/${src}" width="160px" height="160px" style="margin-right: 10px;margin-bottom: 10px;">
                                    </#list>
                                </p>
                            </#if>
                            <p class="ll" style="padding-left: 40%">时间：${(order.order.comment.time)!}</p>
                            <#if (order.order.comment.teacherComment)??>
                                <p class="llend" style="color: #4e794f !important;">治疗师回复：</p>
                                <p class="llend">${(order.order.comment.teacherComment.detail)!}</p>
                                <p class="ll" style="padding-left: 40%">时间：${(order.order.comment.teacherComment.time)!}</p>
                            </#if>
                        </div>
                    </#if>
                    </div>

                </div>
            </div>
            <div class="tab-pane fade" id="parent">
                <div class="div_1">
                    <div>
                        <div class="faline">
                            <p class="ll">姓名：${(order.order.parent.realName)!}</p>
                            <p class="llend">所在地：${(order.order.parent.ground)!}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="patient">
                <div class="div_1">
                    <div>
                        <div class="faline">
                            <p class="ll">姓名：${(order.order.demand.name)!}</p>
                            <p class="ll">性别：${((order.order.demand.gender==1)?string("男","女"))!}</p>
                            <p class="ll">出生日期：${(order.order.demand.birthday)!}</p>
                            <p class="ll">诊断报告：${(order.order.demand.disease)!}</p>
                            <p class="ll">病史：${(order.order.demand.diseaseHis)!}</p>
                            <p class="ll">过敏史：${(order.order.demand.allergyHis)!}</p>
                            <p class="llend">备注：${(order.order.demand.remark)!}</p>
                        </div>
                        <div class="faline">
                            <p class="ptitle">康复史</p>
                        <#if (order.order.recoveryHisList)??>
                            <table class="table recoveryHis-table table-striped">
                                <thead>
                                <tr>
                                    <th>历史康复机构</th>
                                    <th>康复起止时间</th>
                                    <th>康复频次(周)</th>
                                    <th>康复形式及康复内容</th>
                                </tr>
                                </thead>

                                <tbody> <#list order.order.recoveryHisList as recoveryHis>
                                <tr>
                                    <td>
                                        <div>
                                            <span>${recoveryHis.name}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <span>${recoveryHis.time}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <span>${recoveryHis.count}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <span>${recoveryHis.detail}</span>
                                        </div>
                                    </td>
                                </tr>

                                </#list>
                                </tbody>
                            </table>
                        <#else>
                            <div style="text-align: center"><p style="color: #1a1a1a">您还没有添加过康复史</p></div>
                        </#if>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="log" style="font-size: 40px">
                <div style="background-color: white;width: 100%; height: 80px;">
                    <div style="float: right; "><input onclick="location.href='${path}/wx/teacherCenter/${order.order.id}/updateLog'" class="btn btn-default"  style="float: right;margin-right: 20px;width: 40%;margin-top: 6px;background-color: #b6a073;color: #fff;font-size: 40px;font-weight: 400;" value="更新"></div>
                </div>
                <div class="track-list" style="width: 100%; border: solid 1px #e8e8e8; margin-bottom: 20px">
                    <ul style="margin-top: 10px" id="logUl">
                        <#if (order.recoveryLogList)??>
                            <#list order.recoveryLogList as log>
                                <li style=" list-style-type: none;">
                                    <div>
                                        <#if log_index==0>
                                            <span class="glyphicon glyphicon-record" style="margin-left: -7px; color: red;font-size: 40px"></span>
                                        <#else>
                                            <span class="glyphicon glyphicon-record" style="margin-left: -7px; color: #e8e8e8;font-size: 40px"></span>
                                        </#if>
                                        <span class="date" style="margin-left: 20px">${log.time}</span>
                                    <span  style="border: 1px solid #dcdcdc;margin-left: 480px;width: 50px;height: 20px; color: #aaa;font-size:80%">
                                        <#if log.confirmStatus==0>
                                            未确认</span>
                                            <#if log.remindStatus==0>
                                                <button   style="border: 0;float: right;margin-right: 20px;width: 50px;height: 20px;margin-top: 0px;background-color: white;color: red;font-size: 12px;font-weight: 400;" onclick="remind(${log.id},this,'${order.order.id}')">提醒</button>
                                            </#if>
                                            <#if log.remindStatus==1>
                                                <span  style="border: 0;float: right;margin-right: 20px;width: 50px;height: 20px;margin-top: 0px;background-color: white;color: red;font-size: 12px;font-weight: 400;">已提醒</span>
                                            </#if>

                                        </#if>
                                        <#if log.confirmStatus==1>已确认</span></#if>
                                        <#if log.confirmStatus==2>逾期确认</span></#if>
                                        <br>
                                        <div class="txt" style="margin-left: -1px;border-left: solid 1px #e8e8e8; padding-left: 26px; padding-bottom: 20px; margin-bottom: 0px">
                                        ${log.content}
                                        </div>
                                    </div>

                                </li>

                            </#list>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>


    </div>

    <div class="foot" align="center">
        <#if order.order.statusT==1>
            <button onclick="location.href='${path}/wx/teacherCenter/order/${order.order.id}/affirm'" style="width: 49.5% !important;">接受</button>
            <button onclick="location.href='${path}/wx/teacherCenter/order/${order.order.id}/reject'" style="width: 49.5% !important;">拒绝</button>
        <#elseif order.order.statusT==3>
            <button onclick="location.href='${path}/wx/teacherCenter/order/${order.order.id}/stop'" style="width: 49.5% !important;">订单终止</button>
            <#if (order.count)?? && (order.count+"")==(order.order.amount)>
                <button onclick="location.href='${path}/wx/teacherCenter/order/${order.order.id}/finish'" style="width: 49.5% !important;">订单完成</button>
            <#else>
                <button style="width: 49.5%;opacity: 0.5 !important;">订单完成</button>
            </#if>
        <#elseif order.order.comment?? && order.order.statusT==15>
            <#if order.order.comment.teacherComment??>
            <#else>
                <button onclick="location.href='${path}/wx/teacherCenter/order/${order.order.id}/${order.order.comment.id}/comment'" style="width: 100% !important;">回复评价</button>
            </#if>
        </#if>
    </div>

    <div class="ts_mask">
        <div class="tishi" align="center">
        </div>
    </div>
</body>
<script>
    $("#input-22a").rating({
        showClear: false
    });
</script>
</html>