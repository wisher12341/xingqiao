<#include "common/const.ftl" />

<html>
<head>
    <title>个人资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myMessages.css" type="text/css" rel="stylesheet" />

</head>
<body>
<div id="main">

    <div id="title" class="row">
        <div class="col-sm-2" style="text-align: center"><a id="backBtn" class="fa fa-mail-reply fa-4x" href="${path}/wx/parentCenter"></a></div>
        <div class="col-sm-8 titleText"><p>消息中心</p></div>
        <div class="col-sm-2"></div>
    </div>

    <div>
        <ul class="list-group">
            <#list messages as m>
            <li class="list-group-item">
                ${(m.message)!}
                <p>${(m.time)!}</p>
            </li>
            </#list>
        </ul>
    </div>
</div>
</body>
</html>