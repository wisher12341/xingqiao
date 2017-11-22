<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>康复史</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/parentCenter/parentCenter.js" type="text/javascript" ></script>
</head>
<body>
<div id="main">
    <div class="demandModifyDiv" style="margin-top: 40px">
    <label for="input" class="row control-label">历史康复机构</label>
        <div class="row">
            <input type="text" class="form-control" id="name" value="${(recoveryHis.name)!}" >
        </div>
    </div>
    <div class="demandModifyDiv">
        <label for="input" class="row control-label">康复起止时间</label>
        <div class="row">
            <input type="text" class="form-control" id="time" value="${(recoveryHis.time)!}" >
        </div>
    </div>
    <div class="demandModifyDiv">
        <label for="input" class="row control-label">康复频次(周)</label>
        <div class="row">
            <input type="text" class="form-control" id="count" value="${(recoveryHis.count)!}" >
        </div>
    </div>
    <div class="demandModifyDiv">
        <label for="input" class="row control-label">康复形式及康复内容</label>
        <div class="row">
            <input type="text" class="form-control" id="detail" value="${(recoveryHis.detail)!}" >
        </div>
    </div>
    <div class="saveBtn"style="text-align: center;padding: 40px">
        <#if recoveryHis??>
        <button class="btn btn-block btn-default fa fa-save fa-4x" onclick="modifyRecoveryHis(${demandId},${recoveryHis.index});"> 保存</button></div>
        <#else>
            <button class="btn btn-block btn-default fa fa-save fa-4x" onclick="addRecoveryHis(${demandId});"> 保存</button></div>
        </#if>

</div>
</body>
</html>
