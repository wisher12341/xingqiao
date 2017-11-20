<!DOCTYPE html>
<#assign base=request.contextPath />
<#assign c =JspTaglibs["http://java.sun.com/jsp/jstl/core"] />
<#assign fmt =JspTaglibs["http://java.sun.com/jsp/jstl/fmt"] />
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0"/>

    <title>机构查询</title>

    <script type="text/javascript" src="${base}/static/js/common/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="${base}/static/js/common/bootstrap.min.js"></script>
    <script type="text/javascript" src="${base}/static/js/common/angular.js"></script>
    <script type="text/javascript" src="${base}/static/js/common/angular-cookie.js"></script>

    <link rel="stylesheet" href="${base}/static/css/common/bootstrap.min.css">
    <link rel="stylesheet" href="${base}/static/css/jcy.css">

    <style>
        [ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak, .x-ng-cloak {
            display: none !important;
        }

        .form-control{
            border: none;
            border-radius: 0;
            height: 3.5rem;
        }

    </style>
</head>
<body ng-app="testapp" ng-controller="organizationCtrl" ng-init="getOrganization()">
<div class="container list-container-white">

    <div class="input-group row row-wrapper" style="padding: 0rem 2.5rem">
        <input type="text"
               style="margin-top: 0.2rem;border-radius: 20px 0px 0px 20px;"
               class="form-control input-default" ng-model="orgName">
        <span class="glyphicon glyphicon-search input-group-addon"
              style="border-radius: 0 20px 20px 0px; color: #337fc0; background-color: #d9edf7;border: none;"
              ng-click="selectOrg(vm.pro.label,vm.cit.label,vm.dis.label)"></span>
    </div>
    <div class="row row-wrapper" style="padding: 1.5rem 0rem 0rem 0rem">
        <div class="col-xs-6 col-md-6 no-padding">
            <select class="form-control" style="height: 4.5rem">
                <option>上海市:</option>
            </select>
        </div>

        <div class="col-xs-6 col-md-6 no-padding">
            <select class="form-control" ng-model="vm.dis" style="height: 4.5rem"
                    ng-options="c.label for c in addr.provinces[0].districts" ng-change="selectOrg(vm.pro.label,vm.cit.label,vm.dis.label)">
                <option value="">-- 请选择区 --</option>
            </select>
        </div>
    </div>
            <!-- 机构列表 -->

    <div class="row">
        <div class="panel panel-default">
            <table border="0"  style="width: 100%; border-color: #dddddd">
                <tr ng-repeat="temp in NewOrgItems" ng-cloak>
                    <!--<td>名字:<br/>-->
                    <!--人数:<br/>-->
                    <!--简介:-->
                    <!--</td>-->

                    <td style="height: 50px; padding-left: 20px; border-color: #dddddd; border-top: 1px solid #dddddd" >
                        <a ng-click="get_org_intro(temp['id'])">##temp['name']##</a><br/>
                        <!--##temp['NumPeople']##<br/>-->
                        <!--##temp['abstract']##-->

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
        $scope.getOrganization = function() {
            $http({
                method: 'GET',
                url: pathJs+'/wx/organization/get_organizations'

            }).success(function (data, status, headers, config) {
//                console.log(data);
                $scope.organizations = data.data;
                $scope.NewOrgItems = data.data;
            }).error(function(data, status, headers, config) {

            });
        };

//选择结果


        $scope.selectOrg = function(aaa,bbb,ccc) {
            //地区选择;
            j=0;
            $scope.NewOrgItems=[];
            for (i in $scope.organizations){
                if($scope.organizations[i]['district']==ccc){
                    $scope.NewOrgItems[j++]=$scope.organizations[i];
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


            //合并地区查询和字符查询

            //1.将相同的去掉
            for(aa in selectOrgs){
                for(bb in $scope.NewOrgItems){
                    if (selectOrgs[aa]['name']==$scope.NewOrgItems[bb]['name']){

                        $scope.NewOrgItems.slice(bb,1);
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
            $scope.NewOrgItems = selectOrgs.concat($scope.NewOrgItems);

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

