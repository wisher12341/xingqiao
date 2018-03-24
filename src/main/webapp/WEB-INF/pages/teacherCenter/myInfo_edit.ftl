<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>${info.ftype}</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <style>
        body{
            background-color: #f5f5f5;
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
        .title_input{
            border: none;
            font-size: 45px;
            color: dimgrey;
            width: 100%;
            text-align: left;
            background-color: #f5f5f5;
        }
        .buttonDiv_info{
            margin: 2% 0;
            /*border-bottom: 1px solid #ccc;*/
            /*border-top: 1px solid #ccc;*/
        }
        .info{
            width: 90%;
            padding: 15px;
            border: 1px solid #bbb;
            border-radius: 10px;
        }
        .title{
            font-size: 48px;
            font-weight: bold;
            color: white;
            padding: 18px;
        }
        .gender{
            font-size: 48px;
            font-weight: bold;
            color: dimgrey;
            padding: 18px;
            padding-left: 25px;
        }
        p{
            margin-bottom: 0 !important;
        }
        .fa-check{
            font-size: 48px;
            font-weight: bold;
            margin-left: 80%;
        }
    </style>
</head>
<body>


<div id="main">
    <form action="/wx/${(parent??)?string("parentCenter","teacherCenter")}/myInfo/edit" method="post">
        <input type="hidden" name="ctype" value="${info.ctype}">
        <input type="hidden" name="ftype" value="${info.ftype}">
        <input type="hidden" name="isChangeStatus" value="${info.isChangeStatus}">
        <input type="hidden" name="uid" value="${user.id}">
        <div class="" align="center" style="background-color: #20b49a;border-bottom: 1px solid #eee">
            <p class="title">${info.ctypeDesc}</p>
        </div>
        <#if ctype=="gender">
            <input type="hidden" name="value" class="value">
            <div style="background-color: white;border-bottom: 1px solid #eee">
                <p class="gender" style="border-bottom: 1px solid #eee" onclick="$('.value').val(0);$('form').submit()">男${((info.value)?? && (info.value)=="0")?string("<span class='fa fa-check'></span>","")}</p>
                <p class="gender" onclick="$('.value').val(1);$('form').submit()">女${((info.value)?? && (info.value)=="1")?string("<span class='fa fa-check'></span>","")}</p>
            </div>
        <#else >
            <div class="buttonDiv_info" align="center">
                <div class="info" align="center">
                    <input name="value" type="text" class="title_input" maxlength="20" value="${info.value}">
                </div>
            </div>
            <div class="foot" align="center">
                <button style="width: 100% !important;">${(info.isChangeStatus!=0)?string("保存并提交审核","保存")}</button>
            </div>
        </#if>
    </form>

</div>
</body>

</html>
