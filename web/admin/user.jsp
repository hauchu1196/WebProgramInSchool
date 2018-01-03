<%-- 
    Document   : user
    Created on : Jan 3, 2018, 9:16:37 PM
    Author     : Hau
--%>

<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="layout/head.jsp"></jsp:include>
        <script>
            $(document).ready(function () {
                function init() {
                    var table = $('#tableUser').DataTable();

                    $("#tableUser").on('click', '.btn-edit', function () {
                        var id = (this).id;
                        var closestRow = $(this).closest('tr');
                        var data = {
                            command: 'edit-user',
                            id: id
                        }
                        $.ajax({
                            type: 'post',
                            url: '/travel/admin/user',
                            data: data,
                            success: function (data) {

                            }
                        })
                    });

                    $("#tableUser").on('click', '.btn-delete', function () {
                        var id = (this).id;
                        var closestRow = $(this).closest('tr');
                        console.log('delete: ' + id);
                        var data = {
                            command: 'delete-user',
                            id: id
                        };
                        $.ajax({
                            type: 'post',
                            url: '/travel/admin/user',
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
                        User
                    </h1>
                </section>

                <!-- Main content -->
                <section class="content">
                    <table id="tableUser" class="table table-bordered" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Username</th>
                                <th>Created at</th>
                                <th>Update at</th>
                                <th>Role</th>
                                <th>Action</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<User> list = (ArrayList<User>) request.getAttribute("users");
                                for (User user : list) {
                            %>

                            <tr>
                                <td><%= user.getId()%></td>
                                <td><%= user.getName()%></td>
                                <td><%= user.getEmail()%></td>
                                <td><%= user.getUsername()%></td>
                                <td><%= user.getCreated_at()%></td>
                                <td><%= user.getUpdated_at()%></td>
                                <td><%
                                    if (user.getRole() == 1) {
                                        out.print("Admin");
                                    } else {
                                        out.print("User");
                                    }
                                    %>
                                </td>
                                <td>
                                    <a class="btn btn-default btn-edit" href="/travel/admin/user/edit/<%= user.getId()%>" id="<%= user.getId()%>">Sửa</a>
                                    <button class="btn btn-default btn-delete" id="<%= user.getId()%>">Xóa</button>
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
        <script src="public/bootstrap/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="public/dist/js/app.min.js"></script>
    </body>
</html>
