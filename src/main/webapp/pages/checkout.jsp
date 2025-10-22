<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <meta name="keywords" content="HTML5 Template">
    <meta name="description" content="Molla - Bootstrap eCommerce Template">
    <meta name="author" content="p-themes">
    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- Vietnamese Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Agbalumo&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="/assets/components/header.jsp" %>
    <div class="page-wrapper">
        <main class="main">
            <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
                <div class="container">
                    <h1 class="page-title">Trang Thanh Toán<span>PhuongAnhStore</span></h1>
                </div>
            </div>
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home">Trang Chủ</a></li>
                        <li class="breadcrumb-item"><a href="javascript:history.back()">Quay lại</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
                    </ol>
                </div>
            </nav>
            <div class="page-content">
                <div class="checkout">
                    <div class="container">
                        <div class="checkout-discount"></div>
                        <form id="checkout-form" action="${pageContext.request.contextPath}/checkout?action=confirm" method="post">
                            <div class="row">
                                <div class="col-lg-9">
                                    <h2 class="checkout-title">Chi Tiết Hóa Đơn</h2>
                                    <p>Nếu quý khách muốn thay đổi thông tin nhận hàng vui lòng vào <a href="${pageContext.request.contextPath}/profile">Trang cá nhân</a></p>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label>Họ và Tên</label>
                                            <input type="text" class="form-control" value="${user.fullName}" readonly>
                                        </div>
                                    </div>
                                    <label>Số Điện Thoại</label>
                                    <input type="text" class="form-control" name="phone" value="${user.phone}" readonly>
                                    <label>Địa chỉ email *</label>
                                    <input type="email" class="form-control" name="email" value="${user.email}" readonly>
                                    <label>Địa chỉ nhận hàng</label>
                                    <input type="text" class="form-control" name="address" value="${user.address}" readonly>
                                    <h3>Phương thức nhận hàng</h3>
                                    <div>
                                        <label><input type="radio" name="receiveMethod" value="GiaoHang" checked> Giao hàng tận nơi</label>
                                        <label><input type="radio" name="receiveMethod" value="NhanTaiCuaHang"> Nhận tại cửa hàng</label>
                                    </div>
                                </div>
                                <aside class="col-lg-3">
                                    <div class="summary">
                                        <h3 class="summary-title">Hóa Đơn Của Bạn</h3>
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
                                        <input type="hidden" name="paymentMethod" id="paymentMethod" value="">
                                        <div class="accordion-summary" id="accordion-payment">
                                            <div class="card">
                                                <div class="card-header" id="heading-1">
                                                    <h2 class="card-title">
                                                        <a role="button" data-toggle="collapse" href="#collapse-1" aria-expanded="true" aria-controls="collapse-1">
                                                            Thanh Toán Khi Nhận Hàng (COD)
                                                        </a>
                                                    </h2>
                                                </div>
                                                <div id="collapse-1" class="collapse show" aria-labelledby="heading-1" data-parent="#accordion-payment">
                                                    <div class="card-body">
                                                        Thanh toán COD do đơn vị vận chuyển thu hộ
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-header" id="heading-2">
                                                    <h2 class="card-title">
                                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-2" aria-expanded="false" aria-controls="collapse-2" id="show-qr">
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
                                                        <p>Quý khách chuyển khoản xong vui lòng đợi từ 10-30 phút (giờ làm việc) để đơn hàng được xử lý.<br>Nếu có sự cố vui lòng liên hệ hotline: 0901050697</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-header" id="heading-3">
                                                    <h2 class="card-title">
                                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-3" aria-expanded="false" aria-controls="collapse-3">
                                                            Thanh Toán Tại Cửa Hàng
                                                        </a>
                                                    </h2>
                                                </div>
                                                <div id="collapse-3" class="collapse" aria-labelledby="heading-3" data-parent="#accordion-payment">
                                                    <div class="card-body">
                                                        Thanh toán trực tiếp khi nhận hàng tại cửa hàng
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-outline-primary-2 btn-order btn-block">
                                            <span class="btn-text">Thanh Toán</span>
                                            <span class="btn-hover-text">Tiến Hành Thanh Toán</span>
                                        </button>
                                    </div>
                                </aside>
                            </div>
                        </form>
                    </div>
                </div>
            </main>
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
                // Initialize payment options on page load
                updatePaymentOptions();

                // QR Code handling
                document.getElementById("show-qr").addEventListener("click", function (e) {
                    e.preventDefault();
                    const receiveMethod = document.querySelector('input[name="receiveMethod"]:checked').value;
                    fetch("<%=request.getContextPath()%>/qr-gen?format=json&t=" + new Date().getTime())
                        .then(res => {
                            if (!res.ok) throw new Error("QR generation failed");
                            return res.json();
                        })
                        .then(data => {
                            document.getElementById("qr-image").src = "data:image/png;base64," + data.base64;
                            window.paymentId = data.addInfo;
                            window.receiveMethod = receiveMethod; // Store for confirm-payment
                            $('#qrModal').modal('show');
                        })
                        .catch(err => {
                            console.error("QR fetch error:", err);
                            alert("Không thể tạo mã QR. Vui lòng thử lại sau.");
                        });
                    setTimeout(function () {
                        $('#qrModal').modal('hide');
                    }, 900000); // 15 minutes
                });

                document.getElementById("confirm-payment").addEventListener("click", function () {
                    if (!window.paymentId || !window.receiveMethod) {
                        console.error("Payment ID or receive method missing");
                        alert("Lỗi: Vui lòng thử lại quy trình thanh toán.");
                        return;
                    }
                    $('#qrModal').modal('hide');
                    fetch("<%=request.getContextPath()%>/set-payment-flag?paymentId=" + encodeURIComponent(window.paymentId))
                        .then(response => {
                            if (!response.ok) throw new Error("Set payment flag failed");
                            return response.text();
                        })
                        .then(data => {
                            document.getElementById('paymentMethod').value = "CK_" + (window.receiveMethod === "GiaoHang" ? "SHIP" : "STORE");
                            console.log("Set paymentMethod to: " + document.getElementById('paymentMethod').value);
                            alert("Cảm ơn bạn đã thanh toán! Đơn hàng sẽ được xử lý trong 10-20 phút (giờ làm việc).");
                            document.getElementById('checkout-form').submit();
                        })
                        .catch(err => {
                            console.error("Set payment flag error:", err);
                            alert("Lỗi khi xác nhận thanh toán. Vui lòng thử lại.");
                        });
                });

                // Update payment options based on receive method
                document.querySelectorAll('input[name="receiveMethod"]').forEach(radio => {
                    radio.addEventListener('change', updatePaymentOptions);
                });

                function updatePaymentOptions() {
                    const receive = document.querySelector('input[name="receiveMethod"]:checked').value;
                    const codHeading = document.getElementById('heading-1');
                    const transferHeading = document.getElementById('heading-2');
                    const storeHeading = document.getElementById('heading-3');
                    if (receive === 'GiaoHang') {
                        codHeading.style.display = 'block';
                        transferHeading.style.display = 'block';
                        storeHeading.style.display = 'none';
                        $('#collapse-3').collapse('hide');
                        $('#collapse-1').collapse('show');
                    } else {
                        codHeading.style.display = 'none';
                        transferHeading.style.display = 'block';
                        storeHeading.style.display = 'block';
                        $('#collapse-1').collapse('hide');
                        $('#collapse-3').collapse('show');
                    }
                    // Clear paymentMethod to force re-selection
                    document.getElementById('paymentMethod').value = '';
                }

                // Form submission validation
                document.getElementById('checkout-form').addEventListener('submit', function (e) {
                    const pm = document.getElementById('paymentMethod').value;
                    const receive = document.querySelector('input[name="receiveMethod"]:checked')?.value;
                    if (!receive) {
                        console.error("No receive method selected");
                        alert('Vui lòng chọn phương thức nhận hàng.');
                        e.preventDefault();
                        return;
                    }
                    if (!pm) {
                        if (document.querySelector('#collapse-1.show')) {
                            if (receive !== 'GiaoHang') {
                                console.error("Invalid combination: COD with " + receive);
                                alert('Phương thức thanh toán COD chỉ áp dụng cho giao hàng tận nơi.');
                                e.preventDefault();
                                return;
                            }
                            document.getElementById('paymentMethod').value = 'COD';
                        } else if (document.querySelector('#collapse-3.show')) {
                            if (receive !== 'NhanTaiCuaHang') {
                                console.error("Invalid combination: TM_STORE with " + receive);
                                alert('Phương thức thanh toán tại cửa hàng chỉ áp dụng cho nhận tại cửa hàng.');
                                e.preventDefault();
                                return;
                            }
                            document.getElementById('paymentMethod').value = 'TM_STORE';
                        } else if (document.querySelector('#collapse-2.show')) {
                            document.getElementById('paymentMethod').value = 'CK_' + (receive === 'GiaoHang' ? 'SHIP' : 'STORE');
                        } else {
                            console.error("No payment method selected");
                            alert('Vui lòng chọn phương thức thanh toán.');
                            e.preventDefault();
                            return;
                        }
                    }
                    // Additional validation
                    if (!['COD', 'CK_SHIP', 'CK_STORE', 'TM_STORE'].includes(document.getElementById('paymentMethod').value)) {
                        console.error("Invalid paymentMethod on submit: " + document.getElementById('paymentMethod').value);
                        alert('Phương thức thanh toán không hợp lệ.');
                        e.preventDefault();
                    } else {
                        console.log("Submitting with paymentMethod: " + document.getElementById('paymentMethod').value);
                    }
                });
            </script>
        </div>
    </body>
</html>