<!DOCTYPE html>
<#assign base=request.contextPath />
<html style="height: 100%">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>
    <title>星桥</title>
    <script type="text/javascript" src="${base}/static/js/common/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="${base}/static/bootstrap/js/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${base}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${base}/static/css/jcy.css">
    <link rel="stylesheet" href="${base}/static/css/teacher/slider.css">
    <link href='${base}/static/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
    <link href='${base}/static/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <script src='${base}/static/fullcalendar/moment.min.js'></script>
    <script src='${base}/static/fullcalendar/fullcalendar.js'></script>
    <script src='${base}/static/js/teacher/autoresize.js'></script>
    <script src="http://twemoji.maxcdn.com/twemoji.min.js"></script>
    <link rel="stylesheet" href="${base}/static/font-awesome-4.7.0/css/font-awesome.min.css" />
    <style>
        #calendar_month,#calendar_day {
            max-width: 900px;
            margin: 0 auto;
            z-index: 10000;
            background-color: #ffffff;
            padding: 0.5rem 1.6rem 6rem 1.6rem;
            height: 100%;
            transition:all 0.3s ease-in;
            line-height: 1.4rem;
            position: fixed;
            overflow-y: hidden;
            bottom: 0;
            left: 0;
            width: 100%;
        }
        .fc-toolbar.fc-header-toolbar{
            margin-bottom: 0rem;
        }
        .fc-center > h2 {
            font-size: 1.6rem;
            line-height: 3rem;
        }
        .close-time{
            text-align: right;
            padding: 0.8rem;
            font-size: 2rem;
            color: #888888;
        }
        .fc-widget-header {
            padding: 0.6rem 0rem;
        }
        .fc-view-container{
            margin-top: 1rem;
        }
        .teacher-name-title{
            font-size: 1.4rem;
            color: #000000;
        }
        #remark{
            appearance: none;
            -webkit-appearance: none;   /*去除chrome浏览器的默认下拉图片*/
            -moz-appearance: none;  /*去除Firefox浏览器的默认下拉图片*/
            border: 0.1rem solid #aaaaaa;
        }
        .padding-5-10{
            padding: 5px 10px;
        }
        body{
            background-color: #f5f5f5;
        }
        .circle{
            position: relative;
            left: 30px;
            /*padding-top:10px;*/
            /*padding-bottom: 5px;*/
        }
        .icon_fa{
            /*position: relative;*/
            /*top: 5px;*/
            color: dimgrey;
        }
        .text_detail{
            color: dimgrey;
            font-size: 15px;
            /*margin-left: 10px;*/
            /*margin-bottom: 15px;*/
        }
        .text_p{
            font-size: 16px;
            display: inline;
            color: dimgrey;
            /*font-weight: bold;*/
            position: relative;
            top:10px;
            left: 24px;
            padding-bottom: 10px;
        }
    </style>
</head>
<body style="height: 100%;" id="emoji">
<div id="base" class="base" style="height: 100%;">
    <div class="my-panel" style="min-height: 20rem;margin-top: 0!important;" >
        <div class="row" style="height: 100%">
            <div class="col-xs-5 text-center" style="height: 12rem;">
                <img src="${(teacher.headimgurl?contains("wx.qlogo.cn")?string("${teacher.headimgurl}","/${teacher.headimgurl}"))!}" onerror='this.src="${base}/static/img/touxiang.svg;this.onerror=null"' class="headimg-lg">
            </div>
            <div class="col-xs-7" style="padding-left: 0rem">
                <div class="teacher-name-title">${teacher.name!"暂无"}</div>
                <div class="row my-panel-content offset-5">
                    <div class="col-xs-12 inline-wrapper" style="justify-content: flex-start">
                    <#if teacher.level??>
                        <#if teacher.level==1>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#elseif teacher.level==2>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#elseif teacher.level==3>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#elseif teacher.level==4>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#elseif teacher.level==5>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#else>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                            <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        </#if>
                    <#else>
                        <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        <img class="level-star" src="${base}/static/img/star-empty.png"/>
                        <img class="level-star" src="${base}/static/img/star-empty.png"/>
                    </#if>
                    <#--${teacher.level!"暂无(星级)"}-->
                    </div>
                    <div class="offset-5 col-xs-12 no-padding-right" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;${teacher.experienceAge!"0"} 年经验</div>
                </div>

                <div class="row my-panel-content offset-5">
                    <div class="col-xs-4 no-padding-right" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;实名</div>
                    <div class="col-xs-3 no-padding" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;学历</div>
                    <div class="col-xs-3 no-padding" style="color: #4cae4c"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;认证</div>
                </div>
                <div class="my-panel-content offset-5">
                <#--康复经验：${teacher.experienceAge!"0"} 年-->
                <#--<br>-->
                    康复项目：${teacher.domain!"暂无"}
                    <br>
                    康复对象：${teacher.object!"暂无"}
                </div>
            </div>

            <div class="col-xs-12 my-panel-content offset-10">


            <#if teacher.way??>
                <table class="table" style="margin-bottom: 10px;border-top: 1px solid #dddddd;">
                    <thead>
                    <tr>
                        <th class="col-xs-3">授课方式</th>
                        <th class="col-xs-4">价格 (元/课时)</th>
                        <th class="col-xs-5">服务区域</th>
                    </tr>
                    </thead>
                    <#assign teacherways=teacher.way?split("、")>
                    <tbody style="border-bottom: 1px solid #dddddd;color: #000000">
                        <#if teacherways[0] == "不限">
                            <#if (teacher.priceO)! gt 0>
                            <tr>
                                <td>在线授课</td>
                                <td>${(teacher.priceO)!}</td>
                                <td></td>
                            </tr>
                            </#if>
                            <#if (teacher.priceS)! gt 0>
                            <tr>
                                <td>学生上门</td>
                                <td>${(teacher.priceS)!}</td>
                                <td>${(teacher.sGround)!}</td>
                            </tr>
                            </#if>
                            <#if (teacher.priceT)! gt 0>
                            <tr>
                                <td>治疗师上门</td>
                                <td>${(teacher.priceT)!}</td>
                                <td>${(teacher.tGround)!}</td>
                            </tr>
                            </#if>
                        <#else>
                            <#list teacherways as str>
                            <tr>
                                <td>${str}</td>
                                <#if str=="在线授课" && teacher.priceO gt 0>
                                    <td>${(teacher.priceO)!}</td>
                                    <td></td>
                                <#elseif str=="学生上门" && teacher.priceS gt 0>
                                    <td>${(teacher.priceS)!}</td>
                                    <td>${(teacher.tGround)!}</td>
                                <#elseif str=="治疗师上门" && teacher.priceT gt 0>
                                    <td>${(teacher.priceT)!}</td>
                                    <td>${(teacher.sGround)!}</td>
                                </#if>
                            </tr>
                            </#list>
                        </#if>
                    </tbody>
                </table>
                <div class="col-xs-12 no-padding offset-5 text-right">
                    注：该治疗师每个课时时长为 ${teacher.period!"??"} 分钟
                </div>
            <#else>
                <div class="my-panel-content row">
                    <div class="col-xs-12">
                        暂无
                    </div>
                </div>
            </#if>
            </div>
        </div>
    </div>

    <div class="my-panel">
        <div class="my-panel-title">治疗师简介</div>
        <div class="gray-line"></div>
        <div class="my-panel-content">${teacher.abstractTeacher!"暂无"}</div>
    </div>

    <div class="my-panel">
        <div class="my-panel-title">毕业院校</div>
        <div class="gray-line"></div>
        <div class="my-panel-content">
        <#list (teacher.teacherInfoSchoolList)! as school>
            <div style="background-color: white;position: relative;right: 15px" >
                <#if school_index==0>
                    <div class="row" style="height: 2%;">
                    </div>
                </#if>
                <div class="row" style="position: relative; ">
                    <div class="col-xs-1 circle">
                        <i class="fa fa-circle-thin fa-1x icon_fa"></i>
                    </div>
                    <div class="col-xs-8" style="position: absolute;left:55px">
                        <p class="text_detail"> ${school.startTime}<span style="color: white;border-top: 1px solid dimgrey;padding: 10px;margin: 10px;position: relative;top: 20px;">a</span>${school.endTime}</p>
                    </div>
                </div>
                <div class="row" style="height: 35px;">
                    <div class="col-xs-1" style="${school_has_next?string('border-left:2px solid #ccc;','')}height: 100%;position: relative;left: 50px">
                        <p style="color: white">aa</p>
                    </div>
                    <div class="col-xs-5">
                        <p class="text_p">${school.schoolName}</p>
                    </div>
                </div>
                <div class="row" style="height: 4%;">
                    <div class="col-xs-1" style="${school_has_next?string('border-left:2px solid #ccc;','')}height: 100%;position: relative;left: 50px">
                        <p style="color: white">aa</p>
                    </div>
                    <div class="col-xs-10" style="margin-left: 20px;">
                        <p class="text_detail" style="padding-left:5px;color: #a0a0a0;margin-bottom: 0px!important;padding-bottom: 5px;${school_has_next?string('border-bottom:1px solid #ccc;','')}">${school.education}<span style="font-size: 25px;font-weight: bold;padding: 4px;position: relative;top: 2px">·</span>${school.major}</p>
                    </div>
                </div>
                <#if school_has_next>
                    <div class="row" style="border-left:2px solid #ccc;height: 10px;position: relative;left: 50px;width: 70%">
                        <span style="color: white">dd</span>
                    </div>
                </#if>
            </div>
        </#list>
        </div>
    </div>
    <div class="my-panel">
        <div class="inline-wrapper pointable" onclick=<#if (teacher.recoveryHis)??>location.href="/wx/teacher/${teacher.id}/info/recoveryHis"<#else>alert("该治疗师尚未填写")</#if>>
            <div class="my-panel-title">康复治疗经历</div>
            <div class="glyphicon glyphicon-chevron-right" style="color: #999"></div>
        </div>
        <div class="gray-line"></div>
        <div class="inline-wrapper pointable" onclick=<#if (teacher.recoveryHis)??>location.href="/wx/teacher/${teacher.id}/info/successCase"<#else>alert("该治疗师尚未填写")</#if>>
            <div class="my-panel-title">成功案例</div>
            <div class="glyphicon glyphicon-chevron-right" style="color: #999"></div>
        </div>
        <div class="gray-line"></div>
        <div class="inline-wrapper pointable" onclick=location.href="/wx/teacherCenter/${teacher.userId}/mySchedule/parent">
            <div class="my-panel-title">工作时间表</div>
            <div class="glyphicon glyphicon-chevron-right" style="color: #999"></div>
        </div>
    </div>

    <div class="my-panel">
        <div class="inline-wrapper pointable" onclick="location='${base}/wx/teacher/toTeacherCommentList?teacherId=${teacher.id}'">
            <div class="my-panel-title">治疗师评论 (${teacher.commentList?size})</div>
            <div class="glyphicon glyphicon-chevron-right" style="color: #999"></div>
        </div>
        <div class="gray-line"></div>
        <div class="my-panel-content container line-height-24">
        <#assign good=usergoodreport.teacherCommentGood>
        <#assign report=usergoodreport.teacherCommentReport>
        <#if teacher.commentList??>
            <#if teacher.commentList?size gt 0>
                <#assign comm=teacher.commentList[0]>
                <div class="row row-wrapper">
                    <div class="col-xs-2 no-padding">
                        <img class="headimg" src='${comm.user.headimgurl?contains("wx.qlogo.cn")?string("${(comm.user.headimgurl)!}","/${(comm.user.headimgurl)!}")}'/>
                    </div>
                    <div class="col-xs-10">
                        <div>
                            <div class="user-name">${comm.user.username!""}</div>
                            <div class="comment-content" onclick="location='${base}/wx/teacher/toTeacherCommentSingle?cid=${comm.id}&tid=${teacher.id}'">
                                <#if comm.detail?length gt 40>
                                    <#assign s=comm.detail>
                                    <div class="comment-detail">
                                    ${comm.detail?substring(0,40)}……
                                    </div>
                                    <a onclick="showFullComment('${s}',this)">全文</a>
                                    <a onclick="showBriefComment('${s}',this)" style="display: none">收起</a>
                                <#else>
                                ${comm.detail}
                                </#if>
                            </div>
                        </div>
                        <div class="time">
                        ${comm.time}
                        </div>
                        <div class="comment-btns inline-wrapper">
                            <div class="btn-pill" onclick="reply(${comm.id})"><span class="glyphicon glyphicon-pencil btn-pill-icon-left"></span>回复</div>
                            <#if good?contains("#${comm.id}#")>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',1,this)"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',0,this)" style="display: none"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                            <#else>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',1,this)" style="display: none"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',0,this)"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                            </#if>
                            <#if report?contains("#${comm.id}#")>
                                <div class="btn-pill">已举报</div>
                                <div class="btn-pill" style="display: none" onclick="changeCount(1,'${comm.id}',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报</div>
                            <#else>
                                <div class="btn-pill" style="display: none">已举报</div>
                                <div class="btn-pill" onclick="changeCount(1,'${comm.id}',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报</div>
                            </#if>
                        </div>


                    </div>

                </div>
                <hr style="margin: 0.4rem -1.4rem;">
            </#if>
            <#if teacher.commentList?size gt 1>
                <#assign comm=teacher.commentList[1]>
                <div class="row row-wrapper">
                    <div class="col-xs-2 no-padding">
                        <img class="headimg" src='${comm.user.headimgurl?contains("wx.qlogo.cn")?string("${(comm.user.headimgurl)!}","/${(comm.user.headimgurl)!}")}'/>
                    </div>
                    <div class="col-xs-10">
                        <div>
                            <div class="user-name">${comm.user.username!""}</div>
                            <div class="comment-content" onclick="location='${base}/wx/teacher/toTeacherCommentSingle?cid=${comm.id}&tid=${teacher.id}'">
                                <#if comm.detail?length gt 40>
                                    <#assign s=comm.detail>
                                    <div class="comment-detail">
                                    ${comm.detail?substring(0,40)}……
                                    </div>
                                    <a onclick="showFullComment('${s}',this)">全文</a>
                                    <a onclick="showBriefComment('${s}',this)" style="display: none">收起</a>
                                <#else>
                                ${comm.detail}
                                </#if>
                            </div>
                        </div>
                        <div class="time">
                        ${comm.time}
                        </div>
                        <div class="comment-btns inline-wrapper">
                            <div class="btn-pill" onclick="reply(${comm.id})"><span class="glyphicon glyphicon-pencil btn-pill-icon-left"></span><span>回复</div>
                            <#if good?contains("#${comm.id}#")>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',1,this)"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',0,this)" style="display: none"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                            <#else>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',1,this)" style="display: none"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',0,this)"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                            </#if>
                            <#if report?contains("#${comm.id}#")>
                                <div class="btn-pill">已举报</div>
                                <div class="btn-pill" style="display: none" onclick="changeCount(1,'${comm.id}',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报</div>
                            <#else>
                                <div class="btn-pill" style="display: none">已举报</div>
                                <div class="btn-pill" onclick="changeCount(1,'${comm.id}',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报</div>
                            </#if>
                        </div>


                    </div>

                </div>
                <hr style="margin: 1.4rem -1.4rem;">
            </#if>
            <#if teacher.commentList?size gt 2>
                <#assign comm=teacher.commentList[2]>
                <div class="row row-wrapper">
                    <div class="col-xs-2 no-padding">
                        <img class="headimg" src='${comm.user.headimgurl?contains("wx.qlogo.cn")?string("${(comm.user.headimgurl)!}","/${(comm.user.headimgurl)!}")}'/>
                    </div>
                    <div class="col-xs-10">
                        <div>
                            <div class="user-name">${comm.user.username!""}</div>
                            <div class="comment-content" onclick="location='${base}/wx/teacher/toTeacherCommentSingle?cid=${comm.id}&tid=${teacher.id}'">
                                <#if comm.detail?length gt 40>
                                    <#assign s=comm.detail>
                                    <div class="comment-detail">
                                    ${comm.detail?substring(0,40)}……
                                    </div>
                                    <a onclick="showFullComment('${s}',this)">全文</a>
                                    <a onclick="showBriefComment('${s}',this)" style="display: none">收起</a>
                                <#else>
                                ${comm.detail}
                                </#if>
                            </div>

                        </div>
                        <div class="time">
                        ${comm.time}
                        </div>
                        <div class="comment-btns inline-wrapper">
                            <div class="btn-pill" onclick="reply(${comm.id})"><span class="glyphicon glyphicon-pencil btn-pill-icon-left"></span>回复</div>
                            <#if good?contains("#${comm.id}#")>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',1,this)"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',0,this)" style="display: none"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                            <#else>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',1,this)" style="display: none"><span class="glyphicon glyphicon-heart btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                                <div class="btn-pill" onclick="changeCount(0,'${comm.id}',0,this)"><span class="glyphicon glyphicon-heart-empty btn-pill-icon-left"></span><span>赞(<span class="count">${comm.good}</span>)</span></div>
                            </#if>
                            <#if report?contains("#${comm.id}#")>
                                <div class="btn-pill">已举报</div>
                                <div class="btn-pill" style="display: none" onclick="changeCount(1,'${comm.id}',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报</div>
                            <#else>
                                <div class="btn-pill" style="display: none">已举报</div>
                                <div class="btn-pill" onclick="changeCount(1,'${comm.id}',0,this)"><span class="glyphicon glyphicon-bell btn-pill-icon-left"></span>举报</div>
                            </#if>
                        </div>


                    </div>

                </div>
                <hr style="margin: 1.4rem -1.4rem;">
            </#if>
        </#if>
        </div>
    </div>

    <div style="height: 6rem; width: 100%">
    </div>

    <!-- 预约 -->
    <div>
        <div class="bottom-single-btn mobile-nav-taggle" id="mobile-nav-taggle">
            <a href="#" style="color: #ffffff">
                立即预约</a>
        </div>
        <div id="mobile-menu-order" class="mobile-nav mobile-menu-bottom visible-xs visible-sm hide-nav-bottom">
            <div class="container">
                <div class="slider-header">
                    <button type="button" class="close mobile-close-taggle">
                        &times;
                    </button>

                    <div id="myModalLabel">
                        预约
                    </div>
                </div>
                <hr style="margin-top: 0rem; margin-bottom: 1.2rem">
                <div class="slider-body" id="divContent">
                    <div class="form-group container" style="overflow-y: scroll">
                        <div>
                            <div class="text-left">上门方式：</div>
                            <div id="ways" class="row offset-10">
                            </div>
                        </div>
                        <div class="offset-20">
                            <div class="text-left">康复项目：</div>
                            <div id="domains" class="row offset-10">
                            </div>
                        </div>
                        <div class="offset-20">
                            <div class="text-left">需求简历：</div>
                            <div id="demands" class="row offset-10">
                            </div>
                        <#--<select id="waySelect"></select>-->
                        <#--<select id="demandSelect"></select>-->
                        </div>
                        <div class="offset-20">
                            <div class="text-left">排课方式：</div>
                            <div id="timeOption" class="row offset-10">
                                <div class="col-xs-4 padding-10"><div class="timeOption border-pill-active border-pill" data-timeopt="day">指定日期</div></div>
                                <div class="col-xs-4 padding-10"><div class="timeOption border-pill" data-timeopt="week">每周重复</div></div>
                            </div>
                        </div>
                        <div class="offset-20">
                            课程数量：
                            <span class="amount_button" id="subBtn"><img style="width: 2rem;margin:0rem 1rem;" src="${base}/static/img/sub.svg"/></span>
                            <span id="countSpan" >1</span>
                            <span class="amount_button" id="addBtn"><img style="width: 2rem;margin:0rem 1rem;" src="${base}/static/img/add.svg"/></span>
                        </div>

                    <#--<div class="offset-20">-->
                    <#--<div class="text-left">服务时间：</div>-->
                    <#--<div id="time_div">-->
                    <#--<div class="time-choose-div">-->
                    <#--<img onclick="selectTime($(this))" style="width:2.5rem;margin-left: 1rem;" src="${base}/static/img/calendar.svg"/>-->
                    <#--<span class="serviceTime" style="margin-left: 1rem;"></span>-->
                    <#--</div>-->
                    <#--</div>-->
                    <#--</div>-->

                        <div class="offset-20">
                            <div class="text-left">备注：</div>
                            <br><textarea id="remark" style="margin-top:2px;width:99%;"></textarea>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
            <div class="bottom-multiple-btn inline-wrapper">
                <div style="padding-left: 5%; color: #b47400">
                    总价：<span id="sumSpan"></span>元
                </div>
                <button class="bottom-btn-item" style="width: 30%" onclick="toSelectTime()">
                    选择时间
                </button>
            </div>
            <form id="toSelectTimeForm" action="${base}/wx/teacher/toSelectTime" method="post">
                <input hidden name="teacherId"/>
                <input hidden name="teacher.userId"/>
                <input hidden name="teacher.id"/>
                <input hidden name="teacher.name"/>
                <input hidden name="demandId"/>
                <input hidden name="way"/>
                <input hidden name="recoverOb"/>
                <input hidden name="remark"/>
                <input hidden name="totalpay"/>
                <input hidden name="amount"/>
                <input hidden name="isFirst"/>
                <input hidden name="timeOpt"/>
            </form>
        </div>
    </div>
    <div class="mask" id="maskbehind" style="z-index:9998;display: none"></div>
    <div class="mask" id="mask" style="z-index:10000;display: none"></div>
    <div id="calendar_month" class="hide-nav-bottom"></div>
    <div id="calendar_day" class="hide-nav-bottom"></div>

    <!--举报-->
    <div id="mobile-menu-report" class="mobile-nav mobile-menu-bottom-sm visible-xs visible-sm hide-nav-bottom" style="height: 100%;">
        <textarea class="my-textarea" style="height: 100%;" placeholder="举报理由" name="reason"></textarea>
        <input type="hidden" name="cid" >
        <button class="bottom-single-btn" style="border: none; background-color: #EE2C2C;width: 50%;" onclick="doreport()">
            举报
        </button>
        <button class="bottom-single-btn" style="border: none; background-color: cornflowerblue;width: 50%;left: 50%;"
                onclick="javascript:$('#mobile-menu-report').addClass('hide-nav-bottom').removeClass('show-nav-bottom');">
            取消
        </button>
    </div>




</div>
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                请先添加需求简历
            </div>
            <div class="modal-footer">
                <input type="button" onclick="$('#modal').modal('hide')" class="btn" value="取消" style="width:45%;background-color: orange!important;color: white!important;font-size: 18px!important;"/>
                <input type="buttont" class="btn btn-primary" value="前往" style="width:45%;background-color: #20b49a!important;font-size: 18px!important;border-color: white!important;"  onclick=location.href="/wx/parentCenter/${(user.id)!}/addDemandPage">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

</body>
</html>
<script>
    var waySelect = null;
    var domainSelect = null;
    var demandSelect = null;
    var editTimeDiv = null;
    var timeOpt = "day";
    var weekArray = new Array("周日", "周一", "周二", "周三", "周四", "周五", "周六");
    if(waySelect=="治疗师上门"){
        $("#sumSpan").html(parseFloat("${(teacher.priceT)!}")*parseFloat($("#countSpan").html()));
    }else if(waySelect=="学生上门"){
        alert("${(teacher.priceS)!}");
        $("#sumSpan").html(parseFloat("${(teacher.priceS)!}")*parseFloat($("#countSpan").html()));
    }else if(waySelect=="在线授课"){
        $("#sumSpan").html(parseFloat("${(teacher.priceO)!}")*parseFloat($("#countSpan").html()));
    }else{
        $("#sumSpan").html("0");
    }
    twemoji.parse(document.getElementById('emoji'), {size: 36});
    var original = document.documentElement.clientHeight;
    window.addEventListener("resize", function() {
        var resizeHeight = document.documentElement.clientHeight;
        if(resizeHeight != original) {
            $('.bottom-multiple-btn').css('display', 'none');
        } else {
            $('.bottom-multiple-btn').css('display', '');
        }
    });
    $(".mobile-nav-taggle,#mobile-nav-taggle").click(function () {
        if("${user!"no"}"!='no') {
            if('${(user.userStatus)!}'!='2') {
                alert('${(user.userStatusDesc)!}');
                return;
            }
        } else{
            alert('您还没有登录，请前往登录');
            location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx41aea10976e1038a&redirect_uri=http%3A%2F%2Fwww.yoocr.com%2Fwx%2fcallback%2Fopenid%2Fparent&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
        }
        var mobileMenu = $(this).next(".mobile-menu-bottom");//上拉框是下一个节点
        if (mobileMenu.hasClass("hide-nav-bottom")) {
            makeOrder(mobileMenu);
        }
        else {
            setTimeout(function (){
                mobileMenu.addClass("hide-nav-bottom").removeClass("show-nav-bottom");
            }, 100)
        }
    });
    $(".mobile-close-taggle").click(function () {
        var mobileMenu = $(this).parents(".mobile-nav");
        if (mobileMenu.hasClass("hide-nav-bottom")) {
            setTimeout(function () {
                mobileMenu.addClass("show-nav-bottom").removeClass("hide-nav-bottom");
            }, 100)
        }
        else {
            setTimeout(function (){
                mobileMenu.addClass("hide-nav-bottom").removeClass("show-nav-bottom");
            }, 100);
        }
    });
    $('.border-pill').click(pillClick);
    function pillClick() {
        $(this).addClass("border-pill-active");
        if ($(this).hasClass("way")){
            waySelect = $(this).text().trim();
        } else if ($(this).hasClass("domain")){
            domainSelect = $(this).text().trim();
        } else if ($(this).hasClass("demand")) {
            demandSelect = $(this).data("first").split("#")[0];
            var isFirst = $(this).data("first").split("#")[1];
            if (isFirst == "yes") {
                //该简历 第一次交易
                $(".amount_button").unbind("click");
                $("#countSpan").html("1");
                setLessonAmountBtns(true);
            } else {
                setLessonAmountBtns(false);
            }
        }
        var sib = new Array();
        sib = $(this).parent().siblings().children(".border-pill-active");
        $.each(sib, function(key, val) {
            $(val).removeClass("border-pill-active");
        });
        calculateSum();
    }
    function calculateSum() {
        if(waySelect=="治疗师上门"){
            $("#sumSpan").html(parseFloat("${(teacher.priceT)!}")*parseFloat($("#countSpan").html()));
        }else if(waySelect=="学生上门"){
            $("#sumSpan").html(parseFloat("${(teacher.priceS)!}")*parseFloat($("#countSpan").html()));
        }else if(waySelect=="在线授课"){
            $("#sumSpan").html(parseFloat("${(teacher.priceO)!}")*parseFloat($("#countSpan").html()));
        }else{
            $("#sumSpan").html("0");
        }
    }
    function showFullComment(str,ele) {
        ele.previousElementSibling.innerText = str;
        ele.nextElementSibling.style.display = "";
        ele.style.display = "none";
    }
    function showBriefComment(str,ele) {
        ele.previousElementSibling.previousElementSibling.innerText = str.substr(0,60) + "……";
        ele.previousElementSibling.style.display = "";
        ele.style.display = "none";
    }
    function reply(pid) {
        window.location.href="${base}/wx/teacher/toReply?teacherId=${teacher.id}&pid=" +pid;
    }
    var o;//用于存储当前被举报的 评论的 button
    //    g_r： 0赞  1举报      id:评论Id     type： 0增加点赞、举报   1取消点赞
    function changeCount(g_r,id,type,obj){
        if(type==0){
            //增加点赞、举报
            if(g_r==0) {
                //点赞
                $.ajax({
                    method: 'POST',
                    url: '${base}/wx/goodreport/add',
                    data: {
                        type: g_r,
                        cid: id,
                        flag: 1 //0表示  机构评论   1表示治疗师评论
                    },
                    success: function (data) {
                        var count = $(obj).find(".count").html();
                        count = parseInt(count) + 1;
                        $(obj).find(".count").html(count);
                        $(obj).find(".glyphicon").removeClass("glyphicon-heart-empty").addClass("glyphicon-heart");
                        $(obj).attr("onclick", "changeCount(0," + id + ",1,this)");
                    }
                });
            }else{
                //举报
                $("#mobile-menu-report textarea[name='reason']").val("");
                $("#mobile-menu-report input[name='cid']").val(id);
                $("#mobile-menu-report").addClass("show-nav-bottom").removeClass("hide-nav-bottom");;
                o=obj;
            }
        }else{
            //取消点赞
            $.ajax({
                method: 'POST',
                url: '${base}/wx/goodreport/del',
                data: {
                    cid: id,
                    flag: 1 //0表示  机构评论   1表示治疗师评论
                },
                success: function (data) {
                    var count = $(obj).find(".count").html();
                    count = parseInt(count) - 1;
                    $(obj).find(".count").html(count);
                    $(obj).find(".glyphicon").removeClass("glyphicon-heart").addClass("glyphicon-heart-empty");
                    $(obj).attr("onclick", "changeCount(0," + id + ",0,this)");
                }
            });
        }
    }
    function doreport() {
        $.ajax({
            method: 'POST',
            url: '${base}/wx/goodreport/add',
            data: {
                type: 1,
                cid: $("input[name='cid']").val(),
                flag: 1, //0表示  机构评论   1表示治疗师评论
                reason:$("textarea[name='reason']").val()
            },
            success: function (data) {
                $(o).html("已举报");
                $(o).attr("onclick","");
                $("#mobile-menu-report").addClass("hide-nav-bottom").removeClass("show-nav-bottom");
            }
        });
    }
    function makeOrder(mobileMenu) {
        $.ajax({
            method: 'POST',
            url: '${base}/wx/parentCenter/isexisted',
            data: {
                'teacherId':${teacher.id}
            },
            xhrFields: {
                withCredentials: true
            },
            crossDomain: true,
            success:function (data) {
                if (data.success == true) {
                    //'已完成个人资料'-->预约,分为第一次预约和第二次购买。
                    $('#domains').html("");
                    var domains ="${teacher.domain}".split("、");
                    if(domains[0]=='不限') {
                        domains = ['言语', '听觉', '认知', '情绪行为', '运动', '心理'];
                    }
                    var $option=$('<div class="col-xs-4 padding-5-10"><div class="domain border-pill border-pill-active">'+domains[0]+'</div></div>');
                    $('#domains').append($option);
                    for(var i=1;i<domains.length;i++){
                        $option=$('<div class="col-xs-4 padding-5-10"><div class="domain border-pill">'+domains[i]+'</div></div>');
                        $('#domains').append($option);
                    }
                    domainSelect = domains[0];
                    $('#ways').html("");
                    var ways = "${teacher.way}".split("、");
                    if(ways[0]=='不限') {
                        ways = ['治疗师上门', '学生上门', '在线授课'];
                    }
                    $option=$('<div class="col-xs-4 padding-5-10"><div class="way border-pill border-pill-active">'+ways[0]+'</div></div>');
                    $('#ways').append($option);
                    for(var i=1;i<ways.length;i++){
                        $option=$('<div class="col-xs-4 padding-5-10"><div class="way border-pill">'+ways[i]+'</div></div>');
                        $('#ways').append($option);
                    }
                    waySelect = ways[0];
                    var demands = data.data;
                    if(demands.length<1){
                        $("#modal").modal();
                        return;
                    }
                    $("#demands").html("");
                    $option=$('<div class="col-xs-4 padding-5-10"><div class="demand border-pill border-pill-active" data-first="' + demands[0].id+'#'+demands[0].first + '">'+demands[0].name+'</div></div>');
                    $('#demands').append($option);
                    demandSelect=demands[0].id;
                    for(var i=1;i<demands.length;i++){
                        $option=$('<div class="col-xs-4 padding-5-10"><div class="demand border-pill" data-first="' + demands[i].id+'#'+demands[i].first + '">'+demands[i].name+'</div></div>');
                        $('#demands').append($option);
                    }
                    var isFirst=$("#demands > .col-xs-4 > .border-pill-active").data("first").split("#")[1];
                    //该简历 第一次交易
                    setLessonAmountBtns(isFirst=="yes");
                    $(".border-pill").bind("click", pillClick);
                    calculateSum();
                    mobileMenu.addClass("show-nav-bottom").removeClass("hide-nav-bottom");
                    $("#divContent").children(".container").height($("#mobile-menu-order").height()-120);
                    return true;
                } else {
                    //$('#noInf_Modal').modal();
                    alert("请先完善用户信息");
                    location.reload();
                    return false;
                }
                return false;
            }
        });
    }
    function subtract_function() {
        if($('#countSpan').html()!=1) {
            $('#countSpan').html(parseFloat($('#countSpan').html()) - 1);
            $('#sumSpan').html(parseFloat($('#countSpan').html()*(parseFloat($("#sumSpan").html())/(parseFloat($('#countSpan').html())+1))));
        }
    }
    function add_function() {
        $('#countSpan').html(parseFloat($('#countSpan').html()) + 1);
        $('#sumSpan').html(parseFloat($('#countSpan').html()*(parseFloat($("#sumSpan").html()/($('#countSpan').html()-1)))));
    }
    function remind_cannot_change_amount() {
        alert("第一次只能选择一节课哦~");
    }
    function toSelectTime() {
        var isFirst=$(".amount_button:disabled").size();
        if(isFirst>0){
            isFirst=1;
        }
        if (isNaN($('#countSpan').html())){
            alert("显示错误，请刷新页面");
            return;
        }
        if (prepareOrderInfo(isFirst)){
            $("#toSelectTimeForm").submit();
        } else {
            alert("请先完善订单信息");
        }
    }
    function prepareOrderInfo(isFirst) {
        var amount = parseInt($('#countSpan').html());
        if (timeOpt != null && amount > 0){
            $("input[name='teacher.userId']").val(${teacher.userId});
            $("input[name='teacherId']").val(${teacher.id});
            $("input[name='teacher.id']").val(${teacher.id});
            $("input[name='teacher.name']").val("${teacher.name}");
            $("input[name='demandId']").val($(".demand.border-pill-active").data("first").split("#")[0]);
            $("input[name='way']").val(waySelect);
            $("input[name='recoverOb']").val(domainSelect);
            $("input[name='remark']").val($('#remark').val());
            $("input[name='totalpay']").val($('#sumSpan').html());
            $("input[name='amount']").val(amount);
            $("input[name='isFirst']").val(isFirst);
            $("input[name='timeOpt']").val($(".timeOption.border-pill-active").data("timeopt"));
            return true;
        }
        return false;
    }
    function setLessonAmountBtns(isFirstOrder) {
        if (isFirstOrder){
            $("#addBtn > img").attr("src","${base}/static/img/add-disabled.svg");
            $("#subBtn > img").attr("src","${base}/static/img/sub-disabled.svg");
            $("#addBtn").bind("click",remind_cannot_change_amount);
            $("#subBtn").bind("click",remind_cannot_change_amount);
        } else {
            $("#addBtn > img").attr("src","${base}/static/img/add.svg");
            $("#subBtn > img").attr("src","${base}/static/img/sub.svg");
            $("#addBtn").bind("click",add_function);
            $("#subBtn").bind("click",subtract_function);
        }
    }
</script>