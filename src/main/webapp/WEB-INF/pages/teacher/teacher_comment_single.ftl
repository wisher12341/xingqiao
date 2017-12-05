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
</head>
<body>
<div class="my-panel" style="margin: 0">
    <div class="my-panel-content container line-height-24">
    <#if comm??>
        <div class="row">
            <div class="col-xs-2 no-padding">
                <#if comm.user.headimgurl??>
                    <#if comm.user.headimgurl?starts_with("http")>
                        <img class="headimg" src='${comm.user.headimgurl!""}'/>
                    <#else>
                        <img class="headimg" src='${base}/${comm.user.headimgurl!""}'/>
                    </#if>
                <#else>
                    <img class="headimg" src='${base}/${comm.user.headimgurl!""}'/>
                </#if>
            </div>
            <div class="col-xs-10">
                <div class="user-name">${comm.user.username!""}</div>
                <div class="comment-content">
                    <#if comm.detail?length gt 30>
                        <#assign s=comm.detail>
                        <div class="comment-detail">
                        ${comm.detail?substring(0,30)}……
                        </div>
                        <a onclick="showFullComment('${s}',this)">全文</a>
                        <a onclick="showBriefComment('${s}',this)" style="display: none">收起</a>
                    <#else>
                    ${comm.detail}
                    </#if>
                </div>
                <div class="comment-pics">
                    <#if comm.picurls??>
                        <#assign picList = comm.picurls?split("#")>
                        <div class="img-wrap">
                            <img src="${base}/${picList[0]}">
                            <#if picList?size gt 1>
                                <img src="${base}/${picList[1]}">
                            </#if>
                            <#if picList?size gt 2>
                                <img src="${base}/${picList[2]}">
                            </#if>
                        </div>
                        <#if picList?size gt 3>
                            <div class="img-wrap" style="display: none">
                                <#list picList as pic>
                                    <img src="${base}/${pic}">
                                </#list>
                            </div>
                            <a onclick="showMorePics(this)">查看全部${picList?size}张</a>
                            <a onclick="hideMorePics(this)" style="display: none">隐藏</a>
                        </#if>

                    </#if>
                </div>
                <div class="time">
                ${comm.time}
                </div>
                <div class="comment-btns inline-wrapper">
                    <a class="btn-pill" onclick="reply(${comm.id})"><span class="glyphicon glyphicon-pencil btn-pill-icon-left"></span>回复</a>
                    <a class="btn-pill" onclick="changeCount(0,'${comm.id}',0,this)"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></a>
                    <a class="btn-pill" onclick="changeCount(0,'${comm.id}',1,this)" style="display: none"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></a>
                    <a class="btn-pill" onclick="changeCount(1,'${comm.id}',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报(${comm.report})</a>
                    <p class="btn-pill" style="display: none">已举报</p>
                </div>
            </div>
        </div>

        <div class="sub-comment-list row">
        <#if comm.teacherComment??>
            <div class="row no-padding">
                <div class="col-xs-12">
                    <hr style="margin-bottom: 1rem">
                </div>
                <div class="inline-wrapper col-xs-12">
                    <div class="my-panel-title padding-left-15">治疗师回复</div>
                    <div class="time">${comm.teacherComment.time!""}</div>
                </div>
                <div class="col-xs-12">
                    <hr style="margin: 1rem 0rem">
                </div>
                <div class="col-xs-12" style="padding-left: 2rem;padding-right: 2rem">
                    <div class="comment-content" style="padding-left: 2rem;padding-right: 2rem">
                    <#if comm.teacherComment.detail?length gt 60>
                        <#assign s=comm.teacherComment.detail>
                        <div class="comment-detail">
                        ${comm.teacherComment.detail?substring(0,60)}……
                        </div>
                        <a onclick="showFullComment('${s}',this)">更多</a>
                        <a onclick="showBriefComment('${s}',this)" style="display: none">隐藏</a>
                    <#else>
                    ${comm.teacherComment.detail}
                    </#if>
                    <#--<div class="comment-btns inline-wrapper" style="margin-top: 1rem">-->
                        <#--<div class="btn-pill" onclick="reply(${comm.teacherComment.id})"><span class="glyphicon glyphicon-pencil btn-pill-icon-left"></span>回复</div>-->
                        <#--<div class="btn-pill" onclick="changeCount(0,'${comm.teacherComment.id}',0,this)"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">${comm.teacherComment.good}</span>)</span></div>-->
                        <#--<div class="btn-pill" onclick="changeCount(0,'${comm.teacherComment.id}',1,this)" style="display: none"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">${comm.teacherComment.good}</span>)</span></div>-->
                        <#--<div class="btn-pill" onclick="changeCount(1,'${comm.teacherComment.id}',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报(${comm.teacherComment.report})</div>-->
                        <#--<div class="btn-pill" style="display: none">已举报</div>-->
                    <#--</div>-->
                </div>
                </div>
            </div>
        </#if>
        <div class="row">
            <div class="col-xs-12">
                <hr style="margin-bottom: 1rem">
            </div>
            <div class="inline-wrapper col-xs-12">
                <div class="my-panel-title padding-left-15">评论回复</div>
            </div>
            <div class="col-xs-12">
                <hr style="margin-top: 1rem">
            </div>
        </div>
        <#if comm.commentList??>
            <#if comm.commentList?size gt 0>
                    <#list comm.commentList as subComm>
                        <div class="row padding-left-15">
                            <div class="col-xs-2 no-padding">
                                <div class="inline-wrapper">
                                    <img class="col-xs-3 no-padding" src="${base}/static/img/reply.svg"/>
                                    <#if subComm.user.headimgurl??>
                                        <#if subComm.user.headimgurl?starts_with("http")>
                                            <img class="headimg-round col-xs-7 no-padding" src='${subComm.user.headimgurl!""}'/>
                                        <#else>
                                            <img class="headimg-round col-xs-7 no-padding" src='${base}/${subComm.user.headimgurl!""}'/>
                                        </#if>
                                    <#else>
                                        <img class="headimg-round col-xs-7 no-padding" src='${base}/${subComm.user.headimgurl!""}'/>
                                    </#if>
                                </div>
                            </div>
                            <div class="col-xs-10">
                                <div class="inline-wrapper">
                                    <div class="user-name">${subComm.user.username!""}</div>
                                    <div class="time">${subComm.time!""}</div>
                                </div>

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
                                <#--<div class="comment-btns inline-wrapper">-->
                                <#--<a class="btn-pill" onclick="reply(${subComm.id})">回复</a>-->
                                <#--<a class="btn-pill" onclick="changeCount(0,'${subComm.id}',0,this)"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></a>-->
                                <#--<a class="btn-pill" onclick="changeCount(0,'${subComm.id}',1,this)" style="display: none"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></a>-->
                                <#--<a class="btn-pill" onclick="changeCount(1,'${subComm.id}',0,this)">举报(${comm.report})</a>-->
                                <#--<p class="btn-pill" style="display: none">已举报</p>-->
                                <#--</div>-->
                                </div>
                            </div>
                        </div>
                        <hr>
                    </#list>
                </div>
            <#else>
                <p style="text-align: center">暂无评论</p>
            </#if>
        <#else>
            <p style="text-align: center">暂无评论</p>
        </#if>
    </#if>
    </div>
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
                <input type="hidden" name="tid" value="${teacherId}">
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

</body>
</html>
<script>

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
        ele.previousElementSibling.style.display = "";
        ele.previousElementSibling.previousElementSibling.style.display = "none";
        ele.nextElementSibling.style.display = "";
        ele.style.display = "none";
    }

    function hideMorePics(ele) {
        ele.previousElementSibling.previousElementSibling.previousElementSibling.style.display = "";
        ele.previousElementSibling.previousElementSibling.style.display = "none";
        ele.previousElementSibling.style.display = "";
        ele.style.display = "none";
    }

    function reply(pid) {

        $("#mobile-menu-reply textarea[name='detail']").val("");
//        $("#replyModal input[name='oid']").val(oid);
        $("#mobile-menu-reply input[name='pid']").val(pid);
        $("#mobile-menu-reply").addClass("show-nav-bottom").removeClass("hide-nav-bottom");
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
                    url: '${base}/wx/goodreport/add',
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
                $("#mobile-menu-report").addClass("show-nav-bottom").removeClass("hide-nav-bottom");
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

</script>