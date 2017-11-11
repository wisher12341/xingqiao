<#include "common/const.ftl" />
<html>
<head>
    <title>个人资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="main">

    <div id="title">
        <p>简历详情</p>
    </div>

    <div>
        <ul class="list-group">
            <li class="list-group-item">id: ${(demand.id)!}</li>
            <li class="list-group-item">姓名：${(demand.name)!}</li>
        </ul>
    </div>
</div>
</body>
</html>