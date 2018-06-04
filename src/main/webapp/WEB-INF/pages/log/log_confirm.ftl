<#include "../order/common/const.ftl" />
<#include "../order/common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>康复日志</title>
<#include "../order/common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <script src="http://twemoji.maxcdn.com/twemoji.min.js"></script>
    <style>
        body{
            background-color: #f5f5f5;
        }
        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .info,.info_head{
            background-color: white;
            margin: 4px 0;
        }
        .info{
            height: 120px;
            padding-top: 30px;
        }
        .info_head{
            height: 200px;
            padding-top: 60px;
        }
        .text_p{
            font-size: 45px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            font-weight: bold;
        }
        .text_pp{
            font-size: 40px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            position: relative;
            top:5px;
        }
        .text_ppp{
            font-size: 35px;
            display: inline;
            float: right;
            position: relative;
            top:5px;
        }
        .icon_fa{
            /*position: relative;*/
            /*top: 5px;*/
            color: dimgrey;
        }
        .foot{
            position: fixed;
            width: 100%;
            bottom: 0;
            background-color: #f5f5f5;
        }
        .foot button{
            /*background-color:#94e6c8 ;*/
            background-color: #20b49a;
            color: white !important;
            font-size: 45px;
            font-weight: bold;
            padding: 20px;
            margin: 0 auto;
            border-radius: 15px;
            height:6%
        }
        .textarea{
            width: 100%;
            /*height: 30%;*/
            font-size: 45px;
            border-style: none;
            padding: 35px;
            resize: none;
            color: dimgrey;
        }
        .title_input{
            font-size: 45px;
            border-style: none;
            color: dimgrey;
            position: relative;
            top:-6px;
        }
        .length{
            background-color: white;
            font-size: 40px;
            color: grey;
            /*text-align: right;*/
            width: 100%;
            padding: 15px 0;
            padding-left:35px;
            border-bottom: 1px solid #ccc;
        }
        .addimg{
            width: 200px;
            height: 200px;
            margin-right: 50px;
            margin-bottom: 30px;
        }
        #pics{
            width: 95%;
            margin-left: 5%;
            margin-top: 20px;
            margin-bottom: 50px;
        }
        .picrm{
            position: absolute;
            z-index: 999;
            margin-left: -85px;
            color: white;
            background-color: gray;
            margin-top: -105px;
            font-size: 35px;
        }
        .picdiv{
            position: relative;
            display: inline;
        }
    </style>
</head>
<body>


<div id="main">
    <form action="/wx/log/confirm" method="post">
        <input type="hidden" name="rid" value="${log.id}">
        <input type="hidden" name="oid" value="${log.orderId}">

        <div class="buttonDiv_info">
            <div class="info row" >
                <div class="col-xs-11">
                    <p class="text_p"> ${log.demandName}</p>
                </div>
            </div>
        </div>

        <div class="buttonDiv_info" style="background-color: white">
            <p class="length">
                <span>治疗师：${log.teacherName}</span><span style="margin-left: 10%">订单号：${log.orderId}</span>
            </p>
            <p class="textarea" >${log.content}</p>
            <div id="pics">
                <div class="ps" style="display: inline">
                <#if (log.picUrls)?? && (log.picUrls)!="">
                    <#list (log.picUrls)?split("#") as pic>
                        <div class="picdiv">
                            <img class="addimg"  src="/${pic}">
                        </div>
                    </#list>
                </#if>
                </div>
            </div>
        </div>

        <div class="foot" align="center">
            <button style="width: 100% !important;">确认</button>
        </div>
    </form>

</div>
</body>
<script>
    twemoji.parse(document.getElementById('main'), {size: 36});
</script>
</html>
