<!DOCTYPE html>
<#assign base=request.contextPath />
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0"/>
    <title>治疗师评论</title>
    <script type="text/javascript" src="${base}/static/js/common/jquery-1.12.2.js"></script>

    <script type="text/javascript" src="${base}/static/bootstrap/js/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${base}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${base}/static/css/jcy.css">

    <link rel="stylesheet" href="${base}/static/css/teacher/slider.css">
</head>
<body class="base">
<div class="container no-padding">
<#if teacherCommentList??>
    <#list teacherCommentList as comm>
    <#--<div class="my-panel container line-height-24">-->
        <div class="my-panel row row-wrapper pointable">
            <div class="col-xs-2 no-padding">
                <img class="headimg" src='${base}/${comm.user.headimgurl!""}'/>
            </div>
            <div class="col-xs-10">
                <div onclick="location='${base}/wx/teacher/toTeacherCommentSingle?cid=${comm.id}&tid=${teacherId}'">
                    <div class="user-name">${comm.user.username!""}</div>
                    <div class="comment-content">
                        <#if comm.detail?length gt 60>
                            <#assign s=comm.detail>
                            <div class="comment-detail">
                            ${comm.detail?substring(0,60)}……
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
                        </#if>
                    </div>
                </div>
                <div class="time">
                ${comm.time}
                </div>
                <div class="comment-btns inline-wrapper">
                    <div class="btn-pill" onclick="reply(${comm.id})"><span class="glyphicon glyphicon-pencil btn-pill-icon-left"></span>回复</div>
                    <div class="btn-pill" onclick="changeCount(0,'${comm.id}',0,this)"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                    <div class="btn-pill" onclick="changeCount(0,'${comm.id}',1,this)" style="display: none"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                    <div class="btn-pill" onclick="changeCount(1,'${comm.id}',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报(${comm.report})</div>
                    <div class="btn-pill" style="display: none">已举报</div>
                </div>


            </div>

        </div>
    </#list>
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
                url: '${base}/wx/goodreport/del',
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
            url: '${base}/wx/goodreport/add',
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