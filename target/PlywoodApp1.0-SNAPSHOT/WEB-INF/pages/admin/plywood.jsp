<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name='robots' content='all, follow'/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <title>Admin. Plywood catalog</title>
    <link href="../resources/admin/css/default.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/gray.css" rel="stylesheet" type="text/css" media="screen"/>
    <!-- color skin: blue / red / green / dark -->
    <link href="../resources/admin/css/datePicker.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/wysiwyg.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/fancybox-1.3.1.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/visualize.css" rel="stylesheet" type="text/css" media="screen"/>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css">

    <script type="text/javascript" src="../resources/admin/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../resources/admin/js/jquery.dimensions.min.js"></script>

    <!-- // Tabs // -->
    <script type="text/javascript" src="../resources/admin/js/ui.core.js"></script>
    <script type="text/javascript" src="../resources/admin/js/jquery.ui.tabs.min.js"></script>

    <!-- // Table drag and drop rows // -->
    <script type="text/javascript" src="../resources/admin/js/tablednd.js"></script>

    <!-- // Date Picker // -->
    <script type="text/javascript" src="../resources/admin/js/date.js"></script>
    <!--[if IE]><script type="text/javascript" src="public/js/jquery.bgiframe.js"></script><[endif]-->
    <script type="text/javascript" src="../resources/admin/js/jquery.datePicker.js"></script>

    <!-- // Wysiwyg // -->
    <script type="text/javascript" src="../resources/admin/js/jquery.wysiwyg.js"></script>

    <!-- // Graphs // -->
    <script type="text/javascript" src="../resources/admin/js/excanvas.js"></script>
    <script type="text/javascript" src="../resources/admin/js/jquery.visualize.js"></script>

    <!-- // File upload // -->
    <script type="text/javascript" src="../resources/admin/js/jquery.filestyle.js"></script>

    <script type="text/javascript" src="../resources/admin/js/init.js"></script>

</head>
<body>
<div id="main">
    <%@include file="header.jsp" %>
    <!-- #content -->
    <div id="content">

        <!-- breadcrumbs -->
        <div class="breadcrumbs">
            <ul>
                <li class="home"><a href="/admin/plywood" style="font-weight: bold; color: #008B00">Plywood</a></li>
                <li class="home">&nbsp;|&nbsp;</li>
                <li class="home"><a href="/admin/gallery">Gallery</a></li>
                <li class="home">&nbsp;|&nbsp;</li>
                <li class="home"><a href="/admin/orders">Orders</a></li>
                <li class="home">&nbsp;|&nbsp;</li>
                <li class="home"><a href="/admin/users">Users</a></li>
            </ul>
        </div>
        <!-- /breadcrumbs -->
        <div id="top"></div>
        <!-- box -->
        <div class="tabs box">
            <ul class="bookmarks">
                <li><a href="#edit">Edit plywood</a></li>
                <li><a href="#upload">Upload plywood from file</a></li>
                <li><a href="#filters">Renew filters</a></li>
            </ul>
            <div class="box-content">
                <div id="edit">
                    <c:if test="${empty plywoodList}">
                        <h3>Add plywood to the catalog.</h3>
                    </c:if>
                    <c:set var="itemsPerPage" value="${itemsPerPage}"/>
                    <c:set var="itemsNum" value="${itemsNum}"/>

                    <!-- /pagination -->
                    <div class="paging">
                        <ul>
                            <c:forEach begin="1" end="${pagesNum}" var="i">
                                <li id="page${i}">
                                    <a onclick="showPage(${i});">${i}</a>
                                </li>
                            </c:forEach>
                        </ul>
                        <p>Pages: </p>
                    </div>
                    <!-- /pagination -->

                </div>

                <div id="upload">
                    <form:form class="formBox" method="post" action="plywood/upload"
                               enctype="multipart/form-data">

                        <fieldset>
                            <div class="clearfix file">
                                <div class="lab"><label for="textFile">Upload file with plywood</label></div>
                                <div class="con">
                                    <input type="file" accept=".xls,.xlsx" name="textFile" class="upload-file"
                                           id="textFile" multiple required/>
                                </div>
                            </div>
                            - N files<br>
                            - .xlsx or .xls format<br>
                            - <a href="../resources/example.xlsx" target="_blank">example</a> (download)
                            <br><br>

                            <div class="btn-submit"><!-- Submit form -->
                                <input type="submit" value="Add / update" class="button"/>
                            </div>
                        </fieldset>

                    </form:form>
                </div>

                <div id="filters">
                    <form:form class="formBox" method="post" action="plywood/renewFilters">

                        <fieldset>
                            Renewing filters means forming new filter parameters according to existing DB with Machines.
                            <h3 style="color: red; margin-top:10px">Please, do it every time you've finally changed the items.</h3>
                            As a result, you would see <u>relevant</u> filter parameters.<br><br>

                            <div class="btn-submit"><!-- Submit form -->
                                <input type="submit" value="Renew filters" class="button"/>
                            </div>
                        </fieldset>

                    </form:form>
                </div>

            </div>
        </div>

    </div>
    <!-- /#content -->
    <%@include file="footer.jsp" %>
</div>
<!-- /#main -->

<script type="text/javascript">
    var currentPage = 1;
    var itemsPerPage = '${itemsPerPage}';
    var itemsNum = '${itemsNum}';

    $(document).ready(function () {
        $("#textFile").change(function () {
            changeNames($(this));
        });
        toggleItems(currentPage);
        toggleCurrentClassPage(currentPage);
    });
</script>

</body>
</html>