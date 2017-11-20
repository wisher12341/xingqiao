<!DOCTYPE html>
<#assign base=request.contextPath />
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0"/>
    <title>星桥</title>
    <script type="text/javascript" src="${base}/static/js/common/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="${base}/static/bootstrap/js/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${base}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${base}/static/css/jcy.css">
    <link rel="stylesheet" href="${base}/static/css/teacher/slider.css">
    <link href='${base}/static/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
    <link href='${base}/static/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <script src='${base}/static/fullcalendar/moment.min.js'></script>
    <script src='${base}/static/fullcalendar/fullcalendar.js'></script>
    <style>
        #calendar_month,#calendar_day {
            max-width: 900px;
            margin: 0 auto;
            position: absolute;
            z-index: 10000;
            background-color: white;
            top:4rem;
            padding: 0.5rem 1.6rem 6rem 1.6rem;
            height: 65%;
            transition:all 0.3s ease-in;
            border-radius: 10px;
            line-height: 1.4rem;
        }

        .fc-toolbar.fc-header-toolbar{
            margin-bottom: 0rem;
        }

        .fc-center > h2 {
            font-size: 1.6rem;
            line-height: 3rem;
        }

        .close-time{
            text-align: right;
            padding: 0.8rem;
            font-size: 2rem;
            color: #888888;
        }

        .fc-widget-header {
            padding: 0.6rem 0rem;
        }

        .fc-view-container{
            margin-top: 1rem;
        }


    </style>
</head>
<body class="base">
<div class="container my-panel" style="min-height: 20rem">
    <div class="row" style="height: 100%">
        <div class="col-xs-5 text-center" style="height: 12rem;">
            <img src="${base}/${teacher.headimgurl!''}" onerror='this.src="${base}/static/img/touxiang.svg;this.onerror=null"' class="headimg-lg">
        </div>
        <div class="col-xs-7" style="padding-left: 0rem">
            <div class="org-name-title">${teacher.name!"暂无"}</div>
            <div class="row my-panel-content offset-5">
                <div class="col-xs-12 inline-wrapper" style="justify-content: flex-start">
                    <#if teacher.level??>
                        <#if teacher.level==1>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        <#elseif teacher.level==2>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        <#elseif teacher.level==3>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#elseif teacher.level==4>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#elseif teacher.level==5>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#else>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        </#if>
                    <#else>
                        <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        <img class="level-star" src="${base}/static/img/star-empty.png"/>
                    </#if>
                <#--${teacher.level!"暂无(星级)"}-->
                </div>
                <div class="offset-5 col-xs-12 no-padding-right" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;${teacher.experienceAge!"0"} 年经验</div>
            </div>

            <div class="row my-panel-content offset-5">
                <div class="col-xs-4 no-padding-right" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;实名</div>
                <div class="col-xs-3 no-padding" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;学历</div>
                <div class="col-xs-3 no-padding" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;认证</div>
            </div>
            <div class="my-panel-content offset-5">
                <#--康复经验：${teacher.experienceAge!"0"} 年-->
                <#--<br>-->
                康复项目：${teacher.domain!"暂无"}
                <br>
                康复对象：${teacher.object!"暂无"}
            </div>
        </div>

        <div class="col-xs-12 my-panel-content">
            <hr style="margin-top: 0.8rem; margin-bottom: 0.8rem">
            <div style="color: #000000">康复方式及价格&nbsp(元/时)</div>

        <#if teacher.way??>
            <div class="container no-padding">
                <#assign strs=teacher.way?split("、")>
                <#if strs[0] == "不限">
                    <#if teacher.priceO gt 0>
                        <div class="inline-wrapper">
                            <div>在线授课</div>
                            <div>${teacher.priceO}</div>
                        </div>
                    </#if>
                    <#if teacher.priceS gt 0>
                        <div class="inline-wrapper">
                            <div>学生上门</div>
                            <div>${teacher.priceS}</div>
                            <div>${teacher.sGround}</div>
                        </div>
                    </#if>
                    <#if teacher.priceT gt 0>
                        <div class="row">
                            <div class="col-xs-3">治疗师上门</div>
                            <div class="col-xs-1">${teacher.priceT}</div>
                            <div class="col-xs-5">${teacher.tGround}</div>
                        </div>
                    </#if>
                <#else>
                    <#list strs as str>
                        <div class="row">
                            <div class="col-xs-4 no-padding-right">${str}</div>
                            <#if str=="在线授课" && teacher.priceO gt 0>
                                <div class="col-xs-2 no-padding">${teacher.priceO}</div>
                            <#elseif str=="学生上门" && teacher.priceS gt 0>
                                <div class="col-xs-2 no-padding">${teacher.priceS}</div>
                                <div class="col-xs-6 no-padding">${teacher.sGround}</div>
                            <#elseif str=="治疗师上门" && teacher.priceT gt 0>
                                <div class="col-xs-2 no-padding">${teacher.priceT}</div>
                                <div class="col-xs-6 no-padding">${teacher.tGround}</div>
                            </#if>
                        </div>
                    </#list>
                </#if>
            </div>
        <#else>
            <div class="my-panel-content row">
                <div class="col-xs-12">
                    暂无
                </div>
            </div>
        </#if>
        </div>
    </div>
</div>

<div class="my-panel">
    <div class="my-panel-title">治疗师简介</div>
    <div class="gray-line"></div>
    <div class="my-panel-content">${teacher.abstractTeacher!"暂无"}</div>
</div>

<div class="my-panel">
    <div class="my-panel-title">毕业院校</div>
    <div class="gray-line"></div>
    <#if teacher.school??>
        <div class="container no-padding-left">
            <#assign strs=teacher.school?split("#")>
            <#list strs as str>
                <#assign s=str?split("@")>
                <div class="my-panel-content row">
                    <div class="col-xs-4">
                    ${s[1]!""}
                    </div>
                    <div class="col-xs-8">
                    ${s[0]!""}
                    </div>
                </div>
            </#list>
        </div>
    <#else>
        <div class="my-panel-content row">
            <div class="col-xs-12">
                暂无
            </div>
        </div>
    </#if>
</div>

<div class="my-panel">
    <div class="my-panel-title">康复治疗经历</div>
    <div class="gray-line"></div>
    <#if teacher.recoveryHis??>
        <div class="container">
            <#assign strs=teacher.recoveryHis?split("#")>
            <#list strs as str>
                <#assign s=str?split("@")>
                <div class="my-panel-content row">
                    <div class="col-xs-4">
                        ${s[0]!""}
                    </div>
                    <div class="col-xs-8">
                        ${s[1]!""}
                    </div>
                </div>
            </#list>
        </div>
    <#else>
        <div class="my-panel-content row">
            <div class="col-xs-12">
                暂无
            </div>
        </div>
    </#if>
</div>

<div class="my-panel">
    <div class="my-panel-title">成功案例</div>
    <div class="gray-line"></div>
    <div class="my-panel-content">${teacher.successCase?replace("@","<br>")!"暂无"}</div>
</div>


<div class="my-panel">
    <div class="inline-wrapper">
        <div class="my-panel-title">治疗师评论</div>
    </div>
    <div class="gray-line"></div>
    <div class="my-panel-content container">
    <#if teacher.commentList??>
        <#list teacher.commentList as comm>
            <div class="row">
                <div class="col-xs-2 no-padding">
                    <img class="headimg" src='${base}/${comm.user.headimgurl!""}'/>
                </div>
                <div class="col-xs-10 line-height-24">
                    <div class="user-name">${comm.user.username!""}</div>
                    <div class="comment-content">
                        <#if comm.detail?length gt 60>
                            <#assign s=comm.detail>
                            <div class="comment-detail">
                            ${comm.detail?substring(0,60)}……
                            </div>
                            <a onclick="showFullComment('${s}',this)">更多</a>
                            <a onclick="showBriefComment('${s}',this)" style="display: none">隐藏</a>
                        <#else>
                        ${comm.detail}
                        </#if>
                    </div>
                    <div class="comment-pics">
                        <#if comm.picUrls??>
                            <#assign picList = comm.picUrls?split("#")>
                            <div class="img-wrap">
                                <div class="img-container">
                                    <img src="${base}/${picList[0]}">
                                </div>
                            </div>
                            <#if picList?size gt 1>
                                <a onclick="showMorePics(this)">查看全部${picList?size}张</a>
                                <a onclick="hideMorePics(this)" style="display: none">隐藏</a>
                            </#if>
                            <div class="img-wrap" style="display: none">
                                <#list picList as pic>
                                    <div class="img-container">
                                        <img src="${base}/${pic}">
                                    </div>
                                </#list>
                            </div>
                        </#if>
                    </div>
                    <div class="time">
                        ${comm.time}
                    </div>
                    <div class="comment-btns inline-wrapper">
                        <a onclick="reply(${comm.id})">回复</a>
                        <a onclick="changeCount(0,'${comm.id}',0,this)"><span>赞（<span class="count">${comm.good}</span>）</span><span class="glyphicon glyphicon-heart-empty"></span></a>
                        <a onclick="changeCount(0,'${comm.id}',1,this)" style="display: none"><span>赞（<span class="count">${comm.good}</span>）</span><span class="glyphicon glyphicon-heart"></span></a>
                        <a onclick="changeCount(1,'${comm.id}',0,this)">举报(${comm.report})</a>
                        <p style="display: none">已举报</p>
                    </div>
                    <#if comm.teacherComment??>
                        <div class="sub-comment-list container">
                            <hr class="margin-5">
                            <div class="my-panel-title">治疗师回复</div>
                            <hr class="margin-5">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="user-name">${teacher.name!""}</div>
                                    <div class="comment-content">
                                        <#if comm.teacherComment.detail?length gt 60>
                                            <#assign s=comm.teacherComment.detail>
                                            <div class="comment-detail">
                                            ${subComm.detail?substring(0,60)}……
                                            </div>
                                            <a onclick="showFullComment('${s}',this)">更多</a>
                                            <a onclick="showBriefComment('${s}',this)" style="display: none">隐藏</a>
                                        <#else>
                                        ${comm.teacherComment.detail}
                                        </#if>
                                        <div class="time">${comm.teacherComment.time}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <#else>
                    </#if>
                    <#if comm.commentList?? && comm.commentList?size gt 0>
                        <hr class="margin-5">
                        <a onclick="showSubComments(this)">显示跟帖</a>
                        <a onclick="hideSubComments(this)" style="display: none">隐藏跟帖</a>
                        <div class="sub-comment-list container" style="display: none">
                            <hr class="margin-5">
                            <div class="my-panel-title">评论回复</div>
                            <hr class="margin-5">
                            <#list comm.commentList as subComm>
                                <div class="row padding-left-15">
                                    <div class="col-xs-2 no-padding">
                                        <img class="headimg" src='${base}/${subComm.user.headimgurl!""}'/>
                                    </div>
                                    <div class="col-xs-9">
                                        <div class="user-name">${subComm.user.username!""}</div>
                                        <div class="comment-content">
                                            <#if subComm.detail?length gt 60>
                                                <#assign s=subComm.detail>
                                                <div class="comment-detail">
                                                ${subComm.detail?substring(0,60)}……
                                                </div>
                                                <a onclick="showFullComment('${s}',this)">更多</a>
                                                <a onclick="showBriefComment('${s}',this)" style="display: none">隐藏</a>
                                            <#else>
                                            ${subComm.detail}
                                            </#if>
                                            <div class="time">${subComm.time}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dot-line"></div>
                            </#list>
                        </div>

                    </#if>

                </div>
            </div>
            <hr style="margin: 1.4rem -1.4rem;">
        </#list>
    </#if>
    </div>
</div>
<!-- 预约 -->
<div>
    <div class="bottom-single-btn" onclick="makeOrder()">
        <a href="#" class="mobile-nav-taggle" id="mobile-nav-taggle" style="color: #ffffff">
            立即预约</a>
    </div>
    <div id="mobile-menu-order" class="mobile-nav mobile-menu-bottom visible-xs visible-sm hide-nav-bottom">
        <div class="container my-slider-container">
            <div class="slider-header">
                <button type="button" class="close mobile-close-taggle">
                    &times;
                </button>

                <div id="myModalLabel">
                    预约
                </div>
            </div>
            <hr style="margin-top: 0rem; margin-bottom: 1.2rem">
            <div class="slider-body" id="divContent">
                <div class="form-group" style="height: 18.5rem; overflow-y: scroll">
                    <div class="inline-wrapper" style="justify-content: flex-start">
                        上门方式：<select id="waySelect"></select>
                    </div>
                    <div class="offset-10 inline-wrapper" style="justify-content: flex-start">
                        康复项目： <select id="domainSelect"></select>
                    </div>
                    <div id="time_div" class="offset-10 inline-wrapper" style="justify-content: flex-start">
                        服务时间：<input id="serviceTime" class="serviceTime" type="text" onclick="selectTime(this)">
                    </div>
                    <div class="offset-10" style="justify-content: flex-start">
                        备    注：<br><input id="remark" style="margin-top:0.2rem;width:99%;min-height: 4rem" type="text">
                    </div>
                    <div class="offset-10 inline-wrapper" style="justify-content: flex-start">
                        需求简历：<select id="demandSelect"></select>
                    </div>
                    <div class="offset-10 inline-wrapper" style="justify-content: flex-start">
                        课程数量：
                        <div>
                            <button class="amount_button" onclick="subtract__fuction()">-</button>
                            <span id="countSpan" >1</span>
                            <button class="amount_button" onclick="add_function()">+</button>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
            <div class="bottom-multiple-btn inline-wrapper">
                <div style="padding-left: 5%">
                    总价：<span id="sumSpan"></span>元
                </div>
                <button class="bottom-btn-item" style="width: 30%" onclick="yuYue_fucntion()">
                    确认
                </button>
            </div>
        </div>
    </div>
</div>

<div class="mask" id="mask" style="z-index:10000;display: none"></div>
<div id="calendar_month" class="hide-nav-top"></div>
<div id="calendar_day" class="hide-nav-top"></div>

<!-- 模态框（Modal） 未完成个人资料-->
<div class="modal fade"  id="noInf_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>

                <h4 class="modal-title" id="myModalLabel">
                    未完成个人资料
                </h4>

            </div>
            <div class="modal-body" id="divContent">

                <p>您未完成个人资料，请前往完成</p>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <div>
                    <a href="${base}/center#/parentCenter/info">去完成</a>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!--评论跟帖-->
<div id="mobile-menu-reply" class="mobile-nav mobile-menu-bottom-sm visible-xs visible-sm hide-nav-bottom">
    <div class="container my-slider-container">
        <div class="slider-body" id="divContent">
            <form action="${base}/wx/teacher/comment" method="post">
                <div class="row offset-10">
                    <div class="col-xs-3 col-md-3">
                        <input style="display: inline;font-size: 10px;" type="radio" name="isOpen" id="open" checked value="1">公开<br>
                    </div>
                    <div class="col-xs-3 col-md-3">
                        <input style="display: inline;" type="radio" name="isOpen"  id="anonymi" value="0">匿名<br>
                    </div>
                    <div class="col-xs-4 col-md-4"></div>
                    <div class="col-xs-2 col-md-2">
                        <button type="button" class="close mobile-close-taggle">
                            &times;
                        </button>
                    </div>
                </div>
                <div class="row text-center">
                    <textarea class="my-textarea" style="height: 10rem;" placeholder="回复评论" name="detail"></textarea>
                </div>
                <input type="hidden" name="pid" >
                <input type="hidden" name="tid" value="${teacher.id}">
                <input type="hidden" name="type" value="0">
                <input type="submit" class="bottom-single-btn" style="border: none" value="回复">
            </form>
        </div>

    </div>
</div>
<!--举报-->
<div id="mobile-menu-report" class="mobile-nav mobile-menu-bottom-sm visible-xs visible-sm hide-nav-bottom">
    <div class="container my-slider-container">
        <div class="slider-body" id="divContent">
            <div>
                <div class="row offset-10">
                    <div class="col-xs-3 col-md-3">
                        <input style="display: inline;font-size: 10px;" type="radio" name="isOpen" id="open" checked value="1">公开<br>
                    </div>
                    <div class="col-xs-3 col-md-3">
                        <input style="display: inline;" type="radio" name="isOpen"  id="anonymi" value="0">匿名<br>
                    </div>
                    <div class="col-xs-4 col-md-4"></div>
                    <div class="col-xs-2 col-md-2">
                        <button type="button" class="close mobile-close-taggle">
                            &times;
                        </button>
                    </div>
                </div>
                <div class="row text-center">
                    <textarea class="my-textarea" style="height: 10rem;" placeholder="举报理由" name="reason"></textarea>
                </div>
                <input type="hidden" name="cid" >
                <button class="bottom-single-btn" style="border: none; background-color: #ff0000" onclick="report()">
                    举报
                </button>
            </div>
        </div>

    </div>
</div>

<!-- modal -->
</body>
</html>
<script>

    $(".mobile-nav-taggle").click(function () {
        var mobileMenu = $(this).parent().next(".mobile-menu-bottom");//上拉框是下一个节点
        if (mobileMenu.hasClass("hide-nav-bottom")) {
            setTimeout(function () {
                mobileMenu.addClass("show-nav-bottom").removeClass("hide-nav-bottom");
            }, 100)
        }
        else {
            setTimeout(function (){
                mobileMenu.addClass("hide-nav-bottom").removeClass("show-nav-bottom");
            }, 100)
        }
    });

    $(".mobile-close-taggle").click(function () {
        var mobileMenu = $(this).parents(".mobile-nav");
        if (mobileMenu.hasClass("hide-nav-bottom")) {
            setTimeout(function () {
                mobileMenu.addClass("show-nav-bottom").removeClass("hide-nav-bottom");
            }, 100)
        }
        else {
            setTimeout(function (){
                mobileMenu.addClass("hide-nav-bottom").removeClass("show-nav-bottom");
            }, 100)
        }
    });

    function showFullComment(str,ele) {
        ele.previousElementSibling.innerText = str;
        ele.nextElementSibling.style.display = "";
        ele.style.display = "none";
    }

    function showBriefComment(str,ele) {
        ele.previousElementSibling.previousElementSibling.innerText = str.substr(0,60) + "……";
        ele.previousElementSibling.style.display = "";
        ele.style.display = "none";
    }

    function showSubComments(ele) {
        ele.nextElementSibling.nextElementSibling.style.display = "";
        ele.nextElementSibling.style.display = "";
        ele.style.display = "none";
    }

    function hideSubComments(ele) {
        ele.previousElementSibling.style.display = "";
        ele.nextElementSibling.style.display = "none";
        ele.style.display = "none";
    }

    function showMorePics(ele) {
        ele.previousElementSibling.style.display = "none";
        ele.nextElementSibling.nextElementSibling.style.display = "";
        ele.nextElementSibling.style.display = "";
        ele.style.display = "none";
    }

    function hideMorePics(ele) {
        ele.previousElementSibling.previousElementSibling.style.display = "";
        ele.previousElementSibling.style.display = "";
        ele.nextElementSibling.style.display = "none";
        ele.style.display = "none";
    }

    function reply(pid) {

        $("#mobile-menu-reply textarea[name='detail']").val("");
//        $("#replyModal input[name='oid']").val(oid);
        $("#mobile-menu-reply input[name='pid']").val(pid);
        var mobileMenu = $("#mobile-menu-reply");
        if (mobileMenu.hasClass("hide-nav-bottom")) {
            setTimeout(function () {
                mobileMenu.addClass("show-nav-bottom").removeClass("hide-nav-bottom");
            }, 100)
        }
        else {
            setTimeout(function (){
                mobileMenu.addClass("hide-nav-bottom").removeClass("show-nav-bottom");
            }, 100)
        }
    }


    function addFn(){
        for(var i=0;i<ALi.length;i++){
            ALi[i].getElementsByTagName('input')[0].index=i;
            ALi[i].getElementsByTagName('span')[0].index=i;
            // 文件域改变后执行
            ALi[i].getElementsByTagName('input')[0].onchange=function(){
                ALi[this.index].getElementsByTagName('span')[0].style.display='block'; //删除按钮显示
                var oImg = document.createElement('img'); // 创建img元素
                ALi[this.index].getElementsByTagName('span')[0].appendChild(oImg);
                oImg.src=getFileUrl(this);  //地址增加

                setTimeout(function(){  //图片高度居中
                    oImg.style.marginTop=-oImg.offsetHeight/2+'px';
                }, 100);
            };
            // 删除按钮事件
            ALi[i].getElementsByTagName('span')[0].onclick=function(){
                ALi[this.index].innerHTML='<input type="file" class="upfile" name="pics"><span></span>';
                addFn();
            };
        };

    }

    var o;//用于存储当前被举报的 评论的 button
    //    g_r： 0赞  1举报      id:评论Id     type： 0增加点赞、举报   1取消点赞
    function changeCount(g_r,id,type,obj){

        if(type==0){
            //增加点赞、举报
            if(g_r==0) {
                //点赞
                $.ajax({
                    method: 'POST',
                    url: '/wx/goodreport/add',
                    data: {
                        type: g_r,
                        cid: id,
                        flag: 1 //0表示  机构评论   1表示治疗师评论
                    },
                    success: function (data) {
                        var count = $(obj).find(".count").html();
                        count = parseInt(count) + 1;
                        $(obj).find(".count").html(count);
                        $(obj).find(".glyphicon").removeClass("glyphicon-heart-empty").addClass("glyphicon-heart");
                        $(obj).attr("onclick", "changeCount(0," + id + ",1,this)");
                    }
                });
            }else{
                //举报
                $("#mobile-menu-report textarea[name='reason']").val("");
                $("#mobile-menu-report input[name='cid']").val(id);
                $("#mobile-menu-report").addClass("show-nav-bottom").removeClass("hide-nav-bottom");;
                o=obj;
            }
        }else{
            //取消点赞
            $.ajax({
                method: 'POST',
                url: '/wx/goodreport/del',
                data: {
                    cid: id,
                    flag: 1 //0表示  机构评论   1表示治疗师评论
                },
                success: function (data) {
                    var count = $(obj).find(".count").html();
                    count = parseInt(count) - 1;
                    $(obj).find(".count").html(count);
                    $(obj).find(".glyphicon").removeClass("glyphicon-heart").addClass("glyphicon-heart-empty");
                    $(obj).attr("onclick", "changeCount(0," + id + ",0,this)");
                }
            });
        }
    }

    function report() {
        $.ajax({
            method: 'POST',
            url: '/wx/goodreport/add',
            data: {
                type: 1,
                cid: $("input[name='cid']").val(),
                flag: 1, //0表示  机构评论   1表示治疗师评论
                reason:$("textarea[name='reason']").val()
            },
            success: function (data) {
                $(o).html("已举报");
                $(o).attr("onclick","");
                $("#mobile-menu-report").addClass("hide-nav-bottom").removeClass("show-nav-bottom");
            }
        });
    }

    function makeOrder() {
        $.ajax({
            method: 'POST',
            url: '${base}/wx/parentCenter/isexisted',
            data: {
                'teacherId':getCookie("teacherId")
            },
            success:function (data, status, headers, config) {
                if (data.success == true) {
                    //'已完成个人资料'-->预约,分为第一次预约和第二次购买。
                    var domains ="${teacher.domain}".split("、");
                    if(domains[0]=='不限') {
                        domains = ['言语', '听觉', '认知', '情绪行为', '运动', '心理'];
                    }
                    $('#domainSelect').html("");
                    $('#domainSelect').append($("<option></option>"));
                    for(var i=0;i<domains.length;i++){
                        var $option=$('<option value="'+domains[i]+'">'+domains[i]+'</option>');
                        $('#domainSelect').append($option);
                    }
                    var ways = "${teacher.way}".split("、");
                    $('#waySelect').html("");
                    $('#waySelect').append($("<option></option>"));
                    if(ways[0]=='不限') {
                        ways = ['治疗师上门', '学生上门', '在线授课'];
                    }
                    for(var i=0;i<ways.length;i++){
                        var $option=$('<option value="'+ways[i]+'">'+ways[i]+'</option>');
                        $('#waySelect').append($option);
                    }

                    var demands = data.data;
                    $("#demandSelect").html("");
                    for(var i=0;i<demands.length;i++){
                        var $option=$('<option value="'+demands[i].id+'#'+demands[i].first+'">'+demands[i].name+'</option>');
                        $('#demandSelect').append($option);
                    }
                    var isFirst=$("#demandSelect").val().split("#")[1];
                    if(isFirst=="yes"){
                        //该简历 第一次交易
                        $(".amount_button").attr("disabled", true);
                    }else{
                        $(".amount_button").attr("disabled", false);
                    }
                } else {
                    $('#noInf_Modal').modal();
                }
            }
        });
    }

    $('#demandSelect').change(function () {
        var isFirst=$(this).val().split("#")[1];
        if(isFirst=="yes"){
            //该简历 第一次交易
            $(".amount_button").attr("disabled", true);
        }else{
            $(".amount_button").attr("disabled", false);
        }

    });

    $('#waySelect').change(function () {
        var val=$(this).val();
        if(val=="治疗师上门"){
            $("#sumSpan").html(parseInt("${teacher.priceT}")*parseInt($("#countSpan").html()));
        }else if(val=="学生上门"){
            $("#sumSpan").html(parseInt("${teacher.priceS}")*parseInt($("#countSpan").html()));
        }else if(val=="在线授课"){
            $("#sumSpan").html(parseInt("${teacher.priceO}")*parseInt($("#countSpan").html()));
        }else{
            $("#sumSpan").html("0");
        }

    });


    function yuYue_fucntion(){
        var isFirst=$(".amount_button:disabled").size();
        if(isFirst>0){
            isFirst=1;
        }
        $.ajax({
            method: 'POST',
            url: '${base}/wx/order/submit',
            data: {
                'teacher.id': '${teacher.id}',
                'teacher.name':'${teacher.name}',
                'demandId':$('#demandSelect').val().split("#")[0],
                'way':$('#waySelect').val(),
                'recoverOb':$('#domainSelect').val().split("#")[0],
                'serverTime':$('#serviceTime').val(),
                'remark':$('#remark').val(),
                'totalpay':$('#sumSpan').html(),
                'amount':$('#countSpan').html(),
                'isFirst':isFirst
            },
            success:function (data, status, headers, config) {
                if (data.success==true) {
                    //alert(data['data']['order_id'])
//                    setCookie('order_id',data.data,1);//小时
//                    ipCookie('order_id', data['data']['order_id'], {path: '/', expires: 14});
                    document.location = '${base}/wx/order/'+data.data+'/success';
                } else{
                    alert('发生错误');
                }
            }
        });

    }

    function subtract__fuction() {
        if($('#countSpan').html()!=1) {
            $('#countSpan').html(parseInt($('#countSpan').html()) - 1);
            $('#sumSpan').html(parseInt($('#countSpan').html()*(parseInt($("#sumSpan").html())/(parseInt($('#countSpan').html())+1))));
        }
    }

    function add_function() {
        $('#countSpan').html(parseInt($('#countSpan').html()) + 1);
        $('#sumSpan').html(parseInt($('#countSpan').html()*(parseInt($("#sumSpan").html()/($('#countSpan').html()-1)))));

    }

    function getCookie(name) {
        var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");

        if(arr=document.cookie.match(reg)) {
            return unescape(arr[2]);
        }
        else {
            return null;
        }
    }

    function selectTime(obj) {
        obj_var=obj;
        $("#mask").show();
        if( $("#calendar_month").html().trim()!=""){
            $("body").css("overflow-y","hidden");
            $("#calendar_month").addClass("show-nav-top").removeClass("hide-nav-top");
            return;
        }
        $.ajax({
            type: "GET",
            url: "${base}/wx/teacher/${teacher.id}/orderTime/month",
            dataType: "json",
            success: function (data) {
                var events=[];
                for(var i=0;i<data.data.length;i++){
                    var time = {start:data.data[i],title:"可预约",className:"schedule_title"};
                    events.push(time);
                }
                $('#calendar_month').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month'
                    },
                    navLinks: true, // can click day/week names to navigate views
                    weekNumbers: true,
                    weekNumbersWithinDays: true,
                    weekNumberCalculation: 'ISO',
                    eventLimit: true, // allow "more" link when too many events
                    events: events,
                    monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                    monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                    dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
                    dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
                    today: ["今天"],
                    eventClick : function( event ){
                        var date=event.start.toString();
//                        alert(date);
                        $.ajax({
                            type: "POST",
                            url: "${base}/wx/teacher/${teacher.id}/orderTime/day",
                            dataType: "json",
                            data:{
                                date:date
                            },
                            success: function (data) {
                                $("body").children("#calendar_day").remove();
                                $("body").append($("<div id='calendar_day' class='show-nav-top'></div>"));
                                var events_day=[];
                                var defaultDate;
                                for(var i=0;i<data.data.start.length;i++){
                                    var time = {start:data.data.start[i],title:data.data.title[i],end:data.data.end[i],className:data.data.className[i]};
                                    events_day.push(time);
                                    if(0==i){
                                        defaultDate=data.data.start[i].split("T")[0];
                                    }
                                }
//                                alert(defaultDate);

                                $('#calendar_day').fullCalendar({
                                    header: {
                                        left: 'prev,next today',
                                        center: 'title',
                                        right: 'agendaDay'
                                    },
                                    minTime:"07:00:00",
                                    maxTime:"21:00:00",
                                    navLinks: true, // can click day/week names to navigate views
                                    weekNumbers: true,
                                    defaultDate: defaultDate,
                                    defaultView:"agendaDay",
                                    weekNumbersWithinDays: true,
                                    weekNumberCalculation: 'ISO',
                                    eventLimit: true, // allow "more" link when too many events
                                    events: events_day,
                                    monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                                    monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                                    dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
                                    dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
                                    today: ["今天"],
                                    eventClick: function (event) {
                                        if(event.title=="可预约"){
                                            $.ajax({
                                                type: "POST",
                                                url: "${base}/wx/teacher/orderTime",
                                                dataType: "json",
                                                data:{
                                                    start:event.start.toString(),
                                                    end:event.end.toString()
                                                },
                                                success: function (data) {
                                                    $(obj_var).val(data.data);
                                                    $("#calendar_day").addClass("hide-nav-top").removeClass("show-nav-top");
                                                    $("#mask").hide();
                                                }});
                                        }
                                    }

                                });

                                $("#calendar_month").addClass("hide-nav-top").removeClass("show-nav-top");
                                if (!$($("#calendar_day").children("div").get(0)).hasClass("close-time")) {
                                    $("#calendar_day").prepend('<div class="close-time">×</div>');
                                    $("#calendar_day > .close-time").bind("click", function () {
                                        $("#calendar_day").addClass("hide-nav-top").removeClass("show-nav-top");
                                        $("#mask").hide();
                                        $("body").css("overflow-y","scroll");
                                    });
                                }
//                                $("#calendar_day").children(".fc-header-toolbar").children(".fc-right").css("float","left");
//                                var ele = $("#calendar_day").children(".fc-header-toolbar").children(".fc-center");
//                                $("#calendar_day").children(".fc-header-toolbar").after(ele);
//                                $("#calendar_day").children(".fc-header-toolbar").remove(".fc-center");
                                $("body").css("overflow-y","hidden");
                                $("#calendar_day").addClass("show-nav-top").removeClass("hide-nav-top");
                            }
                        });
                    }
                });
                if (!$($("#calendar_month").children("div").get(0)).hasClass("close-time")) {
                    $("#calendar_month").prepend('<div class="close-time">×</div>');
                    $("#calendar_month > .close-time").bind("click",function () {
                        $("#calendar_month").addClass("hide-nav-top").removeClass("show-nav-top");
                        $("#mask").hide();
                        $("body").css("overflow-y","scroll");
                    });
                }
//                $("#calendar_month").children(".fc-header-toolbar").children(".fc-right").css("float","left");
//                var ele = $("#calendar_month").children(".fc-header-toolbar").children(".fc-center");
//                $("#calendar_month").children(".fc-header-toolbar").after(ele);
//                $("#calendar_month").children(".fc-header-toolbar").remove(".fc-center");
                $("body").css("overflow-y","hidden");
                $("#calendar_month").addClass("show-nav-top").removeClass("hide-nav-top");
            }
        });
    }

    function hideTime () {
        $(this).parents("show-nav-top").addClass("hide-nav-top").removeClass("show-nav-top");
        $("#mask").hide();
        $("body").css("overflow-y","scroll");
    }



</script>