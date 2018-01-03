<%-- 
    Document   : editUser
    Created on : Jan 3, 2018, 11:05:30 PM
    Author     : Hau
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% User user = (User) request.getAttribute("user");%>
    <jsp:include page="layout/head.jsp"></jsp:include>
    <script>
        $(document).ready(function () {
            $('#editUser').click(function () {
                var data = {
                    id: $('#id').val(),
                    name: $('#name').val(),
                    email: $('#email').val(),
                    username: $('#username').val(),
                    password: $('#password').val()
                };
                console.log(data);
                $.ajax({
                    url: '/travel/admin/user/edit',
                    type: 'post',
                    data: data,
                    success: function (data) {
                        window.location = '/travel/admin/user';
                    }
                })
            })
        })
    </script>

        <body class="hold-transition skin-blue sidebar-mini">
            <div class="wrapper">

            <jsp:include page="layout/header.jsp"></jsp:include>
            <jsp:include page="layout/sidebar.jsp"></jsp:include>
                <div class="content-wrapper">
                    <section class="content-header">
                        <h1>
                            Edit User
                        </h1>
                    </section>
                    <section class="content">
                        <div class="form-group">
                            <label for="id">ID:</label>
                            <input type="text" name="id" disabled class="form-control" id="id" value="<%= user.getId() %>">
                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" name="name" class="form-control" id="name" value="<%= user.getName() %>">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" name="email" class="form-control" id="email" value="<%= user.getEmail() %>">
                    </div>
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" name="username" class="form-control" id="username" value="<%= user.getUsername() %>">
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" name="password" class="form-control" id="password" value="<%= user.getPassword()%>">
                    </div>
                     <div class="text-right" style="margin-top: 5px">
                        <button class="btn btn-primary" id="editUser">Edit</button>
                    </div>
                </section>
            </div>
        </div>
        <jsp:include page="layout/footer.jsp"></jsp:include>
        <script src="public/bootstrap/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="public/dist/js/app.min.js"></script>
    </body>
</html>
