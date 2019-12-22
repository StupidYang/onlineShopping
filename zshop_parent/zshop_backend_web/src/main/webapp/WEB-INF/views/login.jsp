<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>地狗商城-后台管理登陆</title>
	<meta charset="utf-8">
	<link href="${pageContext.request.contextPath}/ol/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/ol/font-awesome/css/font-awesome.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/ol/css/animate.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/ol/css/style.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/ol/js/jquery-2.1.1.js"></script>
	<script>
		//重新加载验证码
		function reloadImage() {
			$('#randCode').attr('src','${pageContext.request.contextPath}/backend/code/image?time='+new Date().getTime());
			$('#code').val('');
		}
		function loginSubmit() {
			var loginName=document.logings.loginName.value;
			var password=document.logings.password.value;
			var code=document.logings.code.value;
			if (loginName=="") {
				alert("用户名不能为空");
				document.logings.loginName.focus();
				return;
			}
			else if (password==""){
				alert("密码不能为空");
				document.logings.password.focus();
				return;
			}
			else if (code==""){
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
<div class="loginColumns animated fadeInDown">
	<div class="row">
		<div class="col-md-6">
			<h2 class="font-bold">欢迎进入 地狗后台管理</h2>
			<br>
			<h3>小组成员</h3>
			<p>计科172班&nbsp;杨旭东</p>
			<p>计科172班&nbsp;涂会超</p>
			<p>计科172班&nbsp;李&nbsp;&nbsp;&nbsp;翔</p>
			<p>计科172班&nbsp;马煜童</p>
			<p>计科174班&nbsp;邵&nbsp;&nbsp;&nbsp;琦</p>
		</div>
		<div class="col-md-6">
			<div class="ibox-content">
				<form class="m-t" name="logings" action="${pageContext.request.contextPath}/backend/sysuser/login" method="post">
					<div class="form-group">
						<input type="text" name="loginName" id="user" class="form-control" placeholder="用户名">
					</div>
				<div class="form-group">
				<input type="password" name="password" id="password" class="form-control" placeholder="密码">
				</div>
			<div class="form-group">
			<!-- 验证码 -->
			<input style="float: left;width: 206px;margin-right: 5px;" class="form-control" type="text" placeholder="验证码" id="code" name="code">
			<img class="img-responsive" src="${pageContext.request.contextPath}/backend/code/image"
				 id="randCode" style="height: 32px; width: 70px;float: left;"/>
			<button style="padding: 0px;margin-top: 6px;"
					type="button" class="btn btn-link" onclick="reloadImage()">看不清</button>
		</div>
		<div class="text-right" style="width: 150px;float: right;">
			<a href="#">
				<small>忘记密码?</small>
			</a>
		</div><br>
		<button style="margin-top: 15px;margin-bottom: 10px;"
				type="button" onclick="loginSubmit()" class="btn btn-primary block full-width m-b">登录</button>
		</form>
	</div>
</div>
</div>
</div>

</body>
</html>
