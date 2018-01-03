<%-- 
    Document   : index
    Created on : Nov 22, 2017, 10:13:48 PM
    Author     : DELL
--%>

<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@page import="model.Tag"%>
<%@page import="model.Article"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
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
    <% Article article = (Article) request.getAttribute("article");%>
    <script>

        $(document).ready(function () {
            var thumbnail = '';

            $("#input-thumbnail").fileinput({
                uploadUrl: '/travel/upload',
                initialPreview: [
                    '<img class="file-preview-image kv-preview-data" src="<%= article.getThumbnail()%>">',
                ],
            });
            $('#input-thumbnail').on('fileuploaded', function (event, data) {
                thumbnail = data.response.name;
                console.log(thumbnail);

            });
            var dataTag = [];
        <% for (Tag tag : article.getTags()) {%>
            dataTag.push({
                id: <%= tag.getId()%>,
                name: '<%= tag.getName()%>'
            });
        <%} %>

            var tags = $('#tag').magicSuggest({
                placeholder: 'Select...',
                allowFreeEntries: false,
                selectionPosition: 'bottom',
                selectionStacked: true,
                value: dataTag,
                selectionRenderer: function (data) {
                    return data.name;
                }});


            CKEDITOR.replace('editor', {
                filebrowserBrowseUrl: '/travel/images/',
                filebrowserUploadUrl: '/travel/upload',
                filebrowserWindowWidth: '1000',
                filebrowserWindowHeight: '700'
            });

            CKEDITOR.instances['editor'].setData('<%= article.getContent().trim().replaceAll("\\r|\\n|\\r|\\n", " ")%>');


            $.ajax({
                url: "/travel/admin/tag",
                type: "get",
                data: {
                    command: "get-tag-by-id-category",
                    id: 1
                },
                success: function (data) {
                    tags.setData(JSON.parse(data));
                }
            });

            $("#category").change(function () {
                console.log((this).value);
                $.ajax({
                    url: "/travel/admin/tag",
                    type: "get",
                    data: {
                        command: "get-tag-by-id-category",
                        id: (this).value
                    },
                    success: function (data) {
                        tags.setData(JSON.parse(data));

                    }
                });
            })

            $('#editArticle').click(function () {
                var tagsTmp = '';
                for (var i = 0; i < tags.getValue().length; i++) {
                    tagsTmp += tags.getValue()[i];
                }
                var data = {
                    title: $('#title').val(),
                    link: $('#link').val(),
                    category: $('#category').val(),
                    tags: tagsTmp,
                    thumbnail: thumbnail === '' ? '<%= article.getThumbnail()%>' : thumbnail,
                    content: CKEDITOR.instances['editor'].getData(),
                    lat: $('#lat').val(),
                    long: $('#long').val(),
                    location: $('#address').val()
                }
                console.log(data);
                $.ajax({
                    url: '/travel/admin/article/edit',
                    type: 'post',
                    data: data,
                    success: function (data) {
                        window.location = '/travel/admin/article';
                    }
                });
            });
        });

    </script>
    <style>
        #map {
            height: 500px;
        }
        .ms-ctn {
            position: relative;
            padding: 5px 12px;
            height: auto;
        }
        .ms-ctn-focus {
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
        }
        .ms-helper {
            color: #AAA;
            font-size: 10px;
            position: absolute;
            top: -17px;
            right: 0;
        }
        .ms-ctn .ms-trigger {
            top: 0;
            width: 25px;
            height: 100%;
            position: absolute;
            right: 0;
            background: transparent;
            border-left: 1px solid #CCC;
            cursor: pointer;
        }
        .ms-ctn .ms-trigger .ms-trigger-ico {
            display: inline-block;
            width: 0;
            height: 0;
            vertical-align: top;
            border-top: 4px solid #333;
            border-right: 4px solid transparent;
            border-left: 4px solid transparent;
            content: "";
            margin-left: 8px;
            margin-top: 15px;
        }
        .ms-stacked .ms-sel-item {
            float: left!important;
            margin-right: 5px!important;
            background: #3C8DBC!important;
            color: white!important;
        }
    </style>

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
                        Edit Article
                    </h1>
                </section>

                <!-- Main content -->
                <section class="content">
                    <!--                    <table id="tableArticle" class="cell-border" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Title</th>
                                                    <th>Content</th>
                                                    <th>Category</th>
                                                    <th>Link</th>
                                                    <th>Url thumbnail</th>
                                                    <th>View</th>
                                                    <th>Created at</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                        </table>-->

                    <div class="form-group">
                        <label for="title">Title:</label>
                        <input type="text" name="title" class="form-control" id="title" value="<%= article.getTitle()%>">
                    </div>
                    <div class="form-group">
                        <label for="link">Link:</label>
                        <input type="text" name="link" class="form-control" id="link" value="<%= article.getLink()%>">
                        <div class="form-group">
                            <label for="sel1">Category:</label>
                            <%
                                ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
                            %>
                            <select class="form-control" name="category" id="category" value="<%= article.getCategory().getId()%>">
                                <%
                                    for (Category category : categories) {
                                %>
                                <option value="<%= category.getId()%>"> <%= category.getName()%></option>

                                <%}%>

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tag">Tag:</label>
                        <div class="ms-ctn form-control" style="" id="tag">
                            <input type="text" class="" name="tag" placeholder="Select...">
                            <span class="ms-helper " style="display: none;"></span>
                            <div class="ms-trigger">
                                <div class="ms-trigger-ico">

                                </div>

                            </div>

                        </div>
                        <div class="ms-sel-ctn ms-stacked" style="width: 154px;"><div style="display: none;"></div></div>
                    </div>

                    <div class="form-group">
                        <label>Thumbnail</label>
                        <input id="input-thumbnail" type="file" name="upload" class="file" data-preview-file-type="text" >
                    </div>

                    <div class="form-group">
                        <label>Content</label>
                        <textarea name="content" rows="10" cols="80" id="editor" value=""></textarea>
                    </div>

                    <div style="margin-bottom: 15px">
                        <input id="address" class="form-control" style="width:300px; display: inline-block" type="textbox" value="<%= article.getLocationDetail()%>">
                        <input id="lat" class="form-control" style="width:300px; display: inline-block" type="textbox" placeholder="lat" value="<%= article.getLongitude() %>">
                        <input id="long" class="form-control" style="width:300px; display: inline-block" type="textbox" placeholder="long" value="<%= article.getLatitude() %>">
                        <input id="submit" class="btn btn-default" type="button" value="Geocode">
                    </div>
                    <div id="map"></div>

                    <div class="text-right" style="margin-top: 5px">
                        <button class="btn btn-primary" id="editArticle">Edit</button>
                    </div>


                    <!-- Your Page Content Here -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <jsp:include page="layout/footer.jsp"></jsp:include>


        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <script>
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 8,
                    center: {lat: -34.397, lng: 150.644}
                });
                var geocoder = new google.maps.Geocoder();

                document.getElementById('submit').addEventListener('click', function () {
                    geocodeAddress(geocoder, map);
                });
            }

            function geocodeAddress(geocoder, resultsMap) {
                var address = document.getElementById('address').value;
                geocoder.geocode({'address': address}, function (results, status) {
                    if (status === 'OK') {
                        resultsMap.setCenter(results[0].geometry.location);
                        var marker = new google.maps.Marker({
                            map: resultsMap,
                            position: results[0].geometry.location
                        });
                        $('#long').val(marker.position.lng());
                        $('#lat').val(marker.position.lat());
                    } else {
                        alert('Geocode was not successful for the following reason: ' + status);
                    }
                });
            }
        </script>

        <!-- REQUIRED JS SCRIPTS -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxBruzNWomRwIcEAdYHovZpAdnnCMxaz8&callback=initMap"
        async defer></script>

        <script src="public/bootstrap/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="public/dist/js/app.min.js"></script>
        <link href="public/assets/magicsuggest/magicsuggest-min.css" rel="stylesheet">
        <script src="public/assets/magicsuggest/magicsuggest-min.js"></script>
        <script src="public/assets/ckeditor/ckeditor.js"></script>

        <!-- bootstrap 4.x is supported. You can also use the bootstrap css 3.3.x versions -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
        <!-- piexif.min.js is only needed for restoring exif data in resized images and when you 
            wish to resize images before upload. This must be loaded before fileinput.min.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/plugins/piexif.min.js" type="text/javascript"></script>
        <!-- sortable.min.js is only needed if you wish to sort / rearrange files in initial preview. 
            This must be loaded before fileinput.min.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/plugins/sortable.min.js" type="text/javascript"></script>
        <!-- purify.min.js is only needed if you wish to purify HTML content in your preview for 
            HTML files. This must be loaded before fileinput.min.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/plugins/purify.min.js" type="text/javascript"></script>
        <!-- the main fileinput plugin file -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/fileinput.min.js"></script>
        <!-- optionally if you need a theme like font awesome theme you can include it as mentioned below -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/themes/fa/theme.js"></script>

        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. Slimscroll is required when using the
             fixed layout. -->
    </body>
</html>
