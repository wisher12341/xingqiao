<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>个人资料</title>
    <#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />

</head>
<body>
<div id="main">

    <div id="title">
        <p>我的资料</p>
    </div>
    <div class="imgDiv">
        <img src="../../../static/img/parentCenter/parentIcon.jpg" class="img-circle">
    </div>
    <div class="myInfoDiv">
        <div class="info-part-item">
        <p>基本信息</p>
        <ul class="list-group">
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">用户名</div>
                    <div class="list-item-text">${(user.userName)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">性别</div>
                    <#if user.gender==1>
                        <div class="list-item-text">女</div>
                    <#else>
                        <div class="list-item-text">男</div>
                    </#if>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>

            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">手机</div>
                    <div class="list-item-text">${(user.phone)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">邮箱</div>
                    <div class="list-item-text">${(user.email)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
        </ul>
    </div>
        <div class="info-part-item">
            <p>康复服务</p>
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="list-item-div">
                        <div class="list-item-title">康复类型</div>
                        <div class="list-item-text">${(teacher.domain)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div">
                        <div class="list-item-title">康复对象</div>
                        <div class="list-item-text">${(teacher.object)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div">
                        <div class="list-item-title">上门方式</div>
                        <div class="list-item-text">${(teacher.way)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>

                <li class="list-group-item">
                    <div class="list-item-div">
                        <div class="list-item-title">治疗师上门区域</div>
                        <div class="list-item-text">${(teacher.tGround)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div">
                        <div class="list-item-title">学生上门区域</div>
                        <div class="list-item-text">${(teacher.sGround)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>

            </ul>
        </div>
        <div class="info-part-item">
            <p>实名认证</p>
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="list-item-div">
                        <div class="list-item-title">真实姓名</div>
                        <div class="list-item-text">${(teacher.name)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                <div class="list-item-div">
                    <div class="list-item-title">身份证号</div>
                    <div class="list-item-text">${(teacher.pid)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
                <li class="list-group-item">
                    <div class="list-item-div">
                        <div class="list-item-title">毕业院校</div>
                        <div class="list-item-text">${(teacher.school)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div">
                        <div class="list-item-title">成功案例</div>
                        <div class="list-item-text">${(teacher.successCase)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>

            </ul>
        </div>

    </div>
</div>
</body>
</html>