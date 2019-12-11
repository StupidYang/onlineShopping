<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>会议管理系统-注册</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
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
            var conpassword=document.getElementById("conpassword").value;

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

            if (conpassword == "") {
                document.getElementById("explain1").innerHTML="";
                document.getElementById("explain2").innerHTML="";
                document.getElementById("explain3").innerHTML="<p style='color: red'>确认密码不能为空！</p>";
                return;
            }else if (!checkPassword(conpassword)) {
                    document.getElementById("explain1").innerHTML="";
                    document.getElementById("explain1").innerHTML="";
                    document.getElementById("explain3").innerHTML="<p style='color: red'>确认密码格式不正确！</p><p style='color: red'>密码应为长度为7-18位的英文字母、数字或者特殊符号（例：!、?、@、#、$、%、&、*、+、-、/）</p>";
                    return;
                }else if(password!=conpassword){
                document.getElementById("explain1").innerHTML="";
                document.getElementById("explain1").innerHTML="";
                document.getElementById("explain3").innerHTML="<p style='color: red'>两次密码不一致！</p>";
                return;
            }

            document.getElementById("explain1").innerHTML="";
            document.getElementById("explain2").innerHTML="";
            document.getElementById("explain3").innerHTML="";
        }

        function CheckName() {
           var name = document.getElementById("name").value;
           if (name == ""){
               document.getElementById("explain0").innerHTML="<p style='color: red'>姓名不能为空！</p>";
           }
        }
    </script>
</head>
<body class="gray-bg">
<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">EM</h1>
        </div>
        <h3>注册  会议管理系统</h3>
        <p>填入以下内容用于创建帐户</p>
        <form class="m-t" role="form" action="registerServlet" method="post">
            <div class="form-group">
                <input type="text" onBlur="CheckName()" id="name" name="reg_name" class="form-control" placeholder="姓名">
                <div id="explain0">
                </div>
            </div>
            <div class="form-group">
                <input type="text" onBlur="Check()" name="reg_user" id="user"
                       maxlength="18" minlength="5" data-placement="bottom" title="账号应为长度为5-18位的英文字母或者数字或者邮箱"
                       class="form-control" placeholder="账号">
                <div id="explain1">
                </div>
            </div>
            <div class="form-group">
                <input type="password" onBlur="Check()" name="reg_password" id="password"
                       maxlength="18" minlength="7" data-placement="bottom" title="密码应为长度为7-18位的英文字母、数字或者特殊符号（例：!、?、@、#、$、%、&、*、+、-、/）"
                       class="form-control" placeholder="密码">
                <div id="explain2">
                </div>
            </div>
            <div class="form-group">
                <input type="password" onBlur="Check()" name="con_password" id="conpassword"
                       maxlength="18" minlength="7" data-placement="bottom" title="两次密码需保持一致"
                       class="form-control" placeholder="确认密码">
                <div id="explain3">
                </div>
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">注册</button>

            <p class="text-muted text-center"><small>已经有一个账户?</small></p>
            <a class="btn btn-sm btn-white btn-block" href="login.jsp">登录</a>
        </form>
    </div>
</div>
<!-- Mainly scripts -->
<script src="js/jquery-2.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function(){
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
</script>
</body>
</html>
