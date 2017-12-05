<#include "common/const.ftl" />
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>查看评论</title>
<#include "common/head.ftl" />
    <link href="/static/css/teacherCenter/updateLog.css">
    <link type="text/css" href="${path}/static/css/order/star-rating.css" media="all" rel="stylesheet" />
    <script type="text/javascript" src="${path}/static/js/order/star-rating.js"></script>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link type="text/css" href="${path}/static/common/box/build.css" rel="stylesheet" />
    <style>
        #foot{
            width: 100%;
        }
        #target,#reply textarea{
            width: 95%;
            border-style: none;
            padding-top: 10px;
            font-size: 18px;
            resize: none;
        }
        #body{
            height: 88%;
            overflow-y: scroll;
        }
        #foot_play{
            height: 6%;
        }
        .nm{
             /*position: absolute;*/
             right: 10px;
             /*bottom: 9%;*/
             display: inline;
             background-color: whitesmoke;
             border: 1px solid #e5e5e5;
             border-radius: 10px;
             padding:0 5px 3px;
         }
        .nm_span{
            color:#1296db ;
            font-size: 18px;
            position: relative;
            top:3px;
        }
        .nm_t{
            /*position: absolute;*/
            right: 10px;
            /*bottom: 9%;*/
            display: inline;
            background-color:#20b49a;
            border: 1px solid #e5e5e5;
            border-top-left-radius:10px ;
            border-bottom-left-radius: 10px;
            padding:15px 5px;
        }
        .nm_span_t{
            color:white;
            font-size: 18px;
            position: relative;
            top:3px;
        }
        #pics{
            width: 95%;
            margin-left: 5%;
            margin-top: 20px;
        }
        .addimg{
            width: 30%;
            height: 100px;
            margin-right: 10px;
            margin-bottom: 10px;
        }
        .picdiv{
            position: relative;
            display: inline;
        }
        .foot{
            width: 100%;
        }
        #reply textarea{
            height: 92%;
        }
        .foot input{
            /*background-color:#94e6c8 ;*/
            background-color: #20b49a;
            color: white !important;
            font-size: 20px;
            font-weight: bold;
            padding: 8px;
            margin: 0 auto;
            border-radius: 15px;
            width:100%;
            height: 8%;
            border: none;
        }
    </style>
</head>
<body>

    <div id="main">
        <div id="body">
            <div align="center">
                    <textarea id="target">${(comment.detail)!}</textarea>
            </div>
            <div id="pics">
                <div class="ps" style="display: inline">
                    <#list (comment.picUrls)!?split("#") as pic>
                        <div class="picdiv">
                            <img class="addimg" src="/${pic}">
                        </div>
                    </#list>
                </div>
            </div>
        </div>


        <div id="foot">
            <div id="foot_play">
                <div class="nm">
                    <img src="/static/img/earth_s.png" ><span class="nm_span">${(comment.isOpen==1)?string("公开","匿名")}</span>
                </div>
                <div class="nm_t" style="float: right">
                    <#if type=='parent'>
                        <#--家长版本-->
                        <#if (comment.teacherComment.id)??>
                            <img src="/static/img/search.png" ><span class="nm_span_t" onclick="reply()">治疗师已回复</span>
                        <#else>
                            <span class="nm_span_t">治疗尚未回复</span>
                        </#if>
                    <#else>
                        <#--治疗师版本-->
                        <#if (comment.teacherComment.id)??>
                            <img src="/static/img/search.png" ><span class="nm_span_t" onclick="reply()">您已回复</span>
                        <#else>
                            <span class="nm_span_t" onclick="reply()">您还未回复</span>
                        </#if>
                    </#if>

                </div>
                <div style="display: inline">
                    <input id="input-22a" type="number" class="rating" min=0 max=5 step=1 data-size="xs"  value="${comment.level}" disabled="disabled">
                </div>
            </div>

        </div>
    </div>

<div id="reply" style="display: none" align="center">
<#if type=='parent'|| (comment.teacherComment.id)??>
    <textarea  readonly>${(comment.teacherComment.detail)!}</textarea>
    <div class="foot">
        <input type="button" onclick="$('#reply').animate({width:'toggle'},200,function() {$('#main').show();});" value="返回">
    </div>
<#else>
        <form action="/wx/comment/${oid}/teacherReply" method="post">
            <textarea placeholder="填写回复..." name="detail" id="reply_t"></textarea>
            <input name="pid" type="hidden" value="${comment.id}">
            <div class="foot">
                <input  value="确定" type="submit">
                <input onclick="$('#reply').animate({width:'toggle'},200,function() {$('#main').show();});$('#reply_t').val('')" value="返回" type="button">
            </div>
        </form>
</#if>
</div>



</body>
<script>
    $("#input-22a").rating({
        showClear: false
    });
    function reply() {
        $('#main').hide();
        $('#reply').animate({width:'toggle'},200);
    }
</script>
</html>
