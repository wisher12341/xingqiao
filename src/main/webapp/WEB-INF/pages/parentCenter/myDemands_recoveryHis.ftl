<#include "common/const.ftl" />

<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>康复史</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <style>
        body{
            background-color: #f5f5f5;
        }
        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
            padding-bottom: 10px;
        }
        .text_p{
            font-size: 40px;
            display: inline;
            color: dimgrey;
            font-weight: bold;
            position: relative;
            top:25px;
        }
        .text_ppp{
            font-size: 35px;
            display: inline;
            float: right;
            position: relative;
            top:5px;
            color: dimgrey;
        }
        .icon_fa{
            /*position: relative;*/
            /*top: 5px;*/
            color: dimgrey;
        }
        .text_detail{
            color: dimgrey;
            font-size: 35px;
            margin-right: 100px;
            margin-bottom: 15px;
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
        .row{
            margin: 0 !important;
        }
        .circle{
            position: relative;
            left: 25px;
            padding-top:10px;
            padding-bottom: 5px;
        }
        .fa-circle-thin{
            color: #bbb;
        }

        ul{
            list-style: none;
            padding: 0;
            margin: 0;
            width: 100%;
            text-align: left;
        }

        .glyphicon-trash{
            font-size: 45px;
            background-color: #20b49a;
            border-radius: 100%;
            padding: 20px;
            color: white;
            position: absolute;
            right: 10%;
            /*left: 0;*/
            top: 50%;
            transform: translateY(-50%);
            display: none;
            /*bottom: 0;*/
            /*margin:auto;*/
        }
        .sl-content {
            overflow: hidden;
        }
        .sl-li {
            position: relative;
            background-color: #f5f5f5;
            transform: translateZ(0);
            -webkit-transform: translateZ(0);
            margin: 0;
        }
        .sl-li .sl-content {
            overflow: hidden;
            /*padding: 10px;*/
            position: relative;
            z-index: 10;
            /*background-color: #fff;*/
        }
        .sl-li .sl-content.animated {
            -webkit-transition: -webkit-transform .2s ease-out;
            transition: transform .2s ease-out;
        }
        .sl-li .sl-opts {
            height: 100%;
            width: 25%;
            display: -webkit-box;
            -webkit-box-pack: center;
            -webkit-box-align: center;
            position: absolute;
            top: -10px;
            right: 3%;
            z-index: 0;
        }
        .sl-li .sl-opts i {
            padding: 30px;
            display: -webkit-box;
            -webkit-box-pack: center;
            -webkit-box-align: center;
        }
    </style>
</head>
<body style="overflow-x: hidden">


<div id="main">
    <div class="buttonDiv_info" style="background-color: white;margin-bottom: 8%">
        <ul>
            <#list recoveryHisList! as recoveryHis>
                <li class="sl-li ui-border-b" style="background-color: white">
                    <div class="sl-content" style="background-color: white" onclick=location.href="${path}/wx/parentCenter/recoveryHis/${demandId}/${recoveryHis}/editPage">
                    <#if recoveryHis.index==0>
                        <div class="row" style="height: 2%;">
                        </div>
                    </#if>
                        <div class="row" style="position: relative; ">
                            <div class="col-xs-1 circle">
                                <i class="fa fa-circle-thin fa-2x icon_fa"></i>
                            </div>
                            <div class="col-xs-8" style="position: absolute;left:80px">
                                <p class="text_detail"> ${recoveryHis.beginTime} - ${recoveryHis.endTime}</p>
                            </div>
                            <div class="col-xs-2" style="position: absolute;right: 8%">
                                <p class="text_ppp"> 编辑</p>
                            </div>
                            <div class="col-xs-1" style="position: absolute;right: 0">
                                <i class="fa fa-angle-right fa-4x icon_fa"></i>
                            </div>
                        </div>
                        <div class="row" style="height: 6%;">
                            <div class="col-xs-1" style="${recoveryHis_has_next?string('border-left:2px solid #ccc;','')}height: 100%;position: relative;left: 50px">
                                <p style="color: white">aa</p>
                            </div>
                            <div class="col-xs-11">
                                <p class="text_p">${recoveryHis.name}</p>
                            </div>
                        </div>
                        <div class="row" style="height: 4%;  ">
                            <div class="col-xs-1" style="${recoveryHis_has_next?string('border-left:2px solid #ccc;','')}height: 100%;position: relative;left: 50px">
                                <p style="color: white">aa</p>
                            </div>
                            <div class="col-xs-11" style="${recoveryHis_has_next?string('border-bottom:1px solid #ccc;','')}">
                                <p class="text_detail" style="color: #a0a0a0">${recoveryHis.count}周/次<span style="font-size: 40px;font-weight: bold;padding: 5px">·</span>${recoveryHis.detail}</p>
                            </div>
                        </div>
                        <#if recoveryHis_has_next>
                            <div class="row" style="border-left:2px solid #ccc;height: 2%;margin-left: 50px!important;">
                            </div>
                        </#if>
                    </div>
                </li>
            </#list>
        </ul>
    </div>
</div>
<div class="foot" align="center">
    <button onclick="location.href='${path}/wx/parentCenter/recoveryHis/${demandId}/addRecoveryHis'" style="width: 100% !important;">新增</button>
</div>
</body>
</html>