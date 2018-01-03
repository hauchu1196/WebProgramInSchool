<%-- 
    Document   : index
    Created on : Nov 22, 2017, 10:13:48 PM
    Author     : DELL
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="model.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
    <%--<%@ include file="/WEB-INF/views/admin/head.jsp" %>--%>
    <jsp:include page="layout/head.jsp"></jsp:include>
        <script>
            $(document).ready(function () {
                function init() {
                    var table = $('#tableArticle').DataTable();

                    $("#tableArticle").on('click', '.btn-edit', function () {
                        var id = (this).id;
                        var closestRow = $(this).closest('tr');
                        var data = {
                            command: 'edit-article',
                            id: id
                        }
                        $.ajax({
                            type: 'post',
                            url: '/travel/admin/article',
                            data: data,
                            success: function (data) {

                            }
                        })
                    });

                    $("#tableArticle").on('click', '.btn-delete', function () {
                        var id = (this).id;
                        var closestRow = $(this).closest('tr');
                        console.log('delete: ' + id);
                        var data = {
                            command: 'delete-article',
                            id: id
                        };
                        $.ajax({
                            type: 'post',
                            url: '/travel/admin/article',
                            data: data,
                            success: function (data) {
                                console.log(data);
                                if (data.code === 200) {
                                    table.row(closestRow).remove().draw();
                                }
                            }
                        })
                    });
                }
                init();


            })
        </script>

        <!--
        BODY TAG OPTIONS:
        =================
        Apply one or more of the following classes to get the
        desired effect
        |---------------------------------------------------------|
        | SKINS         | skin-blue                               |
        |               | skin-black                              |
        |               | skin-purple                             |
        |               | skin-yellow                             |
        |               | skin-red                                |
        |               | skin-green                              |
        |---------------------------------------------------------|
        |LAYOUT OPTIONS | fixed                                   |
        |               | layout-boxed                            |
        |               | layout-top-nav                          |
        |               | sidebar-collapse                        |
        |               | sidebar-mini                            |
        |---------------------------------------------------------|
        -->
        <body class="hold-transition skin-blue sidebar-mini">
            <div class="wrapper">

            <jsp:include page="layout/header.jsp"></jsp:include>
            <jsp:include page="layout/sidebar.jsp"></jsp:include>
            <%--<%@ include file="/WEB-INF/views/admin/header.jsp" %>--%>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Article
                    </h1>
                    <div class="text-right">
                        <a href="/travel/admin/article/add" class="btn btn-primary" >Add</a>
                    </div>
                </section>

                <!-- Main content -->
                <section class="content">
                    <table id="tableArticle" class="table table-bordered" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Link</th>
                                <th>Category</th>
                                <th>Content</th>
                                <th>Url thumbnail</th>
                                <th>View</th>
                                <th>Created at</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Article> list = (ArrayList<Article>) request.getAttribute("articles");
                                for (Article article : list) {
                            %>
                            <tr>
                                <td class="col-md-1"><%= article.getId()%></td>
                                <td class="col-md-1"><%= article.getTitle()%></td>
                                <td class="col-md-1"><%= article.getLink()%></td>
                                <td class="col-md-1" ><%= article.getCategory().getName()%></td>
                                <td class="col-md-1" style="
                                    max-width: 100px !important;
                                    overflow: hidden !important;
                                    text-overflow: ellipsis!important;
                                    white-space: nowrap!important;"><%= article.getContent()%></td>
                                <td class="col-md-1"><%= article.getThumbnail()%></td>
                                <td class="col-md-1"><%= article.getView()%></td>
                                <td class="col-md-1"><%= article.getCreated_at()%></td>
                                <td class="col-md-1">
                                    <a class="btn btn-default btn-edit" href="/travel/admin/article/edit/<%= article.getId()%>" id="<%= article.getId()%>">Sửa</a>
                                    <button class="btn btn-default btn-delete" id="<%= article.getId()%>">Xóa</button>
                                </td>
                            </tr>

                            <% }%>
                        </tbody>
                    </table>
                    <!-- Your Page Content Here -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <jsp:include page="layout/footer.jsp"></jsp:include>


        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <script src="public/bootstrap/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="public/dist/js/app.min.js"></script>

        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. Slimscroll is required when using the
             fixed layout. -->
    </body>
</html>
