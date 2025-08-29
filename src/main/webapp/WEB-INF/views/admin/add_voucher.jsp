<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${voucher != null ? 'Chỉnh Sửa Voucher' : 'Thêm Voucher Mới'}</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo/main-logo-2.png" type="image/x-icon">

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="container my-5">
        <h2 class="mb-4">${voucher != null ? 'Chỉnh Sửa Voucher' : 'Thêm Voucher Mới'}</h2>
        <form action="${pageContext.request.contextPath}/admin/voucher" method="post">
            <c:if test="${voucher != null}">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="${voucher.id}">
            </c:if>
            <c:if test="${voucher == null}">
                <input type="hidden" name="action" value="add">
            </c:if>
            <div class="mb-3">
                <label for="code" class="form-label">Mã Voucher</label>
                <input type="text" class="form-control" id="code" name="code" value="${voucher.code}" required>
            </div>
            <div class="mb-3">
                <label for="discount" class="form-label">Giảm Giá (%)</label>
                <input type="number" step="0.01" class="form-control" id="discount" name="discount" value="${voucher.discount}" required>
            </div>
            <div class="mb-3">
                <label for="quantity" class="form-label">Số Lượng</label>
                <input type="number" class="form-control" id="quantity" name="quantity" value="${voucher.quantity}" required>
            </div>
            <div class="mb-3">
                <label for="expiryDate" class="form-label">Ngày Hết Hạn</label>
                <input type="date" class="form-control" id="expiryDate" name="expiryDate" value="${voucher.expiryDate}" required>
            </div>
            <button type="submit" class="btn btn-primary">Lưu</button>
            <a href="${pageContext.request.contextPath}/admin/voucher" class="btn btn-secondary">Hủy</a>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>