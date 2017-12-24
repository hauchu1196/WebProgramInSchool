<%-- 
    Document   : article
    Created on : Dec 7, 2017, 9:57:24 PM
    Author     : Phuc Do
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.User"%>
<%@page import="model.Rate"%>
<%@page import="model.Comment"%>
<%@page import="model.Tag"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="layout/head.jsp"></jsp:include>
            <title>JSP Page</title>
        </head>
        <body>
        <jsp:include page="layout/header.jsp"></jsp:include>

            <!--main-->
        <%
            Article article = (Article) request.getAttribute("article");
            User user = (User) session.getAttribute("user");
            ArrayList<Tag> tags = (ArrayList<Tag>) request.getAttribute("list_tag");
            ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("list_comment");
            Rate rate = (Rate) request.getAttribute("rate");
        %>  
        <div class="row">
            <div class="col-lg-offset-2 col-md-8">

                <div class="nnt-title-main-post">
                    <%=article.getTitle()%>
                </div>
                <div class="nnt-inf-main-post">
                    <!--                    <span class="nnt-author-main-post">NAM NHI, </span>
                                        <span class="nnt-source-main-post">THEO TRI THUC TRE   </span>-->
                    <span class="nnt-clock-main-post">
                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                    </span>
                    <span class="nnt-time-main-post"><% String dateArt = article.getCreated_at().toString();%><%=dateArt.substring(0, dateArt.length() - 2)%></span>
                </div>
                <div style="margin-top:20px; border: dotted 1px #c0c0c0"></div>
                <div class="nnt-mainidea-post">Không mang vẻ đẹp buồn man mác đặc trưng của mùa thu miền Bắc, "mùa thu" của miền Tây mang vẻ đẹp tràn đầy sức sống của cả thiên nhiên lẫn con người nơi đây</div>
                <div class="nnt-link-post">
                    <ul>
                        <li><a href="#">Thế giới này còn bao nhiêu người đáng yêu, phải đi thật nhiều thì mới cảm nhận được! </a></li>
                        <li><a href="#">7 quán cafe xinh xắn này sẽ làm bạn muốn quay lại Đài Bắc thêm nhiều lần nữa! </a></li>
                        <li><a href="#">Những quán xá từng một thời gắn liền với thế hệ 8X, 9X Sài Gòn giờ ra sao? </a></li>
                    </ul>
                </div>

                <div style="margin-top:20px; border: dotted 1px #c0c0c0"></div>
                <div class="nnt-content1-post">
                    <%=article.getContent()%>
                </div>
                <!--                <div class="nnt-content1-post">
                                    Thế nhưng, ở Việt Nam mình, cứ mỗi độ thu sang, cũng là mùa nước nổi của miền Tây Nam Bộ. Trái ngược hẳn với vẻ đẹp buồn có phần man mác úa tàn của miền Bắc, "mùa thu" của miền Tây tràn ngập sức sống với những miệt vườn trĩu sai quả ngọt, muôn loại chim di cư về các cánh rừng hay cánh đồng sen nở rực rỡ.
                                </div>
                                <div class="nnt-content1-post">
                                    Thiên nhiên là thế, ngay cả nhịp sống của người miền Tây mùa nước nổi cũng sôi động hơn hẳn với chợ nổi ở khắp nơi, hay khi nước dâng lên khiến cho các cánh rừng ngập mặn đẹp hơn, thu hút khách du lịch hơn, cũng là thời điểm người dân làm du lịch. Vậy đấy, mùa thu ở Việt Nam đâu chỉ có nét buồn đặc trưng, hãy tranh thủ mùa nước nổi để khám phá miền Tây tươi đẹp, dịu dàng ở những địa điểm nổi bật dưới đây nhé:
                                </div>
                                <div class="nnt-title-place1-post">
                                    1. Rừng Tràm Trà Sư - An Giang
                                </div>
                                <div style="font-size: 15px">
                                    Nếu bảo nơi nào điển hình nhất cho mùa nước nổi thì có lẽ "con đường xanh" tại rừng Tràm Trà Sư sẽ được nhớ đến nhiều hơn cả.
                                </div>-->
                <!--                <div class="nnt-img-post">
                                    <img src="public/img/pic1.jpg" alt="">
                                </div>
                                <div class="nnt-photo-post">
                                    @nbaochau
                                </div>
                                <div class="nnt-img-post">
                                    <img src="public/img/pic2.jpg" alt="">
                                </div>
                                <div class="nnt-photo-post">
                                    @nbaochau
                                </div>
                                <div class="nnt-img-post">
                                    <img src="public/img/pic3.jpg" alt="">
                                </div>
                                <div class="nnt-photo-post">
                                    @nbaochau
                                </div>
                                <div style="margin-top: 25px; font-size: 15px">
                                    Ngồi trên những chiếc xuồng ba lá, len lỏi trong kênh rạch chằng chịt của rừng chàm. Bạn sẽ có cơ hội thả mình trong bốn bề xanh ngắt với những hàng cây tràm thẳng tít hai bên, dưới nước là lớp bèo trôi, không gian yên tĩnh, thỉnh thoảng văng vẳng tiếng chim hót dịu dàng biết bao. Nếu may mắn, bạn còn có thể bắt gặp những chú chim chẳng-sợ-ai mà đậu ngay thân cây hay khóm hoa bên bờ, khá hay ho đấy.
                                </div>
                                <div style="margin-top: 30px; font-size: 15px">
                                    Cách thị xã Châu Đốc chừng 30km, rừng tràm Trà Sư tại An Giang mang nét đẹp "lênh đênh" điển hình của mùa nước nổi miền Tây. Thật phí phạm nếu như bạn tới miền tây mà không dành thời gian thả trôi mình với thiên nhiên mát lành nơi đây.
                                </div>
                                <div class="nnt-img-post">
                                    <img src="public/img/pic4.jpg" alt="">
                                </div>
                                <div class="nnt-photo-post">
                                    @nbaochau
                                </div>
                                <div class="nnt-img-post">
                                    <img src="public/img/pic5.jpg" alt="">
                                </div>
                                <div class="nnt-photo-post">
                                    @nbaochau
                                </div>
                                <div class="nnt-img-post">
                                    <img src="public/img/pic6.jpg" alt="">
                                </div>
                                <div class="nnt-photo-post">
                                    @nbaochau
                                </div>
                                <div class="nnt-img-post">
                                    <img src="public/img/pic7.jpg" alt="">
                                </div>
                                <div class="nnt-photo-post">
                                    @nbaochau
                                </div>
                                <div class="nnt-img-post">
                                    <img src="public/img/pic8.jpg" alt="">
                                </div>
                                <div class="nnt-photo-post">
                                    @nbaochau
                                </div>-->
                <div class="klw-new-tags clearfix">
                    <ul class="knt-list">
                        <%
                            for (Tag tag : tags) {
                        %>
                        <li class="kli">
                            <a href="tag?alias=<%=tag.getAlias()%>" title="<%=tag.getName()%>">#<%=tag.getName()%></a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
                <div class="row">
                    <div class="map-title">
                        Chỉ dẫn đường
                    </div>
                    <div id="map" class="col-md-9"></div>
                    <div class="col-md-3" style="background-color: #fff;
                         padding: 5px;
                         font-family: 'Roboto','sans-serif';
                         padding-left: 10px;">
                        <div><strong>Điểm xuất phát:</strong></div>
                        <div>Vị trí của bạn</div>
                        <br>
                        <div><strong>Đích đến:</strong></div>
                        <div><%=article.getLocationDetail()%></div>
                        <br>
                        <div><strong>Phương tiện:</strong></div>
                        <select id="mode">
                            <option value="DRIVING">Lái xe</option>
                            <option value="WALKING">Đi bộ</option>
                        </select>
                        <br><br>
                        <div><strong>Chặng dừng:</strong></div>
                        <select multiple id="waypoints">
                            <option value="hanoi, vietnam">Hà Nội</option>
                            <option value="haiphong, vietnam">Hải Phòng</option>
                            <option value="danang, vietnam">Đà Nẵng</option>
                            <option value="hochiminh, vietnam">TP.Hồ Chí Minh</option>
                            <option value="cantho, vietnam">Cần thơ</option>
                        </select>
                        <br><br>
                        <button id="submit">Chỉ đường</button>
                    </div>
                </div>

                <div class="row comment-article">

                    <div class="detail-bottom-ads" style="background: #f1f1f1; padding: 30px;">
                    </div>
                    <div id="rate" class="map-title row text-center">
                        <% if (user != null) { %>
                        <div>                        
                            Đánh giá của bạn
                            <form method="post" action="">
                                <fieldset class="starability-basic" style="margin: 0 auto; min-height: 0;">
                                    <input type="radio" id="no-rate" class="input-no-rate" name="rating" value="0" checked aria-label="No rating." />
                                    <% for (int star = 1; star <= 5; star++) {%>
                                    <input type="radio" id="rate<%=star%>" name="rating" value="<%=star%>" 
                                           <% if (rate != null && star == rate.getRate()) {%><%="checked"%><% }%>/>
                                    <label for="rate<%=star%>"><%=star%> star.</label>
                                    <% }%>
                                    <span class="starability-focus-ring"></span>
                                </fieldset>
                                <button style="font-weight: 400; font-size: 14px; line-height: 20px; margin-top: 0px">Gửi</button>
                            </form>
                        </div>
                        <!-- Comments Form -->
                        <div class="well" style="height: 200px;">
                            <h4>Viết bình luận ... <span class="glyphicon glyphicon-pencil"></span></h4>
                            <form role="form" method="post" action="">
                                <input id="cmt_article_id" type="hidden" name="article_id" value="<%=article.getId()%>">
                                <input id="cmt_user_id" type="hidden" name="user_id" value="<%=user.getId()%>">
                                <div class="form-group">
                                    <textarea id="cmt_content" class="form-control" style="height: 80px" name="content"></textarea>
                                </div>
                                <input id="btn_comment" class="btn submit" type="button" value="Gửi bình luận" style="color: white; background: #6d84b4; border-color: #3b5998; float: right;">
                                <%
                                    Date date = new Date();
                                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                    String dateString = df.format(date);
                                %>
                                <script type="text/javascript">
                                    $("#btn_comment").on("click", function () {
                                        var formData = {
                                            'article_id': $("#cmt_article_id").val(),
                                            'user_id': $("#cmt_user_id").val(),
                                            'content': $("#cmt_content").val(),
                                        };
                                        $("#cmt_content").val('');
                                        $.post('CommentServlet', formData, function (data) {
//                                            var myObj = JSON.parse(data);
                                            if(data){
                                                console.log('Ok');
                                                var dataHTML = '<div class="media">';
                                                dataHTML += '<a class="pull-left">';
                                                dataHTML += '<img class="media-object" width="58" height="58" src="public/img/user-256.png" alt="">';
                                                dataHTML += '</a>';
                                                dataHTML += '<div class="media-body">';
                                                dataHTML += '<h4 class="media-heading" style="color: darkcyan;"><%=user.getUsername()%>';
                                                dataHTML += '<small> <%=dateString%></small>';
                                                dataHTML += '<h4>' + formData['content'] + '</h4>';
                                                dataHTML += '</div>';
                                                dataHTML += '</div>';
//                                                document.getElementById("old-comment").add(dataHTML);
                                                $("#old-comment").prepend(dataHTML);
                                            }
                                        });
                                    });

                                </script>
                            </form>
                        </div>
                        <% } else { %>
                        <a href="" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span> ĐĂNG NHẬP </a> để đánh giá và bình luận
                        <% }%>
                    </div>
                    <!--<h3><i class="fa fa-comment" style="color: orange;"></i><span> Bình luận</span></h3>-->
                    <div class="row" id="old-comment" style="padding-top: 15px;">
                        <%
                            for (Comment comment : comments) {
                        %>
                        <div class="media">
                            <a class="pull-left">
                                <img class="media-object" width="58" height="58" src="public/img/user-256.png" alt="">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading" style="color: darkcyan;"><%=comment.getUsername()%>
                                    <small><% String date = comment.getCreatedAt().toString();%><%=date.substring(0, date.length() - 2)%></small>
                                </h4>
                                <h4><%=comment.getContent()%></h4>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <!--end main-->
        <script>
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    mapTypeControl: false,
                    center: {lat: <%=article.getLatitude()%>, lng: <%=article.getLongitude()%>},
                    zoom: 13
                });
                var directionsService = new google.maps.DirectionsService;
                var directionsDisplay = new google.maps.DirectionsRenderer;
                directionsDisplay.setMap(map);
                var yourPos = new google.maps.LatLng(20.9724404, 105.83413530000007);
                var destinationPos = new google.maps.LatLng(<%=article.getLatitude()%>, <%=article.getLongitude()%>);
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function (position) {
                        var lat = position.coords.latitude;
                        var lng = position.coords.longitude;
                        yourPos = new google.maps.LatLng(lat, lng);
                    });
                } else {
                    alert("Geolocation is not supported by this browser. Set defaul Ha Noi");
                }
                calculateAndDisplayRoute(directionsService, directionsDisplay, yourPos, destinationPos);
                document.getElementById('mode').addEventListener('change', function () {
                    calculateAndDisplayRoute(directionsService, directionsDisplay, yourPos, destinationPos);
                });
                document.getElementById('submit').addEventListener('click', function () {
                    calculateAndDisplayRoute(directionsService, directionsDisplay, yourPos, destinationPos);
                });
            }
            function calculateAndDisplayRoute(directionsService, directionsDisplay, originPos, destinationPos) {
                var waypts = [];
                var checkboxArray = document.getElementById('waypoints');
                for (var i = 0; i < checkboxArray.length; i++) {
                    if (checkboxArray.options[i].selected) {
                        waypts.push({
                            location: checkboxArray[i].value,
                            stopover: true
                        });
                    }
                }
                var selectedMode = document.getElementById('mode').value;
                directionsService.route({
                    origin: originPos,
                    destination: destinationPos,
                    waypoints: waypts,
                    optimizeWaypoints: true,
                    travelMode: google.maps.TravelMode[selectedMode]
                }, function (response, status) {
                    if (status == 'OK') {
                        directionsDisplay.setDirections(response);
                    } else {
                        window.alert('Directions request failed due to ' + status);
                    }
                });
            }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxBruzNWomRwIcEAdYHovZpAdnnCMxaz8&libraries=places&callback=initMap"
        async defer></script>
    </body>
    <script>
    //    AIzaSyD8Rng4CBtMc08vjgiwcFFwA1zwB8SL09I
    </script>
    <jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>
