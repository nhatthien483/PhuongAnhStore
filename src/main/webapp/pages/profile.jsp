<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">


<!-- molla/dashboard.html  22 Nov 2019 10:03:13 GMT -->
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

    <meta name="keywords" content="HTML5 Template">
    <meta name="description" content="Molla - Bootstrap eCommerce Template">
    <meta name="author" content="p-themes">

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!--Vienamese-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Agbalumo&display=swap" rel="stylesheet">
</head>
<%@ include file="/assets/components/header.jsp" %>
<body>
    <div class="page-wrapper">
		<c:if test="${not empty message}">
    		<div class="alert alert-info d-flex justify-content-center">${message}</div>
		</c:if>
        <main class="main">
        	<div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
        		<div class="container">
        			<h1 class="page-title">Tài Khoản Của Tôi<span>Phương Anh Store</span></h1>
        		</div><!-- End .container -->
        	</div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav mb-3">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home">Trang Chủ</a></li>
						<li class="breadcrumb-item"><a href="javascript:history.back()">Quay lại</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Thông tin tài khoản</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
            	<div class="dashboard">
	                <div class="container">
	                	<div class="row">
	                		<aside class="col-md-4 col-lg-3">
	                			<ul class="nav nav-dashboard flex-column mb-3 mb-md-0" role="tablist">
								    <%-- <li class="nav-item">
								        <a class="nav-link active" id="tab-dashboard-link" data-toggle="tab" href="#tab-dashboard" role="tab" aria-controls="tab-dashboard" aria-selected="true">Dashboard</a>
								    </li> --%>
								    <li class="nav-item">
								        <a class="nav-link active" id="tab-orders-link" data-toggle="tab" href="#tab-orders" role="tab" aria-controls="tab-orders" aria-selected="true">Đơn hàng của tôi</a>
								    </li>
								    <%-- <li class="nav-item">
								        <a class="nav-link" id="tab-downloads-link" data-toggle="tab" href="#tab-downloads" role="tab" aria-controls="tab-downloads" aria-selected="false">Downloads</a>
								    </li> --%>
								    <li class="nav-item">
								        <a class="nav-link" id="tab-address-link" data-toggle="tab" href="#tab-address" role="tab" aria-controls="tab-address" aria-selected="false">Thông tin đặt hàng</a>
								    </li>
								    <li class="nav-item">
								        <a class="nav-link" id="tab-account-link" data-toggle="tab" href="#tab-account" role="tab" aria-controls="tab-account" aria-selected="false">Đổi mật khẩu</a>
								    </li>
								    <li class="nav-item">
								        <a class="nav-link" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
								    </li>
								</ul>
	                		</aside><!-- End .col-lg-3 -->

	                		<div class="col-md-8 col-lg-9">
	                			<div class="tab-content">
								    <%-- <div class="tab-pane fade show active" id="tab-dashboard" role="tabpanel" aria-labelledby="tab-dashboard-link">
								    	<p>Hello <span class="font-weight-normal text-dark">User</span> (not <span class="font-weight-normal text-dark">User</span>? <a href="#">Log out</a>) 
								    	<br>
								    	From your account dashboard you can view your <a href="#tab-orders" class="tab-trigger-link link-underline">recent orders</a>, manage your <a href="#tab-address" class="tab-trigger-link">shipping and billing addresses</a>, and <a href="#tab-account" class="tab-trigger-link">edit your password and account details</a>.</p>
								    </div><!-- .End .tab-pane --> --%>

								    <div class="tab-pane fade show active" id="tab-orders" role="tabpanel" aria-labelledby="tab-orders-link">
								    	<p>Không có đơn hàng nào!</p>
								    	<a href="${pageContext.request.contextPath}/list-all-product" class="btn btn-outline-primary-2"><span>Đi đến cửa hàng</span><i class="icon-long-arrow-right"></i></a>
								    </div><!-- .End .tab-pane -->

								    <%-- <div class="tab-pane fade" id="tab-downloads" role="tabpanel" aria-labelledby="tab-downloads-link">
								    	<p>No downloads available yet.</p>
								    	<a href="category.html" class="btn btn-outline-primary-2"><span>GO SHOP</span><i class="icon-long-arrow-right"></i></a>
								    </div><!-- .End .tab-pane --> --%>

								    <div class="tab-pane fade" id="tab-address" role="tabpanel" aria-labelledby="tab-address-link">
								    	<p>Thông tin tài khoản</p>

								    	<div class="row">
								    		<div class="col-lg-6">
												<div class="card card-dashboard">
													<div class="card-body">
														<h3 class="card-title">Chỉnh sửa thông tin cá nhân</h3>
														<form action="${pageContext.request.contextPath}/profile" method="post">
															<input type="hidden" name="action" value="updateProfile">
															<div class="form-group">
																<label for="fullName">Họ và Tên</label>
																<input type="text" id="fullName" name="fullName" value="${user.getFullName()}" class="form-control" required>
															</div>
															<div class="form-group">
																<label for="email">Email</label>
																<input type="email" id="email" name="email" value="${user.email}" class="form-control" required>
															</div>
															<div class="form-group">
																<label for="phone">Số điện thoại</label>
																<input type="text" id="phone" name="phone" value="${user.phone}" class="form-control" required>
															</div>
															<button type="submit" class="btn btn-primary">Cập nhật</button>
														</form>
													</div>
												</div>
											</div>

								    		<div class="col-lg-6">
												<div class="card card-dashboard">
													<div class="card-body">
														<h3 class="card-title">Địa chỉ giao hàng</h3><!-- End .card-title -->
														<p>${user.address}<br>
															<a href="#" id="edit-address-btn">Chỉnh sửa <i class="icon-edit"></i></a>
														</p>
														<form id="edit-address-form" action="${pageContext.request.contextPath}/profile" method="doget" style="display: none;">
															<input type="hidden" name="action" value="address">
															<input type="text" name="newAddress" placeholder="Nhập địa chỉ mới" class="form-control mb-2" required>
															<button type="submit" class="btn btn-primary">Cập nhật</button>
														</form>
													</div><!-- End .card-body -->
												</div><!-- End .card-dashboard -->
											</div><!-- End .col-lg-6 -->
								    	</div><!-- End .row -->
								    </div><!-- .End .tab-pane -->

								    <div class="tab-pane fade" id="tab-account" role="tabpanel" aria-labelledby="tab-account-link">
										<form action="${pageContext.request.contextPath}/profile" method="post">
											<input type="hidden" name="action" value="changePassword">
											<div class="form-group">
												<label for="currentPassword">Mật khẩu hiện tại</label>
												<input type="password" id="currentPassword" name="currentPassword" class="form-control" required>
											</div>
											<div class="form-group">
												<label for="newPassword">Mật khẩu mới</label>
												<input type="password" id="newPassword" name="newPassword" class="form-control" required>
											</div>
											<div class="form-group">
												<label for="confirmPassword">Xác nhận mật khẩu mới</label>
												<input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
											</div>
											<button type="submit" class="btn btn-primary">Cập nhật mật khẩu</button>
										</form>
									</div>
								</div>
	                		</div><!-- End .col-lg-9 -->
	                	</div><!-- End .row -->
	                </div><!-- End .container -->
                </div><!-- End .dashboard -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->

    <%@ include file="/assets/components/footer.jsp" %>
        
    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>
    <!-- Plugins JS File -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/jquery.hoverIntent.min.js"></script>
    <script src="assets/js/jquery.waypoints.min.js"></script>
    <script src="assets/js/superfish.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
	<script>
		document.getElementById('edit-address-btn').addEventListener('click', function (e) {
			e.preventDefault();
			document.getElementById('edit-address-form').style.display = 'block';
			this.style.display = 'none';
		});
	</script>
</body>


<!-- molla/dashboard.html  22 Nov 2019 10:03:13 GMT -->
</html>