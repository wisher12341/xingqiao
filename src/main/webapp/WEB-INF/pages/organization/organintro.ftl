<!DOCTYPE html>
<#assign base=request.contextPath />
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0"/>
    <title>星桥</title>
    <script type="text/javascript" src="${base}/static/js/common/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="${base}/static/js/common/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${base}/static/css/common/bootstrap.min.css">
    <link rel="stylesheet" href="${base}/static/css/jcy.css">
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
            <button class="btn-default my-panel-title" onclick="comment(${organization.id})">我要评论</button>
        </div>
        <div class="gray-line"></div>
        <div class="my-panel-content container">
            <div class="modal fade"  id="replyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog my-modal-dialog">
                    <div class="modal-content my-modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>

                            <div class="modal-title my-modal-title" id="myModalLabel">
                                跟帖
                            </div>

                        </div>
                        <div class="modal-body my-modal-body" id="divContent">
                            <form action="${base}/organization/reply" method="post">
                                <div>
                                    <textarea class="my-modal-textarea" placeholder="请填写您的回复" id="comment_text" name="detail" ></textarea>
                                </div>
                                <input type="hidden" name="pid" >
                                <input type="hidden" name="oid" value="${organization.id}">
                                <input type="hidden" name="type" value="0">
                                <div class="row">
                                    <div class="col-xs-3 col-md-3">
                                        <input style="display: inline;font-size: 10px;" type="radio" name="isOpen" id="open" checked value="1">公开<br>
                                    </div>
                                    <div class="col-xs-3 col-md-3">
                                        <input style="display: inline;" type="radio" name="isOpen"  id="anonymi" value="0">匿名<br>
                                    </div>

                                    <div class="col-xs-2 col-md-2">
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 20px">
                                    <input type="submit" class="btn btn-primary sub_comment" style="position:relative;left:100px;width:100px; font-size: 16px;" value="发表">
                                </div>
                            </form>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

            <div class="modal fade"  id="commentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog my-modal-dialog">
                    <div class="modal-content my-modal-content">
                        <form action="${base}/organization/comment" method="post" enctype="multipart/form-data">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>

                                <div class="my-modal-title" >
                                    评论
                                </div>

                            </div>
                            <div class="my-modal-body container">
                                <div class="row">
                                    <div class="my-panel-title">
                                        评价内容
                                    </div>
                                    <div >
                                        <textarea class="my-modal-textarea" placeholder="请填写您的评价" id="comment_text" name="detail" ></textarea>
                                    </div>
                                    <input type="hidden" name="pid" value="0">
                                    <input type="hidden" name="oid">
                                    <input type="hidden" name="type" value="1">
                                    <div class="row">
                                        <div class="col-xs-3 col-md-3">
                                            <input style="display: inline;font-size: 10px;" type="radio" name="isOpen" id="open" checked value="1">公开<br>
                                        </div>
                                        <div class="col-xs-3 col-md-3">
                                            <input style="display: inline;" type="radio" name="isOpen"  id="anonymi" value="0">匿名<br>
                                        </div>

                                        <div class="col-xs-2 col-md-2">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="fileImg" id="fileImg" style="margin-left: 1.5rem">
                                            <ul class="file_ul">
                                                <li>
                                                    <input type="file" class="upfile" name="pics">
                                                    <span></span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px">
                                        <input type="submit" class="btn btn-primary sub_comment" style="position:relative;left:100px;width:100px; font-size: 16px;" value="发表">
                                    </div>
                                </div>
                            </div>

                            <div>
                            </div>
                        </form>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

            <div class="modal fade"  id="reportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog my-modal-dialog">
                    <div class="modal-content my-modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>

                            <div class="modal-title my-panel-title" id="myModalLabel">
                                举报内容
                            </div>

                        </div>
                        <div class="modal-body my-modal-body" id="divContent">
                            <div style="width:500px;line-height: 40px;vertical-align: middle;font-size: 16px;">
                                <textarea class="my-modal-textarea" placeholder="请填写您的举报理由" id="comment_text" name="reason" ></textarea>
                            </div>
                            <input type="hidden" name="cid" >
                            <br>
                            <button class="btn btn-primary" onclick="report()">
                                举报
                            </button>

                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <#if organization.organCommentList??>
                <#list organization.organCommentList as comm>
                    <div class="row">
                        <div class="col-xs-3">
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
                            <div class="comment-btns inline-wrapper">
                                <div class="time">
                                    ${comm.time}
                                </div>
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
                                    <div class="row">
                                        <div class="col-xs-3">
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
                                </#list>
                                </div>

                            </#if>

                        </div>
                    </div>
                    <div class="gray-line"></div>
                </#list>
            </#if>
        </div>
    </div>
</body>
</html>
<script>
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

        $("#replyModal textarea[name='detail']").val("");
//        $("#replyModal input[name='oid']").val(oid);
        $("#replyModal input[name='pid']").val(pid);
        $("#replyModal").modal();
    }

    function comment(oid) {

        $(".file_ul").html('<li><input type="file" class="upfile" name="pics"><span></span> </li>');
        obj = document.getElementById('fileImg');
        ALi = obj.getElementsByTagName('li');
        addFn();


        $("#commentModal textarea[name='detail']").val("");
        $("#commentModal input[name='oid']").val(oid);
        $("#commentModal").modal();
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
                $("#reportModal textarea[name='reason']").val("");
                $("#reportModal input[name='cid']").val(id);
                $("#reportModal").modal();
                o=obj;
            }
        }else{
            //取消点赞
            $.ajax({
                method: 'POST',
                url: '/goodreport/del',
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
            url: '/goodreport/add',
            data: {
                type: 1,
                cid: $("input[name='cid']").val(),
                flag: 1, //0表示  机构评论   1表示治疗师评论
                reason:$("textarea[name='reason']").val()
            },
            success: function (data) {
                $(o).html("已举报");
                $(o).attr("onclick","");
                $("#reportModal").modal("hide");
            }
        });
    }

</script>