<%-- 
    Document   : edit
    Created on : Nov 23, 2017, 4:43:53 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%--<%@ include file="/WEB-INF/views/admin/head.jsp" %>--%>
    <jsp:include page="layout/head.jsp"></jsp:include>

        <body class="hold-transition skin-blue sidebar-mini">
            <div class="wrapper">

            <jsp:include page="layout/header.jsp"></jsp:include>
            <jsp:include page="layout/sidebar.jsp"></jsp:include>


                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Page Header
                            <small>Optional description</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
                            <li class="active">Here</li>
                        </ol>
                    </section>

                    <!-- Main content -->
                    <section class="content">

                        <div class="content">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="header">
                                                <h4 class="title">New Article</h4>
                                            </div>
                                            <div class="content">
                                                <form action="" method="post">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label>ID</label>
                                                                <input type="text" class="form-control" disabled placeholder="ID" value="" name="id" >
                                                            </div>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <div class="form-group">
                                                                <label>Title</label>
                                                                <input type="text" class="form-control" placeholder="Article's name" value="" name="title">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Created Date</label>
                                                                <input type="text" class="form-control" placeholder="Year" value="" name="createdDate">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Image</label>
                                                                <input type="file" value="image" name="">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Category</label>
                                                                <select name="category">
                                                                    <option value="1">Du lịch</option>
                                                                    <option value="2">Ăn uống</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Tag</label>
                                                                <select name="tag">
                                                                    <option value="1">Phải đi</option>
                                                                    <option value="2">Khám Phá</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label>Content</label>
                                                                <textarea style="width:700px;height:100px;" name="c_content">

                                                                </textarea>
                                                                <script type="text/javascript">
                                                                    CKEDITOR.replace("c_content");
                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <button type="submit" class="btn btn-info btn-fill pull-right">Save</button>
                                                    <div class="clearfix"></div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </section>
                    <!-- /.content -->
                </div>
                <!-- /.content-wrapper -->

            <jsp:include page="layout/footer.jsp"></jsp:include>

        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <!-- jQuery 2.2.3 -->
        <script src="../public/plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="../public/bootstrap/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../public/dist/js/app.min.js"></script>

    </body>
</html>