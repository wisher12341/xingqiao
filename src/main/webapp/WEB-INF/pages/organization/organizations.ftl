<!DOCTYPE html>
<#assign base=request.contextPath />
<#assign c =JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
<#assign fmt =JspTaglibs["http://java.sun.com/jsp/jstl/fmt"] />
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>

    <title>机构查询</title>

    <script type="text/javascript" src="${base}/static/js/common/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="${base}/static/js/common/bootstrap.min.js"></script>
    <script type="text/javascript" src="${base}/static/js/common/angular.js"></script>
    <script type="text/javascript" src="${base}/static/js/common/angular-cookie.js"></script>

    <link rel="stylesheet" href="${base}/static/css/common/bootstrap.min.css">
    <link rel="stylesheet" href="${base}/static/css/jcy.css">
    <link rel="stylesheet" href="${base}/static/css/teacher/slider.css">
    <link rel="stylesheet" href="${base}/static/css/loading.css">

    <style>
        [ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak, .x-ng-cloak {
            display: none !important;
        }

        .form-control{
            border: none;
            border-radius: 0;
            height: 3.5rem;
        }

        .form-select:focus,
        .form-select:active,
        .form-select:hover{
            border-color: none;
            outline: 0;
            -webkit-box-shadow: none;
            box-shadow: none;
            -webkit-transition: none;
            -o-transition: none;
        }
        select > option{
            -webkit-appearance: none;   /*去除chrome浏览器的默认下拉图片*/
            background-color:transparent;
            border-color:transparent;
        }
    </style>
</head>
<body style="height: 100%;" ng-app="testapp" ng-controller="organizationCtrl" ng-init="getOrganization()">
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
<div class="container list-container-white">

    <div class="input-group row row-wrapper" style="padding: 0rem 2.5rem">
        <input type="text"
               style="margin-top: 0.2rem;border-radius: 20px 0px 0px 20px;border: #cccccc solid 0.1rem"
               class="form-control input-default" ng-model="orgName"
               ng-change="selectOrg(vm.pro.label,null,null)">
        <span class="glyphicon glyphicon-search input-group-addon"
              style="border-radius: 0 20px 20px 0px; color: #337fc0; background-color: #d9edf7;border: none;"
              ng-click="selectOrg(vm.pro.label,vm.cit.label,vm.dis.label)"></span>
    </div>
    <div class="row row-wrapper selector-row">
        <div class="col-xs-6 col-md-6 no-padding">
            <div class="mobile-nav-taggle my-select" id="citySelector" data-menu="menuCity">
                上海市
            </div>
        </div>

        <#--<div class="col-xs-6 col-md-6 no-padding">-->
            <#--<select onclick="javascript:$('#defalutInform').remove();" class="form-control form-select" ng-model="vm.dis" style="height: 4.5rem"-->
                    <#--ng-options="c.label for c in addr.provinces[0].districts" ng-change="selectOrg(vm.pro.label,vm.cit.label,vm.dis.label)">-->
                <#--<option id="defalutInform" value="">-- 请选择区 --</option>-->
            <#--</select>-->
        <#--</div>-->
        <div class="col-xs-6 col-md-6 no-padding">
            <div class="mobile-nav-taggle my-select" id="districtSelector" data-menu="menuDistrict">
                --请选择区--
            </div>
        </div>

    </div>
    <div id="menuCity" class="mobile-nav mobile-menu-top visible-xs visible-sm" style="height: 0px;">
        <div class="menu-option menu-option-active">
            <p>上海市</p>
            <hr/>
        </div>
    </div>
    <div id="menuDistrict" class="mobile-nav mobile-menu-top visible-xs visible-sm" style="height: 0px;">
        <div class="menu-option district-option" data-value="##c['label']##"
             ng-repeat="c in addr.provinces[0].districts" ng-cloak
             ng-click="selectOrg(vm.pro.label,vm.cit.label,c['label'])"
        ><p>##c['label']##</p><hr/></div>
    </div>

    <div class="mask" style="display: none;top:auto;"></div>
    <!-- 机构列表 -->

    <div class="row">
        <div class="panel" style="border: none">
            <table border="0"  style="width: 100%; border-color: #dddddd">
                <tr ng-repeat="temp in NewOrgItems" ng-cloak>

                    <td style="height: 50px; padding-left: 20px; border-color: #dddddd; border-bottom: 1px solid #dddddd" >
                        <a ng-click="get_org_intro(temp['id'])">##temp['name']##</a><br/>

                    </td>
                </tr>
            </table>
        </div>

        <div class="alert alert-dismissable alert-warning" ng-if = "NewOrgItems.length==0">
            <div style="text-align: center;">
                <p>没有搜索结果</p>
            </div>
        </div>

    </div>

</div>

</body>

<script type="text/javascript">
    var pathJs = "${base}";
    var app = angular.module('testapp', ['ipCookie']);
    var selectedCity = "上海市";
    var selectedDistrict = "不限";

    window.onload = function(){

        $(".menu-option").click(function () {
            if (!$(this).hasClass("menu-option-active")){
                $(this).siblings(".menu-option-active").removeClass("menu-option-active");
                $(this).addClass("menu-option-active");
            }
        });

        $(".district-option").click(function () {
           selectedDistrict = $(this).data("value");
           $("#districtSelector").html(selectedDistrict);
                //do search
        });

        $(".mask").click(function () {
            hideMenu(null);
            $(".mask").hide();
        })
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
        menu.css("height","70%");
        menu.css("padding-bottom","3rem");
    }
    function hideMenu(menu){
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

    function loadingImg() {
        $("body").css("overflow","hidden");
        $(".spinner-mask").show();
    }

    function loadingOver() {
        $("body").css("overflow","auto");
        $(".spinner-mask").hide();
    }
    app.config(function($interpolateProvider) {
        $interpolateProvider.startSymbol('##');
        $interpolateProvider.endSymbol('##');
    });
    app.controller('organizationCtrl', ['$scope', '$http', '$window','$location', 'ipCookie',function($scope, $http,$window, $location,ipCookie) {

//        $scope.name = null;
//        $scope.name = ipCookie('access_name');
//        $scope.logIn = true;
//        $scope.logOut = false;
//
//         $scope.deleteToken = function(){
//            ipCookie.remove('access_token',{path: '/'});
//            ipCookie.remove('access_name',{path: '/'});
//            window.location = '/';
//        }
//
//        if($scope.name != null) {
//            $scope.logIn = false;
//            $scope.logOut = true;
//        } else {
//            $scope.logIn = true;
//            $scope.logOut = false;
//        }

        $scope.orgName = "";
        $scope.organizations = [];
        $scope.NewOrgItems = [];
        $scope.tmp = [];
        $scope.getOrganization = function() {

            loadingImg();
            $http({
                method: 'GET',
                url: pathJs+'/wx/organization/get_organizations'

            }).success(function (data, status, headers, config) {
//                console.log(data);
                $scope.organizations = data.data;
                $scope.NewOrgItems = data.data;
                loadingOver();
            }).error(function(data, status, headers, config) {
                loadingOver();
            });
        };

//选择结果

        $scope.selectOrg = function(aaa,bbb,ccc) {
            if (bbb==null){
                bbb = selectedCity;
            }
            if (ccc==null){
                ccc = selectedDistrict;
            }
            //地区选择;
            j=0;
            $scope.NewOrgItems=[];
            if (ccc=='不限'){
                for (i in $scope.organizations) {
                    $scope.NewOrgItems[j++] = $scope.organizations[i];
                }
            }else {
                for (i in $scope.organizations) {
                    if ($scope.organizations[i]['district'] == ccc) {
                        $scope.NewOrgItems[j++] = $scope.organizations[i];
                    }
                }
            }

            //关键字查询
            var selectOrgs = [];
            var str = $scope.orgName;
            var num = str.length;
            //alert(num);
            var index=0;
            for(var ii=0;ii<num;ii++){
                for(jj in $scope.organizations){
                    if($scope.organizations[jj]['name'].indexOf(str[ii])>=0){
                        //alert('存在'+str[ii]);
                        selectOrgs[index++]=$scope.organizations[jj];
                    }
                }
            }
            if (str=="" || str==null){
                selectOrgs = $scope.NewOrgItems.concat();
            }


            //合并地区查询和字符查询

            $scope.tmp = $scope.NewOrgItems.concat();
            $scope.NewOrgItems = [];
            //1.将相同的去掉
            for(aa in selectOrgs){
                for(bb in $scope.tmp){
                    if (selectOrgs[aa]['name']==$scope.tmp[bb]['name']){
                        $scope.NewOrgItems.push(selectOrgs[aa]);
                        $scope.tmp.splice(bb,1);
                    }

                }
            }
//
//      for(aa in $scope.NewOrgItems){
//        for(bb in selectOrgs){
//          if ($scope.NewOrgItems[aa]['name']==selectOrgs[bb]['name']){
//
//            selectOrgs.slice(bb,1);
//          }
//
//        }
//      }
            //2.把查询中有的给出
            //$scope.NewOrgItems = selectOrgs.concat($scope.NewOrgItems);
//            $scope.NewOrgItems = [];
//            for(tt in $scope.tmp){
//                $scope.NewOrgItems.push($scope.tmp[tt])
//            }

        };


        //更多机构介绍
        $scope.get_org_intro = function(orgId){
            $window.location = pathJs+'/wx/organization/'+orgId+'/organintro';
        };



        $scope.addr={};
        $scope.addr.provinces=[
            {
                label:'上海市',
                districts:[
                    {
                        label:'不限'
                    },
                    {
                        label:'普陀区'
                    },
                    {
                        label:'徐汇区'
                    },
                    {
                        label:'静安区'
                    },
                    {
                        label:'闵行区'
                    },
                    {
                        label:'黄浦区'
                    },
                    {
                        label:'长宁区'
                    },
                    {
                        label:'虹口区'
                    },
                    {
                        label:'杨浦区'
                    },
                    {
                        label:'宝山区'
                    },
                    {
                        label:'嘉定区'
                    },
                    {
                        label:'浦东新区'
                    },
                    {
                        label:'金山区'
                    },
                    {
                        label:'松江区'
                    },
                    {
                        label:'青浦区'
                    },
                    {
                        label:'奉贤区'
                    },
                    {
                        label:'南汇区'
                    },
                    {
                        label:'崇明县'
                    },


                ],
            },

        ];
    }]);




</script>
</html>

