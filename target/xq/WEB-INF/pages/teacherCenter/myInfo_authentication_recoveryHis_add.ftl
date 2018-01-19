<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>康复经历</title>
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
    </style>
</head>
<body>


<div id="main">
    <form action="<#if data??>/wx/teacherCenter/info/${user.id}/recoveryHis/${index}/edit<#else>/wx/teacherCenter/info/${user.id}/recoveryHis/add</#if>" method="post">
        <div class="buttonDiv_info">
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 单位名称</p>
                </div>
                <div class="col-xs-9">
                    <input placeholder="请输入所在单位名称，20字以内" type="text" class="title_input" maxlength="20" name="rec.name" style="width: 100%"
                        <#if data??>
                            value="${data.name}"
                        </#if>
                    >
                </div>
            </div>
            <div>
                <div class="info row" >
                    <div class="col-xs-3">
                        <p class="text_p"> 开始时间</p>
                    </div>
                    <div class="col-xs-8">
                        <input placeholder="选择时间" type="text" class="title_input" name="rec.startTime"
                        <#if data??>
                               value="${data.startTime}"
                        </#if>
                        >
                    </div>
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-4x icon_fa"></i>
                    </div>
                </div>
                <div class="info row" >
                    <div class="col-xs-3">
                        <p class="text_p"> 结束时间</p>
                    </div>
                    <div class="col-xs-8">
                        <input placeholder="选择时间" type="text" class="title_input" name="rec.endTime"
                        <#if data??>
                               value="${data.endTime}"
                        </#if>
                        >
                    </div>
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-4x icon_fa"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="buttonDiv_info" style="background-color: white">
            <textarea class="textarea" placeholder="描述您曾任职期间的具体教学内容，科研成果" name="rec.detail"><#if data??>${data.detail}</#if></textarea>
            <p class="length">
            <#if data??>
                ${200-(data!)?split("@")[1]?length}
            <#else >
                200
            </#if>
            </p>
        </div>


        <div class="foot" align="center">
            <button style="width: 100% !important;">${(user.userStatus!=0)?string("保存并提交审核","保存")}</button>
        </div>
    </form>
</div>
</body>
<script>
    $("textarea").on("input propertychange", function() {
        var $this = $(this),
                _val = $this.val(),
                count = "";
        if (_val.length > 200) {
            $this.val(_val.substring(0, 200));
        }
        count = 200 - $this.val().length;
        $(".length").text(count);
    });
</script>
</html>
