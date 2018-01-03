<%-- 
    Document   : header
    Created on : Dec 1, 2017, 5:02:10 PM
    Author     : Phuc Do
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#form-user-name1").keyup(function (e) {
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_username_ajax(user_name);
                    }, 1000);
                });

                function check_username_ajax(username) {
                    $("#user-result").html('<img src="public/img/ajax-loader.gif" />');
                    $.post('CheckEmailServlet', {'username': username}, function (data) {
                        $("#user-result").html(data);
                        if (data == '<img src="public/img/not-available.png" />') {
                            $('#btn-register').attr("disabled",'');
                        }else{
                            $('#btn-register').removeAttr("disabled",'');
                        }
                    });
                }
            });
        </script>
    </head>
    <body>
        <!-- header -->
        <nav id="nnt-menu" class="nnt-main-menu">
            <ul>
                <li>
                    <a href="#xemanchoi">
                        <i class="fa fa-cutlery fa-2x"></i>
                        <span class="nnt-nav-text">
                            Ăn uống
                        </span>
                    </a>

                </li>
                <li>
                    <a href="#dulich">
                        <i class="fa fa-plane fa-2x"></i>
                        <span class="nnt-nav-text">
                            Du lịch
                        </span>
                    </a>

                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-search fa-2x"></i>
                        <span class="nnt-nav-text">
                            Tìm kiếm thông tin
                        </span>
                    </a>
                </li>
            </ul>
            <%
                if (session.getAttribute("user") != null) {
                    User user = (User) session.getAttribute("user");
            %>
            <ul class="user">
                <li class="btn-login">
                    <a href="LogoutServlet">
                        <i class="fa fa-sign-in fa-2x"></i>
                        <span class="nnt-nav-text">
                            Đăng xuất
                        </span>
                    </a>
                </li>
            </ul>
            <% } else { %>
            <ul class="user">
                <li class="btn-login">
                    <a href="" data-toggle="modal" data-target="#myModal">
                        <i class="fa fa-sign-in fa-2x"></i>
                        <span class="nnt-nav-text">
                            Đăng nhập
                        </span>
                    </a>
                </li>
                <li class="btn-register">
                    <a href="" data-toggle="modal" data-target="#myModal">
                        <i class="fa fa-user fa-2x"></i>
                        <span class="nnt-nav-text">
                            Đăng kí
                        </span>
                    </a>
                </li>
            </ul>
            <% } %>

        </nav>
        <header id="header" class="">
            <div class="dvp-top-header">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="row">
                                <a class="col-md-3 dvp-logo-home" href="home">
                                    <!-- <i class=" fa fa-telegram fa-4x" style="color: #a70e1a"></i> -->
                                    <img src="public/img/travel-logo5.png" alt="">
                                </a>
                                <div class="col-md-5 dvp-trending">
                                    <ul class="clearfix">
                                        <li class="dvp-trend">
                                            <a href="tag?alias=di-va-trai-nghiem" title="Đi và trải nghiệm">#Đi và trải nghiệm</a>
                                        </li>
                                        <li class="dvp-trend">
                                            <a href="tag?alias=loanh-quanh-cafe" title="Loanh quanh cafe">#Loanh quanh cafe</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-4 dvp-search-header">
                                    <form role="search" method="get" class="searchform" action="search">
                                        <div class="dvp-search active">
                                            <input id="searchinput" type="text" placeholder="Nhập nội dung tìm kiếm..." name="key">
                                            <button type="submit" class="dvp-btn-search">
                                                <span><i class="fa fa-search"></i></span>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <nav class="navbar navbar-inverse">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a id="dvp-logo-rep" class="navbar-brand" href="" style="padding: 0px 15px;">
                            <img src="public/img/travel-logo5.png" alt="Logo" style="width: 115px;">
                        </a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li class="dvp-menu-item"><a href="home">Trang chủ</a></li>
                            <li class="dvp-menu-item"><a href="du-lich">Du lịch</a></li>
                            <li class="dvp-menu-item"><a href="an-uong">Ăn uống</a></li>
                        </ul>
                        <%
                            if (session.getAttribute("user") != null) {
                                User user = (User) session.getAttribute("user");
                        %>

                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown dropdown-user">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" style="padding: 5px 5px 0px 0px;">
                                    <img alt="" class="img-circle" src="public/img/avatar.png" />
                                    <span class="username username-hide-on-mobile"> <%= user.getName()%> </span>
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-default">
                                    <!--<li class="divider"> </li>-->
                                    <li>
                                        <a href="LogoutServlet"><i class="icon-key"></i> Log Out </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>

                        <%
                        } else {
                        %>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="btn-login"><a href="" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span> ĐĂNG NHẬP</a></li>
                            <li class="btn-register"><a href="" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span> ĐĂNG KÝ</a></li>
                            <script src="public/js/login.js"></script>
                        </ul>
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel">Tài khoản</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-8" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                                                <!-- Nav tabs -->
                                                <ul class="nav nav-tabs">
                                                    <li class="login-form active"><a href="#Login" data-toggle="tab">Đăng nhập</a></li>
                                                    <li class="register-form"><a href="#Registration" data-toggle="tab">Đăng ký</a></li>
                                                </ul>
                                                <!-- Tab panes -->
                                                <div class="tab-content">
                                                    <div class="tab-pane login-form active" id="Login">
                                                        <form role="form" action="" method="post" class="registration-form" id="form-login">
                                                            <%if (request.getParameter("error") != null) {%>
                                                            <div>
                                                                <p style="color:red"><%=request.getParameter("error")%></p>
                                                            </div> 
                                                            <%}%>
                                                            <div class="form-group" id="error">
                                                                
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="sr-only" for="form-user-name">Tài khoản</label>
                                                                <input type="text" name="username" placeholder="Tài khoản..." class="form-user-name form-control" id="form-username">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="sr-only" for="form-password">Mật khẩu</label>
                                                                <input type="password" name="password" placeholder="Mật khẩu..." class="form-password form-control" id="form-password">
                                                            </div>
                                                            <input type="hidden" value="login" name="command" id="form-command">
                                                            <button type="button" class="btn" id="btn-login">Đăng nhập ngay!</button>
                                                            <script type="text/javascript">
                                                                $("#btn-login").on("click", function () {
                                                                    var formData = {
                                                                        'username': $("#form-username").val(),
                                                                        'password': $("#form-password").val(),
                                                                        'command': 'login'
                                                                    };
//                                                                    console.log(formData);
                                                                    $.post('UserServlet', formData, function (data) {
                                                                        if(data=='error'){
//                                                                            $('#erorr').append('');
                                                                            $("#error").append( "<label style='color: red'>Sai tên đăng nhập hoặc mật khẩu</label>" );
                                                                        }else{
                                                                            location.reload();
                                                                        }
                                                                    });
                                                                });
                                                            </script>
                                                        </form>
                                                    </div>
                                                    <div class="tab-pane register-form" id="Registration">
                                                        <form role="form" action="UserServlet" method="post" class="registration-form">
                                                            <div class="form-group">
                                                                <label class="sr-only" for="form-name">Tên</label>
                                                                <input type="text" name="name" placeholder="Tên..." class="form-name form-control" id="form-name1">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="sr-only" for="form-email">Email</label>
                                                                <input type="text" name="email" placeholder="Email..." class="form-email form-control" id="form-email1">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="sr-only" for="form-user-name">Tài khoản</label>
                                                                <input type="text" name="username" placeholder="Tài khoản..." class="form-user-name form-control" id="form-user-name1">
                                                                <span id="user-result" style="position: absolute; top: 202px; right: 10px;"></span>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="sr-only" for="form-password">Mật khẩu</label>
                                                                <input type="password" name="password" placeholder="Mật khẩu..." class="form-password form-control" id="form-password1">
                                                            </div>
                                                            <input type="hidden" value="register" name="command">
                                                            <button type="submit" class="btn" id="btn-register">Đăng ký</button>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div id="OR" class="hidden-xs">
                                                    OR</div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="row text-center sign-with">
                                                    <div class="col-md-12" style="color: #888;">
                                                        <h3>Đăng nhập với</h3>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="btn-group btn-group-justified">
                                                            <a href="#" class="btn btn-primary">Facebook</a>
                                                            <a href="#" class="btn btn-danger">Google</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </nav>
        </header>
        <script src="public/js/menu.js"></script>
    </body>
</html>
