<#include "common/const.ftl" />
<html>
<head>
    <title>简历详情</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myDemands.css" type="text/css" rel="stylesheet" />
    <style>
        .text_p {
            font-size: 45px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            font-weight: bold;
        }
        .text_pp {
            font-size: 40px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            position: relative;
            top: 5px;
        }

    </style>
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
                    <div class="i1"><a href="${path}/wx/teacherCenter/${user.id}/myInfo"><span><i class="fa fa-angle-right fa-5x"  style="color:white;display: inline"></i></span></a></div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-10">
                    <p class="info-header-other" style="font-size: 40px">
                 </p>
                </div>
                <div class="col-sm-2">
                    <div class="i2" style="margin-top: 40px"><a href="${path}/wx/teacherCenter/${user.id}/myMessages"><span><i class="fa fa-envelope-o fa-5x"  style="color:white;display: inline"></i></span></a></div>
                </div>
            </div>
        </div>
    </div>
    <div class="myInfoDiv">
        <div style="height: 30px;background-color: #f5f5f5"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p  style="color: #20b49a">基本信息</p>
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="row list-item-div">
                        <div class="col-xs-3 text_p">姓名 </div>
                        <div class="col-xs-8 text_pp">${(demand.name)!}</div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="row list-item-div">
                        <div class="col-xs-3 text_p">性别 </div>
                        <#if demand.gender??>
                        <#if demand.gender==1>
                            <div class="col-xs-8 text_pp">女</div>
                        <#else>
                            <div class="col-xs-8 text_pp">男</div>
                        </#if>
                        </#if>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="row list-item-div">
                        <div class="col-xs-3 text_p">出生日期 </div>
                        <div class="col-xs-8 text_pp">${(demand.birthday)!}</div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="row list-item-div">
                        <div class="col-xs-3 text_p">诊断报告 </div>
                        <div class="col-xs-8 text_pp">${(demand.report)!}</div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="row list-item-div">
                        <div class="col-xs-3 text_p">病史 </div>
                        <div class="col-xs-8 text_pp">${(demand.diseaseHis)!}</div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="row list-item-div">
                        <div class="col-xs-3 text_p">过敏史 </div>
                        <div class="col-xs-8 text_pp">${(demand.allergyHis)!}</div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="row list-item-div">
                        <div class="col-xs-3 text_p">备注 </div>
                        <div class="col-xs-8 text_pp">${(demand.remark)!}</div>
                    </div>
                </li>
            </ul>
        </div>
        <div style="height: 30px;background-color: #f5f5f5"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p  style="color: #20b49a">康复史</p>
            <#if recoveryHisList??>
            <table class="table recoveryHis-table table-striped">
                <thead>
                <tr>
                    <th>历史康复机构</th>
                    <th>康复起止时间</th>
                    <th>康复频次(周)</th>
                    <th>康复形式及康复内容</th>
                </tr>
                </thead>
                <tbody> <#list recoveryHisList as recoveryHis>
                <tr>
                    <td>
                        <div>
                            <span>${recoveryHis.name}</span>
                        </div>
                    </td>
                    <td>
                        <div>
                            <span>${recoveryHis.beginTime}-${recoveryHis.endTime}</span>
                        </div>
                    </td>
                    <td>
                        <div>
                            <span>${recoveryHis.count}</span>
                        </div>
                    </td>
                    <td>
                        <div>
                            <span>${recoveryHis.detail}</span>
                        </div>
                    </td>

                </tr>

                </#list>

                </tbody>
            </table>
            <#else>
                <div style="text-align: center"><p style="color: #1a1a1a">该患者还没有添加过康复史。</p></div>
            </#if>

        </div>

        <div style="height: 30px;background-color: #f5f5f5"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p  style="color: #20b49a">康复日志</p>
            <div class="track-list" style="width: 100%; margin-bottom: 20px;background-color: white">
                <ul id="logUl">
                <#list recoveryLogList as log>
                    <li style=" list-style-type: none;">
                        <div>
                            <#if log_index==0>
                                <span class="glyphicon glyphicon-record" style="margin-left: -7px; color: red;font-size: 40px"></span>
                            <#else>
                                <span class="glyphicon glyphicon-record" style="margin-left: -7px; color: #e8e8e8;font-size: 40px"></span>
                            </#if>
                            <span class="date" style="margin-left: 20px">${log.time}
                                </span>
                            <div class="txt" >
                                ${log.content}
                            </div>
                        </div>
                    </li>
                </#list>
                </ul>
            </div>
        </div>

    </div>
</body>
</html>