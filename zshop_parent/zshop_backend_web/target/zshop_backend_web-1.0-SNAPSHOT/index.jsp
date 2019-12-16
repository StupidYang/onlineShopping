<%@page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <title>nnn</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<%--  <jsp:forward page="${pageContext.request.contextPath}/admin/showLogin"/>--%>
<button id="btn">测试按钮</button>

</body>
</html>
<script>
    $("#btn").click(function(){
        $.ajax({
            url:"${pageContext.request.contextPath}/backend/evaluate/evaluates?pid=1",
            contentType:"application/json;charset=UTF-8",
            // data:'{"username":"sq","password":"666"}',
            dataType:"json",
            type:"get",
            success:function(data){
                alert(data);
                //alert(data.addressName);
            }
        });
    });
</script>
