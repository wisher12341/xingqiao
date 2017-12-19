<#include "common/const.ftl" />

<html>
<head>
    <title>消息中心</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myMessages.css" type="text/css" rel="stylesheet" />
    <script src="${path}/static/js/parentCenter/parentCenter.js" type="text/javascript" ></script>
</head>
<body>
<div id="main">
    <div class="info-header">
        <div class="info-header-img col-sm-4">
            <img src="${user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}")}" class="img-circle">
        </div>
        <div class="col-sm-7">
            <div class="row">
                <div class="col-sm-11">
                    <p class="info-header-name">${(name)!}</p>
                </div>
                <div class="col-sm-1">
                    <div class="i1"><a href="${path}/wx/parentCenter/${user.id}/myInfo"><span><i class="fa fa-angle-right fa-5x"  style="color:white;display: inline"></i></span></a></div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-10">
                    <p class="info-header-other" style="font-size: 40px">
                   </p>
                </div>
                <div class="col-sm-2">
                    <div class="i2" style="margin-top: 40px"><a href="${path}/wx/parentCenter/${user.id}/myMessages"><span><i class="fa fa-envelope-o fa-5x"  style="color:white;display: inline"></i></span></a></div>
                </div>
            </div>
        </div>
    </div>
    <div style="background-color: #e6ece3">
            <#list messages as m>
         <div class="row" style="background-color: white;margin-bottom: 20px;font-size: 40px;padding: 30px;margin: 0">
             <div class="col-sm-11">
                ${(m.message)!}
                <p>${(m.time)!}</p>
             </div>
             <div class="col-sm-1>
                 <span style="display:inline;margin-bottom: 10px" onclick="deleteMessage(${m.id})"><i class="fa fa-trash-o fa-2x" style="color: indianred"></i></span>
             </div>
         </div>
            </#list>

    </div>
</div>
</body>

</html>