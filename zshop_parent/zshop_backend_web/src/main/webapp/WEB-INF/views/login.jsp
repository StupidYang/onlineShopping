<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>在线商城-后台管理系统</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycss.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
<body>
<!-- 使用自定义css样式 div-signin 完成元素居中-->
<div class="container div-signin">
	<div class="panel panel-primary div-shadow">
		<!-- h3标签加载自定义样式，完成文字居中和上下间距调整 -->
		<div class="panel-heading">
			<h3>在线商城系统</h3>
			<span>ZSHOP Manager System</span>
		</div>
		<div class="panel-body">
			<!-- login form start -->
			<form name="logings" action="${pageContext.request.contextPath}/backend/sysuser/login" class="form-horizontal" method="post">
				<div class="form-group">
					<label class="col-sm-3 control-label">用户名：</label>
					<div class="col-sm-9">
						<input class="form-control" name="loginName" type="text" placeholder="请输入用户名">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
					<div class="col-sm-9">
						<input class="form-control" name="password" type="password" placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">验证码：</label>
					<div class="col-sm-4">
						<input class="form-control" type="text" id="code" name="code" placeholder="验证码">
					</div>
					<div class="col-sm-2">
						<!-- 验证码 -->
						<img class="img-rounded" src="${pageContext.request.contextPath}/backend/code/image" id="randCode" style="height: 32px; width: 70px;"/>
					</div>
					<div class="col-sm-2">
						<button type="button" onclick="reloadImage()" class="btn btn-link">看不清</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3">
					</div>
					<div class="col-sm-9 padding-left-0">
						<div class="col-sm-4">
							<button type="button" onclick="loginSubmit()" class="btn btn-primary btn-block">登&nbsp;&nbsp;陆</button>
						</div>
						<div class="col-sm-4">
							<button type="reset" class="btn btn-primary btn-block">重&nbsp;&nbsp;置</button>
						</div>
						<div class="col-sm-4">
							<button type="button" class="btn btn-link btn-block">忘记密码？</button>
						</div>
					</div>
				</div>
			</form>
			<!-- login form end -->
		</div>
	</div>
</div>
<!-- 页尾 版权声明 -->
<div class="container">
	<div class="col-sm-12 foot-css">
		<p class="text-muted credit">
			Copyright 南昌大学卓越171班
		</p>
	</div>
</div>

</body>
</html>
