<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">


<!-- molla/checkout.html  22 Nov 2019 09:55:06 GMT -->
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
        <main class="main">
        	<div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
        		<div class="container">
        			<h1 class="page-title">Checkout<span>Shop</span></h1>
        		</div><!-- End .container -->
        	</div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <div class="container">
                    <ol class="breadcrumb">
                         <li class="breadcrumb-item"><a href="home">Trang Chủ</a></li>
						<li class="breadcrumb-item"><a href="javascript:history.back()">Quay lại</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
            	<div class="checkout">
	                <div class="container">
            			<div class="checkout-discount">
            				<form action="#">
        						<input type="text" class="form-control" required id="checkout-discount-input">
            					<label for="checkout-discount-input" class="text-truncate">Phiếu giảm giá <span>Nhập phiếu giảm giá của bạn tại đây</span></label>
            				</form>
            			</div><!-- End .checkout-discount -->
            			<form action="#">
		                	<div class="row">
		                		<div class="col-lg-9">
		                			<h2 class="checkout-title">Chi Tiết Hóa Đơn</h2><!-- End .checkout-title -->
		                				<div class="row">
		                					<div class="col-sm-6">
		                						<label>Họ và Tên</label>
		                						<input type="text" class="form-control" value="${user.fullName}" required>
		                					</div><!-- End .col-sm-6 -->
		                				</div><!-- End .row -->

	            						<label>Tỉnh / Thành phố *</label>
                                        <select id="province" class="form-control" required>
                                            <option value="">Chọn tỉnh / thành phố</option>
                                        </select>

                                        <label>Quận / Huyện *</label>
                                        <select id="district" class="form-control" required>
                                            <option value="">Chọn quận / huyện</option>
                                        </select>

                                        <label>Phường / Xã *</label>
                                        <select id="ward" class="form-control" required>
                                            <option value="">Chọn phường / xã</option>
                                        </select>

                                        <label>Số nhà, tên đường, số lô - block, ...</label>
		                				<input type="text" class="form-control" required>

	                					<label>Địa chỉ email *</label>
	        							<input type="email" class="form-control" name="email" value="${user.email}" required>

										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="checkout-diff-address">
											<label class="custom-control-label" for="checkout-diff-address">Địa chỉ nhận hàng khác?</label>
										</div><!-- End .custom-checkbox -->
	                					<label>Ghi chú</label>
	        							<textarea class="form-control" cols="30" rows="4" placeholder="Ghi chú về các yêu cầu của bạn đối với đơn hàng"></textarea>
		                		</div><!-- End .col-lg-9 -->
		                		<aside class="col-lg-3">
		                			<div class="summary">
		                				<h3 class="summary-title">Hóa Đơn Của Bạn</h3><!-- End .summary-title -->

		                				<table class="table table-summary">
		                					<thead>
		                						<tr>
		                							<th>Sản phẩm</th>
		                							<th>Đơn giá</th>
		                						</tr>
		                					</thead>

		                					<tbody>
                                            
		                						<tr>
		                							<td><a href="#">Beige knitted elastic runner shoes</a></td>
		                							<td>$84.00</td>
		                						</tr>

		                						
		                					</tbody>
		                				</table><!-- End .table table-summary -->

		                				<div class="accordion-summary" id="accordion-payment">
										    <div class="card">
										        <div class="card-header" id="heading-1">
										            <h2 class="card-title">
										                <a role="button" data-toggle="collapse" href="#collapse-1" aria-expanded="true" aria-controls="collapse-1">
										                    Thanh Toán Khi Nhận Hàng
										                </a>
										            </h2>
										        </div><!-- End .card-header -->
										        <div id="collapse-1" class="collapse show" aria-labelledby="heading-1" data-parent="#accordion-payment">
										            <div class="card-body">
										                Thanh toán COD do đơn vị vận chuyển thu hộ
										            </div><!-- End .card-body -->
										        </div><!-- End .collapse -->
										    </div><!-- End .card -->

										    <div class="card">
										        <div class="card-header" id="heading-2">
										            <h2 class="card-title">
										                <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-2" aria-expanded="false" aria-controls="collapse-2">
										                    Chuyển khoản ngân hàng (QR Code)
										                </a>
										            </h2>
										        </div><!-- End .card-header -->
										        <div id="collapse-2" class="collapse" aria-labelledby="heading-2" data-parent="#accordion-payment">
										            <div class="card-body">
										                Số tiền và nội dung đã được định sẵn tại QR Code 
										            </div><!-- End .card-body -->
										        </div><!-- End .collapse -->
										    </div><!-- End .card -->									
										</div><!-- End .accordion -->

		                				<button type="submit" class="btn btn-outline-primary-2 btn-order btn-block">
		                					<span class="btn-text">Thanh Toán</span>
		                					<span class="btn-hover-text">Tiến Hành Thanh Toán</span>
		                				</button>
		                			</div><!-- End .summary -->
		                		</aside><!-- End .col-lg-3 -->
		                	</div><!-- End .row -->
            			</form>
	                </div><!-- End .container -->
                </div><!-- End .checkout -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->

    <%@ include file="/assets/components/footer.jsp" %>

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
        document.addEventListener("DOMContentLoaded", function () {
            const provinceSelect = document.getElementById("province");
            const districtSelect = document.getElementById("district");
            const wardSelect = document.getElementById("ward");

            // Load Tỉnh
            fetch("https://provinces.open-api.vn/api/?depth=3")
                .then(response => response.json())
                .then(data => {
                    data.forEach(province => {
                        const option = document.createElement("option");
                        option.value = province.code;
                        option.textContent = province.name;
                        option.dataset.districts = JSON.stringify(province.districts); // lưu quận
                        provinceSelect.appendChild(option);
                    });
                });

            // Khi chọn tỉnh
            provinceSelect.addEventListener("change", function () {
                const selectedOption = this.options[this.selectedIndex];
                const districts = JSON.parse(selectedOption.dataset.districts || "[]");

                // Reset
                districtSelect.innerHTML = '<option value="">Chọn quận / huyện</option>';
                wardSelect.innerHTML = '<option value="">Chọn phường / xã</option>';

                // Đổ quận
                districts.forEach(district => {
                    const option = document.createElement("option");
                    option.value = district.code;
                    option.textContent = district.name;
                    option.dataset.wards = JSON.stringify(district.wards); // lưu phường
                    districtSelect.appendChild(option);
                });
            });

            // Khi chọn quận
            districtSelect.addEventListener("change", function () {
                const selectedOption = this.options[this.selectedIndex];
                const wards = JSON.parse(selectedOption.dataset.wards || "[]");

                // Reset
                wardSelect.innerHTML = '<option value="">Chọn phường / xã</option>';

                // Đổ phường
                wards.forEach(ward => {
                    const option = document.createElement("option");
                    option.value = ward.code;
                    option.textContent = ward.name;
                    wardSelect.appendChild(option);
                });
            });
        });
    </script>





</body>


<!-- molla/checkout.html  22 Nov 2019 09:55:06 GMT -->
</html>