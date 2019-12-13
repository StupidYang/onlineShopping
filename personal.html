<%@ page import="login.userdata" %>
<%@ page import="java.util.List" %>
<%@ page import="meetings.meetingdata" %>
<%@ page import="meetings.mymeet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>会议管理系统-首页</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="js/personalset.js"></script>
    <script src="js/ajax.js"></script>
    <style>
        .hide{
            display: none;
        }
    </style>
</head>
<body>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    userdata a = new userdata();
    if (session.getAttribute("userdata") == null) {
        response.sendRedirect(basePath);
    } else {
        a = (userdata) session.getAttribute("userdata");
    }

    String name = a.getName();
    String classname;
    if(a.getPower() == 2){
       classname = "系统管理员";
    }else {
        classname = "会议人员";
    }

    String sex = a.getSex();
    String birthday = a.getBirthday();
    String register = a.getRegistertime();
    String id = a.getIdnumber();
    String workplace = a.getWorkplace();
    String phone = a.getPhone();
    String uid = a.getUid();
    String tag = a.getTag();
    String speacial = a.getSpeacial();
%>
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="img/profile_small.jpg" />
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><%out.print(name); %></strong>
                             </span> <span class="text-muted text-xs block"><%out.print(classname); %><b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="meetinglist.jsp">会议管理</a></li>
                            <li class="divider"></li>
                            <li><a href="login.jsp">退出登录</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        EM
                    </div>
                </li>
                <li>
                    <a href="welcome_ui.jsp"><i class="fa fa-th-large"></i><span class="nav-label">首页</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">会议管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="newmeeting.jsp">新建会议</a></li>
                        <li><a href="meetinglist.jsp">会议列表</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <!-顶部-->
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message">欢迎来到会议管理系统</span>
                    </li>
                    <li>
                        <a href="login.jsp">
                            <i class="fa fa-sign-out"></i> 退出登录
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <!-中间-->
        <div class="row  border-bottom white-bg dashboard-header">
            <div class="col-sm-3">
                <h2>欢迎您，<%out.print(name); %></h2>
                <small>多努力学习才会有收获.</small>
            </div>
            <div class="col-sm-6">
            </div>
            <div class="col-sm-3">
            </div>
        </div>
        <!-界面-->
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-4">
                    <div class="row m-b-lg m-t-lg">
                        <!-个人简介-->
                        <div class="col-md-6">
                            <div class="profile-image">
                                <img src="img/a4.jpg" class="img-circle circle-border m-b-md" alt="profile">
                            </div>
                            <div class="profile-info">
                                <div class="">
                                    <div>
                                        <h2 class="no-margins">
                                            <%out.print(name); %>
                                        </h2>
                                        <h4><%out.print(classname); %></h4>
                                        <small>
                                            个性签名我也不想做了，总有BUG想害我
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins" id="xinxikuang">
                        <div class="ibox-title">
                            <h5>个人信息</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-wrench"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="#" onclick="personalSet()">修改</a>
                                    </li>
                                </ul>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content no-padding" id="personalbox">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    姓名：<%out.print(name); %>
                                </li>
                                <li class="list-group-item">
                                    性别：<%out.print(sex); %>
                                </li>
                                <li class="list-group-item">
                                    生日：<%out.print(birthday); %>
                                </li>
                                <li class="list-group-item ">
                                    注册日期：<%out.print(register); %>
                                </li>
                                <li class="list-group-item">
                                    身份证号码：<%out.print(id); %>
                                </li>
                                <li class="list-group-item">
                                    工作单位：<%out.print(workplace); %>
                                </li>
                                <li class="list-group-item">
                                    联系电话：<%out.print(phone); %>
                                </li>
                                <li class="list-group-item">
                                    <button type="button" class="btn btn-primary btn-xs">UID</button><%out.print(uid); %>
                                </li>
                                <li class="list-group-item" id="lilast">
                                    标签：<%
                                    boolean b = false;
                                    for (int i=0;i<tag.length();i++)
                                    {
                                        if (  tag.charAt(i)=='，' ) {
                                            b = true;
                                        }
                                    }
                                    if (b) {
                                        String[] TAG = tag.split("，");
                                        String[] str = new String[3];
                                        for(int i = 0; i < 3; ++i){
                                            if(!TAG[i].equals("")){
                                                str[i] = "<button class=\"btn btn-white btn-xs\" type=\"button\">" + TAG[i] + "</button>";
                                            }
                                        }
                                        for(int i = 0;i<3;++i) {
                                            if(!str[i].equals("")){
                                                out.print(str[i]);
                                            }
                                        }
                                    }

                                %>
                                </li>
                                <li class="list-group-item text-right hide" id="cancel">
                                    <a class='btn btn-w-m btn-warning' onclick="reset()">取消</a>&nbsp;&nbsp;
                                    <button type='button' id="tijiao" onclick="personalx()" class='btn btn-w-m btn-info'>提交</button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                        <!-会议信息-->
                        <div class="col-lg-4">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>会议</h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <i class="fa fa-wrench"></i>
                                        </a>
                                        <a class="close-link">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="ibox-content ibox-heading">
                                    <h3>您的会议</h3>
                                    <small><i class="fa fa-map-marker"></i>会议安排如下，请安排好您的时间.</small>
                                </div>
                                <div class="ibox-content inspinia-timeline">
                                    <div class="timeline-item">
                                        <%
                                            List<mymeet> list = meetingdata.mymeetinglist(a.getUid());
                                            mymeet temp;
                                            for(int i = 0; i<list.size(); ++i){
                                                temp = list.get(i);
                                                out.println("<div class=\"row\">");
                                                out.println("<div class=\"col-xs-3 date\">");
                                                out.println("<i class=\"fa fa-briefcase\"></i>会议时间<br/>");
                                                out.println("<small class=\"text-navy\">"+temp.getMydate()+"</small></div>");
                                                out.println("<div class=\"col-xs-7 content no-top-border\"><p class=\"m-b-xs\"><strong>"+temp.getMyname()+"</strong></p>");
                                                out.println("<p>"+temp.getMyde()+"</p>");
                                                out.println("</div>");
                                                out.print("</div>");
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer">
                    <div>
                        会议管理系统
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Mainly scripts -->
<script src="js/jquery-2.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="js/plugins/flot/jquery.flot.js"></script>
<script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="js/plugins/flot/jquery.flot.spline.js"></script>
<script src="js/plugins/flot/jquery.flot.resize.js"></script>
<script src="js/plugins/flot/jquery.flot.pie.js"></script>

<!-- Peity -->
<script src="js/plugins/peity/jquery.peity.min.js"></script>
<script src="js/demo/peity-demo.js"></script>

<!-- jQuery UI -->
<script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- GITTER -->
<script src="js/plugins/gritter/jquery.gritter.min.js"></script>

<!-- Sparkline -->
<script src="js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="js/demo/sparkline-demo.js"></script>

<!-- Custom and plugin javascript -->
<script src="js/inspinia.js"></script>
<script src="js/plugins/pace/pace.min.js"></script>

<!-- ChartJS-->
<script src="js/plugins/chartJs/Chart.min.js"></script>

<!-- Toastr -->
<script src="js/plugins/toastr/toastr.min.js"></script>
<script>
    $(document).ready(function() {
        setTimeout(function() {
            toastr.options = {
                closeButton: true,
                progressBar: true,
                showMethod: 'slideDown',
                timeOut: 4000
            };
            toastr.success('会议管理系统', '欢迎回来！');

        }, 1300);
    });

</script>
</body>
</html>
