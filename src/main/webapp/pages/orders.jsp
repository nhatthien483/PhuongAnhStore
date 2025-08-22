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

    </head>
    <%@ include file="/assets/components/header.jsp" %>
<body>

    <div class="container my-5">
        <h2 class="mb-4">Đơn Hàng Của Tôi</h2>
        <c:if test="${empty orders}">
            <div class="alert alert-info">
                Bạn chưa có đơn hàng nào.
            </div>
        </c:if>
        <c:if test="${not empty orders}">
            <div class="table-responsive">
                <table class="table table-hover order-table">
                    <thead class="table-light">
                        <tr>
                            <th>Mã Đơn</th>
                            <th>Ngày Đặt</th>
                            <th>Tổng Tiền</th>
                            <th>Trạng Thái</th>
                            <th>Thanh Toán</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td>#${order.orderId}</td>
                                <td><fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/></td>
                                <td><fmt:formatNumber value="${order.price}" type="currency" currencySymbol="₫" groupingUsed="true"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${order.status eq 'DaXacNhan'}"><span class="badge bg-primary">Đã Xác Nhận</span></c:when>
                                        <c:when test="${order.status eq 'ChoXacNhan'}"><span class="badge bg-warning text-dark">Chờ Xác Nhận</span></c:when>
                                        <c:when test="${order.status eq 'HoanThanh'}"><span class="badge bg-success">Hoàn Thành</span></c:when>
                                        <c:when test="${order.status eq 'DaHuy'}"><span class="badge bg-danger">Đã Hủy</span></c:when>
                                        <c:when test="${order.status eq 'DangVanChuyen'}"><span class="badge bg-info">Đang Vận Chuyển</span></c:when>
                                        <c:otherwise><span class="badge bg-secondary">${order.status}</span></c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:if test="${not empty order.payment}">
                                        ${order.payment.method} - 
                                        <c:choose>
                                            <c:when test="${order.payment.status eq 'DaThanhToan'}"><span class="badge bg-success">Đã Thanh Toán</span></c:when>
                                            <c:otherwise><span class="badge bg-warning">${order.payment.status}</span></c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <c:if test="${empty order.payment}">
                                        <span class="badge bg-secondary">Chưa Thanh Toán</span>
                                    </c:if>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/orders?action=detail&id=${order.orderId}" class="btn btn-sm btn-outline-primary text-white">Chi Tiết</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <!-- Pagination -->
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="?page=${currentPage + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </c:if>
    </div>
            <%@ include file="/assets/components/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>