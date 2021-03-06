<#include "common/const.ftl" />
<html>
<head>
    <title>家长中心</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="/static/css/fakeLoader.css" type="text/css" rel="stylesheet" />
    <script src="/static/js/fakeLoader.min.js" type="text/javascript"></script>
    <style>
        .icon_mid{
            font-size: 60px;
            padding:20px 0 8px;
            color: #20b49a;
        }
        .text_mid{
            font-size: 45px;
            color: dimgrey;
        }
        .text_div{
            margin-bottom: 15px;
        }
        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .info{
            background-color: white;
            margin: 4px 0;
            height: 7%;
            padding: 20px 40px;
        }
        .text_p{
            font-size: 45px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
        }
        .icon_fa{
            position: relative;
            top: 5px;
            color: dimgrey;
        }
        .userstatus{
            font-size: 35px;
            margin-left: 10px;
        }
        .glyphicon-exclamation-sign,.glyphicon-record,.glyphicon-ok-circle,.glyphicon-remove-circle{
            font-size: 35px;
            margin-top: 30px;
            position: relative;
            top:3px;
        }
        .cog{
            position: absolute;
            top:-10%;
            right: -15%;
        }
        .glyphicon-cog{
            font-size: 40px;
            position: relative;
            top:3px;
         }
        .glyphicon-user{
            color: #20b49a!important;
        }
        .text_my{
            color: #20b49a!important;
        }
        a{
            text-decoration:none;
        }
        .text_ppp{
            font-size: 45px;
            display: inline;
            float: right;
            position: relative;
            top:2px;
            color: orange;!important;
        }
        .getInfo{
            text-align: center;
            font-size: 45px;
            color: white;
            margin-top: 65%;
        }
        .spinner6{
            height: 60px!important;
            width: 150px!important;
            top:35% !important;
        }
        .spinner6 > div{
            width: 12px!important;
        }
        .btn{
            width: 49.4%;
            height: 80px;
        }
        .modal-dialog{
            margin-top: 150px;
        }
        .modal-body{
            font-size: 45px!important;
            color: dimgrey;!important;
        }
    </style>
    <link rel="stylesheet" href="/static/css/style.css"/>
    <script  src="/static/js/index.js"></script>
</head>
<body style="${(new??)?string("background-color: #20b49a","background-color: #f5f5f5")}">
<#if new??>
<#--<div id="facebook" style="margin-top: 60%">-->
    <#--<div class="bar"></div>-->
    <#--<div class="bar"></div>-->
    <#--<div class="bar"></div>-->
<#--</div>-->
<h1 class="loadingtext" style="margin-top: 60%">
    <span>正</span>
    <span>在</span>
    <span>读</span>
    <span>取</span>
    <span>微</span>
    <span>信</span>
    <span>资</span>
    <span>料</span>
</h1>
<script>
    setTimeout(function(){
        $(".loadingtext").hide();
        $("body").css("background-color","#f5f5f5");
        $("#main").show();
    },2000);
</script>
</#if>
<div id="main" style="${(new??)?string("display:none","")}">
    <div class="info-header">
        <div class="info-header-img col-sm-4">
            <img src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle">
        </div>
        <div class="col-sm-7">
            <div class="row">
                <div class="col-sm-11">
                    <p class="info-header-name"><span>
                        <#if (parent.realName)?? && (parent.realName)!="">
                            ${parent.realName}
                        <#else >
                            ${(user.nickname)!}
                        </#if>
                    </span>
                  </p>
                        <#if user.userStatus==0>
                            <i class="glyphicon glyphicon-exclamation-sign" style="color: orange"></i><span class="userstatus" style="color: orange">个人资料未认证</span>
                        <#elseif user.userStatus==1 || user.userStatus==3>
                            <i class="glyphicon glyphicon-record" style="color: burlywood"></i><span class="userstatus" style="color:  burlywood">个人资料正在审核中</span>
                        <#elseif user.userStatus==2>
                            <i class="glyphicon glyphicon-ok-circle" style="color: #dff0d8"></i><span class="userstatus" style="color: #dff0d8">个人资料已通过认证</span>
                        <#elseif user.userStatus==4>
                            <i class="glyphicon glyphicon-remove-circle" style="color:red;"></i><span class="userstatus" style="color:red;">个人资料未通过认证</span>
                        </#if>
                </div>
                <div class="cog">
                    <div class="i1" onclick=location.href="${path}/wx/login/setting/0"><i class="glyphicon glyphicon-cog"  style="color:white;display: inline"></i><span style="font-size: 40px;color: white;margin-left: 5px">设置</span></div>
                </div>
            </div>
        </div>
    </div>



    <div style="background-color: white; border-bottom: 1px solid #ccc;" align="center">
            <div class="row" style="width: 95%">
                <div class="col-xs-4" onclick=location.href="/wx/parentCenter/${user.id}/myDemands">
                    <div>
                        <span class="glyphicon glyphicon-heart icon_mid"></span>
                    </div>
                    <div class="text_div">
                        <span class="text_mid">我的需求</span>
                    </div>
                </div>

                <div class="col-xs-4" onclick=location.href="parentCenter/${user.id}/myTeacher">
                    <div>
                        <span class="fa fa-users icon_mid"></span>
                    </div>
                    <div class="text_div">
                        <span class="text_mid">我的治疗师</span>
                    </div>
                </div>

                <div class="col-xs-4">
                    <div>
                        <span class="fa fa-line-chart icon_mid"></span>
                    </div>
                    <div class="text_div">
                        <span class="text_mid">我的数据</span>
                    </div>
                </div>
            </div>
    </div>

    <div class="buttonDiv_info">
        <div class="info row" onclick=location.href="/wx/parentCenter/${user.id}/myInfo_base">
                <div class="col-xs-1">
                    <i class="fa fa-user-circle fa-4x icon_fa"></i>
                </div>
                <div class="col-xs-10">
                    <p class="text_p"> 基本资料</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
        </div>
        <div class="info row" onclick=location.href="/wx/parentCenter/${user.id}/myInfo_authentication" >
            <div class="col-xs-1">
                <i class="fa fa-id-card fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 实名认证</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info" >
        <div class="info row" onclick=location.href="/wx/parentCenter/${user.id}/myComments">
            <div class="col-xs-1">
                <i class="fa fa-envelope-o fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-9">
                <p class="text_p"> 评价中心</p>
            </div>
            <div class="col-xs-1">
                <p class="text_ppp"><span style="font-weight: bold">${number.commentNumber}</span></p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row" onclick=location.href="/wx/parentCenter/${user.id}/myMessages">
            <div class="col-xs-1">
                <i class="fa fa-pencil-square-o fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-9">
                <p class="text_p"> 消息中心</p>
            </div>
            <div class="col-xs-1">
                <p class="text_ppp"><span style="font-weight: bold">${number.messageNumber}</span></p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>

    <div class="buttonDiv_info" >
        <div class="info row">
            <div class="col-xs-1">
                <i class="fa fa-exclamation-circle fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 问题反馈</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row">
            <div class="col-xs-1">
                <i class="fa fa-heart fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 帮助中心</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
        <div class="info row">
            <div class="col-xs-1">
                <i class="glyphicon glyphicon-star fa-4x icon_fa"></i>
            </div>
            <div class="col-xs-10">
                <p class="text_p"> 关于星桥</p>
            </div>
            <div class="col-xs-1">
                <i class="fa fa-angle-right fa-4x icon_fa"></i>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                您有<span style="padding: 15px;color: red;font-size: 50px">${needCkeckLogNum}</span>条康复日志需要确认！
            </div>
            <div class="modal-footer">
                    <input type="button" onclick="$('#delModal').modal('hide')" class="btn" value="取消" style="background-color: orange!important;color: white!important;font-size: 40px!important;"/>
                    <input type="buttont" class="btn btn-primary" value="前往确认" style="background-color: #20b49a!important;font-size: 40px!important;border-color: white!important;"  onclick="location.href='${path}/wx/log/index'">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<#if (needCkeckLogNum) &gt;0>
<script>
    $('#delModal').modal();
</script>
</#if>

</body>
</html>
