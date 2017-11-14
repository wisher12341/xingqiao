<#include "common/const.ftl" />
<html>
<head>
  <title>订单详情</title>
    <#include "common/head.ftl" />
    <link href="${path}/static/css/order/detail.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/order/detail.js" type="text/javascript" ></script>
</head>
<body>
    <div id="main">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active title_li" ><a href="#order" data-toggle="tab">订单详情</a></li>
            <li class="title_li"><a href="#teacher" data-toggle="tab">治疗师详情</a></li>
            <li class="title_li"><a href="#patient" data-toggle="tab">患者简历</a></li>
            <li class="title_li"><a href="#log" data-toggle="tab">康复计划</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="order">
                <div class="div_0">
                    <p class="ptitle">订单创建</p>
                    <div id="img" align="center">
                        <div class="icon-head">
                            <img src="${path}/static/img/order/waiting-off.png">
                            <p class="sss">待服务</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/order/line.png">
                            <p style="color: #fff;!important;">待服务</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/order/ontheway-off.png">
                            <p class="sss">已出发</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/order/line.png">
                            <p style="color: #fff;!important;">待服务</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/order/done-off.png">
                            <p class="sss">已完成</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/order/line.png">
                            <p style="color: #fff;!important;">待服务</p>
                        </div>
                        <div class="icon-head">
                            <img  src="${path}/static/img/order/comment-off.png">
                            <p class="sss">已评价</p>
                        </div>
                    </div>
                </div>
                <#if order.order.statusP==3>
                    <div class="div_0">
                        <p class="ptitle">订单进度</p>
                        <div class="leftdiv">
                            <h3 class="progressbar-title" style="padding-left:50px;font-size: 40px!important;color: #9d9d9d!important;"><span class="now_cishu">${(order.count)!}</span>/${(order.order.amount)!}</h3>
                            <div class="progress" style="width: 90%;margin: 0 auto;">
                                <div class="progress-bar" style="background:#56c078;">
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
                        <#if order.order.statusP&gt;2>
                            <div class="faline">
                                <p class="ptitle">支付详情：</p>
                                <p class="ll">支付方式：${(order.order.payWay)!}</p>
                                <p class="ll">课程总价：${(order.order.totalpay)!}</p>
                                <p class="ll">实付：${(order.order.realpay)!}</p>
                            </div>
                        </#if>
                        <div class="faline">
                            <p class="ptitle">订单追踪</p>
                            <#if (order.order.trace)?? && order.order.trace!=''>
                                <#list order.order.trace?split("#") as t>
                                    <p class="llend">${t?split("@")[0]}</p>
                                    <p class="ll">${t?split("@")[1]}</p>
                                </#list>
                            </#if>
                        </div>
                    </div>

                </div>
            </div>
            <div class="tab-pane fade" id="teacher">
                <div class="div_1">
                    <div>
                        <div class="faline">
                            <p class="ll"><img src="${path}/${order.order.teacher.user.headimgurl}" width="100" onclick="picAdd(this)"></p>
                            <p class="ll">姓名：${(order.order.teacher.name)!}</p>
                            <p class="ll">身份证：${(order.order.teacher.pid)!}</p>
                            <p class="ll">地址：${(order.order.teacher.detailAddress)!}</p>
                            <p class="llend">所属机构：${(order.order.teacher.unit)!}</p>
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
                            <table class="recoveryHis_table">
                                <thead>
                                    <tr>
                                       <th>历史康复机构</th>
                                        <th>康复起止时间</th>
                                        <th>康复频次(周)</th>
                                        <th>康复形式及康复内容</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <#list order.order.recoveryHisList as his>
                                <tr>
                                    <td><span>${his.name}</span></td>
                                    <td><span>${his.time}</span></td>
                                    <td ><span>${his.count}</span></td>
                                    <td><span>${his.detail}</span></td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="log" style="font-size: 40px">
                <div style="background-color: white;width: 100%; height: 80px;">
                    <div style="float: right; "><input class="btn btn-default" value="全部确认" style="float: right;margin-right: 20px;width: 40%;margin-top: 6px;background-color: #b6a073;color: #fff;font-size: 40px;font-weight: 400;" onclick="allLogConfirm(${order.order.id})"></div>
                </div>
                <div class="track-list" style="width: 100%; border: solid 1px #e8e8e8; margin-bottom: 20px">
                    <ul style="margin-top: 10px" id="logUl">
                        <#list order.recoveryLogList as log>
                            <li style=" list-style-type: none;">
                                <div>
                                    <#if log_index==0>
                                        <span class="glyphicon glyphicon-record" style="margin-left: -7px; color: red;font-size: 40px"></span>
                                    <#else>
                                        <span class="glyphicon glyphicon-record" style="margin-left: -7px; color: #e8e8e8;font-size: 40px"></span>
                                    </#if>
                                    <span class="date" style="margin-left: 20px">${log.time}</span>

                                    <#if log.confirmStatus==0>
                                        <input class="btn btn-default" onclick="logConfirm(${log.id},'${order.order.id}')" value="确认" style="float: right;margin-right: 20px;width: 15%;margin-top: 6px;background-color: #b6a073;color: #fff;font-size: 40px;font-weight: 400;">
                                    <#else>
                                        <span  style="float: right;margin-right: 20px;width: 15%; color: #aaa;font-size:40px">已确认</span>
                                    </#if>

                                    <div class="txt" style="margin-left: -1px;border-left: solid 1px #e8e8e8; padding-left: 26px; padding-bottom: 20px; margin-bottom: 0px;font-size: 50px">
                                    ${log.content}
                                    </div>
                                </div>

                            </li>

                        </#list>
                    </ul>
                </div>
            </div>
        </div>


    </div>

    <div class="foot" align="center">
        <#if order.order.statusP==1>
            <button onclick="location.href='${path}/wx/order/${order.order.id}/cancel'" style="width: 90% !important;">取消预约</button>
        <#elseif order.order.statusP==2>
            <button onclick="location.href='${path}/wx/order/${order.order.id}/cancel'" style="width: 45% !important;">取消预约</button>
            <button onclick="location.href='${path}/wx/order/wxpay/${order.order.id}/pay'" style="width: 45% !important;">付款</button>
        <#elseif order.order.statusP==3>
            <button onclick="location.href='${path}/wx/order/${order.order.id}/stop'" style="width: 90% !important;">终止订单</button>
        <#elseif order.order.cid!=0 && order.order.statusP==15>
            <button onclick="location.href='${path}/wx/comment/${order.order.id}/getCommentByOid'" style="width: 90% !important;">查看评价</button>
        <#elseif order.order.cid==0 && order.order.statusP==15>
            <button onclick="location.href='${path}/wx/comment/${order.order.id}'" style="width: 90% !important;">评价</button>
        </#if>
    </div>


    <div class="ts_mask">
        <div class="tishi" align="center">

        </div>
    </div>
</body>
</html>