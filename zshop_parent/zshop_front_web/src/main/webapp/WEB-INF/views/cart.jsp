<%@ page import="java.util.ArrayList" %>
<%@ page import="com.itany.zshop.pojo.Product" %>
<%@ page import="com.itany.zshop.pojo.Order" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>地狗-购物车</title>

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
<style>
    .hidden{
        display: none;
    }
</style>
    <!-- JavaScripts -->
    <script src="${pageContext.request.contextPath}/js/modernizr.js"></script>
    <script>
        //删除购物车中的单个
        function deleteone(i,test) {
            if (test==true)
                $.post(
                    '${pageContext.request.contextPath}/front/sessions/deleteSession',
                    {'i':i},
                    function (result) {
                        if (result.status==1)
                            location.href='${pageContext.request.contextPath}/front/sessions/cart?page=3';
                    }
                );
        }
        //删除购物车中的所有
        function deleteAll(test) {
            if (test){
                $.post(
                    '${pageContext.request.contextPath}/front/sessions/deleteAll',
                    function (result) {
                        if (result.status==1)
                            location.href='${pageContext.request.contextPath}/front/sessions/cart?page=3';
                    }
                );
            }
        }
        //增加数量改变价格
        function changePrice(i,price,number) {
            document.getElementById('price'+i).innerHTML=number*price;
            $.post(
                '${pageContext.request.contextPath}/front/sessions/changePrice',
                {'i':i,'number':number},
                function(result) {
                    location.href='${pageContext.request.contextPath}/front/sessions/cart?page=3';
                }
            )
        }
        //提交订单，结算
        function submits() {
            Ajax().get('${pageContext.request.contextPath}/front/Orders/addOrder',function (result) {
                console.log(result);
                var json = JSON.parse(result);
                if (json.status!=1){
                    alert(json.message);
                }
                else {
                    var path = document.getElementById("save").value;
                    window.location.href=path+'/front/Orders/findAll?page=2';
                }
            });
        }
    </script>
</head>
<body>


<!-- Wrap -->
<div id="wrap">
<input style="display: none;" type="text" id="save" value="${pageContext.request.contextPath}">
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
                                            <li> <a href="#" onclick="logout()">退出登录 </a> </li>
                                        </ul>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <li> <a href="${pageContext.request.contextPath}/front/board/boards">留言板</a> </li>
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

        <!--======= 购物车 =========-->
        <section class="padding-bottom-100 pages-in chart-page">
            <div class="container">

                <!-- Payments Steps -->
                <div class="shopping-cart text-center">
                    <div class="cart-head">
                        <ul class="row">
                            <!-- PRODUCTS -->
                            <li class="col-sm-2 text-left">
                                <h6>商品</h6>
                            </li>
                            <!-- NAME -->
                            <li class="col-sm-4 text-left">
                                <h6>商品名称</h6>
                            </li>
                            <!-- PRICE -->
                            <li class="col-sm-2">
                                <h6>单价</h6>
                            </li>
                            <!-- QTY -->
                            <li class="col-sm-1">
                                <h6>数量</h6>
                            </li>

                            <!-- TOTAL PRICE -->
                            <li class="col-sm-2">
                                <h6>总计</h6>
                            </li>
                            <li class="col-sm-1"> </li>
                        </ul>
                    </div>

                    <!-- Cart Details -->
                    <%
                        double allprice=(double)0;
                        if(session.getAttribute("orders")==null){
                            out.println("</div>\n" +
                                    "            </div>\n" +
                                    "        </section>\n" +
                                    "<section class=\"padding-top-100 padding-bottom-100 light-gray-bg shopping-cart small-cart\">\n" +
                                    "            <div class=\"container\">\n" +
                                    "\n" +
                                    "                <!-- SHOPPING INFORMATION -->\n" +
                                    "                <div class=\"cart-ship-info margin-top-0\">\n" +
                                    "                    <div class=\"row\">\n" +
                                    "\n" +
                                    "                        <!-- DISCOUNT CODE -->\n" +
                                    "                        <div class=\"col-sm-7\">\n" +
                                    "                            <h6>输入物流地址</h6>\n" +
                                    "                            <form>\n" +
                                    "                                <label>\n" +
                                    "                                    <input type=\"text\" value=\"\" placeholder=\"请输入您的家庭地址\">\n" +
                                    "                                </label>\n" +
                                    "                            <div class=\"coupn-btn\">\n" +
                                    "                                <button href=\"javascript:history.go(-1)\" class=\"btn btn-small btn-dark\">返回购物</button>\n" +
                                    "                                <button href=\"checkout.html\" disabled=\"disabled\" class=\"btn btn-small btn-dark\">确定无误，购买！</button>\n" +
                                    "                            </div>\n" +
                                    "                            </form>\n" +
                                    "                        </div>\n" +
                                    "\n" +
                                    "                        <div class=\"col-sm-5\">\n" +
                                    "                            <h6>grand total</h6>\n" +
                                    "                            <div class=\"grand-total\">\n" +
                                    "                                <div class=\"order-detail\">\n" +
                                    "                                    <!-- SUB TOTAL -->\n" +
                                    "                                    <p class=\"all-total\">TOTAL COST <span> 0</span></p>");
                        }
                        else {
                        ArrayList<Order> products=(ArrayList<Order>)session.getAttribute("orders");
                        for (int i=0;i<products.size();i++){
                    %>
                    <ul class="row cart-details">
                        <li class="col-sm-6">
                            <div class="media">
                                <!-- Media Image -->
                                <div class="media-left media-middle"> <a href="#." class="item-img">
                                    <img class="media-object img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/s3.jpg" alt=""> </a> </div>

                                <!-- Item Name -->
                                <div class="media-body">
                                    <div class="position-center-center">
                                        <a href="productdetail.html"><h5><%=products.get(i).getName()%></h5></a>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <!-- PRICE -->
                        <li class="col-sm-2">
                            <div class="position-center-center"> <span class="price">¥<%=products.get(i).getPrice()%></span> </div>
                        </li>

                        <!-- QTY -->
                        <li class="col-sm-1">
                            <div class="position-center-center">
                                <div class="quinty">
                                    <!-- 数量 -->
                                    <input value="<%=products.get(i).getNumbers()%>" id="number<%=i%>" onchange="changePrice(<%=i%>,<%=products.get(i).getPrice()%>,this.value)"
                                           style="height: 32px; border: 1px solid #000000;color: black;" type="number" min="0">
                                </div>
                            </div>
                        </li>

                        <!-- TOTAL PRICE -->
                        <li class="col-sm-2">
                            <div class="position-center-center"> <span id="price<%=i%>" class="price">¥<%=products.get(i).getPrices()%></span> </div>
                        </li>

                        <!-- REMOVE -->
                        <li class="col-sm-1">
                            <div class="position-center-center"> <a onclick="deleteone(<%=i%>,confirm('是否确认删除'));"><i class="icon-close"></i></a> </div>
                        </li>
                    </ul>
                    <%
                            allprice=allprice+products.get(i).getPrices();
                        }%>

                </div>
            </div>
        </section>

        <!--======= PAGES INNER =========-->
        <section class="padding-top-100 padding-bottom-100 light-gray-bg shopping-cart small-cart">
            <div class="container">

                <!-- SHOPPING INFORMATION -->
                <div class="cart-ship-info margin-top-0">
                    <div class="row">

                        <!-- DISCOUNT CODE -->
                        <div class="col-sm-7">
                            <h6>输入物流地址</h6>
                                <label>
                                    <input type="text" value="" placeholder="请输入您的家庭地址">
                                </label>
                                <div class="coupn-btn">
                                    <button onclick="location.href='${pageContext.request.contextPath}/front/product/search'" class="btn btn-small btn-dark">返回购物</button>
                                    <button onclick="submits()" class="btn btn-small btn-dark">确定无误，购买！</button>
                                </div>
                        </div>

                        <div class="col-sm-5">
                            <h6>grand total</h6>
                            <div class="grand-total">
                                <div class="order-detail">
                                    <%
                                        for (int i=0;i<products.size();i++){

                                    %>
                                    <p><%=products.get(i).getName()%><span>¥<%=products.get(i).getPrice()%></span></p>
                                    <%
                                        }
                                    %>

                                    <!-- SUB TOTAL -->
                                    <p class="all-total">TOTAL COST <span> ¥<%=allprice%></span></p>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!--======= FOOTER =========-->
    <footer>
        <div class="container">
            <!-- Rights -->
            <div class="rights">
                <p>已经到底啦！别拉啦！ </p>
                <div class="scroll"> <a href="#wrap" class="go-up"><i class="lnr lnr-arrow-up"></i></a> </div>
            </div>
        </div>
    </footer>

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
        </script></div>
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