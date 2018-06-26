<!DOCTYPE html>
<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>治疗师中心</title>
    <#--<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">-->
<#include "common/head.ftl" />
    <link rel="stylesheet" type="text/css" href="/static/css/index.css">
    <link href="/static/css/jquery.circliful.css" rel="stylesheet" type="text/css" />
    <script src="/static/js/jquery.circliful.min.js"></script>

    <style>
        body{
            background-color: #f5f5f5;
        }
        .glyphicon-home,.text_index{
            color: #20b49a!important;
        }
        .btn{
            width: 49.4%;
            height: 80px;
        }
        .modal-dialog{
            margin-top: 150px;
            width: 90%!important;
        }
        .modal-body{
            font-size: 45px!important;
            color: dimgrey;!important;
        }
    </style>

</head>
<body class="index-base">
<div id="main"  style="padding-left: 0px; padding-right: ">
    <div id="headPoster" class="row">
        <img src="/static/img/poster.jpg">
        <script>
            var winWidth,winHeight;
            // 获取窗口宽度
            if (window.innerWidth)
                winWidth = window.innerWidth;
            else if ((document.body) && (document.body.clientWidth))
                winWidth = document.body.clientWidth;
            // 获取窗口高度
            if (window.innerHeight)
                winHeight = window.innerHeight;
            else if ((document.body) && (document.body.clientHeight))
                winHeight = document.body.clientHeight;
            // 通过深入 Document 内部对 body 进行检测，获取窗口大小
            if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth)
            {
                winHeight = document.documentElement.clientHeight;
                winWidth = document.documentElement.clientWidth;
            }
            $("#headPoster").css('height',winHeight/3.2);
        </script>
    </div>
<div>
    <div class="index-panel row offset-10" style="padding-top: 2%">
        <div class="index-panel-item col-sm-4 col-xs-4">
            <img class="index-icon" src="/static/img/icons/recovery-center.svg">
            <div class="index-icon-text">康复中心</div>
        </div>
        <div class="index-panel-item col-sm-4 col-xs-4">
            <img class="index-icon" src="/static/img/icons/expert.svg">
            <div class="index-icon-text">专家课堂</div>
        </div>
        <div class="index-panel-item col-sm-4 col-xs-4">
            <img class="index-icon" src="/static/img/icons/rules.svg">
            <div class="index-icon-text">平台准则</div>
        </div>
    </div>
    <div class="row" style="background-color: white;margin-top: -10px;padding-top: 15px;padding-bottom: 2%">
        <div class="index-panel-item col-sm-4 col-xs-4">
            <img class="index-icon" src="/static/img/icons/redpocket.svg">
            <div class="index-icon-text">推荐红包</div>
        </div>
        <div class="index-panel-item col-sm-4 col-xs-4">
            <img class="index-icon" src="/static/img/icons/points.svg">
            <div class="index-icon-text">我的积分</div>
        </div>
        <div class="index-panel-item col-sm-4 col-xs-4">
            <img class="index-icon" src="/static/img/icons/mailbox.svg">
            <div class="index-icon-text">反馈信箱</div>
        </div>
        <script>
            $(".index-panel-item").css('height',winHeight/7.5);
            $(".index-icon").css("height",winHeight/7).css("width",winWidth/7);
        </script>
    </div>
</div>
    <div id="myData" class="offset-10 index-panel row" style="padding-bottom: 10%">
        <div class="index-panel-title-wrapper">
            <div class="green-line-vertical"></div>
            <div class="index-panel-title">我的数据</div>
        </div>
        <div class="row" style="padding: 0px 20px;">
            <div class="col-sm-4 col-xs-4 chart-container">
                <div id="chart1"></div>
            </div>
            <div class="col-sm-4 col-xs-4 chart-container">
                <div id="chart2"></div>
            </div>
            <div class="col-sm-4 col-xs-4 chart-container">
                <div id="chart3"></div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                您有<span style="padding: 15px;color: red;font-size: 50px">${(number.logNumber)!}</span>条康复日志需要填写！
            </div>
            <div class="modal-footer">
                <input type="button" onclick="$('#delModal').modal('hide')" class="btn" value="取消" style="background-color: orange!important;color: white!important;font-size: 40px!important;"/>
                <input type="buttont" class="btn btn-primary" value="前往确认" style="background-color: #20b49a!important;font-size: 40px!important;border-color: white!important;"  onclick="location.href='${path}/wx/teacherCenter/${user.id}/myLog'">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<#if (number.logNumber)! &gt; 0>
<script>
    $('#delModal').modal();
</script>
</#if>
<#include "common/foot.ftl" />
<script>

    $( document ).ready(function() {
        $("#chart1").circliful({
            animationStep: 5,
            foregroundBorderWidth: 5,
            backgroundBorderWidth: 1,
            percent: 80,
            percentageTextSize: 30,
            text: '主页风采',
            textBelow: true,
            fontSize:"35px",
            fontColor: '#000',
            foregroundColor: '#20b49a',
            backgroundColor: '#20b49a'
        });
        $("#chart2").circliful({
            animationStep: 5,
            foregroundBorderWidth: 5,
            backgroundBorderWidth: 1,
            percent: 10,
            percentageTextSize: 30,
            text: '回应率',
            textBelow: true,
            fontColor: '#000',
            foregroundColor: '#20b49a',
            backgroundColor: '#20b49a'
        });
        $("#chart3").circliful({
            animationStep: 5,
            foregroundBorderWidth: 5,
            backgroundBorderWidth: 1,
            percent: 80,
            percentageTextSize: 30,
            text: '好评率',
            textBelow: true,
            fontColor: '#000',
            foregroundColor: '#20b49a',
            backgroundColor: '#20b49a'
        });
    });
</script>
</body>
</html>