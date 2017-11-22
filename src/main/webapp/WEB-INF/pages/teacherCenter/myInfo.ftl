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
                <div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/${"姓名"}/${teacher.name!}/${"name"}/modifyPage">
                    <div class="list-item-title">用户名</div>
                    <div class="list-item-text">${(teacher.name)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div" onclick=location.href="${path}/wx/teacherCenter/${user.id}/${"性别"}/${user.gender!}/${"gender"}/modifyPage">
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
                <div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/${"手机"}/${user.phone!}/${"phone"}/modifyPage">
                    <div class="list-item-title">手机</div>
                    <div class="list-item-text">${(user.phone)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/${"邮箱"}/${user.email!}/${"email"}/modifyPage">
                    <div class="list-item-title">邮箱</div>
                    <div class="list-item-text">${(user.email)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/${"毕业院校"}/${teacher.school!}/${"school"}/modifyPage">
                    <div class="list-item-title">毕业院校</div>
                    <div class="list-item-text" id="school">${teacher.school}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
        </ul>
    </div>
        <div class="info-part-item">
            <p>康复服务</p>
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/teacherCenter/${user.id}/${"康复类型"}/${teacher.domain!}/${"domain"}/modifyPage">
                        <div class="list-item-title">康复类型</div>
                        <div class="list-item-text">${(teacher.domain)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/${"康复对象"}/${teacher.object!}/${"object"}/modifyPage">
                        <div class="list-item-title">康复对象</div>
                        <div class="list-item-text">${(teacher.object)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/teacherCenter/${user.id}/${"上门方式"}/${teacher.way!}/${"way"}/modifyPage">
                        <div class="list-item-title">上门方式</div>
                        <div class="list-item-text">${(teacher.way)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>

                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/teacherCenter/${user.id}/${"治疗师上门区域"}/${teacher.tGround!}/${"tGround"}/modifyPage">
                        <div class="list-item-title">治疗师上门区域</div>
                        <div class="list-item-text">${(teacher.tGround)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/teacherCenter/${user.id}/${"学生上门区域"}/${teacher.sGround!}/${"sGround"}/modifyPage">
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
                <div class="list-item-div" onclick=location.href="${path}/wx/teacherCenter/${user.id}/${"身份证号"}/${teacher.pid!}/${"pid"}/modifyPage">
                    <div class="list-item-title">身份证号</div>
                    <div class="list-item-text">${(teacher.pid)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
                <li class="list-group-item">
                    <div class="list-item-div">
                        <div class="list-item-title">身份证照片</div>
                        <div class="list-item-text"></div>
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

        <div class="info-part-item">
            <p>其他资料</p>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        document.getElementById("school").innerHTML ="${teacher.school}".split("@")[0]+" "+"${teacher.school}".split("@")[1];

    });

</script>