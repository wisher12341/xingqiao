<#include "common/const.ftl" />

<html>
<head>
    <title>个人资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />


</head>
<body>
<div id="main">
    <#if messages??>
        <div style="background-color: #e6ece3">
            <#list messages as m>
                <div style="background-color: white;margin-bottom: 20px;font-size: 40px;padding: 30px">
                ${(m.message)!}
                    <p>${(m.time)!}</p>
                </div>
            </#list>
        </div>
        <#else >
            <div class="row" style="margin-top: 100px;width: 100%">
                <div class="col-xs-2">
                </div>
                <div class="col-xs-2">
                    <img src="/static/img/kong.png" width="150">
                </div>
                <div class="col-xs-6">
                    <p style="font-size: 45px;color: dimgrey;font-weight: bold">您当天没有安排</p>
                    <p style="font-size: 38px;color: grey">可点击日历上标记的日期查看该天安排</p>
                </div>
            </div>
    </#if>

</div>
</body>
</html>