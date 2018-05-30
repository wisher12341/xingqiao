<#include "../order/common/const.ftl" />
<#include "../order/common/var.ftl" />
<html>
<head>
    <title>评价中心</title>
    <#include "../order/common/head.ftl" />
    <link href="${path}/static/css/order/order.css" type="text/css" rel="stylesheet" />
    <script src="http://twemoji.maxcdn.com/twemoji.min.js"></script>
    <link type="text/css" href="${path}/static/css/order/star-rating.css" media="all" rel="stylesheet" />
    <script type="text/javascript" src="${path}/static/js/order/star-rating.js"></script>
    <style>
        #pics{
            width: 95%;
            margin-top: 20px;
        }
        .picdiv{
            position: relative;
            display: inline;
        }
        .addimg{
            width: 200px;
            height: 200px;
            margin-right: 50px;
            margin-bottom: 30px;
        }
        .btn{
            font-size: 42px!important;
            background-color: white!important;
            color: #20b49a!important;
            border: 1px solid #20b49a;
            border-radius: 10%;
        }
        body{
            background-color: #f5f5f5;
        }
        .state{
            border-top:1px solid #eaeaea;
            border-bottom: 1px solid #eaeaea;
            background-color: #fff;
            padding-left: 95px;
            font-size: 0.7em;
            margin-bottom: 2.3em;
            width: 100%;
            padding-top:10px;
            padding-bottom:10px;
        }

        .name{
            padding-bottom: 5px;
        }
        p{
            padding-top: 5px;
            /*margin-left: 130px;*/
        }
        #mytab li{
            width:50%;
            text-align: center;
        }

        #mytab li a{
            font-size: 48px;
            padding-top:15px;
            height:110px;
            color: #20b49a !important;
            opacity: 0.7;
        }

        #mytab li.active a{
            font-size: 48px;
            padding-top:15px;
            height:110px;
            color: white !important;
            opacity: 1;
            background-color:#20b49a ;
            font-weight: bold;
        }
        .comment{
            height: 5%;
            background-color: #20b49a;
            font-size: 45px;
            width: 100%;
            margin-bottom: -30px;
            color: white;
            margin-top: 30px;
            text-align: center;
            padding: 8px;
            font-weight: bold;
        }
        .line {
            background-color: #fff;
            border-bottom: 1px solid #eaeaea;
            border-top: 2px solid #e0e0e0;
            font-size: 30px;
            margin-top: 30px;
            padding-bottom: 15px;
            padding-left: 10px;
            padding-top: 15px;
            margin-bottom: 4%;
        }
        .rr {
            display: inline-block;
            font-size: 11px;
        }
        .name {
            display: inline-block;
            width: 100%;
        }
              p {
            color: #9d9d9d;
            font-size: 35px;
        }
        .total {
            color: orange;
            font-size: 13px;
            margin-right: 170px;
            padding-top: 8px;
        }

        button {
            background-color: #2993ff;
            color: #fff;
            margin-left: 270px;
        }
        .serviceaddress {
            color: #9d9d9d;
            font-size: 35px;
            margin-top: 10px;
        }
        .container {
            width: 95%;
        }
        .count {
            background-color: orange;
            border-radius: 12px;
            color: white;
            margin-left: 3%;
            padding: 0 5px;
        }
        #myTab .active {
            border-bottom: 5px solid #20b49a;
        }

        .timee{
            /*margin-left: 160px;*/
            margin-top: 30px;
            padding-top: 15px;
            font-size: 35px;
        }
        .number{
            background-color: red;
            color: white;
            padding:2px 17px;
            font-size: 38px;
            font-weight: bold;
            border-radius: 100%;
            position: relative;
            border: 2px solid white;
            /*top:-25%;*/
            /*right: 10%;*/
            bottom: 20px;
            margin-left: 10px;
        }
        .rating-lg{
            font-size: 50px!important;
        }
        .label{
            font-size: 36px!important;
        }
        .emoji{
            width: 48px!important;
        }
    </style>
</head>
<body>
    <div id="main">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#reply" data-toggle="tab">
                    待回复<span class="number">${(comments.noCommentOrders)?size}</span>
                </a>
            </li>
            <li>
                <a href="#history" data-toggle="tab">
                    历史
                </a>
            </li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="reply">
                <@orderlist  param1=comments.noCommentOrders/>
            </div>
            <div class="tab-pane fade" id="history">
                <@commentlist  param1=comments.hisComments param2="his"/>
            </div>
        </div>
    </div>

</body>
<script>
    $(".input-22a").rating({
        showClear: false
    });
    twemoji.parse(document.getElementById('main'), {size: 36});
</script>
</html>
