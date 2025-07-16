<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Phương Anh Store</title>

        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/images/icons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assets/images/icons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/images/icons/favicon-16x16.png">
        <link rel="manifest" href="${pageContext.request.contextPath}/assets/images/icons/site.html">
        <link rel="mask-icon" href="${pageContext.request.contextPath}/assets/images/icons/safari-pinned-tab.svg" color="#666666">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.ico">
        <meta name="apple-mobile-web-app-title" content="Molla">
        <meta name="application-name" content="Molla">
        <meta name="msapplication-TileColor" content="#cc9966">
        <meta name="msapplication-config" content="${pageContext.request.contextPath}/assets/images/icons/browserconfig.xml">
        <meta name="theme-color" content="#ffffff">
        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/magnific-popup/magnific-popup.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/nouislider/nouislider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/skins/skin-demo-13.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demos/demo-13.css">
        <!-- Vietnam -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Agbalumo&display=swap" rel="stylesheet">
    </head>

    <body>
        <div class="page-wrapper">
            <%@ include file="/assets/components/header.jsp" %>

            <main class="main">
                <nav aria-label="breadcrumb" class="breadcrumb-nav mb-3">
                    <div class="container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Trang Chủ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Tất Cả Sản Phẩm</li>
                        </ol>
                    </div><!-- End .container -->
                </nav><!-- End .breadcrumb-nav -->

                <div class="page-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9 col-xl-4-5col">


                                <div class="mb-3"></div><!-- End .mb-3 -->

                                <div class="owl-carousel owl-simple owl-nav-align" data-toggle="owl" 
                                     data-owl-options='{
                                     "nav": false, 
                                     "dots": true,
                                     "margin": 30,
                                     "loop": false,
                                     "responsive": {
                                     "0": {
                                     "items":2
                                     },
                                     "420": {
                                     "items":3
                                     },
                                     "600": {
                                     "items":4
                                     },
                                     "900": {
                                     "items":5
                                     },
                                     "1024": {
                                     "items":6,
                                     "nav": true, 
                                     "dots": false
                                     }
                                     }
                                     }'>
                                    <a href="#" class="brand">
                                        <img src="${pageContext.request.contextPath}/assets/images/brands/baseus-logo.png" alt="Baseus Logo">
                                    </a>

                                    <a href="#" class="brand">
                                        <img src="${pageContext.request.contextPath}/assets/images/brands/anker-logo.png" alt="Anker Logo">
                                    </a>

                                    <a href="#" class="brand">
                                        <img src="${pageContext.request.contextPath}/assets/images/brands/remax-logo.png" alt="Remax Logo">
                                    </a>

                                    <a href="#" class="brand">
                                        <img src="${pageContext.request.contextPath}/assets/images/brands/wiwu-logo.png" alt="Wiwu Logo">
                                    </a>

                                    <a href="#" class="brand">
                                        <img src="${pageContext.request.contextPath}/assets/images/brands/hoco-logo.png" alt="Hoco Logo">
                                    </a>


                                </div><!-- End .owl-carousel -->

                                <div class="mb-3 mb-lg-5"></div><!-- End .mb-3 mb-lg-5 -->

                                <div class="cat-blocks-container">
                                    <div class="row">
                                        <div class="col-6 col-md-4 col-lg-3">
                                            <a href="category.html" class="cat-block">
                                                <figure>
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/1.png" alt="Category image">
                                                    </span>
                                                </figure>
                                                <h3 class="cat-block-title">Phụ Kiện Máy Tính</h3><!-- End .cat-block-title -->
                                            </a>
                                        </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                        <div class="col-6 col-md-4 col-lg-3">
                                            <a href="category.html" class="cat-block">
                                                <figure>
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/cu-sac.png" alt="Category image">
                                                    </span>
                                                </figure>

                                                <h3 class="cat-block-title">Phụ Kiện Sạc</h3><!-- End .cat-block-title -->
                                            </a>
                                        </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                        <div class="col-6 col-md-4 col-lg-3">
                                            <a href="category.html" class="cat-block">
                                                <figure>
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/5.png" alt="Category image">
                                                    </span>
                                                </figure>

                                                <h3 class="cat-block-title">Thiết Bị Âm Thanh</h3><!-- End .cat-block-title -->
                                            </a>
                                        </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                        <div class="col-6 col-md-4 col-lg-3">
                                            <a href="category.html" class="cat-block">
                                                <figure>
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/thiet-bi-mang.png" alt="Category image">
                                                    </span>
                                                </figure>

                                                <h3 class="cat-block-title">Thiết Bị Mạng</h3><!-- End .cat-block-title -->
                                            </a>
                                        </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                        <div class="col-6 col-md-4 col-lg-3">
                                            <a href="category.html" class="cat-block">
                                                <figure>
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/o-cung.png" alt="Category image">
                                                    </span>
                                                </figure>

                                                <h3 class="cat-block-title">Thiết Bị Chuyển Đổi - Lưu Trữ</h3><!-- End .cat-block-title -->
                                            </a>
                                        </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                        <div class="col-6 col-md-4 col-lg-3">
                                            <a href="category.html" class="cat-block">
                                                <figure>
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/phu-kien-choi-game.png" alt="Category image">
                                                    </span>
                                                </figure>

                                                <h3 class="cat-block-title">Phụ Kiện Chơi Game</h3><!-- End .cat-block-title -->
                                            </a>
                                        </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                        <div class="col-6 col-md-4 col-lg-3">
                                            <a href="category.html" class="cat-block">
                                                <figure>
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/cuong-luc.png" alt="Category image">
                                                    </span>
                                                </figure>

                                                <h3 class="cat-block-title">Ốp Lưng - Cường Lực</h3><!-- End .cat-block-title -->
                                            </a>
                                        </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                        <div class="col-6 col-md-4 col-lg-3">
                                            <a href="category.html" class="cat-block">
                                                <figure>
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/phu-kien-oto-xe-may.png" alt="Category image">
                                                    </span>
                                                </figure>

                                                <h3 class="cat-block-title">Phụ Kiện Ôtô Xe Máy</h3><!-- End .cat-block-title -->
                                            </a>
                                        </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                        <div class="col-6 col-md-4 col-lg-3">
                                            <a href="category.html" class="cat-block">
                                                <figure>
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/2.png" alt="Category image">
                                                    </span>
                                                </figure>

                                                <h3 class="cat-block-title">Phụ Kiện Livestream - Chụp Ảnh</h3><!-- End .cat-block-title -->
                                            </a>
                                        </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                        <div class="col-6 col-md-4 col-lg-3">
                                            <a href="category.html" class="cat-block">
                                                <figure>
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/phu-kien-khac.png" alt="Category image">
                                                    </span>
                                                </figure>

                                                <h3 class="cat-block-title">Phụ Kiện Khác</h3><!-- End .cat-block-title -->
                                            </a>
                                        </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                    </div><!-- End .row -->
                                </div><!-- End .cat-blocks-container -->

                                <div class="mb-2"></div><!-- End .mb-2 -->

                                <h2 class="title title-border">Tất Cả Sản Phẩm</h2><!-- End .title -->
                                <div class="toolbox">
                                    <div class="toolbox-left">
                                        <div class="toolbox-info">
                                            ${productCount} sản phẩm được tìm thấy
                                        </div><!-- End .toolbox-info -->
                                    </div><!-- End .toolbox-left -->

                                    <div class="toolbox-right">
                                        <div class="toolbox-sort">
                                            <label for="sortby">Sắp xếp theo:</label>
                                            <div class="select-custom">
                                                <select name="sortby" id="sortby" class="form-control">
                                                    <option value="popularity" selected="selected">Giá cao-thấp</option>
                                                    <option value="rating">Giá thấp-cao</option>
                                                </select>
                                            </div>
                                        </div><!-- End .toolbox-sort -->
                                    </div><!-- End .toolbox-right -->
                                </div><!-- End .toolbox -->

                                <div class="products mb-3">
                                    <div class="row">
                                        <c:forEach var="p" items="${allProducts}">
                                            <div class="col-6 col-md-4 col-xl-3">
                                                <div class="product">
                                                    <figure class="product-media">
                                                        <a href="product.html">
                                                            <c:set var="firstImage" value="${fn:split(p.image, ',')[0]}" />
                                                            <img src="${pageContext.request.contextPath}/Images/${p.category.categoryName}/${p.categoryType.categoryTypeName}/${firstImage}" 
                                                                 alt="Ảnh" class="product-img" /></td>
                                                        </a>
                                                        <div class="product-action">
                                                            <a href="#" class="btn-product btn-cart" title="Add to cart"><span>Thêm Vào Giỏ</span></a>
                                                        </div><!-- End .product-action -->
                                                    </figure><!-- End .product-media -->

                                                    <div class="product-body">
                                                        <div class="product-cat">
                                                            <a href="#">${p.getType()}</a>
                                                        </div><!-- End .product-cat -->
                                                        <h3 class="product-title"><a href="product-detail?id=${p.productId}">${p.name}</a></h3><!-- End .product-title -->
                                                        <div class="product-price">
                                                            ${p.formattedPrice}₫
                                                        </div>                                                     
                                                    </div><!-- End .product-body -->
                                                </div><!-- End .product -->
                                            </div><!-- End .col-sm-6 col-md-4 col-xl-3 -->
                                        </c:forEach>
                                    </div><!-- End .row -->
                                </div><!-- End .products -->

                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <!-- Nút Previous -->
                                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                            <a class="page-link page-link-prev" href="?page=${currentPage - 1}" aria-label="Previous" tabindex="-1">
                                                <span aria-hidden="true"><i class="icon-long-arrow-left"></i></span>Prev
                                            </a>
                                        </li>

                                        <!-- Vòng lặp các trang -->
                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                            <c:choose>
                                                <c:when test="${i == currentPage}">
                                                    <li class="page-item active">
                                                        <a class="page-link" href="?page=${i}">${i}</a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item">
                                                        <a class="page-link" href="?page=${i}">${i}</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                        <!-- Tổng số trang -->
                                        <li class="page-item-total">of ${totalPages}</li>

                                        <!-- Nút Next -->
                                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                            <a class="page-link page-link-next" href="?page=${currentPage + 1}" aria-label="Next">
                                                Next <span aria-hidden="true"><i class="icon-long-arrow-right"></i></span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>


                            </div><!-- End .col-lg-9 -->

                            <aside class="col-lg-3 col-xl-5col order-lg-first">
                                <div class="sidebar sidebar-shop">
                                    <div class="widget widget-categories">
                                        <h3 class="widget-title">Danh Mục Sản Phẩm</h3><!-- End .widget-title -->

                                        <div class="widget-body">
                                            <div class="accordion" id="widget-cat-acc">
                                                <div class="acc-item">
                                                    <h5>
                                                        <a role="button" data-toggle="collapse" href="#collapse-1" aria-expanded="true" aria-controls="collapse-1">
                                                            Phụ Kiện Máy Tính
                                                        </a>
                                                    </h5>
                                                    <div id="collapse-1" class="collapse show" data-parent="#widget-cat-acc">
                                                        <div class="collapse-wrap">
                                                            <ul>
                                                                <li><a href="#">Bàn Phím</a></li>
                                                                <li><a href="#">Chuột</a></li>
                                                                <li><a href="#">Bộ Sạc Laptop</a></li>
                                                                <li><a href="#">Quạt Tản Nhiệt - Giá Đỡ</a></li>
                                                                <li><a href="#">Khác</a></li>
                                                                <li><a href="#">Tất Cả</a></li>

                                                            </ul>
                                                        </div><!-- End .collapse-wrap -->
                                                    </div><!-- End .collapse -->
                                                </div><!-- End .acc-item -->

                                                <div class="acc-item">
                                                    <h5>
                                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-2" aria-expanded="false" aria-controls="collapse-2">
                                                            Phụ Kiện Sạc
                                                        </a>
                                                    </h5>
                                                    <div id="collapse-2" class="collapse" data-parent="#widget-cat-acc">
                                                        <div class="collapse-wrap">
                                                            <ul>
                                                                <li><a href="#">Bộ Sạc</a></li>
                                                                <li><a href="#">Củ Sạc</a></li>
                                                                <li><a href="#">Cáp Sạc</a></li>
                                                                <li><a href="#">Adapter</a></li>
                                                                <li><a href="#">Sạc Dự Phòng</a></li>
                                                                <li><a href="#">Ổ Điện</a></li>
                                                                <li><a href="#">Tất Cả</a></li>

                                                            </ul>
                                                        </div><!-- End .collapse-wrap -->
                                                    </div><!-- End .collapse -->
                                                </div><!-- End .acc-item -->

                                                <div class="acc-item">
                                                    <h5>
                                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-3" aria-expanded="false" aria-controls="collapse-3">
                                                            Thiết Bị Âm Thanh
                                                        </a>
                                                    </h5>
                                                    <div id="collapse-3" class="collapse" data-parent="#widget-cat-acc">
                                                        <div class="collapse-wrap">
                                                            <ul>
                                                                <li><a href="#">Loa Không Dây</a></li>
                                                                <li><a href="#">Tai Nghe Có Dây</a></li>
                                                                <li><a href="#">Tai Nghe Không Dây</a></li>
                                                                <li><a href="#">Loa Vi Tính</a></li>
                                                                <li><a href="#">Loa Karaoke</a></li>
                                                                <li><a href="#">Mic Thu Âm - Karaoke</a></li>
                                                                <li><a href="#">Tất Cả</a></li>

                                                            </ul>
                                                        </div><!-- End .collapse-wrap -->
                                                    </div><!-- End .collapse -->
                                                </div><!-- End .acc-item -->

                                                <div class="acc-item">
                                                    <h5>
                                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-4" aria-expanded="false" aria-controls="collapse-4">
                                                            Thiết Bị Mạng
                                                        </a>
                                                    </h5>
                                                    <div id="collapse-4" class="collapse" data-parent="#widget-cat-acc">
                                                        <div class="collapse-wrap">
                                                            <ul>
                                                                <li><a href="#">Bộ Kích Wifi</a></li>
                                                                <li><a href="#">Router</a></li>
                                                                <li><a href="#">USB Wifi</a></li>
                                                                <li><a href="#">Tất Cả</a></li>

                                                            </ul>
                                                        </div><!-- End .collapse-wrap -->
                                                    </div><!-- End .collapse -->
                                                </div><!-- End .acc-item -->

                                                <div class="acc-item">
                                                    <h5>
                                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-5" aria-expanded="false" aria-controls="collapse-5">
                                                            Phụ Kiện Ô tô - Xe Máy
                                                        </a>
                                                    </h5>
                                                    <div id="collapse-5" class="collapse" data-parent="#widget-cat-acc">
                                                        <div class="collapse-wrap">
                                                            <ul>
                                                                <li><a href="#">Giá Đỡ Ô Tô</a></li>
                                                                <li><a href="#">Giá Đỡ Xe Máy</a></li>
                                                                <li><a href="#">Tất Cả</a></li>

                                                            </ul>
                                                        </div><!-- End .collapse-wrap -->
                                                    </div><!-- End .collapse -->
                                                </div><!-- End .acc-item -->

                                                <div class="acc-item">
                                                    <h5>
                                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-6" aria-expanded="false" aria-controls="collapse-6">
                                                            Thiết Bị Chuyển Đổi - Lưu Trữ
                                                        </a>
                                                    </h5>
                                                    <div id="collapse-6" class="collapse" data-parent="#widget-cat-acc">
                                                        <div class="collapse-wrap">
                                                            <ul>
                                                                <li><a href="#">Cáp Chuyển Đổi</a></li>
                                                                <li><a href="#">HUB - Bộ Chuyển Đổi</a></li>
                                                                <li><a href="#">Cáp Nối Dài</a></li>
                                                                <li><a href="#">Đầu Đọc Thẻ</a></li>
                                                                <li><a href="#">OTG</a></li>
                                                                <li><a href="#">USB</a></li>
                                                                <li><a href="#">Ổ Cứng</a></li>
                                                                <li><a href="#">Thẻ Nhớ</a></li>
                                                                <li><a href="#">Khác</a></li>
                                                                <li><a href="#">Tất Cả</a></li>

                                                            </ul>
                                                        </div><!-- End .collapse-wrap -->
                                                    </div><!-- End .collapse -->
                                                </div><!-- End .acc-item -->

                                                <div class="acc-item">
                                                    <h5>
                                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-7" aria-expanded="false" aria-controls="collapse-7">
                                                            Phụ Kiện Livestream - Chụp Ảnh
                                                        </a>
                                                    </h5>
                                                    <div id="collapse-7" class="collapse" data-parent="#widget-cat-acc">
                                                        <div class="collapse-wrap">
                                                            <ul>
                                                                <li><a href="#">Đèn Livestream</a></li>
                                                                <li><a href="#">Tripod - Gậy Selfie</a></li>
                                                                <li><a href="#">Khác</a></li>
                                                                <li><a href="#">Tất Cả</a></li>

                                                            </ul>
                                                        </div><!-- End .collapse-wrap -->
                                                    </div><!-- End .collapse -->
                                                </div><!-- End .acc-item -->

                                                <div class="acc-item">
                                                    <h5>
                                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-8" aria-expanded="false" aria-controls="collapse-8">
                                                            Phụ Kiện Chơi Game
                                                        </a>
                                                    </h5>
                                                    <%-- <div id="collapse-3" class="collapse" data-parent="#widget-cat-acc">
                                                        <div class="collapse-wrap">
                                                            <ul>
                                                                <li><a href="#">Cáp Chuyển Đổi</a></li>
                                                                <li><a href="#">HUB - Bộ Chuyển Đổi</a></li>
                                                                <li><a href="#">Cáp Nối Dài</a></li>
                                                                <li><a href="#">Đầu Đọc Thẻ</a></li>
                                                                <li><a href="#">OTG</a></li>
                                                                <li><a href="#">USB</a></li>
                                                                <li><a href="#">Ổ Cứng</a></li>
                                                                <li><a href="#">Thẻ Nhớ</a></li>
                                                                <li><a href="#">Khác</a></li>
                                                            </ul>
                                                        </div><!-- End .collapse-wrap -->
                                                    </div><!-- End .collapse --> --%>
                                                </div><!-- End .acc-item -->

                                                <div class="acc-item">
                                                    <h5>
                                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-9" aria-expanded="false" aria-controls="collapse-9">
                                                            Ốp Lưng - Cường Lực
                                                        </a>
                                                    </h5>
                                                    <div id="collapse-9" class="collapse" data-parent="#widget-cat-acc">
                                                        <div class="collapse-wrap">
                                                            <ul>
                                                                <li><a href="#">Ốp Lưng Điện Thoại</a></li>
                                                                <li><a href="#">Ốp Lưng Ipad - Tablet</a></li>
                                                                <li><a href="#">Cường Lực Điện Thoại</a></li>
                                                                <li><a href="#">Cường Lực Ipad - Tablet</a></li>
                                                                <li><a href="#">Case Airpod</a></li>
                                                                <li><a href="#">PPF - Nano</a></li>
                                                                <li><a href="#">Bảo Vệ Camera</a></li>
                                                                <li><a href="#">Khác</a></li>
                                                                <li><a href="#">Tất Cả</a></li>

                                                            </ul>
                                                        </div><!-- End .collapse-wrap -->
                                                    </div><!-- End .collapse -->
                                                </div><!-- End .acc-item -->

                                                <div class="acc-item">
                                                    <h5>
                                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-10" aria-expanded="false" aria-controls="collapse-10">
                                                            Phụ Kiện Khác
                                                        </a>
                                                    </h5>
                                                    <%-- <div id="collapse-3" class="collapse" data-parent="#widget-cat-acc">
                                                        <div class="collapse-wrap">
                                                            <ul>
                                                                <li><a href="#">Ốp Lưng Điện Thoại</a></li>
                                                                <li><a href="#">Ốp Lưng Ipad - Tablet</a></li>
                                                                <li><a href="#">Cường Lực Điện Thoại</a></li>
                                                                <li><a href="#">Cường Lực Ipad - Tablet</a></li>
                                                                <li><a href="#">Case Airpod</a></li>
                                                                <li><a href="#">PPF - Nano</a></li>
                                                                <li><a href="#">Bảo Vệ Camera</a></li>
                                                                <li><a href="#">Khác</a></li>
                                                            </ul>
                                                        </div><!-- End .collapse-wrap -->
                                                    </div><!-- End .collapse --> --%>
                                                </div><!-- End .acc-item -->


                                            </div><!-- End .accordion -->
                                        </div><!-- End .widget-body -->
                                    </div><!-- End .widget -->

                                    <div class="widget">
                                        <h3 class="widget-title">Lọc Theo Hãng</h3><!-- End .widget-title -->

                                        <div class="widget-body">
                                            <div class="filter-items">
                                                <div class="filter-item">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="brand-1">
                                                        <label class="custom-control-label" for="brand-1">Baseus</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .filter-item -->

                                                <div class="filter-item">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="brand-2">
                                                        <label class="custom-control-label" for="brand-2">Anker</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .filter-item -->

                                                <div class="filter-item">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="brand-3">
                                                        <label class="custom-control-label" for="brand-3">Hoco</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .filter-item -->

                                                <div class="filter-item">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="brand-4">
                                                        <label class="custom-control-label" for="brand-4">Remax</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .filter-item -->

                                                <div class="filter-item">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="brand-5">
                                                        <label class="custom-control-label" for="brand-5">Robot</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .filter-item -->

                                                <div class="filter-item">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="brand-6">
                                                        <label class="custom-control-label" for="brand-6">Wiwu</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .filter-item -->

                                                <div class="filter-item">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="brand-7">
                                                        <label class="custom-control-label" for="brand-7">Các hãng khác</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .filter-item -->

                                            </div><!-- End .filter-items -->
                                        </div><!-- End .widget-body -->
                                    </div><!-- End .widget -->

                                    <div class="widget">
                                        <h3 class="widget-title">Lọc Theo Giá</h3><!-- End .widget-title -->

                                        <div class="widget-body">
                                            <div class="filter-items">
                                                <div class="filter-item">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="price-1" name="filter-price">
                                                        <label class="custom-control-label" for="price-1">Dưới 100.00VNĐ</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .filter-item -->

                                                <div class="filter-item">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="price-2" name="filter-price">
                                                        <label class="custom-control-label" for="price-2">100.000VNĐ - 200.000VNĐ</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .filter-item -->

                                                <div class="filter-item">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="price-3" name="filter-price">
                                                        <label class="custom-control-label" for="price-3">200.000VNĐ - 500.000VNĐ</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .filter-item -->
                                                <div class="filter-item">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="price-5" name="filter-price">
                                                        <label class="custom-control-label" for="price-5">Trên 500.000VNĐ</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .filter-item -->
                                            </div><!-- End .filter-items -->
                                        </div><!-- End .widget-body -->
                                    </div><!-- End .widget -->


                                    <div class="widget widget-banner-sidebar">
                                        <div class="banner-sidebar-title">PhuongAnhStore Logo</div><!-- End .ad-title -->

                                        <div class="banner-sidebar banner-overlay">
                                            <a href="#">
                                                <img src="${pageContext.request.contextPath}/assets/images/logo/main-logo.jpg" alt="banner">
                                            </a>
                                        </div><!-- End .banner-ad -->
                                    </div><!-- End .widget -->
                                </div><!-- End .sidebar sidebar-shop -->
                            </aside><!-- End .col-lg-3 -->
                        </div><!-- End .row -->
                    </div><!-- End .container -->
                </div><!-- End .page-content -->
            </main><!-- End .main -->
            <%@ include file="/assets/components/footer.jsp" %>

        </div><!-- End .page-wrapper -->
        <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

        <!-- Mobile Menu -->
        <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

        <div class="mobile-menu-container mobile-menu-light">
            <div class="mobile-menu-wrapper">
                <span class="mobile-menu-close"><i class="icon-close"></i></span>

                <form action="#" method="get" class="mobile-search">
                    <label for="mobile-search" class="sr-only">Search</label>
                    <input type="search" class="form-control" name="mobile-search" id="mobile-search" placeholder="Search in..." required>
                    <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
                </form>

                <ul class="nav nav-pills-mobile nav-border-anim" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="mobile-menu-link" data-toggle="tab" href="#mobile-menu-tab" role="tab" aria-controls="mobile-menu-tab" aria-selected="true">Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="mobile-cats-link" data-toggle="tab" href="#mobile-cats-tab" role="tab" aria-controls="mobile-cats-tab" aria-selected="false">Categories</a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade show active" id="mobile-menu-tab" role="tabpanel" aria-labelledby="mobile-menu-link">
                        <nav class="mobile-nav">
                            <ul class="mobile-menu">
                                <li class="active">
                                    <a href="index.html">Home</a>

                                    <ul>
                                        <li><a href="index-1.html">01 - furniture store</a></li>
                                        <li><a href="index-2.html">02 - furniture store</a></li>
                                        <li><a href="index-3.html">03 - electronic store</a></li>
                                        <li><a href="index-4.html">04 - electronic store</a></li>
                                        <li><a href="index-5.html">05 - fashion store</a></li>
                                        <li><a href="index-6.html">06 - fashion store</a></li>
                                        <li><a href="index-7.html">07 - fashion store</a></li>
                                        <li><a href="index-8.html">08 - fashion store</a></li>
                                        <li><a href="index-9.html">09 - fashion store</a></li>
                                        <li><a href="index-10.html">10 - shoes store</a></li>
                                        <li><a href="index-11.html">11 - furniture simple store</a></li>
                                        <li><a href="index-12.html">12 - fashion simple store</a></li>
                                        <li><a href="index-13.html">13 - market</a></li>
                                        <li><a href="index-14.html">14 - market fullwidth</a></li>
                                        <li><a href="index-15.html">15 - lookbook 1</a></li>
                                        <li><a href="index-16.html">16 - lookbook 2</a></li>
                                        <li><a href="index-17.html">17 - fashion store</a></li>
                                        <li><a href="index-18.html">18 - fashion store (with sidebar)</a></li>
                                        <li><a href="index-19.html">19 - games store</a></li>
                                        <li><a href="index-20.html">20 - book store</a></li>
                                        <li><a href="index-21.html">21 - sport store</a></li>
                                        <li><a href="index-22.html">22 - tools store</a></li>
                                        <li><a href="index-23.html">23 - fashion left navigation store</a></li>
                                        <li><a href="index-24.html">24 - extreme sport store</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="category.html">Shop</a>
                                    <ul>
                                        <li><a href="category-list.html">Shop List</a></li>
                                        <li><a href="category-2cols.html">Shop Grid 2 Columns</a></li>
                                        <li><a href="category.html">Shop Grid 3 Columns</a></li>
                                        <li><a href="category-4cols.html">Shop Grid 4 Columns</a></li>
                                        <li><a href="category-boxed.html"><span>Shop Boxed No Sidebar<span class="tip tip-hot">Hot</span></span></a></li>
                                        <li><a href="category-fullwidth.html">Shop Fullwidth No Sidebar</a></li>
                                        <li><a href="product-category-boxed.html">Product Category Boxed</a></li>
                                        <li><a href="product-category-fullwidth.html"><span>Product Category Fullwidth<span class="tip tip-new">New</span></span></a></li>
                                        <li><a href="cart.html">Cart</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                        <li><a href="wishlist.html">Wishlist</a></li>
                                        <li><a href="#">Lookbook</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="product.html" class="sf-with-ul">Product</a>
                                    <ul>
                                        <li><a href="product.html">Default</a></li>
                                        <li><a href="product-centered.html">Centered</a></li>
                                        <li><a href="product-extended.html"><span>Extended Info<span class="tip tip-new">New</span></span></a></li>
                                        <li><a href="product-gallery.html">Gallery</a></li>
                                        <li><a href="product-sticky.html">Sticky Info</a></li>
                                        <li><a href="product-sidebar.html">Boxed With Sidebar</a></li>
                                        <li><a href="product-fullwidth.html">Full Width</a></li>
                                        <li><a href="product-masonry.html">Masonry Sticky Info</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">Pages</a>
                                    <ul>
                                        <li>
                                            <a href="about.html">About</a>

                                            <ul>
                                                <li><a href="about.html">About 01</a></li>
                                                <li><a href="about-2.html">About 02</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="contact.html">Contact</a>

                                            <ul>
                                                <li><a href="contact.html">Contact 01</a></li>
                                                <li><a href="contact-2.html">Contact 02</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="login.html">Login</a></li>
                                        <li><a href="faq.html">FAQs</a></li>
                                        <li><a href="404.html">Error 404</a></li>
                                        <li><a href="coming-soon.html">Coming Soon</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="blog.html">Blog</a>

                                    <ul>
                                        <li><a href="blog.html">Classic</a></li>
                                        <li><a href="blog-listing.html">Listing</a></li>
                                        <li>
                                            <a href="#">Grid</a>
                                            <ul>
                                                <li><a href="blog-grid-2cols.html">Grid 2 columns</a></li>
                                                <li><a href="blog-grid-3cols.html">Grid 3 columns</a></li>
                                                <li><a href="blog-grid-4cols.html">Grid 4 columns</a></li>
                                                <li><a href="blog-grid-sidebar.html">Grid sidebar</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#">Masonry</a>
                                            <ul>
                                                <li><a href="blog-masonry-2cols.html">Masonry 2 columns</a></li>
                                                <li><a href="blog-masonry-3cols.html">Masonry 3 columns</a></li>
                                                <li><a href="blog-masonry-4cols.html">Masonry 4 columns</a></li>
                                                <li><a href="blog-masonry-sidebar.html">Masonry sidebar</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#">Mask</a>
                                            <ul>
                                                <li><a href="blog-mask-grid.html">Blog mask grid</a></li>
                                                <li><a href="blog-mask-masonry.html">Blog mask masonry</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#">Single Post</a>
                                            <ul>
                                                <li><a href="single.html">Default with sidebar</a></li>
                                                <li><a href="single-fullwidth.html">Fullwidth no sidebar</a></li>
                                                <li><a href="single-fullwidth-sidebar.html">Fullwidth with sidebar</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="elements-list.html">Elements</a>
                                    <ul>
                                        <li><a href="elements-products.html">Products</a></li>
                                        <li><a href="elements-typography.html">Typography</a></li>
                                        <li><a href="elements-titles.html">Titles</a></li>
                                        <li><a href="elements-banners.html">Banners</a></li>
                                        <li><a href="elements-product-category.html">Product Category</a></li>
                                        <li><a href="elements-video-banners.html">Video Banners</a></li>
                                        <li><a href="elements-buttons.html">Buttons</a></li>
                                        <li><a href="elements-accordions.html">Accordions</a></li>
                                        <li><a href="elements-tabs.html">Tabs</a></li>
                                        <li><a href="elements-testimonials.html">Testimonials</a></li>
                                        <li><a href="elements-blog-posts.html">Blog Posts</a></li>
                                        <li><a href="elements-portfolio.html">Portfolio</a></li>
                                        <li><a href="elements-cta.html">Call to Action</a></li>
                                        <li><a href="elements-icon-boxes.html">Icon Boxes</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav><!-- End .mobile-nav -->
                    </div><!-- .End .tab-pane -->
                    <div class="tab-pane fade" id="mobile-cats-tab" role="tabpanel" aria-labelledby="mobile-cats-link">
                        <nav class="mobile-cats-nav">
                            <ul class="mobile-cats-menu">
                                <li><a class="mobile-cats-lead" href="#">Daily offers</a></li>
                                <li><a class="mobile-cats-lead" href="#">Gift Ideas</a></li>
                                <li><a href="#">Beds</a></li>
                                <li><a href="#">Lighting</a></li>
                                <li><a href="#">Sofas & Sleeper sofas</a></li>
                                <li><a href="#">Storage</a></li>
                                <li><a href="#">Armchairs & Chaises</a></li>
                                <li><a href="#">Decoration </a></li>
                                <li><a href="#">Kitchen Cabinets</a></li>
                                <li><a href="#">Coffee & Tables</a></li>
                                <li><a href="#">Outdoor Furniture </a></li>
                            </ul><!-- End .mobile-cats-menu -->
                        </nav><!-- End .mobile-cats-nav -->
                    </div><!-- .End .tab-pane -->
                </div><!-- End .tab-content -->

                <div class="social-icons">
                    <a href="#" class="social-icon" target="_blank" title="Facebook"><i class="icon-facebook-f"></i></a>
                    <a href="#" class="social-icon" target="_blank" title="Twitter"><i class="icon-twitter"></i></a>
                    <a href="#" class="social-icon" target="_blank" title="Instagram"><i class="icon-instagram"></i></a>
                    <a href="#" class="social-icon" target="_blank" title="Youtube"><i class="icon-youtube"></i></a>
                </div><!-- End .social-icons -->
            </div><!-- End .mobile-menu-wrapper -->
        </div><!-- End .mobile-menu-container -->

        <!-- Sign in / Register Modal -->
        <div class="modal fade" id="signin-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><i class="icon-close"></i></span>
                        </button>

                        <div class="form-box">
                            <div class="form-tab">
                                <ul class="nav nav-pills nav-fill nav-border-anim" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="signin-tab" data-toggle="tab" href="#signin" role="tab" aria-controls="signin" aria-selected="true">Sign In</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="register-tab" data-toggle="tab" href="#register" role="tab" aria-controls="register" aria-selected="false">Register</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="tab-content-5">
                                    <div class="tab-pane fade show active" id="signin" role="tabpanel" aria-labelledby="signin-tab">
                                        <form action="#">
                                            <div class="form-group">
                                                <label for="singin-email">Username or email address *</label>
                                                <input type="text" class="form-control" id="singin-email" name="singin-email" required>
                                            </div><!-- End .form-group -->

                                            <div class="form-group">
                                                <label for="singin-password">Password *</label>
                                                <input type="password" class="form-control" id="singin-password" name="singin-password" required>
                                            </div><!-- End .form-group -->

                                            <div class="form-footer">
                                                <button type="submit" class="btn btn-outline-primary-2">
                                                    <span>LOG IN</span>
                                                    <i class="icon-long-arrow-right"></i>
                                                </button>

                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="signin-remember">
                                                    <label class="custom-control-label" for="signin-remember">Remember Me</label>
                                                </div><!-- End .custom-checkbox -->

                                                <a href="#" class="forgot-link">Forgot Your Password?</a>
                                            </div><!-- End .form-footer -->
                                        </form>
                                        <div class="form-choice">
                                            <p class="text-center">or sign in with</p>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <a href="#" class="btn btn-login btn-g">
                                                        <i class="icon-google"></i>
                                                        Login With Google
                                                    </a>
                                                </div><!-- End .col-6 -->
                                                <div class="col-sm-6">
                                                    <a href="#" class="btn btn-login btn-f">
                                                        <i class="icon-facebook-f"></i>
                                                        Login With Facebook
                                                    </a>
                                                </div><!-- End .col-6 -->
                                            </div><!-- End .row -->
                                        </div><!-- End .form-choice -->
                                    </div><!-- .End .tab-pane -->
                                    <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                                        <form action="#">
                                            <div class="form-group">
                                                <label for="register-email">Your email address *</label>
                                                <input type="email" class="form-control" id="register-email" name="register-email" required>
                                            </div><!-- End .form-group -->

                                            <div class="form-group">
                                                <label for="register-password">Password *</label>
                                                <input type="password" class="form-control" id="register-password" name="register-password" required>
                                            </div><!-- End .form-group -->

                                            <div class="form-footer">
                                                <button type="submit" class="btn btn-outline-primary-2">
                                                    <span>SIGN UP</span>
                                                    <i class="icon-long-arrow-right"></i>
                                                </button>

                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="register-policy" required>
                                                    <label class="custom-control-label" for="register-policy">I agree to the <a href="#">privacy policy</a> *</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .form-footer -->
                                        </form>
                                        <div class="form-choice">
                                            <p class="text-center">or sign in with</p>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <a href="#" class="btn btn-login btn-g">
                                                        <i class="icon-google"></i>
                                                        Login With Google
                                                    </a>
                                                </div><!-- End .col-6 -->
                                                <div class="col-sm-6">
                                                    <a href="#" class="btn btn-login  btn-f">
                                                        <i class="icon-facebook-f"></i>
                                                        Login With Facebook
                                                    </a>
                                                </div><!-- End .col-6 -->
                                            </div><!-- End .row -->
                                        </div><!-- End .form-choice -->
                                    </div><!-- .End .tab-pane -->
                                </div><!-- End .tab-content -->
                            </div><!-- End .form-tab -->
                        </div><!-- End .form-box -->
                    </div><!-- End .modal-body -->
                </div><!-- End .modal-content -->
            </div><!-- End .modal-dialog -->
        </div><!-- End .modal -->

        <!-- Plugins JS File -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.hoverIntent.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/superfish.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap-input-spinner.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.min.js"></script>
        <!-- Main JS File -->
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    </body>


    <!-- molla/category-market.html  22 Nov 2019 10:03:00 GMT -->
</html>