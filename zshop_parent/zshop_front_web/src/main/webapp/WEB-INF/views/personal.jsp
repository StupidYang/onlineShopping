<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>地狗-个人信息</title>
    <link href="${pageContext.request.contextPath}/ol/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- Toastr style -->
    <link href="${pageContext.request.contextPath}/ol/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="${pageContext.request.contextPath}/ol/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/ol/js/personalset.js"></script>
    <script src="${pageContext.request.contextPath}/ol/js/ajax.js"></script>
    <style>
        .hide{
            display: none;
        }
    </style>
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
                            <li><a href="myOrders.jsp">我的订单</a></li>
                            <li class="divider"></li>
                            <li><a href="#" onclick="logout()">退出登录</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        DD
                    </div>
                </li>
                <li>
                    <a href="personal.jsp"><i class="fa fa-th-large"></i><span class="nav-label">个人信息</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i> <span class="nav-label">订单管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="cart.jsp" target="_blank">我的购物车</a></li>
                        <li><a href="myOrders.jsp">已买到的宝贝</a></li>
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
                        <a href="#" onclick="logout()">
                            <i class="fa fa-sign-out"></i> 退出登录
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <!--中间-->
        <div class="row  border-bottom white-bg dashboard-header">
            <div class="col-sm-3">
                <h2>欢迎您，${customer.name}</h2>
                <small>来看看您新买的宝贝吧！</small>
            </div>
            <div class="col-sm-6">
            </div>
            <div class="col-sm-3">
            </div>
        </div>
        <!--界面-->
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-4">
                    <div class="row m-b-lg m-t-lg">
                        <!--个人简介-->
                        <div class="col-md-6">
                            <div class="profile-image">
                                <img src="${pageContext.request.contextPath}/ol/img/a4.jpg" class="img-circle circle-border m-b-md" alt="profile">
                            </div>
                            <div class="profile-info">
                                <div class="">
                                    <div>
                                        <h2 class="no-margins">
                                            ${customer.name}
                                        </h2>
                                        <h4>地狗会员</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins" id="xinxikuang">
                        <div class="ibox-title">
                            <h5>个人信息</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-wrench"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="#" onclick="personalSet()">修改</a>
                                    </li>
                                </ul>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content no-padding" id="personalbox">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    姓名：${customer.name}
                                </li>
                                <li class="list-group-item">
                                    账号：${customer.login_name}
                                </li>
                                <li class="list-group-item ">
                                    注册日期：${customer.regist_date}
                                </li>
                                <li class="list-group-item">
                                    地址：${customer.address}
                                </li>
                                <li class="list-group-item">
                                    联系电话：${customer.phone}
                                </li>
                                <li class="list-group-item">
                                    <button type="button" class="btn btn-primary btn-xs">UID</button>${customer.id}
                                </li>
                                <li class="list-group-item" id="lilast">
                                    标签：<button class="btn btn-white btn-xs" type="button">非常难</button>
                                </li>
                                <li class="list-group-item text-right hide" id="cancel">
                                    <a class='btn btn-w-m btn-warning' onclick="reset()">取消</a>&nbsp;&nbsp;
                                    <button type='button' id="tijiao" onclick="personalx()" class='btn btn-w-m btn-info'>提交</button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-订单信息-->
                <div class="col-lg-4">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>订单信息</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-wrench"></i>
                                </a>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content ibox-heading">
                            <h3>这些是您买的宝贝哦！</h3>
                            <small><i class="fa fa-map-marker"></i>您的宝贝正在路上哦！</small>
                        </div>
                        <div class="ibox-content inspinia-timeline">
                            <div class="timeline-item">
                            <c:forEach items="${myOrders.list}" var="myorder">
                                <!--一个样例-->
                                <div class="row">
                                    <div class="col-xs-3 date">
                                        <i class="fa fa-briefcase"></i>最新物流时间<br>
                                        <small class="text-navy">2019-12-20 00:00</small></div>
                                    <div class="col-xs-7 content no-top-border"><p class="m-b-xs">订单编号：
                                <strong>${myorder.no}</strong></p>
                                        <p>商品名称：${myorder.name}</p>
                                        <p>总价：￥${myorder.prices}</p>
                                    </div>
                                </div>
                            </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div>
                会议管理系统
            </div>
        </div>
    </div>
</div>
</div>

</div>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/ol/js/ajax.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="${pageContext.request.contextPath}/ol/js/plugins/flot/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/flot/jquery.flot.pie.js"></script>

<!-- Peity -->
<script src="${pageContext.request.contextPath}/ol/js/plugins/peity/jquery.peity.min.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/demo/peity-demo.js"></script>

<!-- jQuery UI -->
<script src="${pageContext.request.contextPath}/ol/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- GITTER -->
<script src="${pageContext.request.contextPath}/ol/js/plugins/gritter/jquery.gritter.min.js"></script>

<!-- Sparkline -->
<script src="${pageContext.request.contextPath}/ol/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="${pageContext.request.contextPath}/ol/js/demo/sparkline-demo.js"></script>

<!-- Custom and plugin javascript -->
<script src="${pageContext.request.contextPath}/ol/js/inspinia.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/pace/pace.min.js"></script>

<!-- ChartJS-->
<script src="${pageContext.request.contextPath}/ol/js/plugins/chartJs/Chart.min.js"></script>

<!-- Toastr -->
<script src="${pageContext.request.contextPath}/ol/js/plugins/toastr/toastr.min.js"></script>
<script>
    $(document).ready(function() {
        setTimeout(function() {
            toastr.options = {
                closeButton: true,
                progressBar: true,
                showMethod: 'slideDown',
                timeOut: 4000
            };
            toastr.success('地狗，引领暴躁生活！', '欢迎回来！');

        }, 1300);
    });
    function logout() {
        $.post(
            '${pageContext.request.contextPath}/front/customer/logout',
            function (result) {
                if (result.status==1){
                    location.href('${pageContext.request.contextPath}/index.jsp');
                }
                else
                    alert("退出失败！");
            }
        )
    }
</script>
</body>
</html>
