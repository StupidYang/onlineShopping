<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        //显示商品类型
        function showProductType(id) {
            $.post(
                '${pageContext.request.contextPath}/backend/productType/findById',
                {'id':id},
                function (result) {
                    if (result.status==1) {
                        $('#proTypeNum').val(result.data.id);
                        $('#proTypeName').val(result.data.name);
                    }
                }
            );
        }
        //修改商品类型name
        function modifyName() {
            $.ajax({
                type:'post',
                url:'${pageContext.request.contextPath}/backend/productType/modifyName',
                data:{'id':$('#proTypeNum').val(),'name':$('#proTypeName').val()},
                dataType:'json',
                success:function (result) {
                    alert(result.message);
                    if (result.status==1)
                        location.href='${pageContext.request.contextPath}/backend/productType/findAll?pageNum='+${pageInfo.pageNum};
                }
            })
            
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
                        <a href="${pageContext.request.contextPath}/backend/product/findAll"><strong>商品类别管理</strong></a>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2" style="margin-top: 30px;">
                <button data-toggle="modal" data-target="#ProductType" type="button" class="btn btn-outline btn-success">增加类别</button>
            </div>
        </div>
        <!--界面-->
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content">
                            <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="15">
                                <thead>
                                <tr>
                                    <th data-toggle="true">编号</th>
                                    <th data-hide="phone">类型名称</th>
                                    <th data-hide="phone">状态</th>
                                    <th class="text-right" data-sort-ignore="true">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pageInfo.list}" var="productType">
                                    <tr>
                                        <td>
                                                ${productType.id}
                                        </td>
                                        <td>
                                                ${productType.name}
                                        </td>
                                        <td>
                                            <c:if test="${productType.status==1}"><span class="label label-primary" id="s${productType.id}">Enable</span></c:if>
                                            <c:if test="${productType.status==0}"><span class="label label-danger" id="s${productType.id}">Disabled</span></c:if>
                                        </td>
                                        <td class="text-right">
                                            <div class="btn-group">
                                                <button type="button" data-toggle="modal" data-target="#myProductType" onclick="showProductType(${productType.id})" class="btn-white btn btn-xs">修改</button>
                                                <button type="button" onclick="sweet(${productType.id})" class="btn-white btn btn-xs">删除</button>
                                                <c:if test="${productType.status==1}">
                                                    <button type="button" class="btn-warning btn btn-xs doProTypeDisable" onclick="modifyStatus(${productType.id},this)" value="禁用">禁用</button>
                                                </c:if>
                                                <c:if test="${productType.status==0}">
                                                    <button type="button" class="btn-primary btn btn-xs doProTypeDisable" onclick="modifyStatus(${productType.id},this)" value="启用">启用</button>
                                                </c:if>
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
    //删除类型
    function deleteProductType(id){
        $.get(
            '${pageContext.request.contextPath}/backend/productType/removeById',
            {'id':id},
            function (result) {
                if (result.status==1)
                    location.href='${pageContext.request.contextPath}/backend/productType/findAll?pageNum='+${pageInfo.pageNum};
            }
        );
    }
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
        location.href='${pageContext.request.contextPath}/backend/productType/findAll?pageNum='+page;
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
    //修改商品类型status
    function modifyStatus(id,btn) {
        var str = "s"+id;
        $.get(
            '${pageContext.request.contextPath}/backend/productType/modifyStatus',
            {'id':id},
            function (result) {
                if (result.status==1){
                    window.location.reload();
                }
                else
                    alert(result.message);
            }
        );
    }
    //添加商品类型
    function addProductType() {
        $.post(
            '${pageContext.request.contextPath}/backend/productType/add',
            {'name':$('#productTypeName').val()},
            function (result) {
                alert(result.message);
                if (result.status==1)
                    location.href='${pageContext.request.contextPath}/backend/productType/findAll?pageNum='+${pageInfo.pageNum};
            }
        );

    }
</script>
</body>
</html>