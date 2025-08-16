<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">


<!-- molla/cart.html  22 Nov 2019 09:55:06 GMT -->
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!--Vienamese-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Agbalumo&display=swap" rel="stylesheet">

</head>
<%@ include file="/assets/components/header.jsp" %>
<body>
        <main class="main">
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home">Trang Chủ</a></li>
						<li class="breadcrumb-item"><a href="javascript:history.back()">Quay lại</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->
            <div class="page-content">
            	<div class="cart">
	                <div class="container">
	                	<div class="row">
	                		<div class="col-lg-9">
	                			<table class="table table-cart table-mobile">
									<thead>
										<tr>
											<th>Sản Phẩm</th>
											<th>Đơn Giá</th>
											<th>Số lượng</th>
											<th>Thành tiền</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="cart-body">
                                    										
									</tbody>
								</table><!-- End .table table-wishlist -->

	                			<div class="cart-bottom">
			            			<div class="cart-discount">
			            				<form id="voucher-form">
											<div class="input-group">
												<input type="text" name="voucher" id="voucher" class="form-control" required placeholder="Phiếu giảm giá">
												<div class="input-group-append">
													<button class="btn btn-outline-primary-2" type="submit">
														<i class="icon-long-arrow-right"></i>
													</button>
												</div>
											</div>
										</form>

			            			</div><!-- End .cart-discount -->

			            			<a href="CartManagementServlet" class="btn btn-outline-dark-2"><span>Tải Lại Giỏ</span><i class="icon-refresh"></i></a>
		            			</div><!-- End .cart-bottom -->
	                		</div><!-- End .col-lg-9 -->
	                		<aside class="col-lg-3">
	                			<div class="summary summary-cart">
	                				<h3 class="summary-title"><strong>Đơn Hàng</strong></h3><!-- End .summary-title -->

	                				<table class="table table-summary">
	                					<tbody>
	                						<tr class="summary-subtotal">
	                							<td>Tạm tính:</td>
	                							<td id="cart-cart-price" style="color: #39f;"></td>
	                						</tr><!-- End .summary-subtotal -->
           						
											<tr class="summary-shipping-estimate">
												<td><strong>Giảm giá (nếu có):</strong></td>
												<td id="discount-info" style="color:red;"></td>
											</tr>	                											
	                						<tr class="summary-total">
												<td><strong>Tổng sau giảm (nếu có):</strong></td>
												<td><span id="cart-total-after-discount"></span></td>
											</tr>
	                					</tbody>
	                				</table><!-- End .table table-summary -->

	                				<a href="${pageContext.request.contextPath}/checkout" class="btn btn-outline-primary-2 btn-order btn-block">THANH TOÁN</a>
	                			</div><!-- End .summary -->

		            			<a href="list-all-product" class="btn btn-outline-dark-2 btn-block mb-3"><span>TIẾP TỤC MUA SẮM</span><i class="icon-refresh"></i></a>
	                		</aside><!-- End .col-lg-3 -->
	                	</div><!-- End .row -->
	                </div><!-- End .container -->
                </div><!-- End .cart -->
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
    <script src="${pageContext.request.contextPath}/assets/js/cart.js?v=<%= System.currentTimeMillis()%>"></script>
	<script>
		document.querySelector("#voucher-form").addEventListener("submit", function(e) {
			e.preventDefault();
			const code = document.querySelector("#voucher").value;

			fetch("voucher?action=check&code=" + encodeURIComponent(code))
				.then(res => res.json())
				.then(data => {
					console.log(data); // debug
					const discountInfoEl = document.getElementById("discount-info");
					const cartCartPriceEl = document.getElementById("cart-cart-price");
					const totalAfterDiscountEl = document.getElementById("cart-total-after-discount");
					console.log("discountPercent:", data.discountPercent);
					console.log("discountAmount:", data.discountAmount);
					console.log("discountInfoEl:", discountInfoEl);
					console.log("totalAfterDiscountEl:", totalAfterDiscountEl);
					if (data.valid) {
						alert(`Áp dụng thành công! Giảm: ` + data.discountPercent + "% (" + data.discountAmount + "đ)");
						// Hiển thị thông tin giảm giá
						if (discountInfoEl) {
							discountInfoEl.innerText = data.discountPercent + "% (" + data.discountAmount + "đ)";
						}

						// Hiển thị tổng sau giảm
						if (totalAfterDiscountEl) {
							totalAfterDiscountEl.innerText = data.totalFormatted + " đ";
						}
					} else {
						alert(data.message || "Mã giảm giá không hợp lệ hoặc đã hết hạn.");

						// Không có giảm giá → lấy giá tạm tính làm tổng sau giảm
						if (discountInfoEl) {
							discountInfoEl.innerText = "";
						}
						if (totalAfterDiscountEl && cartCartPriceEl) {
							totalAfterDiscountEl.innerText = cartCartPriceEl.innerText;
						}
					}
				})
				.catch(err => console.error(err));
		});
	</script>
</body>
</html>