<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <title>Quản Lý Voucher</title>
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
<body>

    <div class="container my-5">
        <h2 class="mb-4">Quản Lý Voucher</h2>
        <a href="${pageContext.request.contextPath}/voucher?action=add" class="btn btn-primary mb-3">Thêm Voucher Mới</a>
        <c:if test="${param.msg != null}">
            <div class="alert alert-success">
                <strong>Thành công!</strong>
                <c:choose>
                    <c:when test="${param.msg == 'created'}">Tạo voucher thành công!</c:when>
                    <c:when test="${param.msg == 'updated'}">Cập nhật voucher thành công!</c:when>
                </c:choose>
            </div>
        </c:if>
        <c:if test="${param.error != null}">
            <div class="alert alert-danger">
                <strong>Lỗi!</strong> ${param.error}
            </div>
        </c:if>
        <c:if test="${empty vouchers}">
            <div class="alert alert-info">
                Chưa có voucher nào.
            </div>
        </c:if>
        <c:if test="${not empty vouchers}">
            <div class="table-responsive">
                <table class="table table-hover order-table">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Code</th>
                            <th>Giảm Giá (%)</th>
                            <th>Số Lượng</th>
                            <th>Ngày Hết Hạn</th>
                            <th>Trạng Thái</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="voucher" items="${vouchers}">
                            <tr>
                                <td>#${voucher.id}</td>
                                <td>${voucher.code}</td>
                                <td>${voucher.discount}</td>
                                <td>${voucher.quantity}</td>
                                <td>${voucher.expiryDate}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${voucher.quantity <= 0}">
                                            <span class="badge bg-danger">Hết Số Lượng</span>
                                        </c:when>
                                        <c:when test="${voucher.expiryDate lt today}">
                                            <span class="badge bg-warning text-dark">Hết Hạn</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-success">Hoạt Động</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/voucher?action=edit&id=${voucher.id}" class="btn btn-sm btn-outline-warning text-white">Sửa</a>
                                    <a href="${pageContext.request.contextPath}/voucher?action=delete&id=${voucher.id}" class="btn btn-sm btn-outline-danger text-white" onclick="return confirm('Xác nhận xóa voucher?')">Xóa</a>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>