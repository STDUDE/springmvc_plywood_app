<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <title>Plywood24. ${plywood.brand} ${priceListItem.priceListPK.length}X${priceListItem.priceListPK.width}X${priceListItem.priceListPK.thickness}</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css" media="screen"/>

    <!-- Customizable CSS -->
    <link rel="stylesheet" href="../resources/css/main.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="../resources/css/green.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="../resources/css/owl.carousel.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="../resources/css/owl.transitions.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="../resources/css/animate.min.css" type="text/css" media="screen"/>

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css" type="text/css" media="screen"/>

    <!-- Favicon -->
    <link rel="shortcut icon" href="../resources/images/favicon.ico">

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
<c:set var="plywood" value="${priceListItem.priceListPK.plywood}"/>
<c:set var="length" value="${priceListItem.priceListPK.length}" />
<c:set var="width" value="${priceListItem.priceListPK.width}" />
<c:set var="thickness" value="${priceListItem.priceListPK.thickness}" />
<div class="wrapper">
    <%@include file="insertions/header.jsp" %>
    <div id="top-mega-nav">
        <div class="container">
            <nav>
                <ul class="inline">
                    <%@include file="insertions/shopByType.jsp" %>
                    <li class="breadcrumb-nav-holder">
                        <ul>
                            <li class="breadcrumb-item gray">
                                <a href="/"><spring:message code="common.home"/></a>
                            </li>
                            <li class="breadcrumb-item gray">
                                <a onclick="goToPlywood()"><spring:message code="common.plywood"/></a>
                            </li>
                            <li class="breadcrumb-item current">
                                <a onclick="window.location.reload(true);">
                                    <h1 class="h2 department-h1">${plywood.brand} ${length}X${width}X${thickness}</h1>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- /.breadcrumb-nav-holder -->
                </ul>
            </nav>
        </div>
        <!-- /.container -->
    </div>
    <!-- /#top-mega-nav -->

    <br>

    <div id="single-product">
        <div class="container">

            <div class="no-margin col-xs-12 col-sm-6 col-md-5 gallery-holder">
                <div class="product-item-holder size-big single-product-gallery small-gallery">

                    <div id="owl-single-product">
                        <div class="single-product-gallery-item" id="slide1">
                            <a data-rel="prettyphoto" href="../resources/images/products/${plywood.photo1}">
                                <img class="img-responsive" alt="" src="../resources/images/blank.gif"
                                     data-echo="../resources/images/products/${plywood.photo1}"/>
                                <span class="photo${plywood.productId} hidden">${plywood.photo1}</span>
                            </a>
                        </div>

                        <c:if test="${plywood.photo2!=''}">
                            <div class="single-product-gallery-item" id="slide2">
                                <a data-rel="prettyphoto" href="../resources/images/products/${plywood.photo2}">
                                    <img class="img-responsive" alt="" src="../resources/images/blank.gif"
                                         data-echo="../resources/images/products/${plywood.photo2}"/>
                                </a>
                            </div>
                        </c:if>

                        <c:if test="${plywood.photo3!=''}">
                            <div class="single-product-gallery-item" id="slide3">
                                <a data-rel="prettyphoto" href="../resources/images/products/${plywood.photo3}">
                                    <img class="img-responsive" alt="" src="../resources/images/blank.gif"
                                         data-echo="../resources/images/products/${plywood.photo3}"/>
                                </a>
                            </div>
                        </c:if>

                        <c:if test="${plywood.photo4!=''}">
                            <div class="single-product-gallery-item" id="slide4">
                                <a data-rel="prettyphoto" href="../resources/images/products/${plywood.photo4}">
                                    <img class="img-responsive" alt="" src="../resources/images/blank.gif"
                                         data-echo="../resources/images/products/${plywood.photo4}"/>
                                </a>
                            </div>
                        </c:if>

                        <c:if test="${plywood.photo5!=''}">
                            <div class="single-product-gallery-item" id="slide5">
                                <a data-rel="prettyphoto" href="../resources/images/products/${plywood.photo5}">
                                    <img class="img-responsive" alt="" src="../resources/images/blank.gif"
                                         data-echo="../resources/images/products/${plywood.photo5}"/>
                                </a>
                            </div>
                        </c:if>

                    </div>
                    <!-- /.single-product-slider -->

                    <div class="single-product-gallery-thumbs gallery-thumbs">

                        <div id="owl-single-product-thumbnails">
                            <a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="0"
                               href="#slide1">
                                <img width="67" alt="" src="../resources/images/blank.gif"
                                     data-echo="../resources/images/products/${plywood.photo1}"/>
                            </a>

                            <c:if test="${plywood.photo2!=''}">
                                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="1" href="#slide2">
                                    <img width="67" alt="" src="../resources/images/blank.gif"
                                         data-echo="../resources/images/products/${plywood.photo2}"/>
                                </a>
                            </c:if>

                            <c:if test="${plywood.photo3!=''}">
                                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide3">
                                    <img width="67" alt="" src="../resources/images/blank.gif"
                                         data-echo="../resources/images/products/${plywood.photo3}"/>
                                </a>
                            </c:if>

                            <c:if test="${plywood.photo4!=''}">
                                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="3" href="#slide4">
                                    <img width="67" alt="" src="../resources/images/blank.gif"
                                         data-echo="../resources/images/products/${plywood.photo4}"/>
                                </a>
                            </c:if>

                            <c:if test="${plywood.photo5!=''}">
                                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="4" href="#slide5">
                                    <img width="67" alt="" src="../resources/images/blank.gif"
                                         data-echo="../resources/images/products/${plywood.photo5}"/>
                                </a>
                            </c:if>
                        </div>
                        <!-- /#owl-single-product-thumbnails -->

                    </div>
                    <!-- /.gallery-thumbs -->

                </div>
                <!-- /.single-product-gallery -->
            </div>
            <!-- /.gallery-holder -->

            <div class="no-margin col-xs-12 col-sm-7 body-holder">
                <div class="body">
                    <div class="brand">
                        <big>
                            <span class="brand${plywood.productId}">${plywood.brand}</span><br>
                            <spring:message code="plywood.productId"/>: ${plywood.productId}
                        </big>
                    </div>

                    <div class="buttons-holder">
                    <span class="wishList${plywood.productId} btn-add-to-wishlist"
                          onclick="addToWishList('${plywood.productId}')"><spring:message
                            code="common.addToWishList"/></span>
                    <span class="wishList${plywood.productId} btn-add-to-wishlist btn-green hidden"
                          onclick="removeFromWishList('${plywood.productId}')"><spring:message
                            code="common.removeFromWishList"/></span>
                    <span class="compare${plywood.productId} btn-add-to-compare" data-toggle="popover"
                          onclick="addToComparison('${plywood.productId}')"><spring:message
                            code="common.addToComparison"/></span>
                    <span class="compare${plywood.productId} btn-add-to-compare btn-green hidden" data-toggle="popover"
                          onclick="removeFromComparison('${plywood.productId}')"><spring:message
                            code="common.removeFromComparison"/></span>
                    </div>

                    <div class="excerpt">
                        <p>${plywood.description}</p>
                    </div>

                    <div class="prices"
                         <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                        <div class="price-current">$<span class="price${plywood.productId}">${priceListItem.price}</span></div>
                    </div>

                    <div class="qnt-holder">
                        <a class="cart${plywood.productId} le-button huge"
                           onclick="addToCart('${plywood.productId}')"><spring:message code="common.addToCart"/></a>
                        <a class="cart${plywood.productId} le-button huge in-cart hidden"
                           onclick="removeFromCart('${plywood.productId}')"><spring:message code="common.inCart"/></a>
                        &nbsp;&nbsp;
                        <a class="le-button huge" href="/hmc/proposalSingle?productId=${plywood.productId}"><spring:message
                                code="cart.getCommercialProposal"/> (PDF)</a>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- ========================================= SINGLE PRODUCT TAB ========================================= -->
    <section id="single-product-tab">
        <div class="container">
            <div class="tab-holder">

                <ul class="nav nav-tabs simple">
                    <li class="active">
                        <a href="#application" data-toggle="tab">
                            <spring:message code="plywood.application"/>
                        </a>
                    </li>
                    <li><a href="#additional-info" data-toggle="tab"><spring:message
                            code="plywood.additional-info"/></a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active container-fluid no-padding" id="description">
                        <div class="col-xs-12 col-md-7 no-padding">
                            <c:if test="${plywood.application!=''}">
                                <p>${plywood.application}</p>
                                <br><br>
                            </c:if>
                        </div>
                    </div>

                    <div class="tab-pane" id="additional-info">
                        <ul class="tabled-data">
                            <li>
                                <label><spring:message code="plywood.type"/></label>

                                <div class="value">${plywood.type}</div>
                            </li>
                            <li>
                                <label><spring:message code="plywood.length"/></label>

                                <div class="value">${length}</div>
                            </li>
                            <li>
                                <label><spring:message code="plywood.width"/></label>

                                <div class="value">${width}</div>
                            </li>
                            <li>
                                <label><spring:message code="plywood.thickness"/></label>

                                <div class="value">${thickness}</div>
                            </li>
                            <li>
                                <label><spring:message code="plywood.weight"/></label>

                                <div class="value">${priceListItem.weight}</div>
                            </li>
                        </ul>

                    </div>

                </div>
                <!-- /.tab-content -->

            </div>
            <!-- /.tab-holder -->
        </div>
        <!-- /.container -->
    </section>
    <!-- /#single-product-tab -->
    <!-- ================================ SINGLE PRODUCT TAB : END ========================================= -->
    <!-- ================================================= FOOTER ========================================== -->
    <%@include file="insertions/footer.jsp" %>
    <!-- ============================================================= FOOTER : END ============================================================= -->
</div>
<!-- /.wrapper -->

<!-- JavaScripts placed at the end of the document so the pages load faster -->
<script src="../resources/js/jquery-1.10.2.min.js"></script>
<script src="../resources/js/jquery-migrate-1.2.1.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
<script src="../resources/js/gmap3.min.js"></script>
<script src="../resources/js/bootstrap-hover-dropdown.min.js"></script>
<script src="../resources/js/owl.carousel.min.js"></script>
<script src="../resources/js/css_browser_selector.min.js"></script>
<script src="../resources/js/echo.min.js"></script>
<script src="../resources/js/jquery.easing-1.3.min.js"></script>
<script src="../resources/js/bootstrap-slider.min.js"></script>
<script src="../resources/js/jquery.raty.min.js"></script>
<script src="../resources/js/jquery.prettyPhoto.min.js"></script>
<script src="../resources/js/jquery.customSelect.min.js"></script>
<script src="../resources/js/wow.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="http://w.sharethis.com/button/buttons.js"></script>
<script src="../resources/js/comparison,wishlist,cart,common.jsp"></script>

</body>
</html>