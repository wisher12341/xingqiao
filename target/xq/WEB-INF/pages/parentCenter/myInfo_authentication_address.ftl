<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>实名认证</title>
    <meta charset="UTF-8">
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
        .info{
            background-color: white;
            margin: 4px 0;
            height: 120px;
            padding-top: 30px;
        }

        .text_p{
            font-size: 45px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            font-weight: bold;
        }
        .icon_fa{
            /*position: relative;*/
            /*top: 5px;*/
            color: dimgrey;
        }

        .title_input{
            font-size: 45px;
            border-style: none;
            color: dimgrey;
            position: relative;
            top:-6px;
        }
        .selectArea1{
            border-style: none;
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            padding-top: 5px;
            width: 100%;
            margin-left: 6px;
            color: dimgrey;
            opacity: 1
        }
        .selectArea2{
            border-style: none;
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            padding-top: 5px;
            width: 100%;
            color: dimgrey;
            opacity: 1;
        }
        .selectArea2No,.selectArea1No{
            border-style: none;
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            padding-top: 5px;
            width: 100%;
            color: #8c8c8c;
            opacity: 0.8;
            margin-left: 5px;
        }
        textarea{
            width: 100%;
            height: 15%;
            font-size: 45px;
            border-style: none;
            padding: 35px;
            resize: none;
            color: dimgrey;
        }
        .selectArea2{
            opacity: 0.5;
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
    </style>
</head>
<body>
<div id="main">
    <form action="/wx/parentCenter/info/${user.id}/address" method="post">
        <div class="buttonDiv_info">
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 地址</p>
                </div>
                <div class="col-xs-9">
                </div>
            </div>
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 省/市</p>
                </div>
                <div class="col-xs-8">
                <#if (parent.ground)?? && (parent.ground)!="">
                <select class="selectArea1 title_input" name="area1" >
                <#else >
                <select class="selectArea1No title_input" name="area1"onchange="area1Select()">
                    <option value="" style="display: none;" disabled selected>选择省/市</option>
                </#if>
                    <option value="上海">上海</option>
                </select>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 市/区</p>
                </div>
                <div class="col-xs-8" id="a2">
                <#if (parent.ground)?? && (parent.ground)!="">
                <select class="selectArea2 title_input" name="area2">
                    <#list area2 as a>
                        <option value="${a.name}">${a.name}</option>
                    </#list>
                <#else >
                    <select class="selectArea2No title_input" name="area2" onclick="alert('请先选择省/市')">
                        <option value="" style="display: none;" disabled selected>请选择市/区</option>
                    </select>
                </#if>
                </select>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
            <div class="info row" style="height:300px!important; ">
                <div class="col-xs-3" style="height:250px!important;">
                    <p class="text_p" style="position:relative;top: 50px"> 详细地址</p>
                </div>
                <div class="col-xs-9" style="height:250px!important; ">
                    <textarea placeholder="请输入详细地址,40字以内"  class="title_input" maxlength="40" name="address" style="padding-left: 20px;height: 100%">${(parent.address)!}</textarea>
                </div>
            </div>
        </div>
        <div class="foot" align="center">
            <input type="button" style="width: 100% !important;" value="${(user.userStatus!=0)?string("保存并提交审核","保存")}" onclick="val()"/>
        </div>
    </form>

</div>
</body>
<script>
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

    $(function () {
        $(function () {
        <#if ((parent.ground))?? && ((parent.ground))!="">
            $(".selectArea1 option").each(function () {
                if($(this).val()=="${(parent.ground)?split("-")[0]}"){
                    $(this).prop("selected","true");
                }
            });
            $(".selectArea2 option").each(function () {
                if($(this).val()=="${(parent.ground)?split("-")[1]}"){
                    $(this).prop("selected","true");
                }
            });
        </#if>

        });
    })

    function area1Select() {
        $(".selectArea1No").removeClass("selectArea1No").addClass("selectArea1");
        var $select=$('<select class="selectArea2No title_input" name="area2" onchange="area2Select()"></select>');
        $select.append($('<option value="" style="display: none;" disabled selected>请选择市/区</option>'));
    <#list (area2)! as item>
        $select.append($('<option value="${item.name}">${item.name}</option>'));
    </#list>
        $("#a2").html($select);
    }

</script>
</html>