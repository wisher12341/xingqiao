<#include "order/common/const.ftl" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <#include "order/common/head.ftl" />
    <title>家长登录</title>
    <link href="${path}/static/css/login.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/login.js" type="text/javascript" ></script>
</head>
<body>
    头像：<img src="${info.headimgurl}">
    昵称:${info.nickname}
    性别:${info.sex}
</body>
</html>