<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta property="og:title" content="Phương Anh Store" />
        <meta property="og:description" content="Phụ kiện sạc, livestream, máy tính, ô tô, xe máy..." />
        <meta property="og:image" content="https://www.phuonganhstore.vn/assets/images/logo/main-logo-2.png" />
        <meta property="og:url" content="https://www.phuonganhstore.vn/" />
        <meta property="og:type" content="website" />
        
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Phương Anh Store</title>
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo/main-logo-2.png" type="image/x-icon">

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
    <%@ include file="/assets/components/header.jsp" %>
    <body>
        <div class="page-wrapper">
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
                            <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienMayTinh" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/1.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Phụ Kiện Máy Tính</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienLivestream-ChupAnh" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/2.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Chụp Ảnh - Livestream</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=CapSac" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/cap-sac.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Cáp Sạc</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=CuSac" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/cu-sac.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Củ Sạc</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiAmThanh" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/assets/images/category-logo/5.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Âm Thanh</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=SacDuPhong" class="cat-block">
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
                            <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienSac">
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
                            <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=SacDuPhong">
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
                            <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=TaiNgheKhongDay">
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
                                <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=LoaKhongDay" class="btn btn-primary btn-round"><span>Mua Ngay</span><i class="icon-long-arrow-right"></i></a>
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
                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByBrand&brandName=Baseus" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/images/brands/baseus-logo.png" alt="Brand Name">
                    </a>

                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByBrand&brandName=Wiwu" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/images/brands/wiwu-logo.png" alt="Brand Name">
                    </a>

                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByBrand&brandName=Hoco" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/images/brands/hoco-logo.png" alt="Brand Name">
                    </a>

                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByBrand&brandName=Remax" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/images/brands/remax-logo.png" alt="Brand Name">
                    </a>

                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByBrand&brandName=Anker" class="brand">
                        <img src="${pageContext.request.contextPath}/assets/images/brands/anker-logo.png" alt="Brand Name">
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
                                        <a href="${pageContext.request.contextPath}/list-all-product?action=viewDetail&id=${p.productId}">
                                            <c:set var="firstImage" value="${fn:split(p.image, ',')[0]}" />
                                                <img src="${pageContext.request.contextPath}/Images/${p.category.categoryName}/${p.categoryType.categoryTypeName}/${firstImage}" 
                                                    alt="Ảnh" class="product-img" />
                                        </a>                     
                                    </figure>

                                    <div class="product-body">
                                        <h3 class="product-title">
                                            <a href="${pageContext.request.contextPath}/list-all-product?action=viewDetail&id=${p.productId}">${p.name}</a>
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
    
    <%@ include file="/assets/components/footer.jsp" %>
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
</html>