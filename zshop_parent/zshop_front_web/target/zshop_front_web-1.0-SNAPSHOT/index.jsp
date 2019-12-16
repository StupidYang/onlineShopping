<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>地狗-您的烦恼基地</title>

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
  <style>
    .btn-index{
      width: 100%;
      letter-spacing: 0px;
      color: #fff;
      background: #2d3a4b;
      display: inline-block;
      padding: 5px 50px;
      text-transform: uppercase;
      font-weight: bold;
      font-size: 18px;
      border-radius: 0px;
      font-family: 'Montserrat', sans-serif;
      line-height: 46px;
      border: 1px solid #2f2f2f;
      position: relative;
      z-index: 1;
    }
    .btn-index:hover,.btn-index:focus{
      color: #ffffff !important;
    }
    .hidden{
      display: none;
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

  <!--======= HOME MAIN SLIDER =========-->
  <section class="home-slider">
    <!-- SLIDE 轮播图 Start -->
    <div class="tp-banner-container">
      <div class="tp-banner">
        <ul>
          <!-- SLIDE-1  -->
          <li data-transition="random" data-slotamount="7" data-masterspeed="300"  data-saveperformance="off" >
            <!-- MAIN IMAGE -->
            <img src="${pageContext.request.contextPath}/sp_image/1.jpg"  alt="slider"  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat">
            <!-- LAYERS -->
            <!-- LAYER NR. 2 -->
            <div class="tp-caption sfl font-extra-bold tp-resizeme"
                 data-x="left" data-hoffset="0"
                 data-y="center" data-voffset="-120"
                 data-speed="800"
                 data-start="800"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.07"
                 data-endelementdelay="0.1"
                 data-endspeed="300"
                 style="z-index: 6; font-size:80px; color:#2d3a4b; text-transform:uppercase; white-space: nowrap;">超过2000款秋冬新品</div>
            <!-- LAYER NR. 2 -->
            <div class="tp-caption sfr font-extra-bold tp-resizeme"
                 data-x="left" data-hoffset="0"
                 data-y="center" data-voffset="0"
                 data-speed="800"
                 data-start="800"
                 data-easing="Power3.easeInOut"
                 data-splitin="chars"
                 data-splitout="none"
                 data-elementdelay="0.07"
                 data-endelementdelay="0.1"
                 data-endspeed="300"
                 style="z-index: 6; font-size:120px; color:#fff; text-transform:uppercase; white-space: nowrap;">限时折上折 </div>
            <!-- LAYER NR. 2 -->
            <div class="tp-caption sfr font-extra-bold tp-resizeme"
                 data-x="left" data-hoffset="0"
                 data-y="center" data-voffset="130"
                 data-speed="800"
                 data-start="1300"
                 data-easing="Power3.easeInOut"
                 data-splitin="chars"
                 data-splitout="none"
                 data-elementdelay="0.07"
                 data-endelementdelay="0.1"
                 data-endspeed="300"
                 style="z-index: 6; font-size:120px; color:#fff; text-transform:uppercase; white-space: nowrap;">冬天不再寒冷</div>
            <!-- LAYER NR. 4 -->
            <div class="tp-caption lfb tp-resizeme"
                 data-x="left" data-hoffset="0"
                 data-y="center" data-voffset="270"
                 data-speed="800"
                 data-start="2200"
                 data-easing="Power3.easeInOut"
                 data-elementdelay="0.1"
                 data-endelementdelay="0.1"
                 data-endspeed="300"
                 data-scrolloffset="0"
                 style="z-index: 8;">
              <form class="form-inline hot-search" action="${pageContext.request.contextPath}/front/product/search" method="post">
                <input style="display: none;" name="name" value="女装${productParam.name}">
                <button type="submit" class="btn-index">立即抢购</button>
              </form>

            </div>
          </li>

          <!-- SLIDE-2  -->
          <li data-transition="random" data-slotamount="7" data-masterspeed="300"  data-saveperformance="off" >
            <!-- MAIN IMAGE -->
            <img src="${pageContext.request.contextPath}/sp_image/2.jpg"  alt="slider"  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat">
            <!-- LAYERS -->
            <!-- LAYER NR. 2 -->
            <div class="tp-caption sfr font-regular tp-resizeme letter-space-4"
                 data-x="center" data-hoffset="0"
                 data-y="center" data-voffset="-50"
                 data-speed="800"
                 data-start="800"
                 data-easing="Power3.easeInOut"
                 data-splitin="chars"
                 data-splitout="none"
                 data-elementdelay="0.07"
                 data-endelementdelay="0.1"
                 data-endspeed="300"
                 style="z-index: 6; font-size:78px; color:#fff; text-transform:uppercase; white-space: nowrap;">潮流男装</div>
            <!-- LAYER NR. 2 -->
            <div class="tp-caption sfr font-extra-bold tp-resizeme letter-space-4"
                 data-x="center" data-hoffset="0"
                 data-y="center" data-voffset="60"
                 data-speed="800"
                 data-start="1300"
                 data-easing="Power3.easeInOut"
                 data-splitin="chars"
                 data-splitout="none"
                 data-elementdelay="0.07"
                 data-endelementdelay="0.1"
                 data-endspeed="300"
                 style="z-index: 6; font-size:140px; color:#fff; text-transform:uppercase; white-space: nowrap;">TO BE UNIQUE</div>
            <!-- LAYER NR. 4 -->
            <div class="tp-caption lfb tp-scrollbelowslider tp-resizeme"
                 data-x="center" data-hoffset="0"
                 data-y="center" data-voffset="200"
                 data-speed="800"
                 data-start="2200"
                 data-easing="Power3.easeInOut"
                 data-elementdelay="0.1"
                 data-endelementdelay="0.1"
                 data-endspeed="300"
                 data-scrolloffset="0"
                 style="z-index: 8;">
              <form class="form-inline hot-search" action="${pageContext.request.contextPath}/front/product/search" method="post">
                <input style="display: none;" name="name" value="男装${productParam.name}">
                <button type="submit" class="btn-index">立即抢购</button>
              </form>
            </div>
          </li>

          <!-- SLIDE-3  -->
          <li data-transition="random" data-slotamount="7" data-masterspeed="300"  data-saveperformance="off" >
            <!-- MAIN IMAGE -->
            <img src="${pageContext.request.contextPath}/sp_image/3.jpg"  alt="slider"  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat">
            <!-- LAYERS -->
            <!-- LAYER NR. 2 -->
            <div class="tp-caption sfl font-extra-bold tp-resizeme"
                 data-x="left" data-hoffset="270"
                 data-y="center" data-voffset="-170"
                 data-speed="800"
                 data-start="800"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.07"
                 data-endelementdelay="0.1"
                 data-endspeed="300"
                 style="z-index: 6; font-size:80px; color:#f3455a; text-transform:uppercase; white-space: nowrap;">JK制服定制</div>
            <!-- LAYER NR. 2 -->
            <div class="tp-caption sfr font-extra-bold tp-resizeme"
                 data-x="left" data-hoffset="290"
                 data-y="center" data-voffset="-50"
                 data-speed="800"
                 data-start="800"
                 data-easing="Power3.easeInOut"
                 data-splitin="chars"
                 data-splitout="none"
                 data-elementdelay="0.07"
                 data-endelementdelay="0.1"
                 data-endspeed="300"
                 style="z-index: 6; font-size:120px; color:#ffffff; text-transform:uppercase; white-space: nowrap;">清新气质涵养</div>
            <!-- LAYER NR. 2 -->
            <div class="tp-caption sfr font-extra-bold tp-resizeme"
                 data-x="left" data-hoffset="240"
                 data-y="center" data-voffset="90"
                 data-speed="800"
                 data-start="1300"
                 data-easing="Power3.easeInOut"
                 data-splitin="chars"
                 data-splitout="none"
                 data-elementdelay="0.07"
                 data-endelementdelay="0.1"
                 data-endspeed="300"
                 style="z-index: 6; font-size:120px; color:#f5ff00; text-transform:uppercase; white-space: nowrap;">每天元气满满</div>
            <!-- LAYER NR. 4 -->
            <div class="tp-caption lfb tp-resizeme"
                 data-x="left" data-hoffset="300"
                 data-y="center" data-voffset="230"
                 data-speed="800"
                 data-start="2200"
                 data-easing="Power3.easeInOut"
                 data-elementdelay="0.1"
                 data-endelementdelay="0.1"
                 data-endspeed="300"
                 data-scrolloffset="0"
                 style="z-index: 8;">
              <form class="form-inline hot-search" action="${pageContext.request.contextPath}/front/product/search" method="post">
                <input style="display: none;" name="name" value="JK${productParam.name}">
                <button type="submit" class="btn-index">即刻选购</button>
              </form>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </section>

  <!-- Content -->
  <div id="content">

    <!-- New Arrival -->
    <section class="padding-top-150 padding-bottom-150">
      <div class="container">

        <!-- Main Heading -->
        <div class="heading text-center">
          <h2 style="color: #ff001f">年&nbsp;度&nbsp;盛&nbsp;典</h2>
          <span style="font-family: 微软雅黑;font-size: 18px">你&nbsp;想&nbsp;要&nbsp;的&nbsp;，&nbsp;这&nbsp;里&nbsp;都&nbsp;没&nbsp;有&nbsp;哦！</span> </div>

        <!-- NEW ARRIVAL -->
        <div class="new-arrival-list">
          <ul class="row">

            <!-- SHOP_ITEMS -->
            <li class="col-md-6">

              <!-- SHOP ITEM 1 -->
              <article> <img class="img-responsive" src="${pageContext.request.contextPath}/index-img/sport.png">
                <div class="position-center-center">
                  <h4><a style="color: #afc800" href="#.">户外运动</a></h4>
                  <form class="form-inline hot-search" action="${pageContext.request.contextPath}/front/product/search" method="post">
                    <input style="display: none;" name="name" value="户外运动${productParam.name}">
                    <button type="submit" class="btn btn-small btn-round">点击前往</button>
                  </form>
                  </div>
              </article>

              <!-- SHOP ITEM 3 -->
              <article> <img class="img-responsive" src="${pageContext.request.contextPath}/index-img/man.png" alt="">
                <div class="position-center-center">
                  <h4><a style="color: #00cab0" href="#.">潮流男装</a></h4>
                  <form class="form-inline hot-search" action="${pageContext.request.contextPath}/front/product/search" method="post">
                    <input style="display: none;" name="name" value="男装${productParam.name}">
                    <button type="submit" class="btn btn-small btn-round">点击前往</button>
                  </form></div>
              </article>

            </li>
            <li class="col-md-6">

              <!-- SHOP_ITEM 2 -->
              <article> <img class="img-responsive" src="${pageContext.request.contextPath}/index-img/girl.jpg" alt="">
                <div class="position-center-center">
                  <h4><a style="color: #ee00eb" href="#.">超美女装</a></h4>
                  <form class="form-inline hot-search" action="${pageContext.request.contextPath}/front/product/search" method="post">
                    <input style="display: none;" name="name" value="女装${productParam.name}">
                    <button type="submit" class="btn btn-small btn-round">点击前往</button>
                  </form></div>
              </article>

              <!-- SHOP_ITEM 4 -->
              <article> <img class="img-responsive" src="${pageContext.request.contextPath}/index-img/dit.png" alt="">
                <div class="position-center-center">
                  <h4><a style="color: #002cff" href="#.">手机数码</a></h4>
                  <form class="form-inline hot-search" action="${pageContext.request.contextPath}/front/product/search" method="post">
                    <input style="display: none;" name="name" value="手机数码${productParam.name}">
                    <button type="submit" class="btn btn-small btn-round">点击前往</button>
                  </form></div>
              </article>
            </li>
          </ul>

          <!-- SHOW MORE -->
          <!--
          <div class="text-center margin-top-50"> <a href="#." class="btn btn-small btn-round"> SHOW MORE...</a> </div>
          -->
        </div>
      </div>
    </section>


    <!-- 反馈留言版 提交后跳转 -->
    <section class="news-letter padding-top-150 padding-bottom-150">
      <div class="container">
        <div class="heading light-head text-center margin-bottom-30">
          <h4>反馈留言</h4>
          <span>您可以在这里写下您的一些建议！ </span> </div>
        <form>
          <input type="text" placeholder="请输入您的想法" required>
          <button type="submit">告诉我们</button>
        </form>
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
</body>
</html>