<!DOCTYPE html>
<#assign base=request.contextPath />
<#assign c =JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
<#assign fmt =JspTaglibs["http://java.sun.com/jsp/jstl/fmt"] />
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>

    <title>治疗师查询</title>

    <script type="text/javascript" src="${base}/static/js/common/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="${base}/static/js/common/angular.js"></script>
    <script type="text/javascript" src="${base}/static/js/common/angular-cookie.js"></script>
    <script type="text/javascript" src="${base}/static/bootstrap/js/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${base}/static/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="${base}/static/css/jcy.css">
    <link rel="stylesheet" href="${base}/static/css/teacher/slider.css">
    <link rel="stylesheet" href="${base}/static/css/loading.css">
    <style>
        .inline-wrapper{
            justify-content: flex-start;
        }
        a:visited,a:hover,a:focus,a:active{
            color: #ffffff;
        }
        .btn-link{
            border: none;
            border-radius: 5px;
            background-color: #20b49a;
            color: #ffffff;
            text-align: center;
            line-height: 2.8rem;
            font-size: 1.3rem;
        }

        .nav-pill{
            border-radius: 5px;
            margin: 5px 0px;
        }
    </style>
</head>
<body ng-app="testapp" ng-controller="teacherCtrl" ng-init="getTeacher()" style="height: 100%;width: 100%;">

<div class="spinner-mask" style="display: none">
    <div class="spinner">
        <div class="spinner-container container1">
            <div class="circle1"></div>
            <div class="circle2"></div>
            <div class="circle3"></div>
            <div class="circle4"></div>
        </div>
        <div class="spinner-container container2">
            <div class="circle1"></div>
            <div class="circle2"></div>
            <div class="circle3"></div>
            <div class="circle4"></div>
        </div>
        <div class="spinner-container container3">
            <div class="circle1"></div>
            <div class="circle2"></div>
            <div class="circle3"></div>
            <div class="circle4"></div>
        </div>
    </div>

</div>

<#--<div class="nav-btn visible-xs visible-sm" style="font-size: 1.2rem">-->
    <#--<a href="#" class="mobile-nav-taggle btn-select" id="mobile-nav-taggle">-->
        <#--<span class="glyphicon glyphicon-search"></span>筛选</a>-->
<#--</div>-->


<div id="container" class="container base no-padding">
    <div class="row row-wrapper selector-row" style="margin: 0px">
        <div class="col-xs-6 col-md-6 no-padding">
            <div class="mobile-nav-taggle my-select" id="citySelector" data-menu="menuCity">
                智能排序
            </div>
        </div>
        <div class="col-xs-6 col-md-6 no-padding">
            <div class="mobile-nav-taggle my-select" id="btnSelector" data-menu="mobile-menu">
                筛选
            </div>
        </div>
    </div>
    <div id="mobile-menu" class="mobile-nav mobile-menu-top" style="height: 0">
        <#--<div class="container offset-15">-->
            <#--<div class="nav-title text-left">康复领域</div>-->
            <#--<div class="inline-wrapper" align="center">-->
                <#--<div class="active nav-pill" ng-click="search_factor('d不限')">##"不限"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('d言语')" >##"言语"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('d听觉')" >##"听觉"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('d认知')" >##"认知"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('d运动')" >##"运动"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('d心理')" >##"心理"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('d情绪行为')" >##"情绪行为"##</div>-->

                <#--<div class="col-xs-12 gray-line"></div>-->
            <#--</div>-->

            <#--<div class="nav-title text-left">康复对象</div>-->
            <#--<div class="inline-wrapper" align="center">-->
                <#--<div class="active nav-pill " ng-click="search_factor('o不限')">##"不限"##</div>-->
                <#--<div class="nav-pill " ng-click="search_factor('o3岁以下')" >##"3岁以下"##</div>-->
                <#--<div class="nav-pill " ng-click="search_factor('o3-6岁')" >##"3-6岁"##</div>-->
                <#--<div class="nav-pill " ng-click="search_factor('o6-18岁')" >##"6-18岁"##</div>-->
                <#--<div class="nav-pill " ng-click="search_factor('o成人')" >##"成人"##</div>-->

                <#--<div class="col-xs-12 gray-line"></div>-->
            <#--</div>-->

            <#--<div class="nav-title text-left">老师性别</div>-->
            <#--<div class="inline-wrapper" align="center">-->
                <#--<div class="active nav-pill" ng-click="search_factor('g不限')">##"不限"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('g0')" >##"男"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('g1')" >##"女"##</div>-->

                <#--<div class="col-xs-12 gray-line"></div>-->
            <#--</div>-->

            <#--<div class="nav-title text-left">上门方式</div>-->
            <#--<div class="inline-wrapper" align="center">-->
                <#--<div class="active nav-pill col-xs-4" ng-click="search_factor('w不限')">##"不限"##</div>-->
                <#--<div class="nav-pill col-xs-4" ng-click="search_factor('w治疗师上门')" >##"治疗师上门"##</div>-->
                <#--<div class="nav-pill col-xs-4" ng-click="search_factor('w学生上门')" >##"学生上门"##</div>-->
                <#--<div class="nav-pill col-xs-4" ng-click="search_factor('w在线授课')" >##"在线授课"##</div>-->

                <#--<div class="col-xs-12 gray-line"></div>-->
            <#--</div>-->

            <#--<div class="nav-title text-left">教学经验</div>-->
            <#--<div class="inline-wrapper" align="center">-->
                <#--<div class="active nav-pill" ng-click="search_factor('y不限')">##"不限"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('y3年以下')" >##"3年以下"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('y3-5年')" >##"3-5年"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('y5年以上')" >##"5年以上"##</div>-->

                <#--<div class="col-xs-12 gray-line"></div>-->
            <#--</div>-->

            <#--<div class="nav-title text-left">价格区间</div>-->
            <#--<div class="inline-wrapper" align="center">-->
                <#--<div class="active nav-pill" ng-click="search_factor('p不限')">##"不限"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('p80-150元')" >##"80-150元/小时"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('p150-300元')" >##"150-300元/小时"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('p300-500元')" >##"300-500元/小时"##</div>-->
                <#--<div class="nav-pill" ng-click="search_factor('p500元以上')" >##"500元以上/小时"##</div>-->
            <#--</div>-->

        <#--</div>-->
            <div class="container offset-15" style="padding: 0rem 2.5rem;">
                <div class="nav-title text-left">康复领域</div>
                <div class="row" align="center">
                    <div class="col-xs-3 padding-5"><div class="active nav-pill" ng-click="search_factor('d不限')">##"不限"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('d言语')" >##"言语"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('d听觉')" >##"听觉"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('d认知')" >##"认知"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('d运动')" >##"运动"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('d心理')" >##"心理"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('d情绪行为')" >##"情绪行为"##</div></div>

                    <div class="col-xs-12 gray-line"></div>
                </div>

                <div class="nav-title text-left">康复对象</div>
                <div class="row" align="center">
                    <div class="col-xs-3 padding-5"><div class="active nav-pill" " ng-click="search_factor('o不限')">##"不限"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill " ng-click="search_factor('o3岁以下')" >##"3岁以下"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill " ng-click="search_factor('o3-6岁')" >##"3-6岁"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill " ng-click="search_factor('o6-18岁')" >##"6-18岁"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill " ng-click="search_factor('o成人')" >##"成人"##</div></div>

                    <div class="col-xs-12 gray-line"></div>
                </div>

                <div class="nav-title text-left">老师性别</div>
                <div class="row" align="center">
                    <div class="col-xs-3 padding-5"><div class="active nav-pill" ng-click="search_factor('g不限')">##"不限"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('g0')" >##"男"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('g1')" >##"女"##</div></div>

                    <div class="col-xs-12 gray-line"></div>
                </div>

                <div class="nav-title text-left">上门方式</div>
                <div class="row" align="center">
                    <div class="col-xs-3 padding-5"><div class="active nav-pill" " ng-click="search_factor('w不限')">##"不限"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill " ng-click="search_factor('w治疗师上门')" >##"治疗师上门"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill " ng-click="search_factor('w学生上门')" >##"学生上门"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill " ng-click="search_factor('w在线授课')" >##"在线授课"##</div></div>

                    <div class="col-xs-12 gray-line"></div>
                </div>

                <div class="nav-title text-left">教学经验</div>
                <div class="row" align="center">
                    <div class="col-xs-3 padding-5"><div class="active nav-pill" ng-click="search_factor('y不限')">##"不限"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('y3年以下')" >##"3年以下"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('y3-5年')" >##"3-5年"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('y5年以上')" >##"5年以上"##</div></div>

                    <div class="col-xs-12 gray-line"></div>
                </div>

                <div class="nav-title text-left">价格区间</div>
                <div class="row" align="center">
                    <div class="col-xs-3 padding-5"><div class="active nav-pill" ng-click="search_factor('p不限')">##"不限"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('p80-150元')" >##"80-150元/小时"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('p150-300元')" >##"150-300元/小时"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('p300-500元')" >##"300-500元/小时"##</div></div>
                    <div class="col-xs-3 padding-5"><div class="nav-pill" ng-click="search_factor('p500元以上')" >##"500元以上/小时"##</div></div>
                </div>

            </div>
    </div>
    <div class="mask" style="display: none;top:auto;"></div>
    <div ng-repeat="temp in teachers" ng-cloak>
        <div class="row row-wrapper my-panel pointable" ng-click="get_teacher_more(temp['id'])">
            <div class="no-padding col-xs-3 col-md-3" align="center">
                <img ng-if="temp['headimgurl'].indexOf('wx.qlogo.cn')!=-1" ng-src="##temp['headimgurl']##" onerror='this.src="${base}/static/img/touxiang.svg;this.onerror=null"' class="headimg">
                <img ng-if="temp['headimgurl'].indexOf('wx.qlogo.cn')==-1" ng-src="${base}/##temp['headimgurl']##" onerror='this.src="${base}/static/img/touxiang.svg;this.onerror=null"' class="headimg">
            <#--<img ng-src="##temp['headimgurl']##" onerror='this.src="${base}/static/img/touxiang.svg;this.onerror=null"' class="headimg">-->
            </div>
            <div class="col-xs-9 col-md-9">
                <div class="row">
                    <div class="col-xs-4 no-padding-right list-item-content-title" ng-click="get_teacher_more(temp['id'])">##temp['name']##</div>
                <#--<div class="col-xs-3">##temp['gender']##</div>-->

                    <div class="col-xs-6 no-padding">
                    <#assign level=5>
                    <#if level??>
                        <#if level==1>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#elseif level==2>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#elseif level==3>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#elseif level==4>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                            <img class="level-star" src="${base}/static/img/star-full.png"/>
                        <#elseif level==5>
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
                    </div>
                    <div class="col-xs-2 no-padding btn-link" ng-click="get_teacher_more(temp['id'])">
                        预约
                    </div>
                </div>
                <div class="row padding-left-15 list-item-content" style="line-height: 3.6rem">
                    <div class="col-xs-8 no-padding" style="line-height: 2.2rem">
                        <div>##temp['domain']##</div>
                        <div>##temp['object']##</div>
                    </div>
                    <div class="col-xs-4 no-padding price" style="float: right;text-align: right;">¥##temp['price']##</div>
                </div>
                <div class="row inline-wrapper padding-left-15 list-item-content" style="justify-content: flex-start; width: 24rem">
                    <div class="way-border" ng-repeat="item in temp['way'].split('、')" style="margin-right: 0.2rem;">
                        <span>##item##</span>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>

</body>
</html>

<script type="text/javascript">
//    var openid = "oxsEYwtmbjRkLNS7NelU1jClG668";
    //document.cookie="openid_parent="+openid;
//    setCookie("openid_parent","oxsEYwtmbjRkLNS7NelU1jClG668",0);
    //调用
    //设置cookie
    function setCookie(name, value, seconds) {
        seconds = seconds || 0;   //seconds有值就直接赋值，没有为0，这个根php不一样。
        var expires = "";
        if (seconds != 0 ) {      //设置cookie生存时间
            var date = new Date();
            date.setTime(date.getTime()+(seconds*1000));
            expires = "; expires="+date.toGMTString();
        }
        document.cookie = name+"="+escape(value)+expires+"; path=/";   //转码并赋值
    }
    function loadingImg() {
        $("body").css("overflow","hidden");
        $(".spinner-mask").show();
    }

    function loadingOver() {
        $("body").css("overflow","auto");
        $(".spinner-mask").hide();
    }


    $(".mobile-nav-taggle").click(function () {
        var menuId = "#" + $(this).data("menu");
        var mobileMenu = $(menuId);
        if (mobileMenu.hasClass("mobile-menu-top")) {
            if (mobileMenu.height() == 0){
                showMenu(mobileMenu);
                $(this).css("background-image","url('${base}/static/img/up.svg')");
                $(this).addClass("mobile-nav-taggle-active");
                $(".mask").show();
            } else {
                hideMenu(mobileMenu);
                $(this).css("background-image","url('${base}/static/img/down.svg')");
                $(this).removeClass("mobile-nav-taggle-active");
                $(".mask").hide();
            }
        }
    });

    function showMenu(menu){
        hideMenu(null);
        $("body").css("overflow-x","hidden");
        $("body").css("overflow-y","hidden");
        $("body").css("position","fixed");
        $("#container").css("overflow-y","hidden");
        menu.css("height","70%");
        menu.css("padding-bottom","3rem");
    }
    function hideMenu(menu){
        $("body").css("overflow-x","scroll");
        $("body").css("overflow-y","scroll");
        $("body").css("position","inherit");
        $("#container").css("overflow-y","scroll");
        if (menu==null){
            $(".mobile-menu-top").css("padding-bottom","0");
            $(".mobile-menu-top").height(0);

            $(".mobile-nav-taggle").css("background-image","url('${base}/static/img/down.svg')");
            $(".mobile-nav-taggle").removeClass("mobile-nav-taggle-active");
        } else {
            menu.css("padding-bottom","0");
            menu.height(0);
        }
    }

//    $("#btnSelector").click(function () {
//        var mobileMenu = $("#mobile-menu");
//        if (mobileMenu.hasClass("hide-nav")) {
//            $("body").css("overflow-x","hidden");
//            $("body").css("overflow-y","hidden");
//            setTimeout(function () {
//                $("body").css("position","fixed");
//                $("#container").css("overflow-y","hidden");
//                $("#mask").show();
//            }, 50);
//            setTimeout(function () {
//                mobileMenu.addClass("show-nav").removeClass("hide-nav");
//            }, 100);
//        }
//        else {
//            $("body").css("overflow-x","scroll");
//            $("body").css("overflow-y","scroll");
//            setTimeout(function () {
//                $("body").css("position","inherit");
//                $("#container").css("overflow-y","scroll");
//                $("#mask").hide();
//            }, 50);
//            setTimeout(function (){
//                mobileMenu.addClass("hide-nav").removeClass("show-nav");
//            }, 100);
//        }
//    });

    $(".mask").click(function(){
        hideMenu(null);
        $(this).hide();
    });

    $('.nav-pill').click(function(){
        //$(this).addClass("active").siblings(".nav-pill").removeClass("active");
        $(this).parent().siblings().children(".nav-pill").removeClass("active");
        $(this).addClass("active");
    });



    var app = angular.module('testapp', ['ipCookie']);
    app.config(function($interpolateProvider) {
        $interpolateProvider.startSymbol('##');
        $interpolateProvider.endSymbol('##');
    });
    app.controller('teacherCtrl', ['$scope', '$http', '$window','$location', 'ipCookie',function($scope, $http,$window, $location,ipCookie) {


        $scope.orgName = "";
        $scope.teachers = [];
        $scope.getTeacher = function () {
            loadingImg()
            $http({
                method: 'POST',
                url: '${base}/wx/teacher/get_teacher'

            }).success(function (data, status, headers, config) {
//                console.log(data);
                $scope.teachers = data.data;
                loadingOver();
            }).error(function (data, status, headers, config) {
                loadingOver();
            });
        };



        //教师查询条件
        $scope.searchWord = {'question':'不限','domain':'不限','obj':'不限','gender':'不限','way':'不限','years':'不限','price':'不限'};
        $scope.sWord;
        $scope.search_factor = function(s_word){
            //alert('dd1');
            //$scope.searchWord =ipCookie('searchWord_cookie')
            //1.将查询字段整理清楚
            if(s_word[0]=='o') {$scope.searchWord['obj']=s_word.substring(1);}
            else if (s_word[0]=='d') {$scope.searchWord['domain']=s_word.substring(1);}
            else if (s_word[0]=='g') {$scope.searchWord['gender']=s_word.substring(1);}
            else if (s_word[0]=='w') {$scope.searchWord['way']=s_word.substring(1);}
            else if (s_word[0]=='y') {$scope.searchWord['years']=s_word.substring(1);}
            else if (s_word[0]=='p') {$scope.searchWord['price']=s_word.substring(1);}
            else if (s_word[0]=='q') {$scope.searchWord['question']=s_word.substring(1);}


            //2.c存在cookie中
            ipCookie('searchWord_cookie',$scope.searchWord,{path:'/',expires:14});

            //3.传到后台
            $scope.sWord = ipCookie('searchWord_cookie');

            $.ajax({
                type: 'post',
                url: '${base}/wx/teacher/get_teacher',
                data:{
                    'object':$scope.sWord['obj'],
                    'domain':$scope.sWord['domain'],
                    'gender':$scope.sWord['gender'],
                    'way':$scope.sWord['way'],
                    'years':$scope.sWord['years'],
                    'question':$scope.sWord['question'],
                    'priceSelect':$scope.sWord['price']
                },
                dataType: 'json',
                async:false,
                success: function (data) {
                    $scope.teachers = data.data;
                }
            });


        };

        //更多老师介绍
        $scope.get_teacher_more = function(teacher_id){
            ipCookie('teacherId', teacher_id, {path: '/', expires: 14});
            $window.location = '${base}'+'/wx/teacher/'+teacher_id+'/detail';
        };

    }]);
</script>

