<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>地狗</title>

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
    <!-- JavaScripts -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/modernizr.js"></script>
    <style>
        .div-line{
            display: inline;
        }
        .btn-xss{
            border-radius: 3px;
            padding: 1px 5px;
            font-size: 12px;
            line-height: 1.5;
        }
        .hidden{
            display: none;
        }
    </style>
    <script>
        //添加到购物车
        function addOrder(id) {
            $.post(
                '${pageContext.request.contextPath}/front/sessions/addSession',
                {'id':id},
                function (result) {
                    alert(result.message);
                }
            );
        }
    </script>
</head>
<body>

<!-- Wrap -->
<div id="wrap">

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
                                        <a href="#." class="dropdown-toggle" data-toggle="modal" data-target="#regModal">注册</a>
                                    </li>
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
                                            <li> <a href="http://localhost:8088/zshop_backend_web_war_exploded/showLogin" target="_blank" class="dropdown-toggle">后台登录</a> </li>
                                            <li> <a href="#" onclick="logout()">退出登录 </a> </li>
                                        </ul>
                                    </li>
                                    <li> <a href="${pageContext.request.contextPath}/front/board/boards">留言板</a> </li>
                                </c:otherwise>
                            </c:choose>

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
    <!-- Content -->
    <div id="content">

        <!-- Products -->
        <section style="padding-top: 50px;" class="shop-page padding-bottom-100">
            <div class="container">
                <div class="row">

                    <!-- Shop SideBar -->
                    <div class="col-sm-3">
                        <div class="shop-sidebar">

                            <!-- Category -->
                            <h5 class="shop-tittle margin-bottom-30">分类</h5>
                            <ul class="shop-cate">
                                <form class="form-inline hot-search" action="${pageContext.request.contextPath}/front/product/search" method="post">
                                <input id="xijie" style="display: none;" value="${productParam.name}">
                                <input style="display: none;" id="leibie" value="-1${productParam.productTypeId}">
                                <li><a href="javascript:void(0);" onclick="num('1')"> 运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;动</a></li>
                                <li><a href="javascript:void(0);" onclick="num('2')"> 男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;装</a></li>
                                <li><a href="javascript:void(0);" onclick="num('3')"> 女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;装</a></li>
                                <li><a href="javascript:void(0);" onclick="num('4')"> 手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</a></li>
                                <li><a href="javascript:void(0);" onclick="num('5')"> 电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;脑</a></li>
                                <li><a href="javascript:void(0);" onclick="num('6')"> 其&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;他</a></li>
                                <button style="margin-top: 10px;" class="btn btn-xss pull-right" type="submit">查询分类</button>
                                </form>
                            </ul>
                        </div>
                    </div>

                    <!-- Item Content -->
                    <div class="col-sm-9">
                        <div class="item-display" style="margin-bottom: 10px;">
                            <div class="row">
                                <!-- Products Select -->
                                <div class="col-xs-12" style="margin-bottom: 30px;">
                                    <div class="pull-left">
                                        <!-- Short By -->
                                        <form class="form-inline hot-search" action="${pageContext.request.contextPath}/front/product/search" method="post">
                                            <div class="div-line" style="margin-right: 10px;">
                                                查询的宝贝：<input name="name" value="${productParam.name}" id="search_details" type="text">
                                            </div>
                                            <div class="div-line" style="margin-right: 10px;">
                                                ¥<input name="minPrice" value="${productParam.minPrice}" id="minpr" placeholder="最低价格" style="width: 84px;" type="number" min="0">
                                                -
                                                ¥<input name="maxPrice" value="${productParam.maxPrice}" id="maxpr" placeholder="最高价格" style="width: 84px;" type="number" min="0">
                                                <select id="type" style="width: 77px;height: 25px;margin-left: 5px;margin-right: 5px;">
                                                    <option value="-1" selected="selected">全部种类</option>
                                                    <c:forEach items="${productTypes}" var="productType">
                                                        <option value="${productType.id}"
                                                                <c:if test="${productType.id==productParam.productTypeId}">selected</c:if>>${productType.name}</option>
                                                    </c:forEach>
                                                </select>
                                                <button type="submit" onclick="detialsearch()" data-placement="bottom" class=" btn-xss btn btn-info"
                                                        style="padding: 4px 25px;color: #ff0000;border: 1px solid #ff0000;">确定</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="div-line pull-right">
                                        <button data-placement="bottom" title="根据价格的从低到高排序商品" class="btn-xss btn btn-default">价格⬇</button>
                                        <button data-placement="bottom" title="根据价格的从高到低排序商品" class="btn-xss btn btn-default">价格⬆</button>
                                    </div>
                                </div>

                        </div>

                        <!-- Popular Item Slide -->
                        <div id="results" class="papular-block row">
                            <c:forEach items="${pageInfo.list}" var="product">
                                <!-- Item -->
                                <div class="col-md-4">
                                    <div class="item">
                                        <!-- Item img -->
                                        <div class="item-img">
                                            <img class="img-1" src="http://localhost:8088/zshop_backend_web_war_exploded/${product.image}" alt="" >
                                            <img class="img-2" src="http://localhost:8088/zshop_backend_web_war_exploded/${product.image}" alt="" >
                                            <!-- Overlay -->
                                            <div class="overlay">
                                                <div class="position-center-center">
                                                    <div class="inn" style="padding-top: 15px;">
                                                        <a href="http://localhost:8088/zshop_backend_web_war_exploded/${product.image}" data-lighter>
                                                            <i class="icon-magnifier"></i></a>
                                                        <a href="#" onclick="addOrder(${product.id})"><i class="icon-basket"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Item Name -->
                                        <div class="item-name"> <a href="${pageContext.request.contextPath}/front/product/findById?id=${product.id}">${product.name}</a>
                                            <p>${product.info}</p>
                                        </div>
                                        <!-- Price -->
                                        <span class="price">¥${product.price}</span> </div>
                                </div>

                            </c:forEach>
                        </div>

                        <ul class="pagination" id="pagination">
                          <!--  <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>-->
                        </ul>
                    </div>
                </div>
            </div>
            </div>
        </section>
        <footer>
            <div class="container">
                <div class="rights">
                    <p>已经到底啦！别拉啦！ </p>
                    <div class="scroll"> <a href="#wrap" class="go-up"><i class="lnr lnr-arrow-up"></i></a> </div>
                </div>
            </div>
        </footer>

        <!--======= RIGHTS =========-->
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
        <!--注册-->
        <div class="modal fade" id="regModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">

                <div class="modal-content" id="register-account">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="text-center" style="color: #ff5c6c">地狗-会员注册</h4>
                        <small class="text-danger" id="registerInfo"></small>
                    </div>
                    <form action="${pageContext.request.contextPath}/front/customer/regist" class="form-horizontal" method="post">
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户姓名:</label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" name="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">登陆账号:</label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" name="loginName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">登录密码:</label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="password" name="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">联系电话:</label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" name="phone">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">联系地址:</label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" name="address">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning" data-dismiss="modal" aria-label="Close">关&nbsp;&nbsp;闭</button>
                            <button type="reset" class="btn btn-warning">重&nbsp;&nbsp;置</button>
                            <button type="submit" class="btn btn-warning">注&nbsp;&nbsp;册</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
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
    function skippage(page) {
        location.href='${pageContext.request.contextPath}/front/product/search?pageNum='+page;
    }
    $(document).ready(function(){
        var pagination = document.getElementById("pagination");
        var now = ${pageInfo.pageNum};
        var total = ${pageInfo.pages};
        var i = 1;
        for(;i<=total;++i){
            if(i == now)
                pagination.innerHTML+="<li class=\"active\"><a onclick='skippage("+i+")' href=\"#\">"+i+"</a></li>";
            else
                pagination.innerHTML+="<li><a onclick='skippage("+i+")' href=\"#\">"+i+"</a></li>";
        }
    });
</script>
</body>
</html>