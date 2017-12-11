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

    <div class="imgDiv2">
        <img src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle">
    </div>
    <div class="myInfoDiv">
        <div style="height: 30px;background-color: #e6ece3"></div>
        <div class="info-part-item" style="padding-top: 30px">
        <p class="info-part-title" style="color: #20b49a">基本信息</p>
        <ul class="list-group">
            <li class="list-group-item">
                <div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/name/modifyPage">
                    <div class="list-item-title">用户名： </div>
                    <div class="list-item-text">${(teacher.name)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>


            <li class="list-group-item">
                <div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/phone/modifyPage">
                    <div class="list-item-title">手机： </div>
                    <div class="list-item-text">${(user.phone)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/email/modifyPage">
                    <div class="list-item-title">邮箱： </div>
                    <div class="list-item-text">${(user.email)!}</div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
            <li class="list-group-item">
                <div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/school/modifyPage">
                    <div class="list-item-title">毕业院校： </div>
                    <div class="list-item-text" id="school">
                    <#if (teacher.school)??>
                    ${teacher.school?split("@")[0]} ${teacher.school?split("@")[1]}
                    </#if>
                    </div>
                    <span><i class="fa fa-angle-right fa-4x"></i></span>
                </div>
            </li>
        </ul>
    </div>
        <div style="height: 30px;background-color: #e6ece3"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p class="info-part-title" style="color: #20b49a">康复服务</p>
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/teacherCenter/${user.id}/domain/modifyPage">
                        <div class="list-item-title">康复类型： </div>
                        <div class="list-item-text">${(teacher.domain)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div"  onclick=location.href="${path}/wx/teacherCenter/${user.id}/object/modifyPage">
                        <div class="list-item-title">康复对象： </div>
                        <div class="list-item-text">${(teacher.object)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/teacherCenter/${user.id}/way/modifyPage">
                        <div class="list-item-title">上门方式： </div>
                        <div class="list-item-text">${(teacher.way)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>

                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/teacherCenter/${user.id}/tGround/modifyPage">
                        <div class="list-item-title">治疗师上门区域： </div>
                        <div class="list-item-text">${(teacher.tGround)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/teacherCenter/${user.id}/sGround/modifyPage">
                        <div class="list-item-title">学生上门区域： </div>
                        <div class="list-item-text">${(teacher.sGround)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>

            </ul>
        </div>
        <div style="height: 30px;background-color: #e6ece3"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p class="info-part-title" style="color: #20b49a">实名认证</p>
            <ul class="list-group">
                <li class="list-group-item">
                <div class="list-item-div" onclick=location.href="${path}/wx/teacherCenter/${user.id}/pid/modifyPage">
                    <div class="list-item-title">身份证号： </div>
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


            </ul>
        </div>
        <div style="height: 30px;background-color: #e6ece3"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p class="info-part-title" style="color: #20b49a">成功案例</p>
            <#if (teacher.successCase)??>
            <ul class="list-group">
            <#list teacher.successCase?split("#") as case>
                <li class="list-group-item">
                    <div class="list-item-div" style="padding: 20px" >
                        <div class="list-item-title" style="display: block" onclick=location.href="${path}/wx/teacherCenter/${user.id}/${case_index}/modifyText">${case?split("@")[0]} </div>
                        <div class="list-item-text" style="display:block;margin-top: 30px" onclick=location.href="${path}/wx/teacherCenter/${user.id}/${case_index}/modifyText">${case?split("@")[1]}</div>
                        <div class="row"style="display: block">
                            <div class="col-sm-10"></div>
                        <span class="col-sm-1" style="display:inline;margin-bottom: 10px" onclick="deleteCase(${user.id},${case_index},'${teacher.successCase}')"><i class="fa fa-trash-o fa-4x"></i></span>
                        <span class="col-sm-1" style="display:inline;margin-bottom: 10px" onclick=location.href="${path}/wx/teacherCenter/${user.id}/${case_index}/modifyText"><i class="fa fa-edit fa-4x"></i></span>
                        </div>
                    </div>
                </li>
                </#list>
            </ul>
            <#else>
                <p>还没有添加成功案例。</p>
            </#if>

        </div>
        <div style="height: 30px;background-color: #e6ece3"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p class="info-part-title" style="color: #20b49a">其他资料</p>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
function deleteCase(userId,caseIndex,cases) {
    var strs=cases.split("#");
    strs.splice(caseIndex,1);
    var newValue=strs.join("#");

    $.ajax({
        url: "/wx/teacherCenter/saveModify",
        type: 'post',
        dataType: 'json',
        data: {
            "newValue": newValue,
            "objId": userId,
            "fieldName":"successCase"
        },
        success: function(){
            window.location.reload();
        },
        error: function(){

        }
    });

}

</script>