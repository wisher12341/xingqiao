<#include "../common/const.ftl" />
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>回复评论</title>
<#include "../common/head.ftl" />
    <link href="/static/css/teacherCenter/updateLog.css">
    <link type="text/css" href="${path}/static/css/order/star-rating.css" media="all" rel="stylesheet" />
    <script type="text/javascript" src="${path}/static/js/order/star-rating.js"></script>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link type="text/css" href="${path}/static/common/box/build.css" rel="stylesheet" />
    <style>
        .foot{
            width: 100%;
        }
        #reply textarea{
            height: 92%;
        }
        #reply textarea{
            width: 95%;
            border-style: none;
            padding-top: 10px;
            font-size: 18px;
            resize: none;
        }
        .foot input{
            /*background-color:#94e6c8 ;*/
            position: fixed;
            bottom: 0;
            background-color: #20b49a;
            color: white !important;
            font-size: 20px;
            font-weight: bold;
            padding: 8px;
            border-radius: 15px;
            width:100%;
            height: 8%;
            border: none;
        }
    </style>
</head>
<body>

<div id="reply" >
    <form action="/wx/comment/${oid}/teacherReply" method="post">
        <div align="center">
            <textarea placeholder="填写回复..." name="detail" id="reply_t"></textarea>
        </div>
        <input name="pid" type="hidden" value="${cid}">
        <div class="foot">
            <input  value="回复" type="submit">
        </div>
    </form>

</div>



</body>

</html>