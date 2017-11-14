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
        <div class="col-sm-3"><button type="button" id="backBtn" class="btn btn-default btn-lg btn-block" onclick=location.href="${path}/wx/parentCenter/${modifyPageDto.userId}/myInfo">返回</button></div>
        <div class="col-sm-6 titleText"><p>修改</p></div>
        <div class="col-sm-3"><button type="button" id="saveBtn" class="btn btn-default btn-lg btn-block" onclick="saveModify('${modifyPageDto.userId}','${modifyPageDto.fieldName}');">保存</button></div>
    </div>
    <div class="modifyDiv">
      <label for="input" class="col-sm-2 control-label">${modifyPageDto.uiName}</label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="input" value="${modifyPageDto.oldValue}" >
    </div></div>

</div>
</body>
</html>
