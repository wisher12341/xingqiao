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
<body class="base">
    <div class="my-panel">
        <div class="org-name-title">${organization.name!"暂无"}</div>
        <div class="my-panel-content offset-5">
            ${organization.province!"暂无"} - ${organization.city!"暂无"} - ${organization.district!"暂无"}
            <br>
            电话：${organization.phone!"暂无"}
            <br>
            地址：${organization.address!"暂无"}
        </div>
    </div>

    <div class="my-panel">
        <div class="my-panel-title">机构简介</div>
        <div class="gray-line"></div>
        <div class="my-panel-content">${organization.abstractOrg!"暂无"}</div>
    </div>

    <div class="my-panel">
        <div class="my-panel-title">课程设置</div>
        <div class="gray-line"></div>
        <div class="my-panel-content">${organization.course!"暂无"}</div>
    </div>

    <div class="my-panel">
        <div class="my-panel-title">服务模式</div>
        <div class="gray-line"></div>
        <div class="my-panel-content">${organization.service!"暂无"}</div>
    </div>

    <div class="my-panel">
        <div class="my-panel-title">硬件设施</div>
        <div class="gray-line"></div>
        <div class="my-panel-content">${organization.hardware!"暂无"}</div>
    </div>

    <div class="my-panel">
        <div class="my-panel-title">师资团队</div>
        <div class="gray-line"></div>
        <div class="my-panel-content">${organization.team!"暂无"}</div>
    </div>

    <div class="my-panel">
        <div class="my-panel-title">联系方式</div>
        <div class="gray-line"></div>
        <div class="my-panel-content">
            电话：${organization.phone!"暂无"}
            <br>
            地址：${organization.address!"暂无"}
        </div>
    </div>

    <div class="my-panel">
        <div class="inline-wrapper">
            <div class="my-panel-title">机构评论 ${organization.organCommentList?size}</div>
        </div>
        <div class="gray-line"></div>
        <div class="my-panel-content container line-height-24">
         <#if organization.organCommentList??>
                <#list organization.organCommentList as comm>
                    <div class="row">
                        <div class="col-xs-2 no-padding">
                            <img class="headimg" src='${base}/${comm.user.headimgurl!""}'/>
                        </div>
                        <div class="col-xs-9">
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
                                <#if comm.picurls??>
                                    <#assign picList = comm.picurls?split("#")>
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
                            <#if comm.organCommentChildList??>
                                <a onclick="showSubComments(this)">显示跟帖</a>
                                <a onclick="hideSubComments(this)" style="display: none">隐藏跟帖</a>
                                <div class="sub-comment-list container" style="display: none">
                                <#list comm.organCommentChildList as subComm>
                                    <div class="dot-line"></div>
                                    <div class="row padding-left-15">
                                        <div class="col-xs-2 no-padding">
                                            <img class="headimg" src='${base}/${subComm.user.headimgurl!""}'/>
                                        </div>
                                        <div class="col-xs-10">
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
    <div class="bottom-single-btn" onclick="location='${base}/wx/organization/toCommentPage?orgId=${organization.id}'">
        <a href="#" class="mobile-nav-taggle" id="mobile-nav-taggle" style="color: #ffffff">
            我要评论</a>
    </div>
    <!--评论跟帖-->
    <div id="mobile-menu-reply" class="mobile-nav mobile-menu-bottom-sm visible-xs visible-sm hide-nav-bottom">
        <div class="container my-slider-container">
            <div class="slider-body" id="divContent">
                <form action="${base}/wx/organization/reply" method="post">
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
                    <input type="hidden" name="oid" value="${organization.id}">
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
                    url: '/goodreport/add',
                    data: {
                        type: g_r,
                        cid: id,
                        flag: 0 //0表示  机构评论   1表示治疗师评论
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
                    flag: 0 //0表示  机构评论   1表示治疗师评论
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
                flag: 0, //0表示  机构评论   1表示治疗师评论
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