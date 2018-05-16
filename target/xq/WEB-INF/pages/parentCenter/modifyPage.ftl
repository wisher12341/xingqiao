<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>修改</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/parentCenter/parentCenter.js" type="text/javascript" ></script>
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
    <form>

        <div class="" align="center" style="background-color: #20b49a;border-bottom: 1px solid #eee">
            <p class="title">${modifyPageDto.uiName}</p>
        </div>
        <#if modifyPageDto.fieldName=="gender">
            <input type="hidden" name="value" class="value">
            <div style="background-color: white;border-bottom: 1px solid #eee">
                <p class="gender" style="border-bottom: 1px solid #eee" onclick="saveModify2('${modifyPageDto.objId}','${modifyPageDto.fieldName}','${modifyPageDto.table}','1');">男${((modifyPageDto.oldValue)?? && modifyPageDto.oldValue=="男")?string("<span class='fa fa-check'></span>","")}</p>
                <p class="gender" onclick="saveModify2('${modifyPageDto.objId}','${modifyPageDto.fieldName}','${modifyPageDto.table}','2');">女${((modifyPageDto.oldValue)?? && modifyPageDto.oldValue=="女")?string("<span class='fa fa-check'></span>","")}</p>
            </div>
        <#else>
            <div class="buttonDiv_info" align="center">
                <div class="info" align="center">
                    <input name="value" type="text" class="title_input" maxlength="20" value="${modifyPageDto.oldValue!}">
                </div>
            </div>
            <div class="foot" align="center">
                <button style="width: 100% !important;" onclick="saveModify('${modifyPageDto.objId}','${modifyPageDto.fieldName}','${modifyPageDto.table}');"> 保存</button>
            </div>
        </#if>
    </form>


    <#--<div class="modifyDiv">-->
      <#--<label for="input" class="control-label row">${modifyPageDto.uiName}：</label>-->
    <#--<div>-->

    <#--<#if modifyPageDto.fieldName=="gender">-->
        <#--<div class="radio-input" style="font-size: 50px;margin-top: 10px">-->
            <#--<input type="radio" name="optionsRadiosinline" value="0" style=" height: 50px;width: 50px;"> 男-->
            <#--<input type="radio"  name="optionsRadiosinline" value="1" style=" height: 50px;width: 50px;"> 女-->
        <#--</div>-->
    <#--<#elseif modifyPageDto.fieldName=="ground">-->
        <#--<div class="row">-->
            <#--<div class="col-sm-6" >-->
                <#--<select class="form-control" name="area1"  id="tGround_1_select" style="font-size: 50px ;height: 100px">-->
                    <#--<option>上海市</option>-->
                <#--</select>-->
            <#--</div>-->
        <#--</div>-->
        <#--<div class="row" style="margin-top: 20px">-->
            <#--<div class="col-sm-6" >-->
                <#--<select class="form-control" name="area2" id="tGround_2_select" style="font-size: 50px ;height: 100px" onchange="tGround_2_change(this)">-->
                    <#--<option ></option>-->
                     <#--<#list area2List as area>-->
                        <#--<option value="${(area.name)!}">${(area.name)!}</option>-->
                    <#--</#list>-->
                <#--</select>-->
            <#--</div>-->
        <#--</div>-->
        <#--<div class="row"  style="margin-top: 20px">-->
            <#--<div class="col-sm-6">-->
                <#--<select class="form-control" name="area3" id="tGround_3_select" style="font-size: 50px ;height: 100px">-->
                    <#--<#list area2List as area2>-->
                            <#--<#list area2.area3List as area3>-->
                                 <#--<option value="${(area3.name)!}">${(area3.name)!}</option>-->
                            <#--</#list>-->
                   <#--</#list>-->
                <#--</select>-->
            <#--</div>-->
        <#--</div>-->
        <#--<div class="row" style="margin-top: 20px">-->
            <#--<input type="text" class="form-control" id="addressInput" value="" >-->
        <#--</div>-->
    <#--<#elseif modifyPageDto.fieldName=="realName">-->
        <#--<input type="text" class="form-control" id="input" value="${modifyPageDto.oldValue}" >-->
    <#--<#else>-->
    <#--<#if modifyPageDto.oldValue!="_null">-->
        <#--<input type="text" class="form-control" id="input" value="${modifyPageDto.oldValue}" >-->
    <#--<#else>-->
        <#--<input type="text" class="form-control" id="input" value="" >-->
    <#--</#if>-->

    <#--</#if>-->
    <#--</div>-->
    <#--</div>-->




</div>
</body>
</html>
<#--<script type="text/javascript">-->
    <#--$(document).ready(function () {-->
        <#--if("${modifyPageDto.fieldName}"=="gender"){-->
            <#--if("${modifyPageDto.oldValue}"=="男") $("input[name='optionsRadiosinline']").get(0).checked=true;-->
            <#--else  $("input[name='optionsRadiosinline']").get(1).checked=true;-->
        <#--}-->
        <#--else if("${modifyPageDto.fieldName}"=="ground"){-->
            <#--document.getElementById("addressInput").value="${modifyPageDto.oldValue}".split('_')[1];-->
            <#--if("${modifyPageDto.oldValue}".split('_')[0]==""){-->
                <#--document.getElementById("tGround_1_select").selectedIndex=-1;-->
                <#--document.getElementById("tGround_2_select").selectedIndex=-1;-->
                <#--document.getElementById("tGround_3_select").selectedIndex=-1;-->
            <#--}-->
            <#--$("#tGround_2_select option").each(function () {-->
                <#--if("${modifyPageDto.oldValue}".indexOf($(this).val())!=-1){-->
                    <#--$(this).prop("selected",true);-->
                    <#--return;-->
                <#--}-->
            <#--});-->

            <#--$("#tGround_3_select option").each(function () {-->
                <#--if("${modifyPageDto.oldValue}".indexOf($(this).val())!=-1){-->
                    <#--$(this).prop("selected",true);-->
                    <#--return;-->
                <#--}-->
            <#--});-->

        <#--}-->

    <#--});-->

<#--</script>-->