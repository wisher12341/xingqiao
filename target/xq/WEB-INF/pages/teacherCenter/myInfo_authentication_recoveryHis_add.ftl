<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>康复经历</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <script src="/static/js/datePicker.js" ></script>
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
        .foot input{
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
    <form action="<#if data??>/wx/teacherCenter/info/${user.id}/recoveryHis/${index}/edit<#else>/wx/teacherCenter/info/${user.id}/recoveryHis/add</#if>" method="post">
        <div class="buttonDiv_info">
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 单位名称</p>
                </div>
                <div class="col-xs-9">
                    <input placeholder="请输入所在单位名称，20字以内" type="text" class="title_input" maxlength="20" name="rec.name" style="width: 100%;<#if qetype?? && qetype=="query">opacity: 1!important;color: #111!important;</#if>" <#if qetype?? && qetype=="query">disabled</#if>
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
                        <input type="text" id="demo1" class="title_input" name="rec.startTime" value="${data.startTime}" <#if qetype?? && qetype=="query">disabled style="opacity: 1!important;color: dimgrey!important;"</#if>>
                    <#else >
                        <input type="text" id="demo1" class="title_input" name="rec.startTime" placeholder="请选择时间">
                    </#if>
                    </div>
<#if parent?? && parent=="1">
<#else >
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-4x icon_fa"></i>
                    </div>
</#if>
                </div>
                <div class="info row" >
                    <div class="col-xs-3">
                        <p class="text_p"> 结束时间</p>
                    </div>
                    <div class="col-xs-8">
                    <#if data??>
                        <input type="text" id="demo2" class="title_input" name="rec.endTime" value="${data.endTime}" <#if qetype?? && qetype=="query">disabled style="opacity: 1!important;color: dimgrey!important;"</#if>>
                    <#else >
                        <input type="text" id="demo2" class="title_input" name="rec.endTime" placeholder="请选择时间" >
                    </#if>
                    </div>
<#if parent?? && parent=="1">
<#else >
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-4x icon_fa"></i>
                    </div>
</#if>
                </div>
            </div>
        </div>

        <div class="buttonDiv_info" style="background-color: white">
            <textarea class="textarea" placeholder="描述您曾任职期间的具体教学内容，科研成果" name="rec.detail" <#if qetype?? && qetype=="query">disabled style="opacity: 1!important;color: #111!important;" </#if>><#if data??>${data.detail}</#if></textarea>
<#if parent?? && parent=="1">
<#else >
            <p class="length">
            <#if data??>
                ${200-(data!)?split("@")[1]?length}
            <#else >
                200
            </#if>
            </p>
</#if>
        </div>

        <#if parent?? && parent=="1">
        <#else >
            <div class="foot" align="center">
                <input style="width: 100% !important;" value="${(user.userStatus!=0)?string("保存并提交审核","保存")}" type="button" onclick="val()" />
            </div>
        </#if>

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
    function val() {
        var flag=0;
        $(".title_input").each(function () {
            if($.trim($(this).val())==""){
                flag=1;
            }
        });
        if(flag==0){
            $("form").submit();
        }else{
            alert("资料未填写完整");
        }
    }

    var calendar = new datePicker();
    calendar.init({
        'trigger': '#demo1', /*按钮选择器，用于触发弹出插件*/
        'type': 'ym',/*模式：date日期；datetime日期时间；time时间；ym年月；*/
        'minDate':'1900-1-1',/*最小日期*/
        'maxDate':'2100-12-31',/*最大日期*/
        'onSubmit':function(){/*确认时触发事件*/
            var theSelectData=calendar.value;
        },
        'onClose':function(){/*取消时触发事件*/
        }
    });
    var calendar2 = new datePicker();
    calendar2.init({
        'trigger': '#demo2', /*按钮选择器，用于触发弹出插件*/
        'type': 'ym',/*模式：date日期；datetime日期时间；time时间；ym年月；*/
        'minDate':'1900-1-1',/*最小日期*/
        'maxDate':'2100-12-31',/*最大日期*/
        'onSubmit':function(){/*确认时触发事件*/
            var theSelectData=calendar.value;
        },
        'onClose':function(){/*取消时触发事件*/
        }
    });

    $("#demo1").focus(function(){
        document.activeElement.blur();
    });
    $("#demo2").focus(function(){
        document.activeElement.blur();
    });
</script>
</html>
