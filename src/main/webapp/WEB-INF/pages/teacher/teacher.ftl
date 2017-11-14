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
</head>
<body class="base">
<div class="container my-panel" style="min-height: 20rem">
    <div class="row" style="height: 100%">
        <div class="col-xs-7">
            <div class="org-name-title">${teacher.name!"暂无"}</div>
            <div class="row my-panel-content offset-5">
                <div class="col-xs-6">${teacher.level!"暂无(星级)"}</div>
                <div class="col-xs-6 no-padding-right" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;${teacher.experienceAge!"0"} 年经验</div>
            </div>

            <div class="row my-panel-content offset-5">
                <div class="col-xs-3 no-padding-right" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;实名</div>
                <div class="col-xs-3 no-padding-right" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;学历</div>
                <div class="col-xs-3 no-padding-right" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;认证</div>
            </div>
            <div class="my-panel-content offset-5">
                <#--康复经验：${teacher.experienceAge!"0"} 年-->
                <#--<br>-->
                康复项目：${teacher.domain!"暂无"}
                <br>
                康复对象：${teacher.object!"暂无"}
            </div>
            <hr style="margin: 0.8rem 0rem;">
            <div class="my-panel-content offset-5" >
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
        <div class="col-xs-5 text-center" style="height: 12rem;">
            <img src="${base}/${teacher.headimgurl!''}" onerror='this.src="${base}/static/img/touxiang.svg;this.onerror=null"' class="headimg-lg">
            <button class="offset-20 btn-order" onclick="makeOrder()">立即预约</button>
        </div>
    </div>
</div>
<#--<div class="my-panel">-->
    <#--<div class="my-panel-content">-->
        <#--<div class="col-xs-12">康复方式：${teacher.way!"暂无"}</div>-->
    <#--</div>-->
<#--</div>-->

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
                        <form action="${base}/teacher/comment" method="post">
                            <div>
                                <textarea class="my-modal-textarea" placeholder="请填写您的回复" id="comment_text" name="detail" ></textarea>
                            </div>
                            <input type="hidden" name="pid" >
                            <input type="hidden" name="tid" value="${teacher.id}">
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
    <#if teacher.commentList??>
        <#list teacher.commentList as comm>
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
                    <#if comm.teacherComment??>
                        <div class="sub-comment-list container">
                            <hr class="margin-5">
                            <div class="my-panel-title">治疗师评论</div>
                            <hr class="margin-5">
                            <div class="row">
                                <#--<div class="col-xs-3">-->
                                    <#--<img class="headimg" src='${base}/${comm.teacherComment.user.headimgurl!""}'/>-->
                                <#--</div>-->
                                <div class="col-xs-9">
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
                                <div class="dot-line"></div>
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

<!-- 模态框（Modal） 预约单-->
<div class="modal fade"  id="yuYue_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>

                <h4 class="modal-title" id="myModalLabel">
                    预约单
                </h4>

            </div>
            <div class="modal-body" id="divContent">


                <div class="form-group">


                    上门方式：<select  id="waySelect"></select><br><br>
                    康复项目： <select  id="domainSelect"></select><br><br>
                    服务时间：<input id="serviceTime" type="text" ><br><br>
                    备    注：<input id="remark" type="text"><br><br>
                    需求简历：<select id="demandSelect"></select>

                    <a href="${base}/center#/parentCenter/demand">添加更多需求简历 >></a><br>
                        <p>##selectedSite##</p>
                    <p>数量</p>
                    <div>

                        <button class="amount_button" onclick="subtract__fuction()">-</button>
                        <span id="countSpan" >1</span>
                        <button class="amount_button" onclick="add_function()">+</button>
                    </div>

                    总价：<span id="sumSpan"></span>元

                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="submit" class="btn btn-primary" onclick="yuYue_fucntion()">
                    提交订单
                </button>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- modal -->



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
<!-- modal -->
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

    function makeOrder() {
        $.ajax({
            method: 'POST',
            url: '/wx/parentCenter/isexisted',
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
                    $('#yuYue_Modal').modal();
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
                'teacher.id': getCookie('teacherId'),
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

</script>