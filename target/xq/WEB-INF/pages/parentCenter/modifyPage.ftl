<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>个人资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/parentCenter/parentCenter.js" type="text/javascript" ></script>
</head>
<body>
<div id="main">
    <div id="title" class="row">
        <div class="col-sm-2" style="text-align: center"><a id="backBtn" class="fa fa-mail-reply fa-4x" href="${path}/wx/parentCenter/${modifyPageDto.objId}/myInfo"></a></div>
        <div class="col-sm-8 titleText"><p>修改</p></div>
        <div class="col-sm-2" style="text-align: center"><a id="saveBtn" class="fa fa-save fa-4x" onclick="saveModify('${modifyPageDto.objId}','${modifyPageDto.fieldName}');"></a></div>
    </div>
    <div class="modifyDiv">
      <label for="input" class="col-sm-2 control-label">${modifyPageDto.uiName}</label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="input" value="${modifyPageDto.oldValue}" >
    </div></div>

</div>
</body>
</html>
