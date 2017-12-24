<%-- 
    Document   : index
    Created on : Nov 22, 2017, 10:13:48 PM
    Author     : DELL
--%>

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
            $('#tableCategory').DataTable({
                "processing": true,
                "serverSide": true,
                "ajax": {
                    "url": "/travel/admin/category",
                    "type": "POST",
                }
            })
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
                        Category
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
                        <li class="active">Here</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <table id="tableCategory" class="display" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Alias</th>
                            </tr>
                        </thead>
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
