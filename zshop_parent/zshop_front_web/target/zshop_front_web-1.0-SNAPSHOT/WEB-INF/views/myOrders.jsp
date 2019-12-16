<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>地狗-已买到的宝贝</title>
    <link href="${pageContext.request.contextPath}/ol/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/plugins/slick/slick.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/plugins/slick/slick-theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/style.css" rel="stylesheet">
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
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${customer.name}</strong>
                             </span> <span class="text-muted text-xs block">地狗会员<b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="${pageContext.request.contextPath}/front/Orders/findAll?page=2">我的订单</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/index.jsp" onclick="logout()">退出登录</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        DD
                    </div>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/front/product/center?page=4"><i class="fa fa-th-large"></i><span class="nav-label">个人信息</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i> <span class="nav-label">订单管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="${pageContext.request.contextPath}/front/sessions/cart?page=3" target="_blank">我的购物车</a></li>
                        <li><a href="${pageContext.request.contextPath}/front/Orders/findAll?page=2">已买到的宝贝</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap"></i> <span class="nav-label">卖家管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="myorder.html">申请成为卖家</a></li>
                    </ul>
                </li>
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
                        <a href="${pageContext.request.contextPath}/index.jsp" onclick="logout()">
                            <i class="fa fa-sign-out"></i> 退出登录
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <!--中间-->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>已买到的宝贝</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/front/product/center?page=4">个人信息</a>
                    </li>
                    <li>
                        <a>订单管理</a>
                    </li>
                    <li class="active">
                        <strong>已买到的宝贝</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <!--界面-->
        <div class="wrapper wrapper-content animated fadeInRight">
            <!--样例 无限在这个div后面加div就行-->
            <c:forEach items="${myOrders.list}" var="myorder">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox product-detail">
                            <div class="ibox-content">
                                <div class="row">
                                    <div class="col-md-5" style="height: 400px;">
                                        <div class="product-images">
                                            <div>
                                                <div class="image-imitation" style="padding: 0px;">
                                                    <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/s3.jpg">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <h2 class="font-bold m-b-xs">
                                                ${myorder.name}
                                        </h2>
                                        <div class="m-t-md">
                                            <h2 class="product-main-price">¥${myorder.prices}</h2>
                                        </div>
                                        <hr>

                                        <h4>单价</h4>

                                        <div class="small text-muted">
                                                ${myorder.price}

                                            <br/>
                                            <br/>
                                            数量：${myorder.numbers}
                                        </div>
                                        <dl class="small m-t-md">
                                            <dt>订单编号：</dt>
                                            <dd>${myorder.no}</dd>
                                            <dt>购买时间：</dt>
                                            <dd>${myorder.createDate}</dd>
                                        </dl>
                                        <hr>

                                        <div>
                                            <div class="btn-group">
                                                <button onclick="deleteOrder(${myorder.id})" class="btn btn-primary btn-sm">删除订单</button>
                                                <button class="btn btn-white btn-sm">点击评价</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/ol/js/ajax.js"></script>
    <script src="${pageContext.request.contextPath}/ol/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/ol/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/ol/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/ol/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <!-- Custom and plugin javascript -->
    <script src="${pageContext.request.contextPath}/ol/js/inspinia.js"></script>
    <script src="${pageContext.request.contextPath}/ol/js/plugins/pace/pace.min.js"></script>
    <!-- slick carousel-->
    <script src="${pageContext.request.contextPath}/ol/js/plugins/slick/slick.min.js"></script>
    <script>
        $(document).ready(function(){


            $('.product-images').slick({
                dots: true
            });

        });
        function deleteOrder(orderId) {
            $.post(
                '${pageContext.request.contextPath}/front/Orders/deleteOrder',
                {'orderId':orderId},
                function(result) {
                    if (result.status==1)
                        location.href='${pageContext.request.contextPath}/front/Orders/findAll?page=2';
                }
            )
        }
    </script>
</body>
</html>