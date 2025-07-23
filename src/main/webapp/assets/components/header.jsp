<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    </head>
    <header class="header header-intro-clearance header-4 p-3">
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
                    <button class="mobile-menu-toggler">
                        <span class="sr-only">Toggle mobile menu</span>
                        <i class="icon-bars"></i>
                    </button>
                    <a href="home" class="logo">
                        <img src="${pageContext.request.contextPath}/assets/images/logo/main-logo.jpg" alt="PhuongAnhStore" width="50" height="50">
                    </a>
                    <a href = "home"><span class="store-name">Phương Anh Store</span></a>
                </div><!-- End .header-left -->

                <%-- <div class="header-center">
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
                </div> --%>
                <div class="header-center">
                    <div class="header-search header-search-extended header-search-visible d-none d-lg-block">
                        <a href="#" class="search-toggle" role="button"><i class="icon-search"></i></a>
                        <form action="#" method="get">
                            <div class="header-search-wrapper search-wrapper-wide">
                                <label for="q" class="sr-only">Search</label>
                                <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
                                <input type="search" class="form-control" name="q" id="q" placeholder="Search product ..." required>
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
                                <div class="dropdown-menu dropdown-menu-right shadow-lg p-3 mb-5 bg-body rounded">
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
                                <span class="cart-count">2</span>
                            </div>
                            <p>Giỏ hàng</p>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right shadow-lg p-3 mb-5 bg-body rounded">

                            <div class="dropdown-cart-products">
                                <%-- <div class="product">
                                    <div class="product-cart-details">
                                        <h4 class="product-title">
                                            <a href="product.html">Beige knitted elastic runner shoes</a>
                                        </h4>

                                            <span class="cart-product-info">
                                                <span class="cart-product-qty">1</span>
                                                x $84.00
                                            </span>
                                        </div><!-- End .product-cart-details -->

                                        <figure class="product-image-container">
                                            <a href="product.html" class="product-image">
                                                <img src="assets/images/products/cart/product-1.jpg" alt="product">
                                            </a>
                                        </figure>
                                        <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                    </div><!-- End .product -->

                                    <div class="product">
                                        <div class="product-cart-details">
                                            <h4 class="product-title">
                                                <a href="product.html">Blue utility pinafore denim dress</a>
                                            </h4>

                                            <span class="cart-product-info">
                                                <span class="cart-product-qty">1</span>
                                                x $76.00
                                            </span>
                                        </div><!-- End .product-cart-details -->

                                        <figure class="product-image-container">
                                            <a href="product.html" class="product-image">
                                                <img src="assets/images/products/cart/product-2.jpg" alt="product">
                                            </a>
                                        </figure>
                                        <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                    </div><!-- End .product --> --%>
                            </div><!-- End .cart-product -->

                            <div class="dropdown-cart-total">
                                <span>Total</span>

                                <span class="cart-total-price">$160.00</span>
                            </div><!-- End .dropdown-cart-total -->

                            <div class="dropdown-cart-action">
                                <a href="cart.html" class="btn btn-primary">View Cart</a>
                                <a href="checkout.html" class="btn btn-outline-primary-2"><span>Checkout</span><i class="icon-long-arrow-right"></i></a>
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
                        <a href="#" class="dropdown-toggle rounded" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" title="Danh Mục Sản Ph">
                            Sản phẩm <i class="icon-angle-down"></i>
                        </a>
                        <div class="dropdown-menu rounded">
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
                <div class ="header-right">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user and (sessionScope.user.roleId == 1 or sessionScope.user.roleId == 2)}">    
                            <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-primary">Trang Quản Lý</a>
                        </c:when>
                    </c:choose>
                </div><!-- End .container -->
            </div><!-- End .header-bottom -->
    </header><!-- End .header -->