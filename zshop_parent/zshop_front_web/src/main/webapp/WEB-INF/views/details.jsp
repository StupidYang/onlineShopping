<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
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
    <script src="${pageContext.request.contextPath}/js/modernizr.js"></script>
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
    <style>
        .btn-xss{
            border-radius: 3px;
            padding: 1px 5px;
            font-size: 16px;
            line-height: 2;
            width: 80px;
            background: #ffffff;
            border: 1px solid #ffffff;
        }
        .btn-active{
            background: #ff0800;
            color: white;
        }
        .btn-cart{
            border: none;
            color: #ffffff;
            display: inline-block;
            padding: 5px 50px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: 18px;
            border-radius: 0px;
            font-family: 'Montserrat', sans-serif;
            line-height: 36px;
            background: #ff0005;
            border: 1px solid #ff0900;
            letter-spacing: 1px;
            position: relative;
            z-index: 1;
        }
        .btn-buynow{
            border: none;
            color: #ff0006;
            display: inline-block;
            padding: 5px 50px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: 18px;
            border-radius: 0px;
            font-family: 'Montserrat', sans-serif;
            line-height: 36px;
            background: #ffa8b5;
            border: 1px solid #ff0900;
            letter-spacing: 1px;
            position: relative;
            z-index: 1;
        }
        .btn-size{
            border-radius: 3px;
            padding: 1px 5px;
            font-size: 16px;
            line-height: 1.5;
            width: 40px;
            background: #ffffff;
            border: 1px solid #000000;
        }
    </style>
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

        <!-- Popular Products -->
        <section style="padding-top:50px;" class="padding-bottom-100">
            <div class="container">

                <!-- SHOP DETAIL -->
                <div class="shop-detail">
                    <div class="row">

                        <!-- Popular Images Slider -->
                        <div class="col-md-7">

                            <!-- Images Slider -->
                            <div class="images-slider">
                                <ul class="slides" style="margin-left: 110px;">
                                    <li data-thumb="${product.image}"> <img class="img-responsive" src="${product.image}"  alt=""> </li>
                                </ul>
                            </div>
                        </div>

                        <!-- COntent -->
                        <div class="col-md-5">
                            <h4>${product.name}</h4>
                            <span class="price"><small>¥</small>${product.price}</span>

                            <!-- Sale Tags -->
                            <ul class="item-owner">
                                <li>运费：<font id="sell">江西</font>至<a href="#" id="secity" data-toggle="modal" data-target="#city">请选择</a><font id="cost"></font></li>
                                <li>卖家：<span>马煜童</span></li>
                            </ul>

                            <!-- Item Detail -->
                            <p>
                                ${product.info}
                            </p>

                            <!-- Short By -->
                            <div class="some-info">
                                <ul class="row margin-top-30">
                                    <!-- 加入购物车和立即购买 -->
                                    <li class="col-xs-6"> <a href="${pageContext.request.contextPath}/front/sessions/cart?page=3" onclick="addOrder(${product.id})" class="btn-buynow">立即购买</a> </li>
                                    <li class="col-xs-6"> <a href="#" onclick="addOrder(${product.id})" class="btn-cart">加入购物车</a> </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!--======= PRODUCT DESCRIPTION =========-->
                <div class="item-decribe">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs animate fadeInUp" data-wow-delay="0.4s" role="tablist">
                        <li role="presentation" class="active"><a href="#descr" role="tab" data-toggle="tab">商品详情</a></li>
                        <li role="presentation"><a href="#review" role="tab" data-toggle="tab">商品评价</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content animate fadeInUp" data-wow-delay="0.4s">
                        <!-- 商品描述-->
                        <div role="tabpanel" class="tab-pane fade in active" id="descr">
                            品牌名称：LEHNO/莱依诺<br><br>
                            <div>
                                产品参数：
                                <br>
                                <br>
                                <table class="table">
                                    <tbody>
                                    <tr>
                                        <td>品牌: MYT/手工定制</td>
                                        <td>适用年龄: 18-25周岁</td>
                                        <td>尺码: S M L XL 需要袜子可联系客服加10元一双</td>
                                    </tr>
                                    <tr>
                                        <td>风格: 韩版</td>
                                        <td>款式: 裙子</td>
                                        <td>货号: 75255</td>
                                    </tr>
                                    <tr>
                                        <td>年份季节: 2019年冬季</td>
                                        <td>袖长: 长袖</td>
                                        <td>材质成分: 其他100%</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <ul>
                                    <li>
                                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/1.jpg">
                                    </li>
                                    <li>
                                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/2.jpg">
                                    </li>
                                    <li>
                                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/3.jpg">
                                    </li>
                                    <li>
                                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/4.jpg">
                                    </li>
                                    <li>
                                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/5.jpg">
                                    </li>
                                    <li>
                                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/6.jpg">
                                    </li>
                                    <li>
                                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/7.jpg">
                                    </li>
                                    <li>
                                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/8.jpg">
                                    </li>
                                    <li>
                                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/9.jpg">
                                    </li>
                                    <li>
                                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/10.jpg">
                                    </li>
                                    <li>
                                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/sp_image/jk/11.jpg">
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- 商品评论 -->
                        <div role="tabpanel" class="tab-pane fade" id="review">
                            <h6>来看看大家有啥评价</h6>
                            <br>
                            <!-- REVIEW PEOPLE 1 -->
                            <c:set var="temp" value="0"></c:set>
                            <c:forEach items="${evaluates}" var="evaluate">
                            <div class="media">
                                <div class="media-left">
                                    <!--  Image -->
                                    <div class="avatar"> <a href="#"> <img class="img-thumbnail" src="${pageContext.request.contextPath}/index-img/hyr.jpg" alt=""> </a> </div>
                                </div>
                                <!--  Details -->
                                <div class="media-body">
                                    <p style="font-size: 18px;font-family: 微软雅黑;" class="font-playfair">${evaluate.evaluate}</p>
                                </div>
                                <c:set var="a" value="${evaluate.id}"></c:set>
                            </div>
                            </c:forEach>
                            <!-- ADD REVIEW -->
                                <ul class="row">
                                    <!--<form action="${pageContext.request.contextPath}/front/evaluate/insert" method="post">-->
                                    <h6 class="margin-t-40">您的评价</h6>
                                        <input class="hidden" id="product_id" name="product_id" value="${product.id}">
                                    <li class="col-sm-12">
                                        <label>
                                            <textarea style="width: 1102px;height: 152px;margin-top: 5px;margin-bottom: 10px;margin-left: 15px;" id="evaluate" name="evaluate"></textarea>
                                        </label>
                                    </li>
                                    <li class="col-sm-6 col-sm-offset-6">
                                        <button type="button" onclick="pingjia()" class="btn btn-dark btn-small pull-right no-margin">提交评价</button>
                                    </li>
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

    </div>
    <div class="modal fade" id="city" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">选择城市</h4>
                </div>
                <div class="modal-body">
                    <div class="tabs-container">
                        <ul class="nav nav-tabs">
                            <li id="tabs_1" class="active"><a data-toggle="tab" href="#tab-1">省份</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
                                <div class="panel-body">
                                    <div>
                                        <button onclick="Oncity(this)" class="btn-xss" value="北京">北京</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="天津">天津</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="河北">河北</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="山西">山西</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="内蒙古">内蒙古</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="辽宁">辽宁</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="吉林">吉林</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="黑龙江">黑龙江</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="江苏">江苏</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="浙江">浙江</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="安徽">安徽</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="福建">福建</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="江西">江西</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="山东">山东</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="河南">河南</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="湖北">湖北</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="湖南">湖南</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="广东">广东</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="广西">广西</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="海南">海南</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="重庆">重庆</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="四川">四川</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="贵州">贵州</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="云南">云南</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="西藏">西藏</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="陕西">陕西</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="甘肃">甘肃</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="青海">青海</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="宁夏">宁夏</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="新疆">新疆</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="台湾">台湾</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="香港">香港</button>
                                        <button onclick="Oncity(this)" class="btn-xss" value="澳门">澳门</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="Onrun()" data-dismiss="modal" class="btn btn-primary">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
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
</div>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script>
    function skip(a) {
        window.location.href=a;
    }
    function pingjia() {
        var product_id = document.getElementById("product_id").value;
        var evaluate = document.getElementById("evaluate").value;
        var data = "product_id="+product_id+"&evaluate="+evaluate;
        Ajax().post("${pageContext.request.contextPath}/front/evaluate/insert",data,skip("${pageContext.request.contextPath}/front/product/findById?id="+product_id));
    }
</script>
<script>
    var place;
    var e;
    function Oncity(a) {
        a.setAttribute("class",a.getAttribute("class").concat(" btn-active"));
        window.e = a;
        window.place = a.value;
        //console.log(window.place);
    }
    function Onrun() {
        window.e.setAttribute("class",window.e.getAttribute("class").replace(" btn-active",""));
        document.getElementById("secity").innerHTML=window.place;
        if(document.getElementById("sell")==window.place){
            document.getElementById("cost").innerHTML="  运费：8.00";
        }else {
            document.getElementById("cost").innerHTML="  运费：12.00";
        }
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