<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<html lang="en">
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <title><spring:message code="common.plywoodTitle"/></title>

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

<div class="wrapper">
    <%@include file="common/insertions/header.jsp" %>

    <div id="top-mega-nav">
        <div class="container">
            <nav>
                <ul class="inline">
                    <%@include file="common/insertions/shopByDepartment.jsp" %>

                    <li class="breadcrumb-nav-holder">
                        <ul>
                            <li class="breadcrumb-item gray">
                                <a href="/"><spring:message code="common.home"/></a>
                            </li>
                            <li class="breadcrumb-item current">
                                <a onclick="window.location.reload(true);">
                                    <h1 class="h2 department-h1"><spring:message code="common.plywood"/></h1>
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

    <section id="category-grid">
        <div class="container">

            <div id="top"></div>

            <!-- ========================================= SIDEBAR ========================================= -->
            <div class="col-xs-12 col-sm-3 no-margin sidebar narrow">
                <!-- ========================================= PRODUCT FILTER ========================================= -->
                <div class="widget">
                    <h2 style="font-size: 28px; line-height: 52px; color: #3d3d3d"><spring:message
                            code="productFilters"/></h2>

                    <div class="body bordered" id="filterForm">

                        <!-- price slider -->
                        <c:if test="${!empty sliders}">
                            <div class="price-filter">
                                <h2><spring:message code="plywood.price"/></h2>
                                <c:set var="priceMin" value="${sliders.iterator().next().priceMin}"/>
                                <c:set var="priceMax" value="${sliders.iterator().next().priceMax}"/>
                                <div class="price-range-holder">
                                    <input type="text" class="price-slider" id="price-slider" name="priceRange">
                            <span class="min-max"><spring:message code="hmc.from"/> ${priceMin} <spring:message
                                    code="hmc.to"/> ${priceMax}</span>
                                </div>
                            </div>
                        </c:if>

                        <hr>

                        <!-- brands -->
                        <c:if test="${!empty brandList}">
                            <div class="category-filter">
                                <h2><spring:message code="plywood.brand"/></h2>
                                <ul>
                                    <c:forEach items="${brandList}" var="brand">
                                        <li>
                                            <input class="le-checkbox" name="brand" type="checkbox" value="${brand.brand}"/>
                                            <label>${brand.brand} (${brand.num})</label>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:if>

                        <!-- types -->
                        <c:if test="${!empty typeList}">
                            <div class="category-filter">
                                <h2><spring:message code="plywood.type"/></h2>
                                <ul>
                                    <c:forEach items="${typeList}" var="type">
                                        <li>
                                            <input class="le-checkbox" name="type" type="checkbox" value="${type.type}"/>
                                            <label>${type.type} (${type.num})</label>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:if>

                        <!-- length slider -->
                        <c:if test="${!empty sliders}">
                            <div class="price-filter">
                                <h2><spring:message code="plywood.length"/></h2>
                                <c:set var="lengthMin" value="${sliders.iterator().next().lengthMin}"/>
                                <c:set var="lengthMax" value="${sliders.iterator().next().lengthMax}"/>
                                <div class="price-range-holder">
                                    <input type="text" class="price-slider" id="length-slider" name="lengthRange">
                            <span class="min-max"><spring:message code="hmc.from"/> ${lengthMin} <spring:message
                                    code="hmc.to"/> ${lengthMax}</span>
                                </div>
                            </div>
                        </c:if>

                        <!-- width slider -->
                        <c:if test="${!empty sliders}">
                            <div class="price-filter">
                                <h2><spring:message code="plywood.width"/></h2>
                                <c:set var="widthMin" value="${sliders.iterator().next().widthMin}"/>
                                <c:set var="widthMax" value="${sliders.iterator().next().widthMax}"/>
                                <div class="price-range-holder">
                                    <input type="text" class="price-slider" id="width-slider" name="widthRange">
                            <span class="min-max"><spring:message code="hmc.from"/> ${widthMin} <spring:message
                                    code="hmc.to"/> ${widthMax}</span>
                                </div>
                            </div>
                        </c:if>

                        <!-- thickness -->
                        <c:if test="${!empty thicknessList}">
                            <div class="category-filter">
                                <h2><spring:message code="plywood.thickness"/></h2>
                                <ul>
                                    <c:forEach items="${thicknessList}" var="thickness">
                                        <li>
                                            <input class="le-checkbox" name="thickness" type="checkbox" value="${thickness.thickness}"/>
                                            <label>${thickness.thickness} (${thickness.num})</label>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:if>

                        <!-- weight -->
                        <c:if test="${!empty sliders}">
                            <div class="price-filter">
                                <h2><spring:message code="plywood.weight"/></h2>
                                <c:set var="weightMin" value="${sliders.iterator().next().weightMin}"/>
                                <c:set var="weightMax" value="${sliders.iterator().next().weightMax}"/>
                                <div class="price-range-holder">
                                    <input type="text" class="price-slider" id="weight-slider" name="weightRange">
                            <span class="min-max"><spring:message code="hmc.from"/> ${weightMin} <spring:message
                                    code="hmc.to"/> ${weightMax}</span>
                                </div>
                            </div>
                        </c:if>

                        <div class="filter-button">
                            <a id="filterSubmit" onclick="submitFilter()"><spring:message code="hmc.filter"/></a>
                        </div>

                    </div>

                    <div class="reset-filter">
                        <a onclick="resetFilter()"><spring:message code="hmc.resetFilter"/></a>
                    </div>

                    <br><br>

                </div>
                <!-- ========================================= PRODUCT FILTER : END ========================================= -->
            </div>
            <!-- ========================================= SIDEBAR : END ========================================= -->

            <!-- ========================================= CONTENT ========================================= -->

            <div class="col-xs-12 col-sm-9 no-margin wide sidebar">
                <section class="carousel-holder">

                    <div class="title-nav">
                        <h2><spring:message code="common.plywood"/></h2>

                        <div class="nav-holder"></div>
                    </div>

                    <div class="grid-list-products">

                        <div class="control-bar">
                            <%--<div id="popularity-sort" class="le-select" >--%>
                            <%--<select data-placeholder="sort by popularity">--%>
                            <%--<option value="1"><spring:message code="hmc.withoutSorting"/></option>--%>
                            <%--<c:if test="${pageContext.request.userPrincipal.name != null}">--%>
                            <%--<option value="2"><spring:message code="hmc.priceHighToLow"/></option>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${pageContext.request.userPrincipal.name != null}">--%>
                            <%--<option value="3"><spring:message code="hmc.priceLowToHigh"/></option>--%>
                            <%--</c:if>--%>
                            <%--</select>--%>
                            <%--</div>--%>

                            <div id="item-count" class="le-select">
                                <select id="selectPerPage">
                                    <c:set var="perPageNums">3;9;18;36;72</c:set>
                                    <c:forTokens items="${perPageNums}" delims=";" var="perPage">
                                        <option value="${perPage}"
                                                <c:if test="${perPage == itemsPerPage}">selected</c:if>>${perPage}
                                            <spring:message code="hmc.perPage"/></option>
                                    </c:forTokens>
                                </select>
                            </div>

                            <div class="grid-list-buttons">
                                <ul>
                                    <li class="grid-list-button-item active">
                                        <a data-toggle="tab" href="#grid-view" onclick="sessionStorage.view = 'grid'">
                                            <i class="fa fa-th-large"></i> <spring:message code="hmc.grid"/>
                                        </a>
                                    </li>
                                    <li class="grid-list-button-item">
                                        <a data-toggle="tab" href="#list-view" onclick="sessionStorage.view = 'list'">
                                            <i class="fa fa-th-list"></i> <spring:message code="hmc.list"/>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.control-bar -->

                        <div class="tab-content">

                            <div id="grid-view" class="products-grid fade tab-pane in active">
                                <div class="product-grid-holder">
                                    <c:if test="${!empty priceList}">
                                        <div class="row no-margin">
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
                                    </c:if>
                                </div>
                            </div>

                            <div id="list-view" class="products-grid fade tab-pane">
                                <div class="products-list">
                                    <c:if test="${!empty priceList}">
                                        <c:forEach items="${priceList}" var="priceListItem" varStatus="loop">
                                            <c:set var="plywood" value="${priceListItem.priceListPK.plywood}"/>
                                            <c:set var="length" value="${priceListItem.priceListPK.length}" />
                                            <c:set var="width" value="${priceListItem.priceListPK.width}" />
                                            <c:set var="thickness" value="${priceListItem.priceListPK.thickness}" />
                                            <div class="item${loop.index + 1} product-item product-item-holder hidden">
                                                <div class="row">
                                                    <div class="no-margin col-xs-12 col-sm-4 image-holder">
                                                        <div class="image">
                                                            <img alt="Plywood - ${plywood.productId}"
                                                                 src="../resources/images/blank.gif"
                                                                 data-echo="../resources/images/products/${plywood.photo1}"/>
                                                            <span class="photo${plywood.productId} hidden">${plywood.photo1}</span>
                                                        </div>
                                                    </div>
                                                    <!-- /.image-holder -->
                                                    <div class="no-margin col-xs-12 col-sm-5 body-holder">
                                                        <div class="body">
                                                            <div class="title">
                                                                <a href="/plywood/${plywood.productId}/${length}/${width}/${thickness}">
                                                                    PLYWOOD ${plywood.brand}<br><span
                                                                        class="size${plywood.productId}">${length}X${width}X${thickness}</span>
                                                                </a>
                                                            </div>
                                                            <span class="brand">
                                                                <spring:message
                                                                        code="plywood.brand"/>: ${plywood.brand}
                                                            </span>
                                                            <span class="type">
                                                                <spring:message
                                                                        code="plywood.type"/>: ${plywood.brand}
                                                            </span>
                                                            <span class="weight">
                                                                <spring:message
                                                                        code="plywood.weight"/>: ${priceListItem.weight}
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <!-- /.body-holder -->
                                                    <div class="no-margin col-xs-12 col-sm-3 price-area">
                                                        <div class="right-clmn">
                                                            <div class="price-current"
                                                                 <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                                                                $<span class="price${plywood.productId}">${priceListItem.price}</span>
                                                            </div>
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
                                    <span class="compare${plywood.productId} btn-add-to-compare" data-toggle="popover"
                                          onclick="addToComparison('${plywood.productId}')"><spring:message
                                            code="common.addToComparison"/></span>
                                    <span class="compare${plywood.productId} btn-add-to-compare btn-green hidden"
                                          data-toggle="popover"
                                          onclick="removeFromComparison('${plywood.productId}')"><spring:message
                                            code="common.removeFromComparison"/></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>

                            <c:if test="${empty priceList}">
                                <div class="container-fluid">
                                    <div class="col-lg-10 center-block items-holder">
                                        <div class="inner-xs">
                                            <div class="page-header">
                                                <h2 class="page-title">
                                                    <spring:message code="hmc.noMachines"/>
                                                </h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${!empty priceList}">
                                <c:set var="itemsPerPage" value="${itemsPerPage}"/>
                                <c:set var="itemsNum" value="${itemsNum}"/>
                                <div class="pagination-holder">
                                    <div class="row">

                                        <div class="col-xs-6 text-left">
                                            <ul class="pagination">
                                                <c:forEach begin="1" end="${pagesNum}" var="i">
                                                    <li id="page${i}" onclick="showPageAndGoUp(${i});">${i}</li>
                                                </c:forEach>
                                            </ul>
                                        </div>

                                        <div class="col-xs-6">
                                            <div class="result-counter">
                                                <spring:message code="hmc.showing"/> <span id="showFromTo"></span> <spring:message
                                                    code="hmc.of"/> <span id="of"></span> <spring:message code="hmc.results"/>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- /.pagination-holder -->
                            </c:if>
                        </div>
                        <!-- /.tab-content -->
                    </div>
                    <!-- /.grid-list-products -->
                </section>
                <!-- /#hmc -->
            </div>
            <!-- /.col -->
            <!-- ========================================= CONTENT : END ========================================= -->

        </div>
        <!-- /.container -->
    </section>


    <!-- /#category-grid -->
    <%@include file="common/insertions/footer.jsp" %>
</div>
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
<script type="text/javascript">
    var checkboxesNames = ['brand', 'type', 'thickness'];

    var slidersNames = ['length', 'width', 'weight', 'price'];

    var specificSlidersNames = ['length', 'width'];

    // step for slider
    var specificSliders = {
        'length': 10,
        'width': 10
    };

    var commonStep = 1;
</script>
<script src="../resources/js/filters.jsp"></script>
<script type="text/javascript">
    // global variables, will be used in file 'filters'
    var slidersDefaultRange = {
        'length': ['${lengthMin}', '${lengthMax}'],
        'width': ['${widthMin}', '${widthMax}'],
        'weight': ['${weightMin}', '${weightMax}'],
        'price': ['${priceMin}', '${priceMax}']
    };

    var itemsNum = '${itemsNum}';

    $(document).ready(function () {
        if (sessionStorage.view == null || sessionStorage.view == "") {
            sessionStorage.view = 'grid';
        } else if (sessionStorage.view == 'list') {
            $('.grid-list-button-item:nth-child(2) a').tab('show')
        }

        if (sessionStorage.page == null || sessionStorage.page == "") {
            sessionStorage.page = '1';
        }

        if (sessionStorage.perPageUrl == null || sessionStorage.perPageUrl == "") {
            sessionStorage.perPageUrl = 'perPage=${itemsPerPage}';
        }

        $('#selectPerPage').change(function () {
            sessionStorage.perPageUrl = 'perPage=' + $(this).val().toString();
            goToPlywood();
        });
    });
</script>
<script src="../resources/js/pagination.jsp"></script>
</body>
</html>