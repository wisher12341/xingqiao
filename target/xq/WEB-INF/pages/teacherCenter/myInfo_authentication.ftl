<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>实名认证</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <style>
        body{
            background-color: #f5f5f5;
        }
        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .info,.info_head{
            background-color: white;
            margin: 4px 0;
        }
        .info{
            height: 120px;
            padding-top: 30px;
        }
        .info_head{
            height: 200px;
            padding-top: 60px;
        }
        .text_p{
            font-size: 45px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            font-weight: bold;
        }
        .text_pp{
            font-size: 40px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            position: relative;
            top:5px;
        }
        .text_ppp{
            font-size: 35px;
            display: inline;
            float: right;
            position: relative;
            top:5px;
        }
        .icon_fa{
            /*position: relative;*/
            /*top: 5px;*/
            color: dimgrey;
        }
        .number{
            background-color: #20b49a;
            color: white;
            padding: 10px 20px;
            border-radius: 50%;
            font-weight: bold;
        }
    </style>
</head>
<body>


<div id="main">
<#--<form action="" method="post">-->
    <#--<div class="buttonDiv_info" onclick=location.href="${path}/wx/teacherCenter/${user.id}/changeIconPage" >-->
        <#--<div class="info_head row">-->
            <#--<div class="col-xs-3">-->
                <#--<p class="text_p"> 头像</p>-->
            <#--</div>-->
            <#--<div class="col-xs-8">-->
                <#--<img style="height: 150px;width: 150px;position: relative;top: -35px;"  src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle" onclick=location.href="${path}/wx/teacherCenter/${user.id}/changeIconPage">-->
            <#--</div>-->
            <#--<div class="col-xs-1">-->
                <#--<i class="fa fa-angle-right fa-4x icon_fa"></i>-->
            <#--</div>-->
        <#--</div>-->
    <#--</div>-->

    <div class="buttonDiv_info">
        <div class="info row" >
            <div class="col-xs-3">
                <p class="text_p"> 真实姓名</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"> ${(teacher.name)!'<span style="color:red;font-size:35px">未填写</span>'}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" >
            <div class="col-xs-3">
                <p class="text_p"> 证件号</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp"> ${(teacher.pid)!'<span style="color:red;font-size:35px">未填写</span>'}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/info/${uid}/idcard">
            <div class="col-xs-3">
                <p class="text_p"> 证件照</p>
            </div>
            <div class="col-xs-8">
                <p class="text_ppp"> ${(teacher.peoplePidUrl==0)?string('<span style="color:red">未上传</span>','')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info">
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/info/${uid}/school/${teacher.school}">
            <div class="col-xs-3">
                <p class="text_p"> 毕业院校</p>
            </div>
            <div class="col-xs-8">
                <p class="text_ppp">${(teacher.school==0)?string('<span style="color:red">未填写</span>','<span style="color:#a0a0a0">'+teacher.school+'条</span>')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/info/${uid}/award/${teacher.award}">
            <div class="col-xs-3">
                <p class="text_p"> 奖励荣誉</p>
            </div>
            <div class="col-xs-8">
                <p class="text_ppp">${(teacher.award==0)?string('<span style="color:red">未填写</span>','<span style="color:#a0a0a0">'+teacher.award+'条</span>')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/info/${uid}/certificate/${teacher.certificate}">
            <div class="col-xs-3">
                <p class="text_p"> 相关证书</p>
            </div>
            <div class="col-xs-8">
                <p class="text_ppp">${(teacher.certificate==0)?string('<span style="color:red">未填写</span>','<span style="color:#a0a0a0">'+teacher.certificate+'条</span>')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info">
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/info/${uid}/abstractTeacher/0">
            <div class="col-xs-3">
                <p class="text_p"> 简介</p>
            </div>
            <div class="col-xs-8">
                    <#if (teacher.abstractTeacher!)?length==0>
                        <p class="text_ppp">  <span style="color:red">未填写</span></p>
                    <#elseif (teacher.abstractTeacher!)?length gt 12>
                        <p class="text_pp">${teacher.abstractTeacher?substring(0,12)+"..."}</p>
                    <#else >
                        <p class="text_pp"> ${teacher.abstractTeacher}</p>
                    </#if>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" >
            <div class="col-xs-3">
                <p class="text_p"> 康复教龄</p>
            </div>
            <div class="col-xs-8">
                <p class="text_pp">${(teacher.experienceAge)!'<span style="color:red">未选择</span>'}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/info/${uid}/recoveryHis/${teacher.recoveryHis}">
            <div class="col-xs-3">
                <p class="text_p"> 康复经历</p>
            </div>
            <div class="col-xs-8">
                <p class="text_ppp">${(teacher.recoveryHis==0)?string('<span style="color:red">未填写</span>','<span style="color:#a0a0a0">'+teacher.recoveryHis+'条</span>')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/info/${uid}/successCase/${teacher.successCase}">
            <div class="col-xs-8">
                <p class="text_p"> 成功案例</p>
            </div>
            <div class="col-xs-3">
                <p class="text_ppp">${(teacher.successCase==0)?string('<span style="color:red">未填写</span>','<span style="color:#a0a0a0">'+teacher.successCase+'条</span>')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info">
        <div class="info row" onclick=location.href="${path}/wx/teacherCenter/info/${uid}/other_pic/${teacher.otherPic}">
            <div class="col-xs-3">
                <p class="text_p"> 其他资料</p>
            </div>
            <div class="col-xs-8">
                <p class="text_ppp">${(teacher.otherPic==0)?string('<span style="color:red">未填写</span>','<span style="color:#a0a0a0">'+teacher.otherPic+'条</span>')}</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>


</div>
</body>
</html>