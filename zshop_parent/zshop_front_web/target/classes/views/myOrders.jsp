<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>地狗-我的订单</title>
    <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/rs-plugin/css/settings.css" media="screen" />

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script>
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
</head>

<body>
<!-- header -->
<header>
    <div class="sticky">
        <div class="container">
            <div class="logo"><img class="img-responsive" src="${pageContext.request.contextPath}/index-img/logo.png" alt="" ></div>
            <nav class="navbar ownmenu">
                <!-- NAV -->
                <div class="collapse navbar-collapse" id="nav-open-btn">
                    <ul class="nav">
                        <li class="dropdown active"> <a href="${pageContext.request.contextPath}/index.jsp">首&nbsp;&nbsp;页</a></li>
                        <c:choose>
                            <c:when test="${empty customer}">
                                <li class="dropdown">
                                    <a href="#." class="dropdown-toggle" data-toggle="modal" data-target="#loginModal">请先登录</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="dropdown"> <a id="use" href="#." class="dropdown-toggle" data-toggle="dropdown">${customer.name}</a>
                                    <ul id="use_list" class="dropdown-menu">
                                        <h6>欢迎回来，${customer.name}></h6>
                                        <hr>
                                        <li> <a href="${pageContext.request.contextPath}/front/Orders/findAll?page=2">我的订单 </a> </li>
                                        <li> <a href="${pageContext.request.contextPath}/front/product/center?page=4">个人信息 </a> </li>
                                        <li> <a href="#" onclick="logout()">退出登录 </a> </li>
                                    </ul>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <li> <a href="contact.html">留言板</a> </li>
                    </ul>
                </div>
                <div class="nav-right">
                    <ul class="navbar-right">
                        <!-- USER BASKET -->
                        <li class="dropdown user-basket">
                            <a href="${pageContext.request.contextPath}/front/sessions/cart?page=3" class="dropdown-toggle">
                                <i class="icon-basket-loaded"></i> </a>
                        </li>
                        <!-- SEARCH BAR -->
                        <li class="dropdown"> <a href="javascript:void(0);" class="search-open"><i class=" icon-magnifier"></i></a>
                            <div class="search-inside animated bounceInUp"> <i class="icon-close search-close"></i>
                                <div class="search-overlay"></div>
                                <div class="position-center-center">
                                    <div class="search">
                                        <form class="form-inline hot-search" action="${pageContext.request.contextPath}/front/product/search" method="post">
                                            <input name="name" value="${productParam.name}" id="searchtext" type="search" placeholder="请输入您想要的商品">
                                            <button type="submit"><i class="icon-check"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>
    <!-- content start -->
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header" style="margin-bottom: 0px;">
                    <h3>我的订单</h3>
                </div>
            </div>
        </div>
        <table class="table table-hover   orderDetail">
            <c:forEach items="${myOrders.list}" var="myorder">
            <tr>
                <td colspan="5">
                    <span>订单编号：<a href="">${myorder.no}</a></span>
                    <span>成交时间：${myorder.createDate}</span>
                </td>
            </tr>
            <tr>
                <td><img src="http://localhost:9001${myorder.image}" alt=""></td>
                <td class="order-content">
                    <p>
                        ${myorder.name}
                    </p>
                </td>
                <td>
                    ￥${myorder.price}
                </td>
                <td>
                    ×${myorder.numbers}
                </td>
                <td class="text-color">
                    ￥${myorder.prices}
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <span class="pull-right"><button class="btn btn-danger" onclick="deleteOrder(${myorder.id})">删除订单</button></span>
                    <span class="">总计:<span class="text-color">￥${myorder.prices}</span></span>
                </td>
            </tr>
            </c:forEach>
        </table>
    </div>
<footer>
    <div class="container">
        <div class="rights">
            <p>已经到底啦！别拉啦！ </p>
            <div class="scroll"> <a href="#wrap" class="go-up"><i class="lnr lnr-arrow-up"></i></a> </div>
        </div>
    </div>
</footer>
    <!-- content end-->
<!--======= 模态框 =========-->
<!--登陆-->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <!-- 用户名密码登陆 start -->
        <div class="modal-content" id="login-account">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="text-center" style="color: #ff5c6c">地狗-会员登陆</h4>
                <small class="text-danger" id="loginInfo"></small>
            </div>
            <form  class="form-horizontal" method="post" id="frmLoginByAccount">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">用户名：</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="text" name="loginName" placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="password" name="password" placeholder="请输入密码">
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button style="margin-right: 100px;" type="button" class="btn btn-warning" data-dismiss="modal" aria-label="Close">关&nbsp;&nbsp;闭</button>
                    <button type="button" class="btn btn-warning" onclick="loginByAccount()">登&nbsp;&nbsp;陆</button> &nbsp;&nbsp;
                </div>
            </form>
        </div>
        <!-- 用户名密码登陆 end -->
    </div>
</div>
</div>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/own-menu.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.lighter.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>

<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script type="text/javascript" src="${pageContext.request.contextPath}/rs-plugin/js/jquery.tp.t.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/rs-plugin/js/jquery.tp.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script>
    function num(a) {
        var num = a;
        document.getElementById("leibie").value = num;
        console.log(num);
    }
</script>
<script>
    //密码登入
    function loginByAccount() {
        $.post(
            '${pageContext.request.contextPath}/front/customer/loginByAccount',
            $('#frmLoginByAccount').serialize(),
            function (result) {
                if (result.status==1) {
                    $('#loginModal').modal('hide');//登入模态框消失
                    location.reload(true);
                }
                else
                    $('#loginInfo').html(result.message);
            }
        );
    }
    //退出
    function logout() {
        $.post(
            '${pageContext.request.contextPath}/front/customer/logout',
            function (result) {
                if (result.status==1){
                    location.reload(true);
                }
                else
                    alert("退出失败！");
            }
        )
    }
</script>
</body>
</html>