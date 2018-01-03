<%-- 
    Document   : search
    Created on : Jan 3, 2018, 12:41:43 PM
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
                        <span>Tìm kiếm</span>
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
                    <a href=article?id=<%=a.getId()%> title="<%=a.getTitle()%>">
                        <div class="row">

                            <div class="col-md-4">
                                <img src="public/img/<%=a.getThumbnail()%>" alt="" style="width: 100%;">
                            </div>
                            <div class="col-md-8">
                                <div class="hcv-tn-meta">
                                    <span class="hcv-tn-time hcv-date-time" title="2017-09-26T19:30:00"><%=a.getCreated_at()%></span>
                                </div>
                                <h3 class="hcv-tn-title">
                                    <a href=article?id=<%=a.getId()%> title="<%=a.getTitle()%>"><%=a.getTitle()%></a>
                                </h3>
                                <!--<p class="hcv-tn-sapo">Nhắc tới Úc, không thể bỏ qua Melbourne và Perth, 2 thành phố nằm ở phía tây và phía nam nổi tiếng bởi cảnh quan thiên nhiên xinh ...</p>-->

                            </div>
                        </div>
                    </a>
                    <%
                        }
                    %>

                </div>
            </div>

        </div>

        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>