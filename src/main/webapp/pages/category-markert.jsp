<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta property="og:title" content="Phương Anh Store" />
        
        <meta property="og:description" content="Phụ kiện sạc, livestream, máy tính, ô tô, xe máy..." />
        <meta property="og:image" content="https://www.phuonganhstore.vn/assets/images/logo/main-logo-2.png" />
        <meta property="og:url" content="https://www.phuonganhstore.vn/" />
        <meta property="og:type" content="website" />

        <title>Phương Anh Store</title>
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo/main-logo-2.png" type="image/x-icon">
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
    <%@ include file="/assets/components/header.jsp" %>
    <body>
        <div class="page-wrapper">

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
                                    <c:if test="${empty flag}">
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
                                    </c:if><!-- End .title -->
                                    <div class="mb-3 mb-lg-5"></div><!-- End .mb-3 mb-lg-5 -->
                                    <c:if test="${empty flag}">
                                        <div class="cat-blocks-container">
                                            <div class="row">
                                                <div class="col-6 col-md-4 col-lg-3">
                                                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienMayTinh" class="cat-block">
                                                        <figure>
                                                            <span>
                                                                <img src="${pageContext.request.contextPath}/assets/images/category-logo/1.png" alt="Category image">
                                                            </span>
                                                        </figure>
                                                        <h3 class="cat-block-title">Phụ Kiện Máy Tính</h3><!-- End .cat-block-title -->
                                                    </a>
                                                </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                                <div class="col-6 col-md-4 col-lg-3">
                                                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienSac" class="cat-block">
                                                        <figure>
                                                            <span>
                                                                <img src="${pageContext.request.contextPath}/assets/images/category-logo/cu-sac.png" alt="Category image">
                                                            </span>
                                                        </figure>

                                                        <h3 class="cat-block-title">Phụ Kiện Sạc</h3><!-- End .cat-block-title -->
                                                    </a>
                                                </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                                <div class="col-6 col-md-4 col-lg-3">
                                                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiAmThanh" class="cat-block">
                                                        <figure>
                                                            <span>
                                                                <img src="${pageContext.request.contextPath}/assets/images/category-logo/5.png" alt="Category image">
                                                            </span>
                                                        </figure>

                                                        <h3 class="cat-block-title">Thiết Bị Âm Thanh</h3><!-- End .cat-block-title -->
                                                    </a>
                                                </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                                <div class="col-6 col-md-4 col-lg-3">
                                                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiMang" class="cat-block">
                                                        <figure>
                                                            <span>
                                                                <img src="${pageContext.request.contextPath}/assets/images/category-logo/thiet-bi-mang.png" alt="Category image">
                                                            </span>
                                                        </figure>

                                                        <h3 class="cat-block-title">Thiết Bị Mạng</h3><!-- End .cat-block-title -->
                                                    </a>
                                                </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                                <div class="col-6 col-md-4 col-lg-3">
                                                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiChuyenDoi-LuuTru" class="cat-block">
                                                        <figure>
                                                            <span>
                                                                <img src="${pageContext.request.contextPath}/assets/images/category-logo/o-cung.png" alt="Category image">
                                                            </span>
                                                        </figure>

                                                        <h3 class="cat-block-title">Thiết Bị Chuyển Đổi - Lưu Trữ</h3><!-- End .cat-block-title -->
                                                    </a>
                                                </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                                <div class="col-6 col-md-4 col-lg-3">
                                                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienChoiGame" class="cat-block">
                                                        <figure>
                                                            <span>
                                                                <img src="${pageContext.request.contextPath}/assets/images/category-logo/phu-kien-choi-game.png" alt="Category image">
                                                            </span>
                                                        </figure>

                                                        <h3 class="cat-block-title">Phụ Kiện Chơi Game</h3><!-- End .cat-block-title -->
                                                    </a>
                                                </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                                <div class="col-6 col-md-4 col-lg-3">
                                                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=Op-CuongLuc" class="cat-block">
                                                        <figure>
                                                            <span>
                                                                <img src="${pageContext.request.contextPath}/assets/images/category-logo/cuong-luc.png" alt="Category image">
                                                            </span>
                                                        </figure>

                                                        <h3 class="cat-block-title">Ốp Lưng - Cường Lực</h3><!-- End .cat-block-title -->
                                                    </a>
                                                </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                                <div class="col-6 col-md-4 col-lg-3">
                                                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienOtoXeMay" class="cat-block">
                                                        <figure>
                                                            <span>
                                                                <img src="${pageContext.request.contextPath}/assets/images/category-logo/phu-kien-oto-xe-may.png" alt="Category image">
                                                            </span>
                                                        </figure>

                                                        <h3 class="cat-block-title">Phụ Kiện Ôtô Xe Máy</h3><!-- End .cat-block-title -->
                                                    </a>
                                                </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                                <div class="col-6 col-md-4 col-lg-3">
                                                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienLivestream-ChupAnh" class="cat-block">
                                                        <figure>
                                                            <span>
                                                                <img src="${pageContext.request.contextPath}/assets/images/category-logo/2.png" alt="Category image">
                                                            </span>
                                                        </figure>

                                                        <h3 class="cat-block-title">Phụ Kiện Livestream - Chụp Ảnh</h3><!-- End .cat-block-title -->
                                                    </a>
                                                </div><!-- End .col-6 col-md-4 col-lg-3 -->

                                                <div class="col-6 col-md-4 col-lg-3">
                                                    <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienKhac" class="cat-block">
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
                                    </c:if><!-- End .cat-blocks-container -->
                                    <div class="mb-2"></div><!-- End .mb-2 -->
                                    <c:if test="${search}">
                                        <h2 class="title title-border">Tất Cả Sản Phẩm</h2><!-- End .title -->
                                    </c:if><!-- End .title -->
                                    <c:if test="${not empty search}">
                                        <h2 class="title title-border">
                                            Kết Quả Tìm Kiếm: <em style="color: #39f;">${keyword}</em>
                                        </h2>
                                    </c:if><!-- End .mb-3 -->
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
                                                            <a href="${pageContext.request.contextPath}/list-all-product?action=viewDetail&id=${p.productId}">
                                                                <c:set var="firstImage" value="${fn:split(p.image, ',')[0]}" />
                                                                <img src="${pageContext.request.contextPath}/Images/${p.category.categoryName}/${p.categoryType.categoryTypeName}/${firstImage}" 
                                                                    alt="Ảnh" class="product-img" />
                                                            </a>
                                                            <%-- <div class="product-action">
                                                                <a href="#" class="btn-product btn-cart" title="Add to cart"><span>Thêm Vào Giỏ</span></a>
                                                            </div><!-- End .product-action --> --%>
                                                        </figure><!-- End .product-media -->

                                                        <div class="product-body">
                                                            <div class="product-cat">
                                                                <a href="#">${p.getType()}</a>
                                                            </div><!-- End .product-cat -->
                                                            <h3 class="product-title"><a href="${pageContext.request.contextPath}/list-all-product?action=viewDetail&id=${p.productId}">${p.name}</a></h3><!-- End .product-title -->
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
                                                    <span aria-hidden="true"><i class="icon-long-arrow-left"></i></span>Lùi
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
                                                    Tiến <span aria-hidden="true"><i class="icon-long-arrow-right"></i></span>
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
                                                    <div id="collapse-1" class="collapse" data-parent="#widget-cat-acc">
                                                        <div class="collapse-wrap">
                                                            <ul>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienMayTinh&categoryTypeName=BanPhim">Bàn Phím</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienMayTinh&categoryTypeName=Chuot">Chuột</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienMayTinh&categoryTypeName=QuatTanNhiet-GiaDo">Quạt Tản Nhiệt - Giá Đỡ</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienMayTinh&categoryTypeName=Khac">Khác</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienMayTinh&categoryTypeName=BoSacLaptop">Bộ Sạc Laptop</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienMayTinh">Tất Cả</a></li>

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
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=BoSac">Bộ Sạc</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=CuSac">Củ Sạc</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=CapSac">Cáp Sạc</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=Adapter">Adapter</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=SacDuPhong">Sạc Dự Phòng</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=ODien">Ổ Điện</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienSac">Tất Cả</a></li>

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
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=LoaKhongDay">Loa Không Dây</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=LoaKhongDay">Tai Nghe Có Dây</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=TaiNgheKhongDay">Tai Nghe Không Dây</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=LoaViTinh">Loa Vi Tính</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=LoaKaraoke">Loa Karaoke</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=MicThuAm-Karaoke">Mic Thu Âm - Karaoke</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiAmThanh">Tất Cả</a></li>

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
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiMang&categoryTypeName=BoKichWifi">Bộ Kích Wifi</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiMang&categoryTypeName=Router">Router</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiMang&categoryTypeName=USBWifi">USB Wifi</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiMang">Tất Cả</a></li>

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
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienOtoXeMay&categoryTypeName=GiaDoOto">Giá Đỡ Ô Tô</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienOtoXeMay&categoryTypeName=GiaDoXeMay">Giá Đỡ Xe Máy</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienOtoXeMay">Tất Cả</a></li>

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
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiChuyenDoi-LuuTru&categoryTypeName=CapChuyenDoi">Cáp Chuyển Đổi</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiChuyenDoi-LuuTru&categoryTypeName=HUB-BoChuyenDoi">HUB - Bộ Chuyển Đổi</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiChuyenDoi-LuuTru&categoryTypeName=CapNoiDai">Cáp Nối Dài</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiChuyenDoi-LuuTru&categoryTypeName=DauDocThe">Đầu Đọc Thẻ</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiChuyenDoi-LuuTru&categoryTypeName=OTG">OTG</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiChuyenDoi-LuuTru&categoryTypeName=USB">USB</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiChuyenDoi-LuuTru&categoryTypeName=Ocung">Ổ Cứng</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiChuyenDoi-LuuTru&categoryTypeName=TheNho">Thẻ Nhớ</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiChuyenDoi-LuuTru&categoryTypeName=Khac">Khác</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiChuyenDoi-LuuTru">Tất Cả</a></li>

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
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienLivestream-ChupAnh&categoryTypeName=DenLivestream">Đèn Livestream</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienLivestream-ChupAnh&categoryTypeName=Tripod-GaySlfie">Tripod - Gậy Selfie</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienLivestream-ChupAnh&categoryTypeName=Khac">Khác</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienLivestream-ChupAnh">Tất Cả</a></li>

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
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=OpDienThoai">Ốp Lưng Điện Thoại</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=OpIpad">Ốp Lưng Ipad - Tablet</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=CuongLucDienThoai">Cường Lực Điện Thoại</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=CuongLucIpad">Cường Lực Ipad - Tablet</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=CaseAirpod">Case Airpod</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=PPF-Nano">PPF - Nano</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=BaoVeCam">Bảo Vệ Camera</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=Khac">Khác</a></li>
                                                                <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=Op-CuongLuc">Tất Cả</a></li>

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

                                        <form action="${pageContext.request.contextPath}/list-all-product" method="get">
                                            <input type="hidden" name="action" value="sortByBrands" />

                                            <div class="filter-items">
                                                <div class="filter-item">
                                                    <input type="checkbox" name="brand" value="Baseus" id="brand-1">
                                                    <label for="brand-1">Baseus</label>
                                                </div>
                                                <div class="filter-item">
                                                    <input type="checkbox" name="brand" value="Anker" id="brand-2">
                                                    <label for="brand-2">Anker</label>
                                                </div>
                                                <div class="filter-item">
                                                    <input type="checkbox" name="brand" value="Hoco" id="brand-3">
                                                    <label for="brand-3">Hoco</label>
                                                </div>
                                                <div class="filter-item">
                                                    <input type="checkbox" name="brand" value="Wiwu" id="brand-3">
                                                    <label for="brand-3">Wiwu</label>
                                                </div>
                                                <div class="filter-item">
                                                    <input type="checkbox" name="brand" value="KingKong" id="brand-3">
                                                    <label for="brand-3">KingKong</label>
                                                </div>
                                                <div class="filter-item">
                                                    <input type="checkbox" name="brand" value="Remax" id="brand-3">
                                                    <label for="brand-3">Remax</label>
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-primary mt-2" style="background-color:#39f; border-color:#39f; color:white;">Lọc</button>
                                        </form>

                                    </div><!-- End .widget -->                                        
                                        <!-- Các checkbox lọc theo brand nếu có -->
                                        <!-- Lọc theo giá -->
                                        <div class="widget">
                                            <h3 class="widget-title">Lọc Theo Giá</h3>
                                            <form action="${pageContext.request.contextPath}/list-all-product" method="get">
                                                <input type="hidden" name="action" value="sortByPrice" />
                                                <div class="widget-body">
                                                    <div class="filter-items">
                                                        <div class="filter-item">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="price-1" name="filter-price" value="0-100000">
                                                                <label class="custom-control-label" for="price-1">Dưới 100.000VNĐ</label>
                                                            </div>
                                                        </div>

                                                        <div class="filter-item">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="price-2" name="filter-price" value="100000-200000">
                                                                <label class="custom-control-label" for="price-2">100.000VNĐ - 200.000VNĐ</label>
                                                            </div>
                                                        </div>

                                                        <div class="filter-item">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="price-3" name="filter-price" value="200000-500000">
                                                                <label class="custom-control-label" for="price-3">200.000VNĐ - 500.000VNĐ</label>
                                                            </div>
                                                        </div>

                                                        <div class="filter-item">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="price-5" name="filter-price" value="500000-999999999">
                                                                <label class="custom-control-label" for="price-5">Trên 500.000VNĐ</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-primary mt-2" style="background-color:#39f; border-color:#39f;">Lọc</button>
                                            </form>
                                        </div>
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