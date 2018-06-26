<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>需求管理</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/parentCenter/parentCenter.js" type="text/javascript" ></script>
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
            height: 30%;
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
            width: 100%;
        }
        .length{
            background-color: white;
            font-size: 35px;
            color: #a0a0a0;
            text-align: right;
            width: 100%;
            padding-right: 50px;
        }
        .selectXueli{
            border-style: none;
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            color: #8c8c8c;
            opacity: 0.8;
            padding-top: 5px;
            width: 100%;
        }
        input[type=month] {
            background-color:transparent;
            FILTER: alpha(opacity=0); /*androd*/
            appearance:none;  /*下拉框去掉右侧图标*/
            -moz-appearance:none;
            -webkit-appearance:none;
        }
    </style>
</head>
<body>
<div id="main">
    <form action="/wx/parentCenter/mydemands/${user.id}/addDemand" method="post">
        <div class="buttonDiv_info">
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 姓名</p>
                </div>
                <div class="col-xs-9">
                    <input type="text" class="title_input" maxlength="20" name="name">
                </div>
            </div>

            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 性别</p>
                </div>
                <div class="col-xs-8">
                    <select class="selectXueli title_input" name="gender" onchange="$(this).css('color','dimgrey').css('opacity','1')">
                        <option value="" style="display: none;" disabled selected>请选择性别</option>
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
            <div>
                <div class="info row" >
                    <div class="col-xs-3">
                        <p class="text_p"> 出生日期</p>
                    </div>
                    <div class="col-xs-8">
                        <input type="text" class="title_input"  name="birthday" placeholder="请选择时间" onfocus="$(this).attr('type','month')">
                    </div>
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-4x icon_fa"></i>
                    </div>
                </div>
            </div>
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 诊断报告</p>
                </div>
                <div class="col-xs-9">
                    <input type="text" class="title_input" maxlength="20" name="report" >
                </div>
            </div>
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 病史</p>
                </div>
                <div class="col-xs-9">
                    <input type="text" class="title_input" maxlength="20" name="diseaseHis">
                </div>
            </div>
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 过敏史</p>
                </div>
                <div class="col-xs-9">
                    <input type="text" class="title_input" maxlength="20" name="allergyHis">
                </div>
            </div>
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 备注</p>
                </div>
                <div class="col-xs-9">
                    <input type="text" class="title_input" maxlength="20" name="remark" >
                </div>
            </div>
        </div>
        <div class="foot" align="center">
            <button style="width: 100% !important;">保存</button>
            <#--<button style="width: 100% !important;">${(user.userStatus!=0)?string("保存并提交审核","保存")}</button>-->
        </div>
    </form>
</div>

</div>
</body>
</html>
