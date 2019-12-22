<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>地狗-登录</title>
  <link href="${pageContext.request.contextPath}ol/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}ol/font-awesome/css/font-awesome.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}ol/css/animate.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}ol/css/style.css" rel="stylesheet">
  <style>
    header {
      height: 100px;
      width: 100%;
      z-index: 999;
      background: #fff;
      padding: 30px 0;
      position: relative;
    }
    header .sticky {
      width: 100%;
      -webkit-transition: 0.4s ease-in-out;
      -moz-transition: 0.4s ease-in-out;
      -ms-transition: 0.4s ease-in-out;
      -o-transition: 0.4s ease-in-out;
      transition: 0.4s ease-in-out;
    }
    header .container {
      padding: 0px;
    }
    header .logo {
      float: left;
      margin-top: 8px;
      position: relative;
      margin-left: 180px;
    }
  </style>
  <script type="text/javascript">
    function checkUser(s){
      var regu =/^[a-z|A-Z|0-9|@(a-z|A-z)(a-z|A-z).com]+$/;
      var re = new RegExp(regu);
      if (re.test(s)) {
        return true;
      }else{
        return false;
      }
    }

    function checkPassword(s){
      var regu =/^[a-z|A-Z|0-9|!|?|@|#|$|%|&|*|+|-|/]+$/;
      var re = new RegExp(regu);
      if (re.test(s)) {
        return true;
      }else{
        return false;
      }
    }

    function Check() {
      var username=document.getElementById("user").value;
      var password=document.getElementById("password").value;

      if (username == "") {
        document.getElementById("explain1").innerHTML="<p style='color: red'>账号不能为空！</p>";
        document.getElementById("explain2").innerHTML="";
        return;
      }else if (!checkUser(username)) {
          document.getElementById("explain1").innerHTML="<p style='color: red'>账号格式不正确！</p><p style='color: red'>账号应为长度为5-18位的英文字母或者数字或者邮箱</p>";
          document.getElementById("explain2").innerHTML="";
          return;
        }

      if (password == "") {
        document.getElementById("explain1").innerHTML="";
        document.getElementById("explain2").innerHTML="<p style='color: red'>密码不能为空！</p>";
        return;
      }else if (!checkPassword(password)) {
          document.getElementById("explain1").innerHTML="";
          document.getElementById("explain2").innerHTML="<p style='color: red'>密码格式不正确！</p><p style='color: red'>密码应为长度为7-18位的英文字母、数字或者特殊符号（例：!、?、@、#、$、%、&、*、+、-、/）</p>";
          return;
        }

      document.getElementById("explain1").innerHTML="";
      document.getElementById("explain2").innerHTML="";
    }

    function Clear() {
        document.getElementById("password").value = "";
    }

    function reloadImage(){
      $('#randCode').attr('src','${pageContext.request.contextPath}/backend/code/image?time='+new Date().getTime());
      $('#code').val('');
    }
    function loginSubmit() {
      var loginName=document.logings.user.value;
      var password=document.logings.password.value;
      var code=document.logings.code.value;
      if (loginName==="") {
        alert("用户名不能为空");
        document.logings.loginName.focus();
        return;
      }
      else if (password===""){
        alert("密码不能为空");
        document.logings.password.focus();
        return;
      }
      else if (code===""){
        alert("验证码不能为空");
        document.logings.code.focus();
        return;
      }
      $.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/backend/code/checkCode',
        data:{'code':$('#code').val()},
        dataType:'json',
        success:function (result) {
          if (result==false) {
            alert("验证码输入错误，请重新输入");
            document.logings.code.focus();
            return;
          }
          else document.logings.submit();
        }
      });
      $.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/backend/sysuser/login',
        data:{'name':$('#product-name').val()},
        dataType:'json',
        success:function (result) {
          if (result!="")
            alert(result);
          else
            document.logings.submit();
        }
      });
    }
  </script>
</head>
<body class="gray-bg">
<header>
  <div class="sticky">
    <div class="container">
      <div class="logo">
        <img class="img-responsive" src="logo.png" alt="DDOG 地狗" />
      </div>
      <nav class="navbar ownmenu">
      </nav>
    </div>
  </div>
</header>
<div class="loginColumns animated fadeInDown">
  <div class="row">
    <div class="col-md-6">
      <h2 class="font-bold">欢迎进入 地狗商城</h2>
      <br>
      <h3>小组成员</h3>
      <p>计科172班&nbsp;杨旭东</p>
      <p>计科172班&nbsp;涂会超</p>
      <p>计科172班&nbsp;李&nbsp;&nbsp;&nbsp;翔</p>
      <p>计科172班&nbsp;马煜童</p>
      <p>计科173班&nbsp;邵&nbsp;&nbsp;&nbsp;琦</p>
    </div>
    <div class="col-md-6">
      <div class="ibox-content">
        <form name="logings" class="m-t" role="form" action="${pageContext.request.contextPath}/backend/sysuser/login" method="post">
          <div class="form-group">
            <input type="text"  oninput="Clear()" onBlur="Check()" maxlength="18" minlength="5"
                   name="user" id="user"  data-placement="bottom" title="账号应为长度为5-18位的英文字母或者数字或者邮箱"
                   class="form-control" placeholder="用户名">
            <div id="explain1">
            </div>
          </div>
          <div class="form-group">
            <input type="password" onBlur="Check()" maxlength="18" minlength="7"
                   name="password" id="password" data-placement="bottom" title="密码应为长度为7-18位的英文字母、数字或者特殊符号（例：!、?、@、#、$、%、&、*、+、-、/）"
                   class="form-control" placeholder="密码">
            <div id="explain2">
            </div>
          </div>
          <div class="form-group">
            <!-- 验证码 -->
              <input style="float: left;width: 206px;margin-right: 5px;" class="form-control" type="text" placeholder="验证码" id="code" name="code">
            <img class="img-responsive" src="${pageContext.request.contextPath}/backend/code/image"
                 id="randCode" style="height: 32px; width: 70px;float: left;"/>
            <button style="padding: 0px;margin-top: 6px;"
                    type="button" class="btn btn-link" onclick="reloadImage()">看不清</button>
          </div>
          <label><input id="<%=flag%>" type="checkbox" value="yes" name="remember_password" style="margin-bottom: 10px;">
            记住密码</label>
          <div class="text-right" style="width: 150px;float: right;">
            <a href="">
              <small>忘记密码?</small>
            </a>
          </div>
          <button type="button" onclick="loginSubmit()" class="btn btn-primary block full-width m-b">登录</button>
          <p class="text-muted text-center">
            <small>没有账户?</small>
          </p>
          <a class="btn btn-sm btn-white btn-block" href="register.html">创建账户</a>    <!--注册界面-->
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>