<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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



        //修改卖家申请的状态(接受)
        function modifyStatusY(id,btn){
            $.post(
                '${pageContext.request.contextPath}/backend/seller/add',
                {'id':id},
                function(result){
                    if(result.status==1){
                        layer.msg('添加成功',{
                            time:2000,
                            skin:'successMsg'
                        },function(){
                            location.href='${pageContext.request.contextPath}/backend/sysuser/findAll?pageNum='+${pageInfo.pageNum};
                        })
                    }

                }
            );


            $.post(
                '${pageContext.request.contextPath}/backend/seller/modifyStatusY',
                {'id':id},
                function(result){
                    if(result.status==1){
                        let $td=$(btn).parent().parent().children().eq(5);
                        if($td.text().trim()=='申请中'){
                            $td.text('已接受');
                            $(btn).val('拒绝').removeClass('btn-success').addClass('btn-danger');
                        }else if($td.text().trim()=='已接受'){
                            $td.text('已拒绝');
                            $(btn).val('接受').removeClass('btn-danger').addClass('btn-success');
                        }else{
                            $td.text('已接受');
                            $(btn).val('拒绝').removeClass('btn-success').addClass('btn-danger');

                        }
                    }
                    location.reload()
                }
            );

        }

        //修改卖家申请的状态(拒绝)
        function modifyStatusN(id,btn){
            $.post(
                '${pageContext.request.contextPath}/backend/seller/modifyStatusN',
                {'id':id},
                function(result){
                    if(result.status==1){
                        let $td=$(btn).parent().parent().children().eq(5);
                        if($td.text().trim()=='申请中'){
                            $td.text('已接受');
                            $(btn).val('拒绝').removeClass('btn-success').addClass('btn-danger');
                        }else if($td.text().trim()=='已接受'){
                            $td.text('已拒绝');
                            $(btn).val('接受').removeClass('btn-danger').addClass('btn-success');
                        }else{
                            $td.text('已接受');
                            $(btn).val('拒绝').removeClass('btn-success').addClass('btn-danger');

                        }
                    }
                    location.reload()
                }
            );

        }




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
                <h2>管理员选项</h2>
                <ol class="breadcrumb">
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/backend/seller/findAll"><strong>卖家申请审核</strong></a>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2" style="margin-top: 30px;">
            </div>
        </div>
        <!--界面-->
        <!--搜索栏-->
        <div class="wrapper wrapper-content animated fadeInRight">
            <!--搜索栏-->
            <form class="ibox-content m-b-sm border-bottom" action="${pageContext.request.contextPath}/backend/seller/findByParams" method="post" id="frmSearch">
                <input type="hidden" name="pageNum" value="${pageInfo.pageNum}" id="pageNum">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="userName">姓名</label>
                            <input type="text" class="form-control" id="userName" placeholder="请输入姓名" name="name" value="${sellerParam.name}">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="loginName">帐号:</label>
                            <input type="text" class="form-control" id="loginName" placeholder="请输入帐号" name="loginName" value="${sellerParam.loginName}">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="phone">电话:</label>
                            <input type="text" class="form-control" id="phone" placeholder="请输入电话" name="phone" value="${sellerParam.phone}">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="status">状态</label>
                            <select class="form-control" name="isValid" id="status">
                                <option value="-1">全部</option>
                                <option value="0" <c:if test="${sellerParam.apply==0}">selected</c:if>>申请中</option>
                                <option value="1" <c:if test="${sellerParam.apply==1}">selected</c:if>>已接受</option>
                                <option value="2" <c:if test="${sellerParam.apply==2}">selected</c:if>>已拒绝</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-2" style="margin-top: 23px;">
                        <div class="form-group">
                            <input type="submit" value="查询" class="btn btn-primary form-control" id="doSearch">
                        </div>
                    </div>
                </div>

            </form>

            <!--表格-->
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox">
                    <div class="ibox-content">
                        <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="15">
                            <thead>
                            <tr>
                                <th data-toggle="true">序号</th>
                                <th data-hide="phone">姓名</th>
                                <th data-hide="phone">帐号</th>
                                <th data-hide="phone">电话</th>
                                <th data-hide="phone">邮箱</th>
                                <th data-hide="phone">状态</th>
                                <th data-hide="phone">申请时间</th>
                                <th class="text-right" data-sort-ignore="true">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="seller">
                                <tr>
                                    <td>${seller.id}</td>
                                    <td>${seller.name}</td>
                                    <td>${seller.loginName}</td>
                                    <td>${seller.phone}</td>
                                    <td>${seller.email}</td>
                                    <td>
                                        <c:if test="${seller.apply==0}">申请中</c:if>
                                        <c:if test="${seller.apply==1}">已接受</c:if>
                                        <c:if test="${seller.apply==2}">已拒绝</c:if>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${seller.createDate}" type="both"/>
                                    </td>
                                    <td class="text-right">
                                        <div class="btn-group">
                                            <c:if test="${seller.apply==0}">
                                                <input type="button" class="btn btn-success btn-xs doMangerDisable" value="接受" onclick="modifyStatusY(${seller.id},this)">
                                                <input type="button" class="btn btn-danger btn-xs doMangerDisable" value="拒绝" onclick="modifyStatusN(${seller.id},this)">
                                            </c:if>
                                            <c:if test="${seller.apply==1}">
                                                <input type="button" class="btn btn-warning btn-xs doProDelete" onclick="sweet(${seller.id})" value="删除">
                                            </c:if>
                                            <c:if test="${seller.apply==2}">
                                                <input type="button" class="btn btn-warning btn-xs doProDelete" onclick="sweet(${seller.id})" value="删除">
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-bottom: 20px;" class="text-center" id="pagination">
        </div>
    </div>
    <div class="footer">
        <div>
            地狗后台管理
        </div>
    </div>



<!-- 删除商品 start -->
<div class="modal fade" tabindex="-1" id="deleteSellerModal">
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
                <h4>确认要删除该卖家申请信息吗?</h4>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="deleteSellerId" />
                <button class="btn btn-primary updatePro" onclick="deleteSeller()">删除</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 删除商品 end -->
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
        //删除商品
        function deleteSeller(id) {
            $.get(
                '${pageContext.request.contextPath}/backend/seller/removeById',
                {'id':id},
                function (result) {
                    if (result.status==1)
                        location.href='${pageContext.request.contextPath}/backend/seller/findAll?pageNum='+${pageInfo.pageNum};
                }
            );
        }
        function sweet(id) {
            swal({
                    title: "是否删除该条记录",
                    text: "",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#19dd00",
                    confirmButtonText: "删除",
                    cancelButtonText: "取消",
                    closeOnConfirm: false,
                    closeOnCancel: false },
                function (isConfirm) {
                    if (isConfirm) {
                        //console.log("2");
                        deleteSeller(id);
                        //console.log("3");
                        swal("删除成功", "该条记录已经删除", "success");
                    } else {
                        swal("取消删除", "该操作已经取消", "success");
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
            location.href='${pageContext.request.contextPath}/backend/seller/findAll?pageNum='+page;
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
    </script>
</body>

</html>