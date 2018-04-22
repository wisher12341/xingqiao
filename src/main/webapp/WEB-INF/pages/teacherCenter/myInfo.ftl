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
<div class="modal fade infoModal" id="fillInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <a type="button" class="close" aria-hidden="true" >×</a>
                <h4 class="modal-title" id="myModalLabel">
                    您还为填写个人资料
                </h4>
            </div>
            <div class="modal-body">
                未填写资料将无法预约治疗师。
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick=location.href="${path}/wx/teacherCenter/${user.id}/fillInfoPage">
                    立即填写
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div id="main">

    <div class="imgDiv2">
        <img src="${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"))!}" class="img-circle" onclick=location.href="${path}/wx/teacherCenter/${user.id}/changeIconPage">
        <div id="myAlert" class="alert alert-success" style="display: none">
            <a href="#" class="close" data-dismiss="alert">&times;</a>
            <strong>您的资料正在审核中。</strong>审核通过后即可预约。
        </div>
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
                        <div class="list-item-text">
                        <#if (teacher.pidUrlFront)??>
                            <img src="${path}/${teacher.pidUrlFront}" style="width:100px">
                        </#if>
                        <#if (teacher.pidUrlBack)??>
                            <img src="${path}/${teacher.pidUrlBack}" style="width:100px">
                        </#if>
                        </div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>


            </ul>
        </div>
        <div style="height: 30px;background-color: #e6ece3"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p class="info-part-title" style="color: #20b49a">成功案例</p>
        <#if (teacher.successCase)?? && teacher.successCase!="">
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
    $(document).ready(function() {
    <#--if(${user.infoStatus}==0){-->
    <#--$("#myAlert").show();-->
    <#--}-->
        if(${user.userStatus}==0)
        {
            $('#fillInfoModal').modal();
        }

        else if(${user.userStatus}==1){
            $("#myAlert").show();
        }
        else if(${user.userStatus}==3){
            $("#myAlert").show();
        }

    });
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