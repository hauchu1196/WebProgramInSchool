<%-- 
    Document   : dulich
    Created on : Dec 1, 2017, 6:02:21 PM
    Author     : Phuc Do
--%>

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

            <!-- main -->
            <div class="hcv-body-content-area clearfix">
                <div class="hcv-dulich-topbg">
                    <div>
                        <span>du lịch</span>
                    </div>
                </div>
            <%
                ArrayList<Article> articles = (ArrayList<Article>) request.getAttribute("list_article");
            %>  
            <div class="hcv-article">
                <div class="col-md-10">
                    <%
                        for (Article a : articles) {
                    %>
                    <div class="row">

                        <div class="col-md-4">
                            <img src="public/img/<%=a.getThumbnail()%>" alt="" style="width: 100%;">
                        </div>
                        <div class="col-md-8">
                            <div class="hcv-tn-meta">
                                <span class="hcv-tn-time hcv-date-time" title="2017-09-26T19:30:00">3 ngày trước</span>
                            </div>
                            <h3 class="hcv-tn-title">
                                <a href="<%=a.getLink() + '-' + a.getId()%>" title="<%=a.getTitle()%>"><%=a.getTitle()%></a>
                            </h3>
                            <p class="hcv-tn-sapo">Nhắc tới Úc, không thể bỏ qua Melbourne và Perth, 2 thành phố nằm ở phía tây và phía nam nổi tiếng bởi cảnh quan thiên nhiên xinh ...</p>

                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

        </div>

        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>
