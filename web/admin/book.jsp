<%-- 
    Document   : listbook
    Created on : Nov 23, 2017, 4:44:33 PM
    Author     : DELL
--%>

<%@page import="model.Book"%>
<%@page import="model.Category"%>
<%@page import="model.Article"%>
<%@page import="dao.ArticleDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

                        <div class="page-container" style="background-color: #364150!important;">
                            <div>
                                <div class="row" style="margin: 0;">
                                    <div class="col-md-10 col-md-offset-1 portlet light">
                                        <!-- END EXAMPLE TABLE PORTLET-->
                                        <div class="portlet light portlet-fit portlet-datatable bordered">
                                            <div class="portlet-title">
                                                <div class="caption font-dark">
                                                    <i class="icon-settings font-dark"></i>
                                                    <span class="caption-subject bold uppercase">Book</span>
                                                </div>
                                                <div class="actions">
                                                    <div class="btn-group btn-group-devided" >
                                                        <a href="eidt.jsp" class="btn btn-transparent dark btn-outline btn-circle btn-sm">Add</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="portlet-body">
                                            <%
                                                Book[] books = (Book[]) request.getAttribute("list_book");
                                            %> 
                                            <table id="table_student_1" class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <td>ID</td>
                                                        <td>Name</td>
                                                        <td>Author</td>
                                                        <td>Price</td>
                                                        <td>Quantity</td>
                                                        <td>Content</td>
                                                        <td>Actions</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (Book b : books) {
                                                    %>
                                                    <tr>
                                                        <td><%= b.getId()%></td>
                                                        <td><%= b.getName()%></td>
                                                        <td><%= b.getAuth()%></td>
                                                        <td><%= b.getPrice()%></td>
                                                        <td><%= b.getQuanity()%></td>
                                                        <td><%= b.getContent()%></td>
                                                        <td>
                                                            <a class='btn btn-primary btn-xs' role='button'  href='edit.jsp'>Edit</a>
                                                            <a class='btn btn-primary btn-xs' role='button'  href='#'>Delete</a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>
                                    <!-- END EXAMPLE TABLE PORTLET-->
                                </div>
                            </div>
                        </div>
                        <!-- END CONTENT BODY -->

                        <!-- BEGIN CORE PLUGINS -->
                        <script src="public/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
                        <script src="public/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
                        <script src="public/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
                        <script src="public/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
                        <script src="public/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
                        <!-- END CORE PLUGINS -->
                        <!-- BEGIN PAGE LEVEL PLUGINS -->
                        <script src="public/assets/global/scripts/datatable.js" type="text/javascript"></script>
                        <script src="public/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
                        <script src="public/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
                        <!-- END PAGE LEVEL PLUGINS -->
                        <!-- BEGIN THEME GLOBAL SCRIPTS -->
                        <script src="public/assets/global/scripts/app.min.js" type="text/javascript"></script>
                        <!-- END THEME GLOBAL SCRIPTS -->
                        <!-- BEGIN PAGE LEVEL SCRIPTS -->
                        <script src="public/assets/pages/scripts/table-datatables-responsive.min.js" type="text/javascript"></script>
                        <!-- END PAGE LEVEL SCRIPTS -->
                        <!-- BEGIN THEME LAYOUT SCRIPTS -->
                        <script src="public/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
                        <script src="public/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>


                        <script>
                            $(document).ready(function() {
                                $('#table_student_1').DataTable();
                            });
                        </script>
                    </div>

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->



            <!-- REQUIRED JS SCRIPTS -->

            <!-- jQuery 2.2.3 -->
<!--            <script src="public/plugins/jQuery/jquery-2.2.3.min.js"></script>
             Bootstrap 3.3.6 
            <script src="public/bootstrap/js/bootstrap.min.js"></script>
             AdminLTE App 
            <script src="public/dist/js/app.min.js"></script>-->

            <jsp:include page="layout/footer.jsp"></jsp:include>
        </div>
        <!-- ./wrapper -->

    </body>
</html>
