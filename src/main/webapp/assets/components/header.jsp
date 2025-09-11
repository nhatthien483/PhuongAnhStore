<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta property="og:title" content="Phương Anh Store" />
        <meta property="og:description" content="Phụ kiện sạc, livestream, máy tính, ô tô, xe máy..." />
        <meta property="og:image" content="https://www.phuonganhstore.vn/assets/images/logo/main-logo-2.png" />
        <meta property="og:url" content="https://www.phuonganhstore.vn/" />
        <meta property="og:type" content="website" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <style>
            .dropdown-menu.custom-dropdown {
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 1rem;
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
                min-width: 220px;
                padding: 0.5rem 0;
            }

            .account-menu {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .account-menu li {
                border-bottom: 1px solid #eee;
            }

            .account-menu li:last-child {
                border-bottom: none;
            }

            .account-menu a {
                display: block;
                padding: 0.75rem 1.25rem;
                color: #333;
                text-decoration: none;
                font-weight: 500;
                transition: all 0.2s ease;
                border-radius: 5px;
            }

            .account-menu a:hover {
                background-color: #39f;
                color: #fff;
            }
        </style>
    </head>
    <header class="header header-intro-clearance header-4 p-3">
        <div class="header-top">
            <div class="container">
                <div class="header-left">
                    <a href="tel:0901050697"><i class="icon-phone">Gọi ngay: 0901050697</i></a>
                </div><!-- End .header-left -->
                <div class="header-right">
                </div><!-- End .header-right -->
            </div><!-- End .container -->
        </div><!-- End .header-top -->
        <div class="header-middle">
            <div class="container">
                <div class="header-left">
                    <button class="mobile-menu-toggler">
                        <span class="sr-only">Toggle mobile menu</span>
                        <i class="icon-bars"></i>
                    </button>
                    <a href="${pageContext.request.contextPath}/home" class="logo">
                        <img src="${pageContext.request.contextPath}/assets/images/logo/main-logo.jpg" alt="PhuongAnhStore" width="50" height="50">
                    </a>
                    <a href = "${pageContext.request.contextPath}/home"><span class="store-name">Phương Anh Store</span></a>
                </div><!-- End .header-left -->

                <div class="header-center">
                    <div class="header-search header-search-extended header-search-visible d-none d-lg-block">
                        <a href="${pageContext.request.contextPath}/list-all-product" class="search-toggle" role="button"><i class="icon-search"></i></a>
                        <form action="${pageContext.request.contextPath}/list-all-product" method="get">
                            <input type="hidden" name="action" value="search">
                            <div class="header-search-wrapper search-wrapper-wide">
                                <%-- <label for="q" class="sr-only">Search</label> --%>
                                <%-- <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button> --%>
                                <input type="search" class="form-control" name="keyword" value="${param.keyword}" placeholder="Tìm kiếm sản phẩm ..." required>
                            </div><!-- End .header-search-wrapper -->
                        </form>
                    </div><!-- End .header-search -->
                </div>

                <div class="header-right">
                    <div class="dropdown cart-dropdown">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
                                    <div class="icon">
                                        <i class="icon-user"></i>
                                    </div>
                                    <p>Tài khoản</p>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right custom-dropdown">
                                    <ul class="account-menu">
                                        <li><a href="${pageContext.request.contextPath}/profile">Thông tin tài khoản</a></li>
                                        <li><a href="${pageContext.request.contextPath}/orders">Đơn hàng của tôi</a></li>
                                        <li><a href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                                    </ul>
                                </div> <!-- End .dropdown-menu-->
                            </c:when>

                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/login">Đăng Nhập / Đăng Ký</a>
                            </c:otherwise>
                        </c:choose>
                    </div> <!-- End .cart-dropdown -->
                    <%-- <div class="wishlist">
                        <a href="wishlist.html" title="Wishlist">
                            <div class="icon">
                                <i class="icon-heart-o"></i>
                                <span class="wishlist-count badge">3</span>
                            </div>
                            <p>Yêu thích</p>
                        </a>
                    </div>
                    <!-- End .compare-dropdown --> --%>
                    <div class="dropdown cart-dropdown ">
                        <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
                            <div class="icon">
                                <i class="icon-shopping-cart"></i>
                                <span class="cart-count cart-badge" id="cart-count"></span>
                            </div>
                            <p>Giỏ hàng</p>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right shadow-lg p-3 mb-5 bg-body rounded">

                            <div class="dropdown-cart-products" id="cart-items">
                            </div>
                            <div class="dropdown-cart-total">
                                <span>Tổng Đơn Hàng</span>
                                <span class="cart-total-price" id="cart-price" style="color: #39f;"></span>
                            </div><!-- End .dropdown-cart-total -->
                            <div class="dropdown-cart-action" id="cart-action">
                                <a href="CartManagementServlet" class="btn btn-primary">Xem Giỏ</a>
                            </div><!-- End .dropdown-cart-total -->
                        </div><!-- End .dropdown-menu -->
                    </div><!-- End .cart-dropdown -->
                </div><!-- End .header-right -->
            </div><!-- End .container -->
        </div><!-- End .header-middle -->

        <div class="header-bottom sticky-header">
            <div class="container">
                <div class="header-left">
                    <div class="dropdown category-dropdown">
                        <a href="#" class="dropdown-toggle rounded" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" title="Danh Mục Sản Phẩm">
                            Sản phẩm <i class="icon-angle-down"></i>
                        </a>
                        <div class="dropdown-menu rounded">
                            <nav class="side-nav">
                                <ul class="menu-vertical sf-arrows">
                                    <li><a href="${pageContext.request.contextPath}/list-all-product">-- Tất Cả Sản Phẩm --</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienSac">Phụ kiện sạc</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienLivestream-ChupAnh">Phụ kiện livestream - Chụp ảnh</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienMayTinh">Phụ kiện máy tính</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiAmThanh">Phụ kiện âm thanh</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiMang">Thiết bị mạng</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienOtoXeMay">Phụ kiện ô tô - xe máy</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiChuyenDoi-LuuTru">Thiết bị chuyển đổi - hub chuyển đổi</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienChoiGame">Phụ kiện chơi game­</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=Op-CuongLuc">Ốp lưng - Cường lực</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienKhac">Phụ kiện khác</a></li>
                                </ul><!-- End .menu-vertical -->
                            </nav><!-- End .side-nav -->
                        </div><!-- End .dropdown-menu -->
                    </div><!-- End .category-dropdown -->
                </div><!-- End .header-left -->
                <div class ="header-right">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user and (sessionScope.user.roleId == 1 or sessionScope.user.roleId == 2)}">    
                            <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-success">Trang Quản Lý</a>
                        </c:when>
                    </c:choose>
                </div><!-- End .container -->
            </div><!-- End .header-bottom -->
    </header><!-- End .header -->
    <div id="cart-notification"
        style="display: none;
        position: fixed;
        top: 80px; /* bên dưới header */
        left: 50%;
        transform: translateX(-50%);
        background: rgba(0, 128, 0, 0.9);
        color: white;
        padding: 15px 20px;
        border-radius: 8px;
        font-size: 16px;
        text-align: center;
        z-index: 1000;
        min-width: 250px;
        max-width: 90%;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);">
    </div>
    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->
    <div class="mobile-menu-container mobile-menu-light">
        <div class="mobile-menu-wrapper">
            <span class="mobile-menu-close"><i class="icon-close"></i></span>

            <form action="${pageContext.request.contextPath}/list-all-product" method="get" class="mobile-search">
                <input type="hidden" name="action" value="search">
                <label for="mobile-search" class="sr-only">Search</label>
                <input type="search" class="form-control" name="keyword" id="mobile-search" value="${param.keyword}" placeholder="Tìm kiếm sản phẩm ..." required>
                <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
            </form>

            <ul class="nav nav-pills-mobile nav-border-anim" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="mobile-menu-link" data-toggle="tab" href="#mobile-menu-tab" role="tab" aria-controls="mobile-menu-tab" aria-selected="true">Menu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="mobile-cats-link" data-toggle="tab" href="#mobile-cats-tab" role="tab" aria-controls="mobile-cats-tab" aria-selected="false">Về Chúng Tôi</a>
                </li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade show active" id="mobile-menu-tab" role="tabpanel" aria-labelledby="mobile-menu-link">
                    <nav class="mobile-nav">
                        <ul class="mobile-menu">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/home">Trang Chủ</a>                              
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/list-all-product">Tất Cả Sản Phẩm</a>                             
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienSac" class="sf-with-ul">Phụ Kiện Sạc</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=BoSac">Bộ Sạc</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=CuSac">Củ Sạc</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=CapSac">Cáp Sạc</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=Adapter">Adapter</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=SacDuPhong">Sạc Dự Phòng</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=ODien">Ổ Điện</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienSac&categoryTypeName=BanPhim">Tất Cả</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienLivestream-ChupAnh" class="sf-with-ul">Phụ kiện livestream - Chụp ảnh</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienLivestream-ChupAnh&categoryTypeName=DenLivestream">Đèn Livestream</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienLivestream-ChupAnh&categoryTypeName=Tripod-GaySlfie">Tripod - Gậy Selfie</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienLivestream-ChupAnh&categoryTypeName=Khac">Khác</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienLivestream-ChupAnh&categoryTypeName=GiaDoOto">Tất Cả</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienMayTinh" class="sf-with-ul">Phụ kiện máy tính</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienMayTinh&categoryTypeName=BanPhim">Bàn Phím</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienMayTinh&categoryTypeName=Chuot">Chuột</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienMayTinh&categoryTypeName=QuatTanNhiet-GiaDo">Quạt Tản Nhiệt - Giá Đỡ</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienMayTinh&categoryTypeName=Khac">Khác</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienMayTinh&categoryTypeName=BoSacLaptop">Bộ Sạc Laptop</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienMayTinh&categoryTypeName=">Tất Cả</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiAmThanh" class="sf-with-ul">Phụ kiện âm thanh</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=LoaKhongDay">Loa Không Dây</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=LoaKhongDay">Tai Nghe Có Dây</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=TaiNgheKhongDay">Tai Nghe Không Dây</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=LoaViTinh">Loa Vi Tính</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=LoaKaraoke">Loa Karaoke</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=MicThuAm-Karaoke">Mic Thu Âm - Karaoke</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiAmThanh&categoryTypeName=BoSac">Tất Cả</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiMang" class="sf-with-ul">Thiết bị mạng</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiMang&categoryTypeName=BoKichWifi">Bộ Kích Wifi</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiMang&categoryTypeName=Router">Router</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiMang&categoryTypeName=USBWifi">USB Wifi</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiMang&categoryTypeName=LoaKhongDay">Tất Cả</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienOtoXeMay" class="sf-with-ul">Phụ kiện ô tô - xe máy</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienOtoXeMay&categoryTypeName=GiaDoOto">Giá Đỡ Ô Tô</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienOtoXeMay&categoryTypeName=GiaDoXeMay">Giá Đỡ Xe Máy</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=PhuKienOtoXeMay&categoryTypeName=BoKichWifi">Tất Cả</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=ThietBiChuyenDoi-LuuTru" class="sf-with-ul">Thiết bị chuyển đổi - hub chuyển đổi</a>
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
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=ThietBiChuyenDoi-LuuTru&categoryTypeName=GiaDoOto">Tất Cả</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienChoiGame" class="sf-with-ul">Phụ kiện chơi game</a>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=Op-CuongLuc" class="sf-with-ul">Ốp lưng - Cường lực</a>
                                <ul>
                                     <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=OpDienThoai">Ốp Lưng Điện Thoại</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=OpIpad">Ốp Lưng Ipad - Tablet</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=CuongLucDienThoai">Cường Lực Điện Thoại</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=CuongLucIpad">Cường Lực Ipad - Tablet</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=CaseAirpod">Case Airpod</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=PPF-Nano">PPF - Nano</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=BaoVeCam">Bảo Vệ Camera</a></li>
                                    <li><a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryNameAndCategoryTypeName&categoryName=Op-CuongLuc&categoryTypeName=Khac">Khác</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/list-all-product?action=sortByCategoryName&type=PhuKienKhac" class="sf-with-ul">Phụ kiện khác</a>

                            </li>                      
                        </ul>
                    </nav><!-- End .mobile-nav -->
                </div><!-- .End .tab-pane -->
                <div class="tab-pane fade" id="mobile-cats-tab" role="tabpanel" aria-labelledby="mobile-cats-link">
                    <nav class="mobile-cats-nav">
                        <ul class="mobile-cats-menu">
                            <li><a href="#">Chính sách bảo mật</a></li>
                            <li><a href="#">Chính sách bảo hành - Đổi trả</a></li>
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
    <script src="${pageContext.request.contextPath}/assets/js/addToCart.js?v=<%= System.currentTimeMillis()%>"></script>
    <script>
        function updateCartDisplay() {
            var cartCountElement = document.getElementById('cart-count');
            var cartCount = cartCountElement ? (parseInt(cartCountElement.textContent.trim()) || 0) : 0;
            var cartAction = document.getElementById('cart-action');
            var cartItems = document.getElementById('cart-items');
            var cartPrice = document.getElementById('cart-price');

            if (cartCount === 0) {
                if (cartAction) cartAction.style.display = 'none';
                if (cartItems && cartItems.innerHTML.trim() === '') {
                    cartItems.innerHTML = '<p style="text-align: center; color: #777;">Giỏ hàng trống</p>';
                }
                if (cartPrice) cartPrice.textContent = '0 VNĐ';
            } else {
                if (cartAction) cartAction.style.display = 'block';
            }
        }

        // Gọi khi trang tải xong
        document.addEventListener('DOMContentLoaded', updateCartDisplay);

        // Gọi khi dropdown giỏ hàng được mở (sử dụng sự kiện Bootstrap)
        var cartDropdown = document.querySelector('.cart-dropdown .dropdown-menu');
        if (cartDropdown) {
            cartDropdown.addEventListener('shown.bs.dropdown', updateCartDisplay);
        }

        // Theo dõi thay đổi trên #cart-count (nếu addToCart.js cập nhật động)
        var observer = new MutationObserver(updateCartDisplay);
        var cartCountElement = document.getElementById('cart-count');
        if (cartCountElement) {
            observer.observe(cartCountElement, { childList: true, subtree: true });
        }
    </script>