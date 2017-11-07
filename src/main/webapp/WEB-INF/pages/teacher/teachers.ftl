<!DOCTYPE html>
<#assign base=request.contextPath />
<#assign c =JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
<#assign fmt =JspTaglibs["http://java.sun.com/jsp/jstl/fmt"] />
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0"/>

    <title>治疗师查询</title>

    <script type="text/javascript" src="${base}/static/js/common/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="${base}/static/js/common/angular.js"></script>
    <script type="text/javascript" src="${base}/static/js/common/angular-cookie.js"></script>
    <script type="text/javascript" src="${base}/static/bootstrap/js/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${base}/static/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="${base}/static/css/jcy.css">
    <link rel="stylesheet" href="${base}/static/css/teacher/leftSlider.css">
</head>
<body ng-app="testapp" ng-controller="teacherCtrl" ng-init="getTeacher()">

<div class="nav-btn visible-xs visible-sm">
    <a href="#" class="mobile-nav-taggle" id="mobile-nav-taggle">
        <span class="glyphicon glyphicon-search"></span></a>
</div>
<div id="mobile-menu" class="mobile-nav visible-xs visible-sm hide-nav">
    <div class="container my-slider-container offset-15">
        <div class="row" align="center">
            <div class="nav-title col-xs-12">康复领域</div>
            <div class="active nav-pill col-xs-3" ng-click="search_factor('d不限')">##"不限"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('d言语')" >##"言语"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('d听觉')" >##"听觉"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('d认知')" >##"认知"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('d运动')" >##"运动"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('d心理')" >##"心理"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('d情绪行为')" >##"情绪行为"##</div>

            <div class="col-xs-12 gray-line"></div>
        </div>
        <div class="row" align="center">
            <div class="nav-title col-xs-12">康复对象</div>
            <div class="active nav-pill col-xs-4" ng-click="search_factor('o不限')">##"不限"##</div>
            <div class="nav-pill col-xs-4" ng-click="search_factor('o6岁以下')" >##"6岁以下"##</div>
            <div class="nav-pill col-xs-4" ng-click="search_factor('o7-18岁')" >##"7-18岁"##</div>
            <div class="nav-pill col-xs-4" ng-click="search_factor('o成人')" >##"成人"##</div>

            <div class="col-xs-12 gray-line"></div>
        </div>
        <div class="row" align="center">
            <div class="nav-title col-xs-12">老师性别</div>
            <div class="active nav-pill col-xs-3" ng-click="search_factor('g不限')">##"不限"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('g0')" >##"男"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('g1')" >##"女"##</div>

            <div class="col-xs-12 gray-line"></div>
        </div>


        <div class="row" align="center">
            <div class="nav-title col-xs-12">上门方式</div>
            <div class="active nav-pill col-xs-4" ng-click="search_factor('w不限')">##"不限"##</div>
            <div class="nav-pill col-xs-4" ng-click="search_factor('w治疗师上门')" >##"治疗师上门"##</div>
            <div class="nav-pill col-xs-4" ng-click="search_factor('w学生上门')" >##"学生上门"##</div>
            <div class="nav-pill col-xs-4" ng-click="search_factor('w在线授课')" >##"在线授课"##</div>

            <div class="col-xs-12 gray-line"></div>
        </div>

        <div class="row" align="center">
            <div class="nav-title col-xs-12">教学经验</div>
            <div class="active nav-pill col-xs-3" ng-click="search_factor('y不限')">##"不限"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('y3年以下')" >##"3年以下"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('y3-5年')" >##"3-5年"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('y5年以上')" >##"5年以上"##</div>

            <div class="col-xs-12 gray-line"></div>
        </div>

        <div class="row" align="center">
            <div class="nav-title col-xs-12">价格区间</div>
            <div class="active nav-pill col-xs-3" ng-click="search_factor('p不限')">##"不限"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('p80-150元')" >##"80-150元/小时"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('p150-300元')" >##"150-300元/小时"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('p300-500元')" >##"300-500元/小时"##</div>
            <div class="nav-pill col-xs-3" ng-click="search_factor('p500元以上')" >##"500元以上/小时"##</div>
        </div>



    </div>
</div>
<div class="container list-container-white">
    <div class="row row-wrapper">
        <div class="my-page-title col-xs-12 text-center">治疗师查询</div>
        <div class="col-xs-12 col-xs-12 gray-line"></div>
    </div>
    <div ng-repeat="temp in teachers" ng-cloak>
        <div class="row row-wrapper list-item-content pointable" ng-click="get_teacher_more(temp['id'])">
            <div class="col-xs-3 col-md-2" align="center">
                <img ng-src="${base}/##temp.headimgurl##" onerror='this.src="${base}/static/img/touxiang.svg;this.onerror=null"' class="headimg">
            </div>
            <div class="col-xs-9 col-md-7">
                <div class="row">
                    <div class="col-xs-4 list-item-content-title" ng-click="get_teacher_more(temp['id'])">##temp['name']##</div>
                    <div class="col-xs-3">##temp['gender']##</div>
                    <div class="col-xs-5 no-padding" style="float: right">¥##temp['price']##<span>元/小时</span></div>

                </div>
                <div class="row padding-left-15">
                    <div class="col-xs-3 no-padding" ng-repeat="item in temp['way'].split('、')" style="display: inline">
                        <span>##item##</span>
                    </div>
                </div>

                <div class="row padding-left-15">
                    <strong>康复领域:</strong>
                    <span>##temp['domain']##</span>
                </div>
                <div class="row padding-left-15">
                    <strong>问题类型:</strong>
                    <a>##temp['question']##</a>
                </div>
                <div class="row padding-left-15">
                    <strong>康复对象:</strong>
                    <span>##temp['object']##</span>
                </div>
                <div class="row padding-left-15">
                    <strong ng-if="(temp['way'].indexOf('治疗师上门')!=-1)||(temp['way'].indexOf('不限')!=-1)" >治疗师上门区域:</strong>
                    <span ng-if="(temp['way'].indexOf('治疗师上门')!=-1)||(temp['way'].indexOf('不限')!=-1)" >##temp['sGround']##</span>
                </div>
                <div class="row padding-left-15">
                    <strong ng-if="(temp['way'].indexOf('学生上门')!=-1)||(temp['way'].indexOf('不限')!=-1)" >学生上门地址:</strong>
                    <span ng-if="(temp['way'].indexOf('学生上门')!=-1)||(temp['way'].indexOf('不限')!=-1)" >##temp['tGround']##</span>
                </div>
                <div class="row padding-left-15">
                    <strong>简介:</strong>
                    <span>##temp['abstractTeacher']##</span>
                </div>
            </div>
        </div>
        <hr style="margin: 1rem">
    </div>
</div>

</body>
</html>

<script type="text/javascript">
    $("#mobile-nav-taggle").click(function () {
        var mobileMenu = $("#mobile-menu");
        if (mobileMenu.hasClass("hide-nav")) {
            setTimeout(function () {
                mobileMenu.addClass("show-nav").removeClass("hide-nav");
            }, 100)
        }
        else {
            setTimeout(function (){
                mobileMenu.addClass("hide-nav").removeClass("show-nav");
            }, 100)
        }
    });

    $('.nav-pill').click(function(){
        $(this).addClass("active").siblings(".nav-pill").removeClass("active");
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
            $http({
                method: 'POST',
                url: '/teacher/get_teacher'

            }).success(function (data, status, headers, config) {
//                console.log(data);
                $scope.teachers = data.data;

            }).error(function (data, status, headers, config) {

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
                url: '${base}/teacher/get_teacher',
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
            $window.location = ${base}+'/teacher/'+teacher_id+'/detail';
        };

    }]);
</script>

