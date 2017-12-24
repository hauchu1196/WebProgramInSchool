<%-- 
    Document   : login
    Created on : Nov 23, 2017, 5:00:34 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Login</title>
        <base href="http://localhost:8080/travel/" />

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="public/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- styles -->
        <link href="public/css/login-admin.css" rel="stylesheet">
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://code.jquery.com/jquery.js"></script>
    </head>
    <body class="login-bg">
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Logo -->
                        <div class="logo">
                            <h1><a>Travel Admin</a></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-content container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-wrapper">
                        <div class="box">
                            <div class="content-wrap">
                                <h6>Sign In</h6>
                                <div class="social">
                                    <div class="division">
                                        <hr class="left">
                                        <span>with</span>
                                        <hr class="right">
                                    </div>
                                </div>
                                <form action="admin/login" method="POST">
                                    <input class="form-control" name="username" type="text" placeholder="Username">
                                    <input class="form-control" name="password" type="password" placeholder="Password">
                                    <div class="action">
                                        <button class="btn btn-primary signup" type="submit">Login</button>
                                    </div>                
                                </form>
                            </div>
                        </div>

                        <div class="already">
                            <p>Don't have an account yet?</p>
                            <a href="">Sign Up</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            $(document).ready(function () {
                
            })
        </script>



        
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="public/bootstrap/js/bootstrap.min.js"></script>
        <script src="public/js/custom.js"></script>
    </body>
</html>
