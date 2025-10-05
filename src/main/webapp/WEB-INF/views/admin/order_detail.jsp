<%-- order-detail.jsp --%>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <!--Vienamese-->
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Agbalumo&display=swap" rel="stylesheet">
        <style>
        body {
            background-color: #f8f9fa;
        }
        .card-header {
            background-color: #e9ecef;
        }
        .item-total {
            font-weight: bold;
        }
        </style>
        </head>
        <%@ include file="/assets/components/header.jsp" %>
<body>
    <div class="container my-5">
        <h2 class="mb-4">Chi Tiết Đơn Hàng #${order.orderId}</h2>
        
        <div class="row">
            <!-- Thông tin đơn hàng -->
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <h5>Thông Tin Đơn Hàng</h5>
                    </div>
                    <div class="card-body">
                        <p><strong>Ngày Đặt:</strong> <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/></p>
                        <p><strong>Trạng Thái:</strong> 
                            <c:choose>
                                <c:when test="${order.status eq 'DaXacNhan'}"><span class="badge bg-primary text-white">Đã Xác Nhận</span></c:when>
                                <c:when test="${order.status eq 'ChoXacNhan'}"><span class="badge bg-warning text-dark text-white">Chờ Xác Nhận</span></c:when>
                                <c:when test="${order.status eq 'HoanThanh'}"><span class="badge bg-success text-white">Hoàn Thành</span></c:when>
                                <c:when test="${order.status eq 'DaHuy'}"><span class="badge bg-danger text-white">Đã Hủy</span></c:when>
                                <c:when test="${order.status eq 'DangVanChuyen'}"><span class="badge bg-info text-white">Đang Vận Chuyển</span></c:when>
                                <c:otherwise><span class="badge bg-secondary">${order.status}</span></c:otherwise>
                            </c:choose>
                        </p>
                        <p><strong>Tổng Tiền:</strong> <fmt:formatNumber value="${order.price}" type="currency" currencySymbol="₫" groupingUsed="true"/></p>
                        <p><strong>Mã Giảm Giá:</strong> ${order.voucherId > 0 ? order.voucherId : 'Không'}</p>
                        <p><strong>Số Tiền Cần Thanh Toán:</strong> <fmt:formatNumber value="${order.payment.amount}" type="currency" currencySymbol="₫" groupingUsed="true"/></p>
                    </div>
                </div>
                
                <!-- Thông tin thanh toán -->
                <div class="card mb-4">
                    <div class="card-header">
                        <h5>Thông Tin Thanh Toán</h5>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty order.payment}">
                            <p><strong>Phương Thức:</strong> ${order.payment.method}</p>
                            <p><strong>Trạng Thái:</strong> ${order.payment.status}</p>
                            <p><strong>Số Tiền:</strong> <fmt:formatNumber value="${order.payment.amount}" type="currency" currencySymbol="₫" groupingUsed="true"/></p>
                            <p><strong>Ngày Thanh Toán:</strong> <fmt:formatDate value="${order.payment.date}" pattern="dd/MM/yyyy HH:mm"/></p>
                            <p><strong>Mã Giao Dịch:</strong> ${order.payment.transactionId}</p>
                        </c:if>
                        <c:if test="${empty order.payment}">
                            <p class="text-muted">Chưa có thông tin thanh toán.</p>
                        </c:if>
                    </div>
                </div>
            </div>
            
            <!-- Thông tin người nhận -->
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <h5>Thông Tin Người Nhận</h5>
                    </div>
                    <div class="card-body">
                        <p><strong>Tên:</strong> ${order.user.fullName}</p>
                        <p><strong>Email:</strong> ${order.user.email}</p>
                        <p><strong>Số Điện Thoại:</strong> ${order.user.phone}</p>
                        <p><strong>Địa Chỉ:</strong> ${order.user.address}</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Danh sách sản phẩm -->
        <div class="card">
            <div class="card-header">
                <h5>Sản Phẩm Trong Đơn Hàng</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead class="table-light">
                            <tr>
                                <th>Sản Phẩm</th>
                                <th>Giá</th>
                                <th>Số Lượng</th>
                                <th>Tổng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${order.orderDetails}">
                                <tr>
                                    <td>${item.nameSnapshot}</td>
                                    <td><fmt:formatNumber value="${item.priceSnapshot}" type="currency" currencySymbol="₫" groupingUsed="true"/></td>
                                    <td>${item.quantity}</td>
                                    <td class="item-total"><fmt:formatNumber value="${item.subtotal}" type="currency" currencySymbol="₫" groupingUsed="true"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="3" class="text-end"><strong>Tổng Cộng:</strong></td>
                                <td class="item-total"><fmt:formatNumber value="${order.price}" type="currency" currencySymbol="₫" groupingUsed="true"/></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="mt-3">
            <a href="${pageContext.request.contextPath}/orders" class="btn btn-outline-secondary  text-white">Quay Về Danh Sách Đơn Hàng</a>
        </div>
    </div>
    <%@ include file="/assets/components/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>