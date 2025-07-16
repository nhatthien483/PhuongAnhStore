<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
 </head>
    <header class="header header-intro-clearance header-4">
        <div class="header-top">
            <div class="container">
                <div class="header-left">
                    <a href="tel:#"><i class="icon-phone">Gọi ngay: </i><a href="tel:0901050697">0901050697</a></a>
                </div><!-- End .header-left -->
                <div class="header-right">
                </div><!-- End .header-right -->
            </div><!-- End .container -->
        </div><!-- End .header-top -->
        <div class="header-middle">
            <div class="container">
                <div class="header-left">
                    <a href="home" class="logo">
                        <img src="${pageContext.request.contextPath}/assets/images/logo/main-logo.jpg" alt="PhuongAnhStore" width="50" height="50">
                    </a>
                    <a href = "home"><span class="store-name">Phương Anh Store</span></a>
                </div><!-- End .header-left -->

                <div class="header-center">
                    <div class="header-search header-search-extended header-search-visible d-none d-lg-block">
                        <a href="#" class="search-toggle" role="button"><i class="icon-search"></i></a>
                        <form action="#" method="get">
                            <div class="header-search-wrapper search-wrapper-wide">
                                <label for="q" class="sr-only">Tìm kiếm</label>
                                <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
                                <input type="search" class="form-control" name="q" id="q" placeholder="Tìm kiếm sản phẩm..." required>
                            </div><!-- End .header-search-wrapper -->
                        </form>
                    </div><!-- End .header-search -->
                </div>
                <div class="header-right">
                    <nav class="main-nav">
                        <ul class="menu sf-arrows"> 
                            <c:choose>
                                <c:when test="${not empty sessionScope.user and (sessionScope.user.roleId == 1 or sessionScope.user.roleId == 2)}">    
                                    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-primary">Trang Quản Lý</a>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="#" class="sf-with-ul">Liên Hệ</a>
                                        <ul>
                                            <li><a href="about.html" class="sf-with-ul">Facebook</a></li>
                                            <li><a href="contact.html" class="sf-with-ul">Titok</a></li>
                                            <li><a href="login.html">Zalo</a></li>
                                        </ul>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul><!-- End .menu -->
                    </nav><!-- End .main-nav -->



                    <div class="dropdown cart-dropdown">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
                                    <div class="icon">
                                        <i class="icon-user"></i>
                                    </div>
                                    <p>Tài khoản</p>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <ul class="account-menu">
                                        <li><a href="${pageContext.request.contextPath}/profile">Thông tin tài khoản</a></li>
                                        <li><a href="${pageContext.request.contextPath}/orders">Đơn hàng của tôi</a></li>
                                        <li><a href="${pageContext.request.contextPath}/wishlist">Yêu thích</a></li>
                                        <li><a href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                                    </ul> <!-- End .account-menu -->
                                </div> <!-- End .dropdown-menu-->
                            </c:when>

                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/login">Đăng Nhập / Đăng Ký</a>
                            </c:otherwise>
                        </c:choose>
                    </div> <!-- End .cart-dropdown -->
                </div><!-- End .header-right -->
            </div><!-- End .container -->
        </div><!-- End .header-middle -->

        <div class="header-bottom sticky-header">
            <div class="container">
                <div class="header-left">
                    <div class="dropdown category-dropdown">
                        <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" title="Danh Mục Sản Ph">
                            Sản phẩm <i class="icon-angle-down"></i>
                        </a>
                        <div class="dropdown-menu">
                            <nav class="side-nav">
                                <ul class="menu-vertical sf-arrows">
                                    <li><a href="list-all-product">-- Tất Cả Sản Phẩm --</a></li>
                                    <li><a href="#">Phụ kiện sạc</a></li>
                                    <li><a href="#">Phụ kiện livestream - Chụp ảnh</a></li>
                                    <li><a href="#">Phụ kiện máy tính</a></li>
                                    <li><a href="#">Phụ kiện âm thanh</a></li>
                                    <li><a href="#">Thiết bị mạng</a></li>
                                    <li><a href="#">Phụ kiện ô tô - xe máy</a></li>
                                    <li><a href="#">Thiết bị chuyển đổi - hub chuyển đổi</a></li>
                                    <li><a href="#">Phụ kiện chơi game­</a></li>
                                    <li><a href="#">Ốp lưng - Cường lực</a></li>
                                    <li><a href="#">Phụ kiện khác</a></li>

                                </ul><!-- End .menu-vertical -->
                            </nav><!-- End .side-nav -->
                        </div><!-- End .dropdown-menu -->
                    </div><!-- End .category-dropdown -->
                </div><!-- End .header-left -->

                <div class="header-center">

                    <div class="dropdown cart-dropdown">
                        <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
                            <div class="icon">
                                <i class="icon-shopping-cart"></i>
                                <span class="cart-count">2</span>
                            </div>
                            <p>Giỏ hàng</p>
                        </a>
                    </div><!-- End .cart-dropdown -->
                </div><!-- End .header-center --> 
                <div class ="header-right">
                    <div class="dropdown compare-dropdown">
                        <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" title="So sÃ¡nh sáº£n pháº©m" aria-label="So sánh sản phẩm">
                            <div class="icon">
                                <i class="icon-random"></i>
                            </div>
                            <p>So sánh</p>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <ul class="compare-products">
                                <li class="compare-product">
                                    <a href="#" class="btn-remove" title="Xóa sản phẩm"><i class="icon-close"></i></a>
                                    <h4 class="compare-product-title"><a href="product.html">#</a></h4>
                                </li>
                                <li class="compare-product">
                                    <a href="#" class="btn-remove" title="Xóa sản phẩm"><i class="icon-close"></i></a>
                                    <h4 class="compare-product-title"><a href="product.html">#</a></h4>
                                </li>
                            </ul>
                            <div class="compare-actions">
                                <a href="#" class="action-link">Xóa tất cả</a>
                                <a href="#" class="btn btn-outline-primary-2"><span>So sánh</span><i class="icon-long-arrow-right"></i></a>
                            </div>
                        </div><!-- End .dropdown-menu -->
                    </div><!-- End .compare-dropdown -->
                    <div class="wishlist">
                        <a href="wishlist.html" title="Yêu thích">
                            <div class="icon">
                                <i class="icon-heart-o"></i>
                                <span class="wishlist-count badge">3</span>
                            </div>
                            <p>Yêu thích</p>
                        </a>
                    </div><!-- End .wishlist -->
                </div><!-- End .container -->
            </div><!-- End .header-bottom -->
    </header><!-- End .header -->