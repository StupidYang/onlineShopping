<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>backend</title>
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/index.css" />
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/file.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js"></script>
    <script>
        $(function(){
            //上传图像预览
            $('#product-image').on('change',function() {
                $('#img').attr('src', window.URL.createObjectURL(this.files[0]));
            });
            $('#pro-image').on('change',function() {
                $('#img2').attr('src', window.URL.createObjectURL(this.files[0]));
            });
            //分页
            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion:3,
                currentPage:${pageInfo.pageNum},
                totalPages:${pageInfo.pages},
                pageUrl:function (type,page,current) {
                    return '${pageContext.request.contextPath}/backend/product/findAll?pageNum='+page;
                },
                itemTexts:function (type,page,current) {
                    switch (type) {
                        case "first":return "首页";
                        case "prev":return "上一页";
                        case "next":return "下一页";
                        case "last":return "末页";
                        case "page":return page;
                    }
                }
            });
        });
        //显示商品信息
        function showProduct(id) {
            $.post(
                '${pageContext.request.contextPath}/backend/product/findById',
                {'id':id},
                function (result) {
                    if (result.status==1){
                        $('#pro-num').val(result.data.id);
                        $('#pro-name').val(result.data.name);
                        $('#pro-price').val(result.data.price);
                        $('#pro-TypeId').val(result.data.productType.id);
                        $('#img2').attr('src',result.data.image);
                    }
                }
            )
        }
        //按钮提交校验是否存在商品add
        function testSubmit() {
            var productName=document.addForm.name.value;
            var productPrice=document.addForm.price.value;
            var productImage=document.addForm.file.value;
            var productType=document.addForm.productTypeId.value;
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
        //显示删除模态框
        function showDeleteModal(id) {
            $('#deleteProductId').val(id);
            $('#deleteProductModal').modal('show');
        }
        //删除商品
        function deleteProduct() {
            $.get(
                '${pageContext.request.contextPath}/backend/product/removeById',
                {'id':$('#deleteProductId').val()},
                function (result) {
                    alert("删除成功");
                    if (result.status==1)
                        location.href='${pageContext.request.contextPath}/backend/product/findAll?pageNum='+${pageInfo.pageNum};
                }
            );
        }
    </script>
</head>

<body>
<div class="panel panel-default" id="userPic">
    <div class="panel-heading">
        <h3 class="panel-title">商品管理</h3>
    </div>
    <div class="panel-body">
        <input type="button" value="添加商品" class="btn btn-primary" id="doAddPro">
        <br>
        <br>
        <div class="show-list text-center">
            <table class="table table-bordered table-hover" style='text-align: center;'>
                <thead>
                <tr class="text-danger">
                    <th class="text-center">编号</th>
                    <th class="text-center">商品</th>
                    <th class="text-center">价格</th>
                    <th class="text-center">产品类型</th>
                    <th class="text-center">状态</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                   <c:forEach items="${pageInfo.list}" var="product">
                       <tr>
                           <td>${product.id}</td>
                           <td>${product.name}</td>
                           <td>${product.price}</td>
                           <td>${product.productType.name}</td>
                           <td>
                               <c:if test="${product.productType.status==1}">有效商品</c:if>
                               <c:if test="${product.productType.status==0}">无效商品</c:if>
                           </td>
                           <td class="text-center">
                               <input type="button" class="btn btn-warning btn-sm doProModify" onclick="showProduct(${product.id})" value="修改">
                               <input type="button" class="btn btn-warning btn-sm doProDelete" onclick="showDeleteModal(${product.id})" value="删除">
                           </td>
                       </tr>
                   </c:forEach>
                </tbody>
            </table>
            <ul id="pagination"></ul>
        </div>
    </div>
</div>

<!-- 添加商品 start -->
<div class="modal fade" tabindex="-1" id="Product">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <form name="addForm" action="${pageContext.request.contextPath}/backend/product/add" class="form-horizontal" method="post" enctype="multipart/form-data">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">添加商品</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <input type="hidden" name="pageNum" value="${pageInfo.pageNum}"/>
                            <label for="product-name" class="col-sm-4 control-label">商品名称：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="product-name" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-price" class="col-sm-4 control-label">商品价格：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="product-price" name="price">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-image" class="col-sm-4 control-label">商品图片：</label>
                            <div class="col-sm-8">
                                <a href="javascript:;" class="file">选择文件
                                    <input type="file" name="file" id="product-image">
                                </a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-type" class="col-sm-4 control-label">商品类型：</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="productTypeId">
                                    <option value="">请选择</option>
                                    <c:forEach items="${productTypes}" var="productType">
                                        <option value="${productType.id}">${productType.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <!-- 显示图像预览 -->
                        <img style="width: 160px;height: 180px;" id="img">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" onclick="testSubmit()">添加</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 添加商品 end -->

<!-- 修改商品 start -->
<div class="modal fade" tabindex="-1" id="myProduct">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <form action="${pageContext.request.contextPath}/backend/product/modify" class="form-horizontal" method="post" enctype="multipart/form-data">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">修改商品</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <input type="hidden" name="pageNum" value="${pageInfo.pageNum}"/>
                            <label for="pro-num" class="col-sm-4 control-label">商品编号：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="id" id="pro-num" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pro-name" class="col-sm-4 control-label">商品名称：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="name" id="pro-name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pro-price" class="col-sm-4 control-label">商品价格：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="price" id="pro-price">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pro-image" class="col-sm-4 control-label">商品图片：</label>
                            <div class="col-sm-8">
                                <a class="file">
                                    选择文件 <input type="file" name="file" name="file" id="pro-image">
                                </a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-type" class="col-sm-4 control-label">商品类型：</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="productTypeId" id="pro-TypeId">
                                    <option>请选择</option>
                                    <c:forEach items="${productTypes}" var="productType">
                                        <option value="${productType.id}">${productType.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <!-- 显示图像预览 -->
                        <img style="width: 160px;height: 180px;" id="img2">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary updatePro" type="submit">修改</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
    <!-- 修改商品 end -->

<!-- 删除商品 start -->
<div class="modal fade" tabindex="-1" id="deleteProductModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">提示信息</h4>
                </div>
                <div class="modal-body text-center row">
                    <h4>确认要删除该商品吗?</h4>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="deleteProductId" />
                    <button class="btn btn-primary updatePro" onclick="deleteProduct()">删除</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
    </div>
</div>
<!-- 删除商品 end -->
</body>

</html>