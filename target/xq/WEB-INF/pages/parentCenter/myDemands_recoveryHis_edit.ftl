<#include "common/const.ftl" />

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
    <form action="<#if data??>/wx/parentCenter/mydemands/recoveryHis/${demandId}/${data.index}/edit<#else>/wx/parentCenter/mydemands/recoveryHis/${demandId}/add</#if>" method="post">
        <div class="buttonDiv_info">
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 机构名称</p>
                </div>
                <div class="col-xs-9">
                    <input placeholder="请输入康复机构名称，20字以内" type="text" class="title_input" maxlength="20" name="name"
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
                        <#if data??>
                            <input type="month" class="title_input" name="beginTime" value="${data.beginTime}" >
                        <#else >
                                <input type="text" class="title_input" name="beginTime" placeholder="请选择时间" onfocus="$(this).attr('type','month')">
                        </#if>
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
                        <#if data??>
                            <input  type="month" class="title_input" name="endTime" value="${data.endTime}" >
                        <#else >
                            <input type="text" class="title_input" name="endTime" placeholder="请选择时间" onfocus="$(this).attr('type','month')">
                        </#if>
                    </div>
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-4x icon_fa"></i>
                    </div>
                </div>
            </div>
                <div class="info row" >
                    <div class="col-xs-3">
                        <p class="text_p"> 康复内容</p>
                    </div>
                    <div class="col-xs-8">
                        <select class="selectXueli title_input" name="detail" onchange="$(this).css('color','dimgrey').css('opacity','1')">
                        <#if data??>
                                <option value="${data.detail}" style="display: none;">${data.detail}</option>
                        <#else >
                                <option value="" style="display: none;" disabled selected>选择康复内容</option>
                        </#if>
                            <option value="心理">心理</option>
                            <option value="言语">言语</option>
                            <option value="认知">认知</option>
                            <option value="听觉">听觉</option>
                            <option value="运动">运动</option>
                            <option value="情绪行为">情绪行为</option>
                        </select>
                    </div>
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-4x icon_fa"></i>
                    </div>
                </div>
                <div class="info row" >
                    <div class="col-xs-3">
                        <p class="text_p"> 康复频次</p>
                    </div>
                    <div class="col-xs-9">
                        <input placeholder="请输入数字" type="text" class="title_input" maxlength="20" name="count"
                    <#if data??>
                           value="${data.count}"
                    </#if>
                        >
                    </div>
                </div>
            </div>
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
