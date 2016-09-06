<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="keywords" content='<spring:message code="common.keywords"/>'>
    <meta name="description" content='<spring:message code="common.description"/>'>

    <title><spring:message code="common.plywoodTitle"/></title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css" media="screen"/>

    <!-- Customizable CSS -->
    <link rel="stylesheet" href="resources/css/main.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="resources/css/green.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="resources/css/owl.carousel.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="resources/css/owl.transitions.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="resources/css/animate.min.css" type="text/css" media="screen"/>

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css" media="screen"/>

    <!-- Favicon -->
    <link rel="shortcut icon" href="resources/images/favicon.ico">

    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-75911811-4', 'auto');
        ga('send', 'pageview');

    </script>

</head>
<body>

<div class="wrapper">
    <%@include file="common/insertions/navigation.jsp" %>
<!-- ================================================ HEADER ======================================================= -->
    <%@include file="common/insertions/header.jsp" %>
<!-- =============================================== HEADER : END ================================================ -->

<div id="top-banner-and-menu">
    <div class="container">
        <br><br>
        <div class="col-xs-12 col-sm-4 col-md-3 sidemenu-holder">
            <div class="side-menu animate-dropdown">
                <div class="head">
                    <i class="fa fa-list"></i><spring:message code="index.allDepartments"/>
                </div>
                <nav class="yamm megamenu-horizontal" role="navigation">
                    <ul class="nav">
                        <li class="dropdown menu-item">
                            <a onclick="goToPlywood()">
                                <h1 class="h2 no-margin" style="font-size: 15px; line-height: 26px; letter-spacing: normal; text-transform: none;">
                                    <spring:message code="common.plywood"/>
                                </h1>
                            </a>
                            <a href="http://plywood24.com/plywood" target="_blank"><spring:message code="common.plywoodTitle"/></a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <div class="col-xs-12 col-sm-8 col-md-9 homebanner-holder">
            <div id="hero">
                <p>
                    Some info
                </p>
            </div>
        </div>
    </div>
</div>
<!-- /.container -->

<!-- /.Featured machines and new arrivals -->
<c:if test="${!empty priceList}">
    <div id="products-tab" class="wow fadeInUp">
        <div class="container">
            <div class="tab-holder">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#featured" data-toggle="tab"><spring:message
                            code="common.featuredPlywood"/></a></li>
                    <li><a href="#new-arrivals" data-toggle="tab"><spring:message code="common.newArrivals"/></a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">

                    <div class="tab-pane active" id="featured">
                        <div class="product-grid-holder">
                            <c:forEach items="${priceList}" var="priceListItem" varStatus="loop">
                                <c:set var="plywood" value="${priceListItem.priceListPK.plywood}"/>
                                <c:set var="length" value="${priceListItem.priceListPK.length}" />
                                <c:set var="width" value="${priceListItem.priceListPK.width}" />
                                <c:set var="thickness" value="${priceListItem.priceListPK.thickness}" />
                                <div class="item${loop.index + 1} col-xs-12 col-sm-4 no-margin product-item-holder hover hidden">
                                    <div class="product-item">
                                        <div class="image">
                                            <img alt="Plywood - ${plywood.productId}"
                                                 src="../resources/images/blank.gif"
                                                 data-echo="../resources/images/products/${plywood.photo1}"/>
                                            <span class="photo${plywood.productId} hidden">${plywood.photo1}</span>
                                        </div>
                                        <div class="body">
                                            <div class="title">
                                                <a href="/plywood/${plywood.productId}/${length}/${width}/${thickness}">
                                                    PLYWOOD ${plywood.brand}<br><span
                                                        class="size${plywood.productId}">${length}X${width}X${thickness}</span>
                                                </a>
                                            </div>
                                            <div class="brand">
                                                                <span class="brand${plywood.productId}"><spring:message
                                                                        code="plywood.brand"/>: ${plywood.brand}</span>
                                                                <span class="type${plywood.productId}"><spring:message
                                                                        code="plywood.type"/>: ${plywood.brand}</span>
                                                                <span class="weight${plywood.productId}"><spring:message
                                                                        code="plywood.weight"/>: ${priceListItem.weight}</span>
                                            </div>
                                        </div>
                                        <div class="prices"
                                             <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                                            <div class="price-current pull-right">$<span
                                                    class="price${plywood.productId}">${priceListItem.price}</span>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="hover-area">
                                            <div class="add-cart-button">
                                                <a class="cart${plywood.productId} le-button"
                                                   onclick="addToCart('${plywood.productId}')"><spring:message
                                                        code="common.addToCart"/></a>
                                                <a class="cart${plywood.productId} le-button in-cart hidden"
                                                   onclick="removeFromCart('${plywood.productId}')"><spring:message
                                                        code="common.inCart"/></a>
                                            </div>
                                            <div class="wish-compare">
                                    <span class="wishList${plywood.productId} btn-add-to-wishlist"
                                          onclick="addToWishList('${plywood.productId}')"><spring:message
                                            code="common.addToWishList"/></span>
                                    <span class="wishList${plywood.productId} btn-add-to-wishlist btn-green hidden"
                                          onclick="removeFromWishList('${plywood.productId}')"><spring:message
                                            code="common.removeFromWishList"/></span>
                                                <br>
                                    <span class="compare${plywood.productId} btn-add-to-compare"
                                          onclick="addToComparison('${plywood.productId}')"><spring:message
                                            code="common.addToComparison"/></span>
                                    <span class="compare${plywood.productId} btn-add-to-compare btn-green hidden"
                                          onclick="removeFromComparison('${plywood.productId}')"><spring:message
                                            code="common.removeFromComparison"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="tab-pane" id="new-arrivals">
                        <div class="product-grid-holder">
                            <c:forEach items="${arrivalsList}" var="priceListItem" varStatus="loop">
                                <c:set var="plywood" value="${priceListItem.priceListPK.plywood}"/>
                                <c:set var="length" value="${priceListItem.priceListPK.length}" />
                                <c:set var="width" value="${priceListItem.priceListPK.width}" />
                                <c:set var="thickness" value="${priceListItem.priceListPK.thickness}" />
                                <div class="item${loop.index + 1} col-xs-12 col-sm-4 no-margin product-item-holder hover hidden">
                                    <div class="product-item">
                                        <div class="image">
                                            <img alt="Plywood - ${plywood.productId}"
                                                 src="../resources/images/blank.gif"
                                                 data-echo="../resources/images/products/${plywood.photo1}"/>
                                            <span class="photo${plywood.productId} hidden">${plywood.photo1}</span>
                                        </div>
                                        <div class="body">
                                            <div class="title">
                                                <a href="/plywood/${plywood.productId}/${length}/${width}/${thickness}">
                                                    PLYWOOD ${plywood.brand}<br><span
                                                        class="size${plywood.productId}">${length}X${width}X${thickness}</span>
                                                </a>
                                            </div>
                                            <div class="brand">
                                                                <span class="brand${plywood.productId}"><spring:message
                                                                        code="plywood.brand"/>: ${plywood.brand}</span>
                                                                <span class="type${plywood.productId}"><spring:message
                                                                        code="plywood.type"/>: ${plywood.brand}</span>
                                                                <span class="weight${plywood.productId}"><spring:message
                                                                        code="plywood.weight"/>: ${priceListItem.weight}</span>
                                            </div>
                                        </div>
                                        <div class="prices"
                                             <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                                            <div class="price-current pull-right">$<span
                                                    class="price${plywood.productId}">${priceListItem.price}</span>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="hover-area">
                                            <div class="add-cart-button">
                                                <a class="cart${plywood.productId} le-button"
                                                   onclick="addToCart('${plywood.productId}')"><spring:message
                                                        code="common.addToCart"/></a>
                                                <a class="cart${plywood.productId} le-button in-cart hidden"
                                                   onclick="removeFromCart('${plywood.productId}')"><spring:message
                                                        code="common.inCart"/></a>
                                            </div>
                                            <div class="wish-compare">
                                    <span class="wishList${plywood.productId} btn-add-to-wishlist"
                                          onclick="addToWishList('${plywood.productId}')"><spring:message
                                            code="common.addToWishList"/></span>
                                    <span class="wishList${plywood.productId} btn-add-to-wishlist btn-green hidden"
                                          onclick="removeFromWishList('${plywood.productId}')"><spring:message
                                            code="common.removeFromWishList"/></span>
                                                <br>
                                    <span class="compare${plywood.productId} btn-add-to-compare"
                                          onclick="addToComparison('${plywood.productId}')"><spring:message
                                            code="common.addToComparison"/></span>
                                    <span class="compare${plywood.productId} btn-add-to-compare btn-green hidden"
                                          onclick="removeFromComparison('${plywood.productId}')"><spring:message
                                            code="common.removeFromComparison"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</c:if>
<!-- /.Featured machines and new arrivals - end -->

</div>
<!-- /#top-banner-and-menu -->

<br><br><br><br>
<!-- ========================================= MAIN : END ========================================= -->
<!-- ============================================================= FOOTER ============================================================= -->
<%@include file="common/insertions/footer.jsp" %>
<!-- ============================================================= FOOTER : END ============================================================= -->
</div>
<!-- JavaScripts placed at the end of the document so the pages load faster -->
<script src="resources/js/jquery-1.10.2.min.js"></script>
<script src="resources/js/jquery-migrate-1.2.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
<script src="resources/js/gmap3.min.js"></script>
<script src="resources/js/bootstrap-hover-dropdown.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/css_browser_selector.min.js"></script>
<script src="resources/js/echo.min.js"></script>
<script src="resources/js/jquery.easing-1.3.min.js"></script>
<script src="resources/js/bootstrap-slider.min.js"></script>
<script src="resources/js/jquery.raty.min.js"></script>
<script src="resources/js/jquery.prettyPhoto.min.js"></script>
<script src="resources/js/jquery.customSelect.min.js"></script>
<script src="resources/js/wow.min.js"></script>
<script src="resources/js/scripts.js"></script>
<script src="http://w.sharethis.com/button/buttons.js"></script>
<script src="resources/js/comparison,wishlist,cart,common.jsp"></script>

</body>
</html>