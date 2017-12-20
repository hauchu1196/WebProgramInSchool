<%-- 
    Document   : content
    Created on : Dec 1, 2017, 5:36:00 PM
    Author     : Phuc Do
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-offset-1 col-md-10">
                    <!-- Du lịch -->
                    <div class="container-fuild">
                        <div class="row" style="width: 100%; margin: 0;">
                            <div class="col-md-12 col-xs-12">
                                <div class="row">
                                    <div class="title-main">
                                        <div class="text-main col-md-4 col-xs-12"><a class="tab-dulich" href="#du-lich" data-toggle="tab" style="color:  white;">DU LỊCH BỐN PHƯƠNG</a></div>
                                        <ul id="myTab1" class="nav nav-tabs col-md-8 col-xs-12">
                                            <li><a class="tab-dulich" href="#di-va-trai-nghiem" data-toggle="tab">Đi và trải nghiệm</a></li>
                                            <li><a class="tab-dulich" href="#phai-di" data-toggle="tab">Phải đi</a></li>
                                            <li><a class="tab-dulich" href="#loanh-quanh-cafe" data-toggle="tab">Loanh quanh cafe</a></li>
                                            <li><a class="tab-dulich" href="#o-dau-cho-suong" data-toggle="tab">Ở đâu cho sướng</a></li>
                                            <li><a class="tab-dulich" href="#di-choi-o-dau" data-toggle="tab">Đi chơi ở đâu</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="myTabContent1" class="tab-content">
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    getDataArticle('myTabContent1', 'du-lich');
                                    getDataArticle('myTabContent2', 'an-uong');
//                                    console.log(dulich);
//                                    document.getElementById("myTabContent1").innerHTML = dulich;

                                    $('.tab-dulich').on('click', function (event) {
                                        var self = this;
                                        // $(event.target).parents()[2].remove();
                                        var string = $(event.target)['0'].hash;

                                        console.log(string.substring(1));
//                                        console.log($(event.target));
                                        $('.tab-pane').attr('id', string);
                                        var tag = $(event.target)['0'].hash.substring(1);
                                        dulich = getDataArticle('myTabContent1', tag);
//                                        document.getElementById("myTabContent1").innerHTML = dulich;
                                    });

                                    $('.tab-anuong').on('click', function (event) {
                                        var self = this;
                                        // $(event.target).parents()[2].remove();
                                        var string = $(event.target)['0'].hash;

                                        console.log(string.substring(1));
//                                        console.log($(event.target));
                                        $('.tab-pane').attr('id', string);
                                        var tag = $(event.target)['0'].hash.substring(1);
                                        dulich = getDataArticle('myTabContent2', tag);
//                                        document.getElementById("myTabContent1").innerHTML = dulich;
                                    });

                                    function getDataArticle(table, tag) {
                                        $.ajax({
                                            url: 'ArticleServlet',
                                            dataType: "text",
                                            data: {
                                                tag: tag
                                            },
                                            success: function (data) {
                                                var myObj = JSON.parse(data);
                                                console.log(myObj);
                                                var dataHTML = " <div class='tab-pane fade in active' id=" + tag.substring(1) + ">";
                                                dataHTML += "<div class='row'>";
                                                for (x in myObj) {
                                                    dataHTML += "<div class='image-text-main du-lich col-md-4 col-xs-12'>";
                                                    dataHTML += "<div class='hcv-container-image'>";
                                                    dataHTML += "<img class='images' src=public/img/" + myObj[x].thumbnail + " alt=''>";
                                                    dataHTML += "<div class='hcv-text-bottom-image'>đi</div>";
                                                    dataHTML += "</div>";
                                                    dataHTML += "<div class='link-main'><a href=" + myObj[x].link +"-"+ myObj[x].id +">" + myObj[x].title + "</a></div>";
                                                    dataHTML += "</div>";
                                                }
                                                dataHTML += "</div>";
//                                                console.log(dataHTML);
                                                console.log(table);
                                                document.getElementById(table).innerHTML = dataHTML;
//                                                document.getElementById("myTabContent1").innerHTML = dataHTML;
                                                return dataHTML;

                                            },
                                            fails: function () {
                                                alert("Article not Found");
                                                return null;
                                            }
                                        });

                                    }
                                });
                            </script>
                        </div>
                    </div>
                    <!-- Xem Ăn Chơi -->
                    <div class="container-fuild">
                        <div class="row" style="width: 100%; margin: 0;">
                            <div class="col-md-12 col-xs-12">
                                <div class="row">
                                    <div class="title-main">
                                        <div class="text-main col-md-4 col-xs-12"><a class="tab-anuong" href="#an-uong" data-toggle="tab" style="color:  white;">ĂN CẢ THẾ GIỚI</a></div>
                                        <ul id="myTab2" class="nav nav-tabs col-md-8 col-xs-12">
                                            <li><a class="tab-anuong" href="#ha-noi" data-toggle="tab">Hà Nội</a></li>
                                            <li><a class="tab-anuong" href="#mien-trung" data-toggle="tab">Miền Trung</a></li>
                                            <li><a class="tab-anuong" href="#tp-ho-chi-minh" data-toggle="tab">TP . Hồ Chí Minh</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="myTabContent2" class="tab-content">
                            <!--                            <div class="tab-pane fade in active" id="hanoi">
                                                            <div class="row">
                                                                <div class="image-text-main du-lich col-md-4 col-xs-12">
                                                                    <div class="hcv-container-image">
                                                                        <img class="images" src="public/img/img7.jpg" alt="">
                                                                        <div class="hcv-text-bottom-image">đi và trải nghiệm</div>
                                                                    </div>
                                                                    <div class="link-main"><a href="#">Thu sang, hãy thử "quên" lá vàng miền Bắc để về với miền Tây đón mùa nước nổi</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade" id="mientrung">
                                                            <div class="row">
                                                                <div class="image-text-main du-lich col-md-4 col-xs-12">
                                                                    <div class="hcv-container-image">
                                                                        <img class="images" src="public/img/img8.gif" alt="">
                                                                        <div class="hcv-text-bottom-image">phải đi</div>
                                                                    </div>
                                                                    <div class="link-main"><a href="#">5 địa điểm du lịch độc đáo trên thế giới đã kịp in dấu chân các bạn trẻ Việt Nam!</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade" id="tphochiminh">
                                                            <div class="row">
                                                                <div class="image-text-main du-lich col-md-4 col-xs-12">
                                                                    <div class="hcv-container-image">
                                                                        <img class="images" src="public/img/img9.jpg" alt="">
                                                                        <div class="hcv-text-bottom-image">loanh quanh cafe</div>
                                                                    </div>
                                                                    <div class="link-main"><a href="#">Nếu một lần được đến Đài Loan, bạn sẽ hiểu hai chữ "bình yên" thật sự là như thế nào</a></div>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>
                    </div>
                    <!-- Bootstrap TabCollapse-->

                    <script type="text/javascript" src="public/js/bootstrap-tabcollapse.js"></script>
                    <script type="text/javascript" src="public/js/tab-click.js"></script>

                </div>
            </div>
        </div>
        <script src="public/js/responsive-tabs.js"></script>
        <script src="public/js/tab-nav.js"></script>
    </body>
</html>
