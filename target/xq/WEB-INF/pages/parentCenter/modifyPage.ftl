<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>修改</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/parentCenter/parentCenter.js" type="text/javascript" ></script>
</head>
<body>
<div id="main">
    <div class="modifyDiv">
      <label for="input" class="control-label row">${modifyPageDto.uiName}：</label>
    <div>
    <#if modifyPageDto.fieldName=="gender">
        <div class="radio-input" style="font-size: 50px;margin-top: 10px">
            <input type="radio" name="optionsRadiosinline" value="0" style=" height: 50px;width: 50px;"> 男
            <input type="radio"  name="optionsRadiosinline" value="1" style=" height: 50px;width: 50px;"> 女
        </div>
    <#elseif modifyPageDto.fieldName=="ground">
        <div class="row">
            <div class="col-sm-6" >
                <select class="form-control" name="area1"  id="tGround_1_select" style="font-size: 50px ;height: 100px">
                    <option>上海市</option>
                </select>
            </div>
        </div>
        <div class="row" style="margin-top: 20px">
            <div class="col-sm-6" >
                <select class="form-control" name="area2" id="tGround_2_select" style="font-size: 50px ;height: 100px" onchange="tGround_2_change(this)">
                    <option ></option>
                     <#list area2List as area>
                        <option value="${(area.name)!}">${(area.name)!}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="row"  style="margin-top: 20px">
            <div class="col-sm-6">
                <select class="form-control" name="area3" id="tGround_3_select" style="font-size: 50px ;height: 100px">
                    <#list area2List as area2>
                            <#list area2.area3List as area3>
                                 <option value="${(area3.name)!}">${(area3.name)!}</option>
                            </#list>
                   </#list>
                </select>
            </div>
        </div>
        <div class="row" style="margin-top: 20px">
            <input type="text" class="form-control" id="addressInput" value="" >
        </div>
    <#elseif modifyPageDto.fieldName=="realName">
        <input type="text" class="form-control" id="input" value="${modifyPageDto.oldValue}" >
    <#else>
    <#if modifyPageDto.oldValue!="_null">
        <input type="text" class="form-control" id="input" value="${modifyPageDto.oldValue}" >
    <#else>
        <input type="text" class="form-control" id="input" value="" >
    </#if>

    </#if>
    </div>
    </div>
        <div class="saveBtn fa fa-save fa-4x" onclick="saveModify('${modifyPageDto.objId}','${modifyPageDto.fieldName}','${modifyPageDto.table}');"> 保存</div>




</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        if("${modifyPageDto.fieldName}"=="gender"){
            if("${modifyPageDto.oldValue}"=="男") $("input[name='optionsRadiosinline']").get(0).checked=true;
            else  $("input[name='optionsRadiosinline']").get(1).checked=true;
        }
        else if("${modifyPageDto.fieldName}"=="ground"){
            document.getElementById("addressInput").value="${modifyPageDto.oldValue}".split('_')[1];
            if("${modifyPageDto.oldValue}".split('_')[0]==""){
                document.getElementById("tGround_1_select").selectedIndex=-1;
                document.getElementById("tGround_2_select").selectedIndex=-1;
                document.getElementById("tGround_3_select").selectedIndex=-1;
            }
            $("#tGround_2_select option").each(function () {
                if("${modifyPageDto.oldValue}".indexOf($(this).val())!=-1){
                    $(this).prop("selected",true);
                    return;
                }
            });

            $("#tGround_3_select option").each(function () {
                if("${modifyPageDto.oldValue}".indexOf($(this).val())!=-1){
                    $(this).prop("selected",true);
                    return;
                }
            });

        }

    });

</script>