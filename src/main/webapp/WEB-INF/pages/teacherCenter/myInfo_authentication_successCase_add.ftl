<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>成功案例</title>
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
        }
        .length{
            background-color: white;
            font-size: 35px;
            color: #a0a0a0;
            text-align: right;
            width: 100%;
            padding-right: 50px;
        }
    </style>
</head>
<body>


<div id="main">
    <form action="<#if data??>/wx/teacherCenter/info/${user.id}/successCase/${index}/edit<#else>/wx/teacherCenter/info/${user.id}/successCase/add</#if>" method="post">
        <div class="buttonDiv_info">
            <div class="info row" >
                <div class="col-xs-2">
                    <p class="text_p"> 标题</p>
                </div>
                <div class="col-xs-9">
                    <input placeholder="请输入标题，20字以内" name="title" type="text" class="title_input" maxlength="20" <#if qetype?? && qetype=="query">disabled style="opacity: 1!important;color: #111!important;"</#if>
                        <#if data??>
                            value="${(data!)?split("@")[0]}"
                        </#if>
                    >
                </div>
            </div>
        </div>

        <div class="buttonDiv_info" style="background-color: white">
            <textarea class="textarea" placeholder="描述您的成功案例" name="detail" <#if qetype?? && qetype=="query">disabled style="opacity: 1!important;color: #111!important;"</#if>><#if data??>${(data!)?split("@")[1]}</#if></textarea>
<#--<#if qetype?? && qetype=="edit">-->
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
<#--<#if qetype?? && qetype=="edit">-->
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
        if($.trim($(".title_input").val())=="" || $.trim($(".textarea").val())==""){
            alert("资料未填写完整");
        }else{
            $("form").submit();
        }
    }
</script>
</html>
