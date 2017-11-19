<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>个人资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/parentCenter/parentCenter.js" type="text/javascript" ></script>
</head>
<body>
<div id="main">
    <div id="title" class="row">
        <div class="col-sm-2" style="text-align: center"></div>
        <div class="col-sm-8 titleText"><p>康复史</p></div>
        <div class="col-sm-2" style="text-align: center">
            <#if recoveryHis??>
            <a id="saveBtn" class="fa fa-save fa-4x" onclick="modifyRecoveryHis(${demandId},${recoveryHis.index});">保存</a>
            <#else>
                <a id="saveBtn" class="fa fa-save fa-4x" onclick="addRecoveryHis(${demandId});">添加</a>
            </#if>
        </div>
    </div>
    <div class="demandModifyDiv">
    <label for="input" class="col-sm-4 control-label">历史康复机构</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="name" value="${(recoveryHis.name)!}" >
        </div>
    </div>
    <div class="demandModifyDiv">
        <label for="input" class="col-sm-4 control-label">康复起止时间</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="time" value="${(recoveryHis.time)!}" >
        </div>
    </div>
    <div class="demandModifyDiv">
        <label for="input" class="col-sm-4 control-label">康复频次(周)</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="count" value="${(recoveryHis.count)!}" >
        </div>
    </div>
    <div class="demandModifyDiv">
        <label for="input" class="col-sm-4 control-label">康复形式及康复内容</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="detail" value="${(recoveryHis.detail)!}" >
        </div>
    </div>

</div>
</body>
</html>
