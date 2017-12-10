<#--用于自定义指令-->


<#--订单列表-->
<#macro orderlist param1>
    <#list param1 as order>
        <div class="line">
            <#if teacher??>
            <div class="container" onclick=location.href="${path}/wx/teacherCenter/order/${order.id}/detail">
            <#else>
            <div class="container" onclick=location.href="${path}/wx/order/${order.id}/detail">
            </#if>
                <div class="row name">
                    <h>订单号：${(order.id)!}<span class="count">${(order.amount)!}</span></h>
                    <span class="price_span">
                        <#if ((order.statusP)?? && order.statusP<3 )||((order.statusT)?? && order.statusT<3 )>
                            总价：￥${(order.totalpay)!}
                        <#else>
                            实付：￥${(order.realpay)!}
                        </#if>
                    </span>
                </div>
                <div class="row servicetime">
                    <#if order.isFirst==1>
                        <span class="firstOrder">首次预约</span>
                    </#if>
                    <#list (order.serverTime?split("#"))! as time>
                        <p style="margin-top: -10px!important;">
                            ${(time_index==0)?string("服务时间：","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")}${time?replace("%","-")}
                        </p>
                    </#list>
                </div>
                <div class="row serviceaddress">
                    <#if teacher??>
                        <p>客户：${order.pname}</p>
                    <#else>
                        <p>治疗师：${order.teacher.name}</p>
                    </#if>
                    <p>康复项目：${(order.recoverOb)!}</p>
                    <p>上门方式：${(order.way)!}</p>
                </div>
        <div id="img">
            <div class="icon-head">
                <img src="${path}/static/img/trace/yuyue${(order.statusP>=2 && order.statusP!=11 && order.statusP!=16)?string('','_no')}.png">
                <p class="sss">预约</p>
            </div>
            <div class="icon-head">
                <img  src="${path}/static/img/order/line${(order.statusP>=3 && order.statusP!=11 && order.statusP!=16)?string('','_no')}.png">
                <p style="color: #fff;!important;">待服务</p>
            </div>
            <div class="icon-head">
                <img  src="${path}/static/img/trace/fuwu${(order.statusP>=3 && order.statusP!=11 && order.statusP!=16)?string('','_no')}.png">
                <p class="sss">服务</p>
            </div>
            <div class="icon-head">
                <img  src="${path}/static/img/order/line${(order.statusP==15)?string('','_no')}.png">
                <p style="color: #fff;!important;">待服务</p>
            </div>
            <div class="icon-head">
                <img  src="${path}/static/img/trace/wancheng${(order.statusP==15)?string('','_no')}.png" style="width: 92%">
                <p class="sss">完成</p>
            </div>
            <div class="icon-head">
                <img  src="${path}/static/img/order/line${((order.statusP==15) && (order.cid!=0))?string('','_no')}.png">
                <p style="color: #fff;!important;">待服务</p>
            </div>
            <div class="icon-head">
                <img  src="${path}/static/img/trace/pingjia${((order.statusP==15) && (order.cid!=0))?string('','_no')}.png" style="width: 95%">
                <p class="sss">评价</p>
            </div>
        </div>
                <div class="row timee">
                    <div class="col-xs-6" style="width: 55% !important;">
                        状态：<span style="color:orange;">
                    <#if order.statusDesc?? &&(order.statusDesc)=='完成'>
                        <#if order.cid==0>
                            待评价
                        <#else>
                            完成
                        </#if>
                    <#else>
                        ${(order.statusDesc)!}
                    </#if>
                    </span>
                    </div>
                    <div class="col-xs-5 ordertime" style="width: 45% !important;">
                        下单时间：${(order.sTime?split(" ")[0])!}
                    </div>
                </div>
            </div>
        </div>
    </#list>
</#macro>
