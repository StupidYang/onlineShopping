<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8" />
    <title>地狗后台管理</title>
    <link href="${pageContext.request.contextPath}/ol/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/style.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${pageContext.request.contextPath}/ol/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/ol/js/jquery-2.1.1.js"></script>
    <script>

        //添加系统用户
        function addSysuser(){
            $.post(
                '${pageContext.request.contextPath}/backend/sysuser/add',
                $('#frmAddSysuser').serialize(),
                function(result){
                    if(result.status==1){
                        layer.msg('添加成功',{
                            time:2000,
                            skin:'successMsg'
                        },function(){
                            location.href='${pageContext.request.contextPath}/backend/sysuser/findAll?pageNum='+${pageInfo.pageNum};
                        })
                    }

                }
            );
        }

        //修改系统用户的状态
        function modifyStatus(id,btn){
            $.post(
                '${pageContext.request.contextPath}/backend/sysuser/modifyStatus',
                {'id':id},
                function(result){
                    if(result.status==1){
                        let $td=$(btn).parent().parent().children().eq(5);
                        if($td.text().trim()=='有效'){
                            $td.text('无效');
                            $(btn).val('启用').removeClass('btn-danger').addClass('btn-success');
                        }else{
                            $td.text('有效');
                            $(btn).val('禁用').removeClass('btn-success').addClass('btn-danger');
                        }
                    }
                }
            );

        }
    </script>
</head>

<body>
<div id="wrapper">
    <!--侧边栏-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/ol/img/profile_small.jpg" />
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${sysuser.name}</strong>
                             </span> <span class="text-muted text-xs block">${sysuser.role.roleName}<b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="${pageContext.request.contextPath}/backend/product/findAll">商品管理</a></li>
                            <c:choose>
                                <c:when test="${sysuser.role.id == 3}">
                                    <li><a href="${pageContext.request.contextPath}/backend/productType/findAll">商品类别管理</a></li>
                                    <li><a href="${pageContext.request.contextPath}/backend/sysuser/findAll">卖家管理</a></li>
                                    <li><a href="${pageContext.request.contextPath}/backend/seller/findAll">卖家申请审核</a></li>
                                </c:when>
                            </c:choose>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/showLogin" onclick="logout()">退出登录</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        DD
                    </div>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/backend/product/findAll"><i class="fa fa-pie-chart"></i><span class="nav-label">商品管理</span></a>
                </li>
                <c:choose>
                    <c:when test="${sysuser.role.id == 3}">
                        <li>
                            <a href="#"><i class="fa fa-sitemap"></i> <span class="nav-label">管理员选项</span><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li><a href="${pageContext.request.contextPath}/backend/productType/findAll">商品类别管理</a></li>
                                <li><a href="${pageContext.request.contextPath}/backend/sysuser/findAll">卖家管理</a></li>
                                <li><a href="${pageContext.request.contextPath}/backend/seller/findAll">卖家申请审核</a></li>
                            </ul>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
    </nav>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <!--顶部-->
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <a href="${pageContext.request.contextPath}/index.jsp">地狗首页</a>
                    </li>
                    <li>
                        <span class="m-r-sm text-muted welcome-message">欢迎来到地狗</span>
                    </li>
                    <li>
                        <a onclick="logout() ">
                            <i class="fa fa-sign-out"></i> 退出登录
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <!--中间-->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>管理员选项</h2>
                <ol class="breadcrumb">
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/backend/product/findAll"><strong>卖家管理</strong></a>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2" style="margin-top: 30px;">
            </div>
        </div>
        <!--界面-->
        <div class="wrapper wrapper-content animated fadeInRight">
            <!--搜索栏-->
            <form class="ibox-content m-b-sm border-bottom" action="${pageContext.request.contextPath}/backend/sysuser/findByParams" method="post" id="frmSearch">
                <input type="hidden" name="pageNum" value="${pageInfo.pageNum}" id="pageNum">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="userName">姓名</label>
                            <input type="text" class="form-control" id="userName" placeholder="请输入姓名" name="name" value="${sysuserParam.name}">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="loginName">帐号:</label>
                            <input type="text" class="form-control" id="loginName" placeholder="请输入帐号" name="loginName" value="${sysuserParam.loginName}">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="phone">电话:</label>
                            <input type="text" class="form-control" id="phone" placeholder="请输入电话" name="phone" value="${sysuserParam.phone}">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="status">状态</label>
                            <select class="form-control" name="isValid" id="status">
                                <option value="-1">全部</option>
                                <option value="1" <c:if test="${sysuserParam.isValid==1}">selected</c:if>>有效</option>
                                <option value="0" <c:if test="${sysuserParam.isValid==0}">selected</c:if>>无效</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-2" style="margin-top: 23px;">
                        <div class="form-group">
                        <input type="submit" value="查询" class="btn btn-primary form-control" id="doSearch">
                        </div>
                    </div>
                </div>

            </form>

            <!--表格-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content">
                            <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="15">
                                <thead>
                                <tr>
                                    <th data-toggle="true">编号</th>
                                    <th data-hide="phone">姓名</th>
                                    <th data-hide="phone">帐号</th>
                                    <th data-hide="phone">电话</th>
                                    <th data-hide="phone">邮箱</th>
                                    <th data-hide="phone">状态</th>
                                    <th data-hide="phone">注册时间</th>
                                    <th data-hide="phone">角色</th>
                                    <th class="text-right" data-sort-ignore="true">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pageInfo.list}" var="sysuser">
                                    <tr>
                                        <td>${sysuser.id}</td>
                                        <td>${sysuser.name}</td>
                                        <td>${sysuser.loginName}</td>
                                        <td>${sysuser.phone}</td>
                                        <td>${sysuser.email}</td>
                                        <td>
                                            <c:if test="${sysuser.isValid==1}"><span class="label label-primary" id="s${sysuser.id}">Enable</span></c:if>
                                            <c:if test="${sysuser.isValid==0}"><span class="label label-danger" id="s${sysuser.id}">Disabled</span></c:if>
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${sysuser.createDate}" type="both"/>
                                        </td>
                                        <td>${sysuser.role.roleName}</td>
                                        <td class="text-right">
                                            <div class="btn-group">
                                                <button type="button" data-toggle="modal" data-target="#myProductType" onclick="showProductType(${productType.id})" class="btn-white btn btn-xs">修改</button>
                                                <c:if test="${sysuser.isValid==1}">
                                                    <button type="button" class="btn btn-warning btn-xs doMangerDisable" value="禁用" onclick="modifyStatus(${sysuser.id},this)">禁用</button>
                                                </c:if>
                                                <c:if test="${sysuser.isValid==0}">
                                                    <button type="button" class="btn btn-primary btn-xs doMangerDisable" value="启用" onclick="modifyStatus(${sysuser.id},this)">启用</button>
                                                </c:if>
                                                <button type="button" onclick="sweet(${productType.id})" class="btn-white btn btn-xs">删除</button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div style="margin-bottom: 20px;" class="text-center" id="pagination">
            </div>
        </div>
        <div class="footer">
            <div>
                地狗后台管理
            </div>
        </div>
    </div>
</div>


<!-- 添加系统用户 start -->
<div class="modal fade" tabindex="-1" id="myMangerUser">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <form id="frmAddSysuser">
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加卖家</h4>
            </div>
            <div class="modal-body text-center">
                <div class="row text-right">
                    <label for="marger-username" class="col-sm-4 control-label">卖家姓名：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="marger-username" name="name">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="marger-loginName" class="col-sm-4 control-label">登录帐号：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="marger-loginName" name="loginName">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="marger-password" class="col-sm-4 control-label">登录密码：</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" id="marger-password" name="password">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="marger-phone" class="col-sm-4 control-label">联系电话：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="marger-phone" name="phone">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="marger-adrees" class="col-sm-4 control-label">联系邮箱：</label>
                    <div class="col-sm-4">
                        <input type="email" class="form-control" id="marger-email" name="email">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="role" class="col-sm-4 control-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</label>
                    <div class=" col-sm-4">
                        <select class="form-control" name="roleId">
                            <option>--请选择--</option>
                            <c:forEach items="${roles}" var="role">
                                <option value="${role.id}">${role.roleName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <br>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary add-Manger" onclick="addSysuser()" type="button">添加</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- 添加系统用户 end -->

<!-- 修改系统用户 start -->
<div class="modal fade" tabindex="-1" id="myModal-Manger">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">卖家信息修改</h4>
            </div>
            <div class="modal-body text-center">
                <div class="row text-right">
                    <label for="MargerUsername" class="col-sm-4 control-label">用户编号：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="MargerStaffId" readonly="readonly">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="MargerUsername" class="col-sm-4 control-label">用户姓名：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="MargerStaffname">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="MargerLoginName" class="col-sm-4 control-label">登录帐号：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="MargerLoginName" readonly="readonly">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="MargerPhone" class="col-sm-4 control-label">联系电话：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="MargerPhone">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="MargerAdrees" class="col-sm-4 control-label">联系邮箱：</label>
                    <div class="col-sm-4">
                        <input type="email" class="form-control" id="MargerAdrees">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="MargerRole" class="col-sm-4 control-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</label>
                    <div class=" col-sm-4">
                        <select class="form-control" id="MargerRole">
                            <option>--请选择--</option>
                            <c:forEach items="${roles}" var="role">
                                <option value="${role.id}">${role.roleName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <br>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary doMargerModal">修改</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改系统用户 end -->

<!--添加类型-->
<div class="modal inmodal" tabindex="-1" id="ProductType">
    <div class="modal-dialog modal-lg">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <h4 class="modal-title">增加新的类别</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>类别名称：</label>
                        <input type="text" class="form-control" id="productTypeName">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary addProductType" onclick="addProductType()">添加</button>
                    <button class="btn btn-white cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 修改商品 -->
<div class="modal inmodal" tabindex="-1" id="myProductType">
    <div class="modal-dialog modal-lg">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <h4 class="modal-title">修改类别</h4>
                    <small class="font-bold">全部的信息都需要修改哦！</small>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="proTypeName">编号：</label>
                        <input type="text" class="form-control" id="proTypeNum" readonly>
                    </div>
                    <div class="form-group">
                        <label for="proTypeName">类型名称：</label>
                        <input type="text" class="form-control" id="proTypeName">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary updateProType" onclick="modifyName()">修改</button>
                    <button class="btn btn-white cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/ol/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${pageContext.request.contextPath}/ol/js/inspinia.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/pace/pace.min.js"></script>

<!-- Sparkline -->
<script src="${pageContext.request.contextPath}/ol/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sweet alert -->
<script src="${pageContext.request.contextPath}/ol/js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    function sweet(id) {
        swal({
                title: "是否删除该类别",
                text: "",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#19dd00",
                confirmButtonText: "删除",
                cancelButtonText: "取消",
                closeOnConfirm: false,
                closeOnCancel: false },
            function (isConfirm) {
                if (isConfirm) {
                    //console.log("2");
                    deleteProductType(id);
                    //console.log("3");
                    swal("删除成功", "该类别已经删除", "success");
                } else {
                    swal("取消删除", "该操作已经取消", "success");
                }
            });
    }
    $(document).ready(function() {

        $("#sparkline1").sparkline([34, 43, 43, 35, 44, 32, 44, 48], {
            type: 'line',
            width: '100%',
            height: '50',
            lineColor: '#1ab394',
            fillColor: "transparent"
        });


    });

    function logout() {
        $.post(
            '${pageContext.request.contextPath}/backend/sysuser/logout',
            function (result) {
                if (result.status==1){
                    location.href='${pageContext.request.contextPath}/index.jsp';
                }
                else
                    alert("退出失败！");
            }
        )
    }
    function skippage(page) {
        location.href='${pageContext.request.contextPath}/backend/sysuser/findAll?pageNum='+page;
    }
    $(document).ready(function(){
        var pagination = document.getElementById("pagination");
        try {
            var now = ${pageInfo.pageNum};
            var total = ${pageInfo.pages};
        }catch (e) {
            console.log(e);
        }
        var i = 1;
        //console.log(total);
        for(;i<=total;++i){
            if(i == now)
                pagination.innerHTML+="<button type='button' onclick='skippage("+i+")' class=\"btn btn-white active\">"+i+"</button>";
            else
                pagination.innerHTML+="<button type='button' onclick='skippage("+i+")' class=\"btn btn-white\">"+i+"</button>";
        }
        //var page = getQueryVariable("pageNum");

    });
</script>
</body>

</html>