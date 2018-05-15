<#--用于自定义指令-->


<#--订单列表-->
<#macro orderlist param1>
    <#list param1 as order>
        <div class="line">
    <#if comment??>
    <div class="container" >
    <#else >
        <#if teacher??>
        <div class="container" onclick=location.href="${path}/wx/teacherCenter/order/${order.id}/detail">
        <#else>
        <div class="container" onclick=location.href="${path}/wx/order/${order.id}/detail">
        </#if>
    </#if>
                <div class="row name">
                    <h>订单号：${(order.id)!}
                        <#--<span class="count">${(order.amount)!}</span>-->
                    </h>
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
                    <#--<#list (order.serverTime?split("#"))! as time>-->
                        <p style="margin-top: -10px!important;">
                            服务时间：${order.serverTime}
                            <#--${(time_index==0)?string("服务时间：","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")}${time?replace("%","-")}-->
                        </p>
                        <p style="margin-top: -10px!important;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共&nbsp;${(order.amount)!}&nbsp;节课
                        </p>
                    <#--</#list>-->

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
        <#if comment??>
        <#else >
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
        </#if>
                <div class="row timee">
                    <#if comment??>
                        <div class="col-xs-9" style="color: #9d9d9d;">
                            下单时间：${(order.sTime?split(" ")[0])!}
                        </div>
                        <div class="col-xs-3" >
                                <input type="button" onclick="location.href='${path}/wx/comment/${order.id}'" class="btn" value="评价">
                        </div>
                    <#else >
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
                    </#if>
                </div>
            </div>

        </div>

    </#list>
</#macro>


<#--评论中心列表-->
<#macro commentlist param1 param2>
    <#if param1?size==0>
        <div class="row" style="margin-top: 30%!important;width: 100%">
            <div class="col-xs-3">
            </div>
            <div class="col-xs-2">
                <img src="/static/img/kong.png" width="150">
            </div>
            <div class="col-xs-6">
                <p style="font-size: 45px;color: dimgrey;font-weight: bold">抱歉</p>
                <p style="font-size: 38px;color: grey;font-weight: bold">您还没有<#if param2=="reply">待回复的</#if>评论</p>
            </div>
        </div>
    <#else >
    <#list param1 as comment>
    <div class="line">
        <div class="container">
        <div class="row name">
            <div class="col-xs-3" style="width: 22%!important;padding-left: 0!important;margin-left: -10px" >
                <img src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" width="150" style="border-radius: 100%">
            </div>
            <div class="col-xs-5" style="margin-top: 40px;margin-left: -20px">
                <span style="font-size: 45px;font-weight: bold;color: dimgrey;">${comment.parent.realName}</span>
            </div>
            <div class="col-xs-4" style="margin-top: 40px;margin-left: 20px">
                <span style="font-size: 40px;color: grey;float: right">${comment.time}</span>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12" style="padding-left: 0!important;">
                <p style="">订单号：${comment.order.id}&nbsp;&nbsp;&nbsp;${comment.demand.name}<span style="font-size: 40px;font-weight: bold;">·</span>${comment.order.recoverOb}<span style="font-size: 40px;font-weight: bold;">·</span>${comment.order.way}</p>
            </div>
        </div>
        <div class="row serviceaddress">
            <input type="number" class="rating input-22a" min=0 max=5 step=1 data-size="lg"  value="${comment.level}" disabled="disabled">
            <p style="color: dimgrey;font-size: 45px">${comment.detail}</p>
                    <div id="pics">
                        <div class="ps" style="display: inline">
            <#if (comment.picUrls)??>
                <#list (comment.picUrls)?split("#") as pic>
                            <div class="picdiv">
                                <img class="addimg"  src="/${pic}">
                            </div>
                </#list>
            </#if>
                        </div>
                    </div>

        </div>
        <div class="row timee" style="${(param2=="reply")?string('border-top: 1px solid #e0e0e0;',"border-bottom: 1px solid #e0e0e0;")}">
            <div class="col-xs-9" style="padding-left: 0!important;">
                <p>点赞${comment.good}次&nbsp;&nbsp;&nbsp;举报${comment.report}次</p>
            </div>
            <div class="col-xs-3" >
                <#if param2=="reply">
                    <input type="button" onclick="location.href='${path}/wx/teacherCenter/order/${comment.order.id}/${comment.id}/comment'" class="btn" value="回复">
                    <#else >
                </#if>
            </div>
        </div>
            <#if param2=="his">
                <div class="row">
                    <p style="color: red;font-size: 40px;margin-top: 20px">我的回复：</p>
                    <p style="color: dimgrey;font-size: 45px">${comment.teacherComment.detail}</p>
                </div>
            <div class="row">
                <div class="col-xs-8">
                </div>
                <div class="col-xs-4">
                    <span style="font-size: 40px;color: grey;">${comment.teacherComment.time}</span>
                </div>
            </div>
            </#if>
    </div>
    </div>
        </#list>
    </#if>
</#macro>