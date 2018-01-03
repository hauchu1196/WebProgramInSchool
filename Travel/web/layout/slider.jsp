<%-- 
    Document   : slider
    Created on : Dec 1, 2017, 5:30:20 PM
    Author     : Phuc Do
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- slider -->
        <div class="main-container">
            <div class="dvp-main">
                <div class="slideshow-container">
                    <div class="container" style="width: 100%;">
                        <div class="row">
                            <div id="slide-show" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#slide-show" data-slide-to="0" class="active"></li>
                                    <li data-target="#slide-show" data-slide-to="1"></li>
                                    <li data-target="#slide-show" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <a href="" title=""><img class="dvp-img-slider" src="public/img/pexels-photo-287240.jpeg"></a>
                                        <div class="carousel-caption">
                                            <h3>"Một nửa cái thú của việc đi là nghệ thuật đi lạc."</h3>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <a href="" title=""><img class="dvp-img-slider" src="public/img/pexels-photo-239520.jpeg"></a>
                                        <div class="carousel-caption">
                                            <h1>CỨ ĐI ĐI</h1>
                                            <h3>
                                                "Hạnh phúc không phải đích đến, <br>
                                                - mà là trên từng chặng đường đi -"
                                            </h3>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <a href="" title=""><img class="dvp-img-slider" src="public/img/pexels-photo-59519.jpeg"></a>
                                        <div class="carousel-caption">
                                            <h3>"Thế giới là 1 cuốn sách, và ai  không đi chỉ đọc được một trang."</h3>
                                        </div>
                                    </div>
                                    <a class="left carousel-control" href="#slide-show" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#slide-show" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </a>
                                </div>
                            </div>
                            <script src="public/js/slide-show.js"></script>
                        </div>
                    </div>
                </div>
                <script src="public/js/slider.js"></script>
            </div>
        </div>
    </body>
</html>
