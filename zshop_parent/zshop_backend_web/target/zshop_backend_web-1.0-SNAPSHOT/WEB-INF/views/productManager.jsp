<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">

<head>
    <meta charset="UTF-8" />
    <title>地狗后台管理</title>
    <link href="${pageContext.request.contextPath}/ol/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/style.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${pageContext.request.contextPath}/ol/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ol/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/ol/js/jquery-2.1.1.js"></script>
    <script>
        $(document).ready(function() {
            var url = window.location.href;
            if (url == "http://localhost:8088/zshop_backend_web_war_exploded/backend/sysuser/login")
                location.href = "http://localhost:8088/zshop_backend_web_war_exploded/backend/product/findAll?pageNum=1";
        });
        $(function(){
            //上传图像预览
            $('#product-image').on('change',function() {
                $('#img').attr('src', window.URL.createObjectURL(this.files[0]));
            });
            $('#pro-image').on('change',function() {
                $('#img2').attr('src', window.URL.createObjectURL(this.files[0]));
            });
        });

    </script>
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
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${sysuser.name}</strong>
                             </span> <span class="text-muted text-xs block">${sysuser.role.roleName}<b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="${pageContext.request.contextPath}/backend/product/findAll">商品管理</a></li>
                            <c:choose>
                            <c:when test="${sysuser.role.id == 3}">
                            <li><a href="${pageContext.request.contextPath}/backend/productType/findAll">商品类别管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/backend/sysuser/findAll">卖家管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/backend/seller/findAll">卖家申请审核</a></li>
                            </c:when>
                            </c:choose>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/showLogin" onclick="logout()">退出登录</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        DD
                    </div>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/backend/product/findAll"><i class="fa fa-pie-chart"></i><span class="nav-label">商品管理</span></a>
                </li>
                <c:choose>
                <c:when test="${sysuser.role.id == 3}">
                <li>
                    <a href="#"><i class="fa fa-sitemap"></i> <span class="nav-label">管理员选项</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="${pageContext.request.contextPath}/backend/productType/findAll">商品类别管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/backend/sysuser/findAll">卖家管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/backend/seller/findAll">卖家申请审核</a></li>
                    </ul>
                </li>
                </c:when>
                </c:choose>
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
                        <a onclick="logout() ">
                            <i class="fa fa-sign-out"></i> 退出登录
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <!--中间-->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>商品管理</h2>
                <ol class="breadcrumb">
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/backend/product/findAll"><strong>商品管理</strong></a>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2" style="margin-top: 30px;">
                <button data-toggle="modal" data-target="#Product" type="button" class="btn btn-outline btn-success">增加商品</button>
            </div>
        </div>
        <!--界面-->
        <div class="wrapper wrapper-content animated fadeInRight">
            <c:forEach items="${pageInfo.list}" var="product">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox product-detail">
                            <div class="ibox-content">
                                <div class="row">
                                    <div class="col-md-4 col-xs-6" style="height: 400px;">
                                        <div class="product-images">
                                            <div>
                                                <div class="image-imitation" style="padding: 0px;">
                                                    <img class="img-thumbnail" src="http://localhost:8088/zshop_backend_web_war_exploded/${product.image}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <h2 class="font-bold m-b-xs">
                                                ${product.name}
                                        </h2>
                                        ${product.info}
                                        <div class="m-t-md">
                                            <h2 class="product-main-price">¥${product.price}</h2>
                                        </div>
                                        <hr>
                                        <h4>产品类型</h4>
                                        <div class="small text-muted">
                                                ${product.productType.name}
                                            <br/>
                                            <br/>
                                                    <c:if test="${product.productType.status==1}">有效商品</c:if>
                                                    <c:if test="${product.productType.status==0}">无效商品</c:if>
                                        </div>
                                        <hr>

                                        <div>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myProduct" onclick="showProduct(${product.id})">修改</button>
                                                <button onclick="sweet(${product.id})" type="button" class="btn btn-white btn-sm">删除</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div style="margin-bottom: 20px;" class="text-center" id="pagination">
            </div>
        </div>

        <div class="footer">
            <div>
                地狗后台管理
            </div>
        </div>
    </div>
</div>



<!-- 增加 -->
<div class="modal inmodal" tabindex="-1" id="Product">
    <div class="modal-dialog modal-lg">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <form name="addForm" action="${pageContext.request.contextPath}/backend/product/add" enctype="multipart/form-data" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">增加商品</h4>
                        <small class="font-bold">上架新的宝贝啦！</small>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="hidden" name="pageNum" value="${pageInfo.pageNum}"/>
                            <label for="product-name">商品名称：</label>
                            <input type="text" class="form-control" id="product-name" name="name">
                        </div>
                        <div class="form-group">
                            <label for="product-name">商品描述：</label>
                            <input type="text" class="form-control" id="product-info" name="info">
                        </div>
                        <div class="form-group">
                            <label for="product-price" >商品价格：</label>
                            <input type="text" class="form-control" id="product-price" name="price">
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8" style="margin-top: 60px;padding-left: 0px;">
                                <label for="product-image">商品图片：</label>
                                <a href="javascript:;" class="file">
                                    <input type="file" name="file" id="product-image">
                                </a>
                            </div>
                            <div class="col-sm-4">
                                <!-- 显示图像预览 -->
                                <img style="width: 160px;height: 180px;" id="img">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-type">商品类型：</label>
                                <select class="form-control" id="product-type" name="productTypeId">
                                    <option value="">请选择</option>
                                    <c:forEach items="${productTypes}" var="productType">
                                        <option value="${productType.id}">${productType.name}</option>
                                    </c:forEach>
                                </select>
                        </div>

                    </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" onclick="testSubmit()">添加</button>
                    <button class="btn btn-white" data-dismiss="modal">取消</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 修改商品 -->
<div class="modal inmodal" tabindex="-1" id="myProduct">
    <div class="modal-dialog modal-lg">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <form action="${pageContext.request.contextPath}/backend/product/modify" method="post" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h4 class="modal-title">修改商品</h4>
                        <small class="font-bold">全部的信息都需要修改哦！</small>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="product-name">商品编号：</label>
                            <input type="text" class="form-control" id="pro-num" name="id" readonly>
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="pageNum" value="${pageInfo.pageNum}"/>
                            <label for="product-name">商品名称：</label>
                            <input type="text" class="form-control" id="pro-name" name="name">
                        </div>
                        <div class="form-group">
                            <label for="product-name">商品描述：</label>
                            <input type="text" class="form-control" id="pro-info" name="info">
                        </div>
                        <div class="form-group">
                            <label for="product-price" >商品价格：</label>
                            <input type="text" class="form-control" id="pro-price" name="price">
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8" style="margin-top: 60px;padding-left: 0px;">
                                <label for="product-image">商品图片：</label>
                                <a href="javascript:;" class="file">
                                    <input type="file" name="file" id="pro-image">
                                </a>
                            </div>
                            <div class="col-sm-4">
                                <!-- 显示图像预览 -->
                                <img style="width: 160px;height: 180px;" id="img2">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-type">商品类型：</label>
                            <select class="form-control" id="pro-type" name="productTypeId">
                                <option value="">请选择</option>
                                <c:forEach items="${productTypes}" var="productType">
                                    <option value="${productType.id}">${productType.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit">修改</button>
                        <button class="btn btn-white" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/ol/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${pageContext.request.contextPath}/ol/js/inspinia.js"></script>
<script src="${pageContext.request.contextPath}/ol/js/plugins/pace/pace.min.js"></script>

<!-- Sparkline -->
<script src="${pageContext.request.contextPath}/ol/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sweet alert -->
<script src="${pageContext.request.contextPath}/ol/js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    //按钮提交校验是否存在商品add
    function testSubmit() {
        var productName=document.addForm.name.value;
        var productPrice=document.addForm.price.value;
        var productImage=document.addForm.file.value;
        var productType=document.addForm.productTypeId.value;
        var productInfo=document.addForm.info.value;
        var pattern=/\d+(\.\d+)?/g;
        if (productName=="") {
            alert("商品名不能为空");
            document.addForm.name.focus();
            return;
        }
        else if (productPrice==""){
            alert("商品价格不能为空");
            document.addForm.price.focus();
            return;
        }
        else if (!pattern.test(productPrice.toString())){
            alert("商品价格格式错误");
            document.addForm.price.focus();
            return;
        }
        else if (productImage==""){
            alert("商品图片不能为空");
            return;
        }
        else if (productType==""){
            alert("商品类型不能为空");
            return;
        }else if (productInfo==""){
            alert("商品描述不能为空");
            return;
        }
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/backend/product/checkName',
            data:{'name':$('#product-name').val()},
            dataType:'json',
            success:function (result) {
                if (result!="")
                    alert(result);
                else
                    document.addForm.submit();
            }
        });
    }
    //商品信息
    function showProduct(id) {
        $.post(
            '${pageContext.request.contextPath}/backend/product/findById',
            {'id':id},
            function (result) {
                if (result.status==1){
                    try {
                        $('#pro-num').val(result.data.id);
                        $('#pro-name').val(result.data.name);
                        $('#pro-info').val(result.data.info);
                        $('#pro-price').val(result.data.price);
                    }catch (e) {
                        console.log(e);
                    }

                }
            }
        )
    }
    //删除商品
    function deleteProduct(id) {
        $.get(
            '${pageContext.request.contextPath}/backend/product/removeById',
            {'id':id},
            function (result) {
                if (result.status==1)
                    location.href='${pageContext.request.contextPath}/backend/product/findAll?pageNum=1';
            }
        );
    }
    function sweet(id) {
        swal({
                title: "是否下架该商品",
                text: "下架后无法恢复，需要重新添加！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#19dd00",
                confirmButtonText: "下架",
                cancelButtonText: "取消",
                closeOnConfirm: false,
                closeOnCancel: false },
            function (isConfirm) {
                if (isConfirm) {
                    //console.log("2");
                    deleteProduct(id);
                    //console.log("3");
                    swal("下架成功", "该商品已经下架", "success");
                } else {
                    swal("取消下架", "该操作已经取消", "success");
                }
            });
    }
    $(document).ready(function() {

        $("#sparkline1").sparkline([34, 43, 43, 35, 44, 32, 44, 48], {
            type: 'line',
            width: '100%',
            height: '50',
            lineColor: '#1ab394',
            fillColor: "transparent"
        });


    });

    function logout() {
        $.post(
            '${pageContext.request.contextPath}/backend/sysuser/logout',
            function (result) {
                if (result.status==1){
                    location.href='${pageContext.request.contextPath}/index.jsp';
                }
                else
                    alert("退出失败！");
            }
        )
    }

    function skippage(page) {
        location.href='${pageContext.request.contextPath}/backend/product/findAll?pageNum='+page;
    }
    $(document).ready(function(){
        var pagination = document.getElementById("pagination");
        try {
            var now = ${pageInfo.pageNum};
            var total = ${pageInfo.pages};
        }catch (e) {
            console.log(e);
        }
        var i = 1;
        //console.log(total);
        for(;i<=total;++i){
            if(i == now)
                pagination.innerHTML+="<button type='button' onclick='skippage("+i+")' class=\"btn btn-white active\">"+i+"</button>";
            else
                pagination.innerHTML+="<button type='button' onclick='skippage("+i+")' class=\"btn btn-white\">"+i+"</button>";
        }
        //var page = getQueryVariable("pageNum");

    });
    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
        }
        return(false);
    }
</script>
</body>
</html>