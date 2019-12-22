<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>地狗-留言板</title>
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
    <script src="${pageContext.request.contextPath}/js/modernizr.js"></script>
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
        <section class="padding-bottom-100">
            <div class="container">
                <div class="item-decribe" style="margin-top: 0px;">
                <div class="tab-content animate fadeInUp" style="margin-top: 0px;">
                    <div role="tabpanel" class="tab-pane fade in active" style="margin-top: 0px;">
        <h3 style="color: #ff4143">意见反馈与交流</h3>
                        <hr>
        <!-- REVIEW PEOPLE 1 -->
                        <c:forEach items="${boards}" var="board">
            <div class="media">
                <div class="media-left">
                    <!--  Image -->
                    <div class="avatar"> <a href="#"> <img class="img-thumbnail" src="${pageContext.request.contextPath}/index-img/hyr.jpg" alt=""> </a> </div>
                </div>
                <!--  Details -->
                <div class="media-body">
                    <p style="font-size: 18px;font-family: 微软雅黑;" class="font-playfair">${board.content}</p>
                    <small>uid：${board.customer_id}</small>
                    <div class="pull-right">
                        <a href="#" onclick="changere('${board.id}')"><small>回复</small></a>
                    </div>
                    <c:choose>
                    <c:when test="${empty board.replay}">
                    </c:when>
                    <c:otherwise>
                        <br><hr><small>神秘人${customer.id}</small>回复：<p style="font-size: 16px;font-family: 微软雅黑;" class="font-playfair">${board.replay}</p>
                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
                        </c:forEach>
        <!-- ADD REVIEW -->
                        <div class="item-decribe">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs animate fadeInUp" data-wow-delay="0.4s" role="tablist">
                                <li role="presentation" class="active"><a href="#descr" role="tab" data-toggle="tab">留言</a></li>
                                <li role="presentation"><a href="#review" role="tab" data-toggle="tab">回复</a></li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content animate fadeInUp" data-wow-delay="0.4s">
                                <!-- 留言-->
                                <div role="tabpanel" class="tab-pane fade in active" id="descr">
                                        <ul class="row">
                                            <!--<form action="${pageContext.request.contextPath}/front/board/insert" method="post">-->
                                                <h5 class="margin-t-40" style="margin-top: 0px;margin-left: 20px;">有啥想法说出来吧</h5>
                                                <input class="hidden" id="customer_id" value="${customer.id}">
                                                <li class="col-sm-12">
                                                    <label class="col-sm-12">
                                                        <textarea style="width: 1102px;height: 152px;margin-top: 5px;margin-bottom: 10px;" id="liucontent" name="content"></textarea>
                                                    </label>
                                                </li>
                                                <li class="col-sm-6 col-sm-offset-6">
                                                    <button type="button" onclick="liuyan()" class="btn btn-dark btn-small pull-right no-margin">提交</button>
                                                </li>
                                        </ul>
                                </div>
                                <!-- 回复 -->
                                <div role="tabpanel" class="tab-pane fade" id="review">
                                        <ul class="row">
                                            <!--<form action="${pageContext.request.contextPath}/front/board/update" method="post">-->
                                                <h5 class="margin-t-40" style="margin-top: 0px;margin-left: 20px;">您的回复</h5>
                                                <input type="text" id="reid" class="hide" name="id" value="">
                                                <li class="col-sm-12">
                                                    <label>
                                                        <textarea style="width: 1102px;height: 152px;margin-top: 5px;margin-bottom: 10px;margin-left: 15px;" id="replay"></textarea>
                                                    </label>
                                                </li>
                                                <li class="col-sm-6 col-sm-offset-6">
                                                    <button type="button" onclick="huifu()" class="btn btn-dark btn-small pull-right no-margin">提交</button>
                                                </li>
                                        </ul>
                                </div>
                            </div>
                        </div>

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
    </div>
</div>


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
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script>
    function skip(a) {
        location.href=a;
    }
    function huifu() {
        var id = document.getElementById("reid").value;
        var replay = document.getElementById("replay").value;
        var data = "id="+id+"&replay="+replay;
        Ajax().post("${pageContext.request.contextPath}/front/board/update",data,skip("${pageContext.request.contextPath}/front/board/boards"));
    }
    function liuyan() {
        var customer_id = document.getElementById("customer_id").value;
        var content = document.getElementById("liucontent").value;
        var data = "customer_id="+customer_id+ "&content="+content;
        Ajax().post("${pageContext.request.contextPath}/front/board/insert",data,skip("${pageContext.request.contextPath}/front/board/boards"));
    }
    function changere(a){
        console.log(a);
        console.log(document.getElementById("reid"));
        document.getElementById("reid").value=""+a;
    }
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

<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/own-menu.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.lighter.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>

<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script type="text/javascript" src="${pageContext.request.contextPath}/rs-plugin/js/jquery.tp.t.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/rs-plugin/js/jquery.tp.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
