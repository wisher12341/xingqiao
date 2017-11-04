<#--用于存储常量、自定义指令-->

<#--项目根路径-->
<#assign path=request.contextPath />

<#macro orders param1>
    <#list param1 as order>
        <div class="line">
            <div class="container"  onclick="order_detail('${order.id}')">
                <div class="row name">
                    <h>${order.product.name}<span class="count">${order.count}</span></h>
                    <span class="price_span">
                                    ￥${order.realPay}
                                </span>
                </div>
                <#--<div class="row servicetime">-->
                    <#--<c:forEach var="time" items="${order.serviceTime.split('#')}">-->
                        <#--<p style="margin-top: -10px!important;">-->
                        <#--${time}-->
                        <#--</p>-->
                    <#--</c:forEach>-->
                <#--</div>-->
                <div class="row serviceaddress" >
                ${order.serviceAddress.address}
                </div>
                <div id="img">
                    <div class="icon-head">
                        <img src="//www.yueguanjia.com/wxpage/deploy/img/tab-orders/waiting-off.png">
                        <p>待服务</p>
                    </div>
                    <div class="icon-head">
                        <img  src="//www.yueguanjia.com/wxpage/deploy/img/tab-orders/line.png">
                        <p style="color: #fff;">待服务</p>
                    </div>
                    <div class="icon-head">
                        <img  src="//www.yueguanjia.com/wxpage/deploy/img/tab-orders/ontheway-off.png">
                        <p>已出发</p>
                    </div>
                    <div class="icon-head">
                        <img  src="//www.yueguanjia.com/wxpage/deploy/img/tab-orders/line.png">
                        <p style="color: #fff;">待服务</p>
                    </div>
                    <div class="icon-head">
                        <img  src="//www.yueguanjia.com/wxpage/deploy/img/tab-orders/done-off.png">
                        <p>已完成</p>
                    </div>
                    <div class="icon-head">
                        <img  src="//www.yueguanjia.com/wxpage/deploy/img/tab-orders/line.png">
                        <p style="color: #fff;">待服务</p>
                    </div>
                    <div class="icon-head">
                        <img  src="//www.yueguanjia.com/wxpage/deploy/img/tab-orders/comment-off.png">
                        <p>已评价</p>
                    </div>
                </div>
                <div class="row timee">
                    <div class="col-xs-5">
                        订单状态：<span style="color:orange;">${order.statusDesc}</span>
                    </div>
                    <div class="col-xs-6 ordertime">
                        下单时间：${order.orderTime.split(" ")[0]}
                    </div>
                </div>
            </div>
        </div>
    </#list>
</#macro>