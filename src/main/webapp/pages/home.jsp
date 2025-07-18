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

        <%-- <!-- Favicon -->
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/line-awesome/line-awesome/line-awesome/css/line-awesome.min.css"> --%>
        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/magnific-popup/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/jquery.countdown.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/skins/skin-demo-4.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demos/demo-4.css">
        <!-- Vietnam -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Agbalumo&display=swap" rel="stylesheet">

    </head>

    <body>
        <div class="page-wrapper">
            <%@ include file="/assets/components/header.jsp" %>

            <!-- Banner Slide -->
            <div class="intro-slider-container mb-5">
                <div class="intro-slider owl-carousel owl-theme"
                     data-toggle="owl"
                     data-owl-options='{
                     "items": 1,
                     "loop": true,
                     "nav": false,
                     "dots": false,
                     "autoplay": true,
                     "autoplayTimeout": 3000,
                     "autoplayHoverPause": false
                     }'>
                    <div class="intro-slide" style="background-image: url('${pageContext.request.contextPath}/assets/images/slider/slide-1.png');"></div>
                    <div class="intro-slide" style="background-image: url('${pageContext.request.contextPath}/assets/images/slider/slide-2.png');"></div>
                </div>
            </div>


            <div class="container">
                <h2 class="title text-center mb-4">Danh Mục Sản Phẩm Nổi Bật</h2><!-- End .title text-center -->

                <div class="cat-blocks-container">
                    <div class="row">
                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="category.html" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/1.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Phụ Kiện Máy Tính</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="category.html" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/2.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Chụp Ảnh - Livestream</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="category.html" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/cap-sac.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Cáp Sạc</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="category.html" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/cu-sac.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Củ Sạc</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="category.html" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/5.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Âm Thanh</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="category.html" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/sac-du-phong.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Sạc Dự Phòng</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->
                    </div><!-- End .row -->
                </div><!-- End .cat-blocks-container -->
            </div><!-- End .container -->

            <div class="mb-4"></div><!-- End .mb-4 -->

            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="banner banner-overlay banner-overlay-light">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/assets/images/banner/cu-sac-banner.png" alt="Banner">
                            </a>

                            <%-- <div class="banner-content">
                                <h4 class="banner-subtitle"><a href="#">Smart Offer</a></h4><!-- End .banner-subtitle -->
                                <h3 class="banner-title"><a href="#">Save $150 <strong>on Samsung <br>Galaxy Note9</strong></a></h3><!-- End .banner-title -->
                                <a href="#" class="banner-link">Shop Now<i class="icon-long-arrow-right"></i></a>
                            </div><!-- End .banner-content --> --%>
                        </div><!-- End .banner -->
                    </div><!-- End .col-md-4 -->

                    <div class="col-md-6 col-lg-4">
                        <div class="banner banner-overlay banner-overlay-light">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/assets/images/banner/sac-du-phong-banner.png" alt="Banner">
                            </a>

                            <%-- <div class="banner-content">
                                <h4 class="banner-subtitle"><a href="#">Time Deals</a></h4><!-- End .banner-subtitle -->
                                <h3 class="banner-title"><a href="#"><strong>Bose SoundSport</strong> <br>Time Deal -30%</a></h3><!-- End .banner-title -->
                                <a href="#" class="banner-link">Shop Now<i class="icon-long-arrow-right"></i></a>
                            </div><!-- End .banner-content --> --%>
                        </div><!-- End .banner -->
                    </div><!-- End .col-md-4 -->

                    <div class="col-md-6 col-lg-4">
                        <div class="banner banner-overlay banner-overlay-light">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/assets/images/banner/tai-nghe-banner.png" alt="Banner">
                            </a>

                            <%-- <div class="banner-content">
                                <h4 class="banner-subtitle"><a href="#">Clearance</a></h4><!-- End .banner-subtitle -->
                                <h3 class="banner-title"><a href="#"><strong>GoPro - Fusion 360</strong> <br>Save $70</a></h3><!-- End .banner-title -->
                                <a href="#" class="banner-link">Shop Now<i class="icon-long-arrow-right"></i></a>
                            </div><!-- End .banner-content --> --%>
                        </div><!-- End .banner -->

                    </div><!-- End .col-lg-4 -->
                </div><!-- End .row -->
            </div><!-- End .container -->

            <div class="mb-3"></div><!-- End .mb-5 -->

            <div class="mb-6"></div><!-- End .mb-6 -->

            <div class="container">
                <div class="cta cta-border mb-5" style="background-image: url(${pageContext.request.contextPath}/assets/images/banner/bg-1.jpg);">
                    <img src="${pageContext.request.contextPath}/assets/images/product-demo/loa-remax.png" alt="loa" class="cta-img">
                    <div class="row justify-content-center">
                        <div class="col-md-12">
                            <div class="cta-content">
                                <div class="cta-text text-right text-white">
                                    <p>Loa Không Dây<br><strong>Nhận Ngay Ưu Đãi Trong Hôm Nay </strong></p>
                                </div><!-- End .cta-text -->
                                <a href="#" class="btn btn-primary btn-round"><span>Mua Ngay</span><i class="icon-long-arrow-right"></i></a>
                            </div><!-- End .cta-content -->
                        </div><!-- End .col-md-12 -->
                    </div><!-- End .row -->
                </div><!-- End .cta -->
            </div><!-- End .container -->
            <div class="container">
                <hr class="mb-0">
                <div class="owl-carousel mt-5 mb-5 owl-simple" data-toggle="owl" 
                     data-owl-options='{
                     "nav": false, 
                     "dots": false,
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
                     "items":6
                     }
                     }
                     }'>
                    <a href="#" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/images/brands/baseus-logo.png" alt="Brand Name">
                    </a>

                    <a href="#" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/images/brands/wiwu-logo.png" alt="Brand Name">
                    </a>

                    <a href="#" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/images/brands/hoco-logo.png" alt="Brand Name">
                    </a>

                    <a href="#" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/images/brands/remax-logo.png" alt="Brand Name">
                    </a>

                    <a href="#" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/images/brands/anker-logo.png" alt="Brand Name">
                    </a>

                    <a href="#" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/images/brands/6.png" alt="Brand Name">
                    </a>
                </div><!-- End .owl-carousel -->
            </div><!-- End .container -->

        </div>
        <div class="mb-5"></div><!-- End .mb-5 -->

        <div class="container for-you">
            <div class="heading heading-flex mb-3">
                <div class="heading-left">
                    <h2 class="title">Gợi Ý Cho Bạn</h2><!-- End .title -->
                </div><!-- End .heading-left -->

                <div class="heading-right">
                    <a href="list-all-product" class="title-link">Xem tất cả sản phẩm<i class="icon-long-arrow-right"></i></a>
                </div><!-- End .heading-right -->
            </div><!-- End .heading -->

            <div class="products">
                <div class="row justify-content-center"><div class="row justify-content-center">
                        <c:forEach var="p" items="${trendingProducts}">
                            <div class="col-6 col-md-4 col-lg-3">
                                <div class="product product-2">
                                    <figure class="product-media">
                                        <a href="product-detail?id=${p.productId}">
                                            <img src="${pageContext.request.contextPath}/Images/${p.getImagePath()}" alt="${p.name}" class="product-image">
                                        </a>

                                        <div class="product-action-vertical">
                                            <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                        </div>

                                        <div class="product-action">
                                            <a href="#" class="btn-product btn-cart" title="Add to cart"><span>Thêm vào giỏ</span></a>
                                        </div>
                                    </figure>

                                    <div class="product-body">
                                        <h3 class="product-title">
                                            <a href="product-detail?id=${p.productId}">${p.name}</a>
                                        </h3>
                                        <div class="product-price">
                                            ${p.formattedPrice}₫
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div><!-- End .products -->
            </div><!-- End .container -->

            <div class="mb-4"></div><!-- End .mb-4 -->

            <div class="container">
                <hr class="mb-0">
            </div><!-- End .container -->

            <div class="icon-boxes-container bg-transparent">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-dark">
                                    <i class="icon-rocket"></i>
                                </span>
                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">FreeShip BK 5KM </h3><!-- End .icon-box-title -->
                                    <p>Với Hóa Đơn Từ 300K</p>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->

                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-dark">
                                    <i class="icon-rotate-left"></i>
                                </span>

                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Bảo Hành 1 Đổi 1</h3><!-- End .icon-box-title -->
                                    <%-- <p>Lỗi Từ Nhà Sản Xuất</p> --%>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->

                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-dark">
                                    <i class="icon-info-circle"></i>
                                </span>

                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Giảm 5%/Bill</h3><!-- End .icon-box-title -->
                                    <p>Follow Fanpage</p>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->

                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-dark">
                                    <i class="icon-life-ring"></i>
                                </span>

                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Hỗ Trợ</h3><!-- End .icon-box-title -->
                                    <p>24/7</p>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->
                    </div><!-- End .row -->
                </div><!-- End .container -->
            </div><!-- End .icon-boxes-container -->
        </main><!-- End .main -->


    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

    <!-- Mobile Menu -->
    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

    <div class="mobile-menu-container mobile-menu-light">
        <div class="mobile-menu-wrapper">
            <span class="mobile-menu-close"><i class="icon-close"></i></span>

            <form action="#" method="get" class="mobile-search">
                <label for="mobile-search" class="sr-only">Search</label>
                <input type="search" class="form-control" name="mobile-search" id="mobile-search" placeholder="Search in${pageContext.request.contextPath}." required>
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
                                    <div class="icon-box icon-box-side">
                                        <span class="icon-box-icon text-dark">
                                            <i class="icon-life-ring"></i>
                                        </span>

                                        <div class="icon-box-content">
                                            <h3 class="icon-box-title">We Support</h3><!-- End .icon-box-title -->
                                            <p>24/7 amazing services</p>
                                        </div><!-- End .icon-box-content -->
                                    </div><!-- End .icon-box -->
                                    </div><!-- End .col-sm-6 col-lg-3 -->
                                    </div><!-- End .row -->
                                    </div><!-- End .container -->
                                    </div><!-- End .icon-boxes-container -->
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
                                                <input type="search" class="form-control" name="mobile-search" id="mobile-search" placeholder="Search in${pageContext.request.contextPath}." required>
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
                                    <script src="${pageContext.request.contextPath}/assets/js/jquery.plugin.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/assets/js/jquery.countdown.min.js"></script>
                                    <!-- Main JS File -->
                                    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
                                    <script src="${pageContext.request.contextPath}/assets/js/demos/demo-4.js"></script>
                                    </body>


                                    <!-- molla/index-4.html  22 Nov 2019 09:54:18 GMT -->
                                    </html>