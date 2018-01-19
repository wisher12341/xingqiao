<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
                              <head>
    <title>奖励荣誉</title>
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
        }
        .text_p{
            font-size: 45px;
            display: inline;
            margin-left: 40px;
            color: dimgrey;
            font-weight: bold;
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
            color: #a0a0a0;
            font-size: 35px;
            margin-left: 40px;
            margin-right: 100px;
            margin-top: 20px;
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
        .addimg{
            width: 200px;
            height: 200px;
            margin-right: 20px;
            margin-bottom: 30px;
        }
        .row{
            margin: 0 !important;
        }
    </style>
</head>
<body>


<div id="main">
    <div class="buttonDiv_info" style="background-color: white;margin-bottom: 8%">
            <#list ((data!)?split("#"))! as a>
                <div  onclick=location.href="${path}/wx/teacherCenter/info/${uid}/${type}/${a_index}/edit">
                    <div class="row" style="height: 7%;padding-top:3.5% ">
                        <div class="col-xs-9">
                            <p class="text_p"> ${a?split("@")[0]}</p>
                        </div>
                        <div class="col-xs-2">
                            <p class="text_ppp"> 编辑</p>
                        </div>
                        <div class="col-xs-1">
                            <i class="fa fa-angle-right fa-4x icon_fa"></i>
                        </div>
                    </div>
                    <div class="row" style="border-bottom:1px solid #ccc;height: 17% ">
                        <div class="col-xs-12">
                            <p class="text_detail">
                                <#list (a?split("@")[1])?split("!") as pic>
                                    <img src="/${pic}" class="addimg">
                                </#list>
                        </div>
                    </div>
                </div>
            </#list>
    </div>
</div>
<div class="foot" align="center">
    <button onclick="location.href='${path}/wx/teacherCenter/info/${uid}/award/0'" style="width: 100% !important;">新增</button>
</div>
</body>
</html>