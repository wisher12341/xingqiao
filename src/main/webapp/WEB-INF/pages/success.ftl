<#include "order/common/const.ftl" />
<html>
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <#include "order/common/head.ftl" />
    <link rel="stylesheet" href="${path}/static/css/jcy.css">
</head>
<body style="text-align: center">
<div style="margin: 0 auto;position: relative;top: 25%;">
    <img src="${path}/static/img/order/smile.svg" style="width:40%">
    <div style="font-size: 5rem;">${content}</div>
    <button class="offset-20 btn-usual" onclick="location='${path}${url}'">返回</button>
</div>

</body>
</html>
