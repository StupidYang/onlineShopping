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
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js"></script>
    <script>
        //分页设置
        $(function () {
            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion:3,
                currentPage:${pageInfo.pageNum},
                totalPages:${pageInfo.pages},
                pageUrl:function (type,page,current) {
                    return '${pageContext.request.contextPath}/backend/productType/findAll?pageNum='+page;
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
        //添加商品类型
        function addProductType() {
            $.post(
                '${pageContext.request.contextPath}/backend/productType/add',
                {'name':$('#productTypeName').val()},
                function (result) {
                    alert(result.message);
                    if (result.status==1)
                        location.href='${pageContext.request.contextPath}/backend/productType/findAll?pageNum='+${pageInfo.pageNum};
                }
            );

        }
        //显示商品类型
        function showProductType(id) {
            $.post(
                '${pageContext.request.contextPath}/backend/productType/findById',
                {'id':id},
                function (result) {
                    if (result.status==1) {
                        $('#proTypeNum').val(result.data.id);
                        $('#proTypeName').val(result.data.name);
                    }
                }
            );
        }
        //修改商品类型name
        function modifyName() {
            $.ajax({
                type:'post',
                url:'${pageContext.request.contextPath}/backend/productType/modifyName',
                data:{'id':$('#proTypeNum').val(),'name':$('#proTypeName').val()},
                dataType:'json',
                success:function (result) {
                    alert(result.message);
                    if (result.status==1)
                        location.href='${pageContext.request.contextPath}/backend/productType/findAll?pageNum='+${pageInfo.pageNum};
                }
            })
            
        }
        //显示删除提示
        function showDeleteModal(id) {
            $('#deleteProductTypeId').val(id);
            $('#deleteProductType').modal('show');
        }
        //删除商品类型
        function deleteProductType(){
            $.get(
                '${pageContext.request.contextPath}/backend/productType/removeById',
                {'id':$('#deleteProductTypeId').val()},
                function (result) {
                    alert(result.message);
                    if (result.status==1)
                        location.href='${pageContext.request.contextPath}/backend/productType/findAll?pageNum='+${pageInfo.pageNum};
                }
            );
        }
        //修改商品类型status
        function modifyStatus(id,btn) {
            $.get(
                '${pageContext.request.contextPath}/backend/productType/modifyStatus',
                {'id':id},
                function (result) {
                    if (result.status==1){
                        //局部刷新
                        let $td=$(btn).parent().prev();
                        if ($td.text().trim()=='启用') {
                            $td.text('禁用');
                            $(btn).val("启用").removeClass("btn-danger").addClass("btn-success");
                        }
                        else {
                            $td.text('启用');
                            $(btn).val("禁用").removeClass("btn-success").addClass("btn-danger")
                        }
                    }
                    else
                        alert(result.message);
                }
            );
        }
    </script>
</head>

<body>
<div class="panel panel-default" id="userSet">
    <div class="panel-heading">
        <h3 class="panel-title">商品类型管理</h3>
    </div>
    <div class="panel-body">
        <input type="button" value="添加商品类型" class="btn btn-primary" id="doAddProTpye">
        <br>
        <br>
        <div class="show-list text-center" >
            <table class="table table-bordered table-hover" style='text-align: center;'>
                <thead>
                <tr class="text-danger">
                    <th class="text-center">编号</th>
                    <th class="text-center">类型名称</th>
                    <th class="text-center">状态</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${pageInfo.list}" var="productType">
                    <tr>
                        <td>${productType.id}</td>
                        <td>${productType.name}</td>
                        <td>
                            <c:if test="${productType.status==1}">启用</c:if>
                            <c:if test="${productType.status==0}">禁用</c:if>
                        </td>
                        <td class="text-center">
                            <input type="button" class="btn btn-warning btn-sm doProTypeModify" value="修改" onclick="showProductType(${productType.id})">
                            <input type="button" class="btn btn-warning btn-sm doProTypeDelete" onclick="showDeleteModal(${productType.id})" value="删除">
                            <c:if test="${productType.status==1}">
                                <input type="button" class="btn btn-danger btn-sm doProTypeDisable" onclick="modifyStatus(${productType.id},this)" value="禁用">
                            </c:if>
                            <c:if test="${productType.status==0}">
                                <input type="button" class="btn btn-success btn-sm doProTypeDisable" onclick="modifyStatus(${productType.id},this)" value="启用">
                            </c:if>

                        </td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>
            <!--使用分页插件-->
            <ul id="pagination"></ul>
        </div>
    </div>
</div>

<!-- 添加商品类型 start -->
<div class="modal fade" tabindex="-1" id="ProductType">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加商品类型</h4>
            </div>
            <div class="modal-body text-center">
                <div class="row text-right">
                    <label for="productTypeName" class="col-sm-4 control-label">类型名称：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="productTypeName">
                    </div>
                </div>
                <br>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary addProductType" onclick="addProductType()">添加</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 添加商品类型 end -->

<!-- 修改商品类型 start -->
<div class="modal fade" tabindex="-1" id="myProductType">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改商品类型</h4>
            </div>
            <div class="modal-body text-center">
                <div class="row text-right">
                    <label for="proTypeNum" class="col-sm-4 control-label">编号：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="proTypeNum" readonly>
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="proTypeName" class="col-sm-4 control-label">类型名称</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="proTypeName">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-warning updateProType" onclick="modifyName()">修改</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改商品类型 end -->

<!-- 删除商品类型 start -->
<div class="modal fade" tabindex="-1" id="deleteProductType">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">提示消息</h4>
            </div>
            <div class="modal-body text-center">
                <h3>确认要删除该商品类型吗？</h3>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="deleteProductTypeId"/>
                <button class="btn btn-warning updateProType" onclick="deleteProductType()" data-dismiss="modal">删除</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 删除商品类型 end -->
</body>

</html>