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
    <div id="select">
        <button onclick="$('#select').hide();$('#accountBind').show()">已有账号，登录</button>
        <a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx41aea10976e1038a&redirect_uri=http%3A%2F%2Fwww.yoocr.com%2Fwx%2fcallback%2Fnew&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect">新用户登录</a>
    </div>

    <div id="accountBind" style="display: none" align="center">
            <form action="${path}/wx/login" method="post">
                <div class="group">
                    <span class="la">账号：</span><input type="text" name="username" class="textInput" placeholder="username"/>
                </div>
                <div class="group">
                    <span class="la">密码：</span><input type="password" name="password" class="textInput" placeholder="password"/>
                </div>
                    <div class="group">
                        <span style="color: red;text-align: center">${message!}</span>
                    </div>
                <input type="hidden" name="openid" value="${openid!}">
                <%--<input type="hidden" name="openid" value="12341234">--%>
                <input type="submit" value="登录"  class="submit">
            </form>
    </div>
</body>
</html>