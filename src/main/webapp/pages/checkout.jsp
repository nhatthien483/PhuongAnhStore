<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <h1 class="page-title">Trang Thanh Toán<span>PhuongAnhStore</span></h1>
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
                            </div><!-- End .checkout-discount -->
                                <div class="row">
                                    <div class="col-lg-9">
                                        <h2 class="checkout-title">Chi Tiết Hóa Đơn</h2><!-- End .checkout-title -->
                                        <p>Nếu quý khách muốn thay đổi thông tin nhận hàng vui lòng vào <a href="${pageContext.request.contextPath}/profile">Trang cá nhân</a></p>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>Họ và Tên</label>
                                                <input type="text" class="form-control" value="${user.fullName}" readonly>
                                            </div><!-- End .col-sm-6 -->
                                        </div><!-- End .row -->

                                        <label>Số Điện Thoại</label>
                                        <input type="text" class="form-control" name="phone" value="${user.phone}" readonly>

                                        <label>Địa chỉ email *</label>
                                        <input type="email" class="form-control" name="email" value="${user.email}" readonly>

                                        <label>Địa chỉ nhận hàng</label>
                                        <input type="text" class="form-control" name="" value="${user.address}" readonly>

                                        <label>Ghi chú</label>
                                        <textarea class="form-control" cols="30" rows="4" placeholder="Ghi chú về các yêu cầu của bạn đối với đơn hàng"></textarea>
                                    </div><!-- End .col-lg-9 -->                                  
                                    <aside class="col-lg-3">
                                        <div class="summary">
                                            <h3 class="summary-title">Hóa Đơn Của Bạn</h3><!-- End .summary-title -->
                                            <h4 style="color: #39f">
                                                <strong>Tổng hóa đơn:</strong> 
                                                <c:choose>
                                                    <c:when test="${not empty totalPriceDiscount}">
                                                        <fmt:formatNumber value="${totalPriceDiscount}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </h4>
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
                                                            <a class="collapsed" role="button" data-toggle="collapse"
                                                               href="#collapse-2" aria-expanded="false" aria-controls="collapse-2" id="show-qr">
                                                                Chuyển khoản ngân hàng (QR Code)
                                                            </a>
                                                        </h2>
                                                        <div class="modal fade" id="qrModal" tabindex="-1" role="dialog" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title">Quét QR Code để thanh toán</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Đóng">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body text-center">
                                                                        <p><strong>Quý khách chuyển khoản xong vui lòng bấm xác nhận.</strong><br>
                                                                            Nếu có sự cố vui lòng liên hệ hotline: 0901050697</p>
                                                                        <img id="qr-image" src="" alt="QR Code" style="max-width:200px; margin:10px auto; display:block;">
                                                                        <button id="confirm-payment" class="btn btn-success mt-3">Xác nhận đã thanh toán</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="collapse-2" class="collapse" aria-labelledby="heading-2" data-parent="#accordion-payment">
                                                        <div class="card-body" style="text-align:center;">
                                                            <p>Quý khách chuyển khoản xong vui lòng đợi từ 5-15 phút (giờ làm việc) để đơn hàng được xử lý.<br>Nếu có sự cố vui lòng liên hệ hotline: 0901050697</p>
                                                            <div id="qr-container" style="display:none;">
                                                                <img id="qr-image" src="" alt="QR Code" style="max-width:200px;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <script>
                                                    document.getElementById("show-qr").addEventListener("click", function (e) {
                                                        e.preventDefault();
                                                        // set QR image
                                                        document.getElementById("qr-image").src = "<%=request.getContextPath()%>/qr-gen?t=" + new Date().getTime();
                                                        // show modal
                                                        $('#qrModal').modal('show');
                                                        // auto close after 15m
                                                        setTimeout(function () {
                                                            $('#qrModal').modal('hide');
                                                        }, 900000);
                                                    });
                                                    document.getElementById("confirm-payment").addEventListener("click", function () {
                                                        // Đóng modal trước
                                                        $('#qrModal').modal('hide');
                                                        // Thông báo
                                                        alert("Cảm ơn bạn đã thanh toán! Đơn hàng sẽ được xử lý trong 10-20 phút (giờ làm việc).");
                                                        // Chuyển hướng đến servlet (ví dụ PaymentServlet)
                                                        window.location.href = "<%=request.getContextPath()%>/checkout?action=confirm";
                                                    });
                                                </script>							
                                            </div><!-- End .accordion -->
                                            <button type="submit" class="btn btn-outline-primary-2 btn-order btn-block">
                                                <a href="${pageContext.request.contextPath}/checkout?action=confirm" style="color: white" class="btn-text">Thanh Toán</a>
                                                <a href="${pageContext.request.contextPath}/checkout?action=confirm"style="color: white" class="btn-hover-text">Tiến Hành Thanh Toán</a>
                                            </button>
                                        </div><!-- End .summary -->
                                    </aside><!-- End .col-lg-3 -->
                                </div><!-- End .row -->
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
                document.getElementById('checkout-diff-address').addEventListener('change', function () {
                    const addressSelection = document.getElementById('address-selection');
                    addressSelection.style.display = this.checked ? 'block' : 'none';
                });

                document.getElementById('save-address-btn').addEventListener('click', function (e) {
                    e.preventDefault(); // tránh reload form chính
                    
                    const province = document.getElementById('province').options[document.getElementById('province').selectedIndex].text;
                    const district = document.getElementById('district').options[document.getElementById('district').selectedIndex].text;
                    const ward = document.getElementById('ward').options[document.getElementById('ward').selectedIndex].text;
                    const street = document.getElementById('street').value.trim();

                    if (!province || !district || !ward || !street) {
                        alert("Vui lòng chọn đầy đủ thông tin địa chỉ.");
                        return;
                    }

                    const fullAddress = `${street}, ${ward}, ${district}, ${province}`;

                    // Gán vào input hidden
                    document.getElementById("newAddress").value = fullAddress;

                    // Submit form ẩn
                    document.getElementById("edit-address-form").submit();
                });
            </script>
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
</html>