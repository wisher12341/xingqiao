<!DOCTYPE html>
<#assign base=request.contextPath />
<#assign good=usergoodreport.orgCommentGood>
<#assign report=usergoodreport.orgCommentReport>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>
    <title>机构评论</title>
    <script type="text/javascript" src="${base}/static/js/common/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="${base}/static/bootstrap/js/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${base}/static/js/teacher/mescroll.min.js"></script>

    <link rel="stylesheet" href="${base}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${base}/static/css/jcy.css">

    <link rel="stylesheet" href="${base}/static/css/teacher/slider.css">
    <link rel="stylesheet" href="${base}/static/css/teacher/mescroll.min.css">
</head>
<body class="base">
<div class="container no-padding mescroll" id="mescroll" style="height: 1100px">
    <div class="mescroll-bounce">
        <ul id="dataList" class="data-list">
        </ul>
    </div>

    <#--<#if organCommentList??>-->
        <#--<#list organCommentList as comm>-->
        <#--&lt;#&ndash;<div class="my-panel container line-height-24">&ndash;&gt;-->
            <#--<div class="my-panel row row-wrapper pointable">-->
                <#--<div class="col-xs-2 no-padding">-->
                    <#--<img class="headimg" src='${base}/${comm.user.headimgurl!""}'/>-->
                <#--</div>-->
                <#--<div class="col-xs-10">-->
                <#--<div onclick="location='${base}/wx/organization/toOrganCommentSingle?cid=${comm.id}'">-->
                    <#--<div class="user-name">${comm.user.username!""}</div>-->
                    <#--<div class="comment-content">-->
                        <#--<#if comm.detail?length gt 60>-->
                            <#--<#assign s=comm.detail>-->
                            <#--<div class="comment-detail">-->
                            <#--${comm.detail?substring(0,60)}……-->
                            <#--</div>-->
                            <#--<a onclick="showFullComment('${s}',this)">全文</a>-->
                            <#--<a onclick="showBriefComment('${s}',this)" style="display: none">收起</a>-->
                        <#--<#else>-->
                        <#--${comm.detail}-->
                        <#--</#if>-->
                    <#--</div>-->
                    <#--<div class="comment-pics">-->
                        <#--<#if comm.picurls??>-->
                            <#--<#assign picList = comm.picurls?split("#")>-->
                            <#--<div class="img-wrap">-->
                                <#--<img src="${base}/${picList[0]}">-->
                                <#--<#if picList?size gt 1>-->
                                    <#--<img src="${base}/${picList[1]}">-->
                                <#--</#if>-->
                                <#--<#if picList?size gt 2>-->
                                    <#--<img src="${base}/${picList[2]}">-->
                                <#--</#if>-->
                            <#--</div>-->
                        <#--</#if>-->
                    <#--</div>-->
                <#--</div>-->
                    <#--<div class="time">-->
                    <#--${comm.time}-->
                    <#--</div>-->
                    <#--<div class="comment-btns inline-wrapper">-->
                        <#--<div class="btn-pill" onclick="reply(${comm.id})"><span class="glyphicon glyphicon-pencil btn-pill-icon-left"></span>回复</div>-->
                        <#--<div class="btn-pill" onclick="changeCount(0,'${comm.id}',0,this)"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>-->
                        <#--<div class="btn-pill" onclick="changeCount(0,'${comm.id}',1,this)" style="display: none"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>-->
                        <#--<div class="btn-pill" onclick="changeCount(1,'${comm.id}',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报(${comm.report})</div>-->
                        <#--<div class="btn-pill" style="display: none">已举报</div>-->
                    <#--</div>-->


                <#--</div>-->

            <#--</div>-->
        <#--</#list>-->
    <#--</#if>-->
</div>

<#--<div id="mobile-menu-reply" class="mobile-nav mobile-menu-bottom-sm visible-xs visible-sm hide-nav-bottom">-->
    <#--<div class="container my-slider-container">-->
        <#--<div class="slider-body" id="divContent">-->
            <#--<form action="${base}/wx/organization/reply" method="post">-->
                <#--<div class="row offset-10">-->
                    <#--<div class="col-xs-3 col-md-3">-->
                        <#--<input style="display: inline;font-size: 10px;" type="radio" name="isOpen" id="open" checked value="1">公开<br>-->
                    <#--</div>-->
                    <#--<div class="col-xs-3 col-md-3">-->
                        <#--<input style="display: inline;" type="radio" name="isOpen"  id="anonymi" value="0">匿名<br>-->
                    <#--</div>-->
                    <#--<div class="col-xs-4 col-md-4"></div>-->
                    <#--<div class="col-xs-2 col-md-2">-->
                        <#--<button type="button" class="close mobile-close-taggle">-->
                            <#--&times;-->
                        <#--</button>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="row text-center">-->
                    <#--<textarea class="my-textarea" style="height: 10rem;" placeholder="回复评论" name="detail"></textarea>-->
                <#--</div>-->
                <#--<input type="hidden" name="pid" >-->
                <#--<input type="hidden" name="oid" value="${orgId}">-->
                <#--<input type="hidden" name="type" value="0">-->
                <#--<input type="submit" class="bottom-single-btn" style="border: none" value="回复">-->
            <#--</form>-->
        <#--</div>-->

    <#--</div>-->
<#--</div>-->
<!--举报-->
<div id="mobile-menu-report" class="mobile-nav mobile-menu-bottom-sm visible-xs visible-sm hide-nav-bottom">
    <div class="container my-slider-container no-padding">
        <div class="slider-header">
            <div class="row">
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
        </div>
        <div class="slider-body" id="divContent">
            <textarea class="my-textarea" style="height: 12rem;" placeholder="举报理由" name="reason"></textarea>
            <input type="hidden" name="cid" >
            <button class="bottom-single-btn" style="border: none; background-color: #ff0000" onclick="doreport()">
                举报
            </button>
        </div>
    </div>
</div>

</body>
</html>
<script>
    var good= "${usergoodreport.orgCommentGood}";
    var report="${usergoodreport.orgCommentReport}";
    var h = document.documentElement.clientHeight;
    function doreport() {
        $.ajax({
            method: 'POST',
            url: '${base}/wx/goodreport/add',
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

    $(function(){
        //创建MeScroll对象,内部已默认开启下拉刷新,自动执行up.callback,重置列表数据;
        $("#mescroll").height(h);
        var mescroll = new MeScroll("mescroll", {
            up: {
                offset:60,
                clearEmptyId: "dataList", //1.下拉刷新时会自动先清空此列表,再加入数据; 2.无任何数据时会在此列表自动提示空
                callback: getListData //上拉回调,此处可简写; 相当于 callback: function (page) { getListData(page); }
            }
        });

        /*联网加载列表数据  page = {num:1, size:10}; num:当前页 从1开始, size:每页数据条数 */
        function getListData(page){
            //联网加载数据
            console.log("page.num=="+page.num);
            getListDataFromNet(page.num, page.size, function(data){
                //联网成功的回调,隐藏下拉刷新和上拉加载的状态;
                mescroll.endSuccess(data.length);//传参:数据的总数; mescroll会自动判断列表如果无任何数据,则提示空;列表无下一页数据,则提示无更多数据;
                //设置列表数据,因为配置了emptyClearId,第一页会清空dataList的数据,所以setListData应该写在最后;
                setListData(data);
            }, function(){
                //联网失败的回调,隐藏下拉刷新和上拉加载的状态;
                mescroll.endErr();
            });
        }

        /*设置列表数据*/
        function setListData(data){
            var listDom=document.getElementById("dataList");
            for (var i = 0; i < data.length; i++) {
                var comm=data[i];
                if (comm.detail.length > 60){
                    comm.detail = comm.detail.substr(0,59)+"……";
                }
                var pics = new Array();
                if (comm.picurls!=null){
                    pics = comm.picurls.split("#");
        //            alert(pics.length);
                }

                var str='<div class="my-panel row row-wrapper pointable">' +
                        '<div class="col-xs-2 no-padding"> ' +
                        '<img class="headimg" src="';
                if(comm.user.headimgurl.substr(0,4)=="http"){
                    str += comm.user.headimgurl;
                }else{
                    str +='${base}/' + comm.user.headimgurl;
                }
                str +='"/></div>' +
                        '<div class="col-xs-10">' +
                        '<div>' +
                        '<div class="user-name">'+ comm.user.username + '</div>' +
                        '<div class="comment-content" onclick="location=\'${base}/wx/organization/toOrganCommentSingle?cid=' + comm.id + '\'">' + comm.detail +'</div>' +
                        '<div class="comment-pics"><div class="img-wrap">';
                for (var m=0; m<pics.length && m<3; m++){
                    str += '<img src="${base}/'+ pics[m] +'">'
                }

                str += '</div></div></div><div class="time">' + comm.time +'</div>' +
                        '<div class="comment-btns inline-wrapper"> ' +
                        '<div class="btn-pill" onclick="reply('+ comm.id +')"><span class="glyphicon glyphicon-pencil btn-pill-icon-left"></span>回复</div>';
                var id = "#" + comm.id + "#";
                if (good.indexOf(id) >= 0){
                    str += '<div class="btn-pill" onclick="changeCount(0,'+ comm.id +',1,this)"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">'+ comm.good +'</span>)</span></div>' +
                            '<div class="btn-pill" onclick="changeCount(0,' + comm.id +',0,this)" style="display: none"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">'+ comm.good +'</span>)</span></div>';
                } else {
                    str += '<div class="btn-pill" onclick="changeCount(0,'+ comm.id +',1,this)" style="display: none"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">'+ comm.good +'</span>)</span></div>' +
                            '<div class="btn-pill" onclick="changeCount(0,'+ comm.id +',0,this)"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">'+ comm.good +'</span>)</span></div>';
                }
                if (report.indexOf(id) >= 0){
                    str += '<div class="btn-pill">已举报</div>'+
                            '<div class="btn-pill" style="display: none" onclick="changeCount(1,'+ comm.id +',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报</div>';
                } else {
                    str += '<div class="btn-pill" style="display: none">已举报</div>'+
                            '<div class="btn-pill" onclick="changeCount(1,'+ comm.id +',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报</div>';
                }

                str += "</div></div></div>";
                var liDom=document.createElement("li");
                liDom.innerHTML=str;
                listDom.appendChild(liDom);
            }
        }


        /*联网加载列表数据*/
        function getListDataFromNet(pageNum,pageSize,successCallback,errorCallback) {
            //延时一秒,模拟联网
            setTimeout(function () {
//                alert(pageNum);
                $.ajax({
                    type: 'POST',
                    url: '${base}/wx/organization/getOrgCommentByPage',
                    data:{
                        page:pageNum,
                        size:pageSize,
                        orgId:${orgId}
                    },
                    dataType: 'json',
                    success: function(data){
                        var listData=data;
                //        alert(listData.length);
                        successCallback(listData);
                    },
                    error: errorCallback
                });
            },500)
        }

        document.ondragstart=function() {return false;}

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


    function reply(pid) {
        window.location.href="${base}/wx/organization/toReply?commOid=${orgId}&pid=" +pid;
//        $("#mobile-menu-reply textarea[name='detail']").val("");
////        $("#replyModal input[name='oid']").val(oid);
//        $("#mobile-menu-reply input[name='pid']").val(pid);
//        $("#mobile-menu-reply").addClass("show-nav-bottom").removeClass("hide-nav-bottom");
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
                url: '${base}/wx/goodreport/del',
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



</script>