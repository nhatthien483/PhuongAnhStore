<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Quản Lý Sản Phẩm</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin_dashboard.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/apexcharts@3.45.1/dist/apexcharts.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <style>
        <style>
            .custom-page {
                background-color: #000 !important;
                color: #fff !important;
                border-color: #000 !important;
            }

            .custom-page:hover {
                background-color: #222 !important;
                color: #fff !important;
                border-color: #222 !important;
            }

            .page-item.active .custom-page {
                background-color: #444 !important;
                border-color: #444 !important;
                color: #fff !important;
            }
            body {
                font-family: 'Segoe UI', sans-serif;
            }
            .container-fluid {
                margin-top: 20px;
            }
            .card {
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
            }
            .card-header {
                color: white;
                border-radius: 10px 10px 0 0;
                padding: 20px;
            }
            .card-header h5 {
                margin: 0;
                font-size: 20px;
                font-weight: bold;
                color: black;
            }
            .btn-primary {
                background: black;
                border: none;
            }
            .admin-table {
                width: 100%;
                border-collapse: collapse;
                text-align: center;
            }
            .admin-table thead {
                background: white;
                font-weight: bold;
                font-size: 16px;
            }
            .admin-table th, .admin-table td {
                padding: 15px;
                border-bottom: 1px solid #e1e1e1;
                vertical-align: middle;
            }
            .admin-table tbody tr:hover {
                background-color: #f1f1f1;
            }
            img.accessory-img {
                width: 100px;
                height: 100px;
                border-radius: 10px;
                box-shadow: 0 0 5px rgba(0,0,0,0.3);
            }
            .btn-sm {
                margin: 2px;
                font-size: 14px;
                border-radius: 6px;
            }
            .alert-container {
                margin: 20px auto;
                max-width: 1200px; /* giới hạn rộng giống card */
            }

            .alert {
                padding: 15px 20px;
                border-radius: 10px;  /* giống card */
                font-size: 16px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1); /* giống card */
                position: relative;
            }
            .alert-success {
                background-color: #d4edda;
                color: #155724;
                border: 2px solid #c3e6cb;
            }
            .alert-error {
                background-color: #f8d7da;
                color: #721c24;
                border: 1px solid #f5c6cb;
            }
            .close-btn {
                position: absolute;
                top: 8px;
                right: 15px;
                color: #000;
                font-size: 20px;
                cursor: pointer;
            }
        </style>
    </head>

    <body class="admin-panel">
        <jsp:include page="/WEB-INF/views/components/adminSidebar.jsp" />
        <div class="main-content">
            <jsp:include page="/WEB-INF/views/components/dashboardHeader.jsp" />

            <div class="container-fluid">
                <div class="alert-container">
                    <!-- ALERT MESSAGES -->
                    <c:if test="${param.msg == 'created' || param.msg == 'updated' || param.msg == 'deleted'}">
                        <div class="alert alert-success" id="successMessage">
                            <strong>Success!</strong>
                            <c:choose>
                                <c:when test="${param.msg == 'created'}"> Tạo sản phẩm thành công! </c:when>
                                <c:when test="${param.msg == 'updated'}"> Cập nhật sản phẩm thành công! </c:when>
                                <c:when test="${param.msg == 'deleted'}"> Xóa sản phẩm thành công! </c:when>
                            </c:choose>
                        </div>
                    </c:if>

                    <c:if test="${param.error != null}">
                        <div class="alert alert-error">
                            <span class="close-btn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                            <strong>Error!</strong> ${param.error}
                        </div>
                    </c:if>
                </div>

                <!-- SEARCH FORM -->
                <form action="${pageContext.request.contextPath}/admin/productManagement" method="get" style="margin-bottom: 20px;">
                    <input type="hidden" name="action" value="search">
                    <div style="display: flex; gap: 10px;">
                        <input type="text" name="keyword" value="${param.keyword}" placeholder="Tìm kiếm sản phẩm..."
                               style="flex:1; padding:12px; border:1px solid #ccc; border-radius:8px;">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Tìm Kiếm</button>
                        <a href="${pageContext.request.contextPath}/admin/productManagement" class="btn btn-secondary"><i class="fas fa-sync"></i> Reset</a>
                    </div>
                </form>
                <c:if test="${not empty message}">
                    <div class="alert alert-success">${message}</div>
                </c:if>
                <!-- MAIN TABLE -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5>Quản Lý Sản Phẩm</h5>
                        <a href="productManagement?action=add" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Thêm Sản Phẩm
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Ảnh</th>
                                    <th>Tên</th>
                                    <th>Giá</th>
                                    <th>Danh Mục</th>
                                    <th>Kho</th>
                                    <th class="text-center">Trạng Thái</th>
                                    <th class="text-center">Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty products}">
                                    <tr>
                                        <td colspan="8">
                                            <div class="alert alert-warning">Không có sản phẩm nào được tìm thấy</div>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:forEach var="p" items="${products}" varStatus="loop">
                                    <tr>
                                        <td>${p.productId}</td>
                                        <td>
                                            <c:set var="firstImage" value="${fn:split(p.image, ',')[0]}" />
                                            <img src="${pageContext.request.contextPath}/Images/${p.category.categoryName}/${p.categoryType.categoryTypeName}/${firstImage}" alt="Ảnh" class="img-thumbnail" style="max-width: 80px; height: auto;"/>
                                        </td>                                                                                
                                        <td>${p.name}</td>
                                        <td class="text-nowrap">${p.formattedPrice} ₫</td>
                                        <td>${p.category.categoryName} / ${p.categoryType.categoryTypeName}</td>
                                        <td>${p.stock}</td>
                                        <td class="text-center">
                                            <span class="badge ${p.status ? 'bg-success' : 'bg-secondary'}">
                                                ${p.status ? 'Hiển thị' : 'Ẩn'}
                                            </span>
                                        </td>
                                        <td class="text-center text-nowrap">
                                            <a href="${pageContext.request.contextPath}/admin/productManagement?action=edit&id=${p.productId}" class="btn btn-warning btn-sm me-1"><i class="fas fa-edit"></i></a>
                                            <a href="${pageContext.request.contextPath}/admin/productManagement?action=delete&id=${p.productId}" class="btn btn-danger btn-sm"
                                               onclick="return confirm('Xác nhận xoá sản phẩm?')"><i class="fas fa-trash-alt"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <!-- PHÂN TRANG -->
                        <div class="container">
                            <nav class="p-3" aria-label="Page navigation">
                                <ul class="pagination">
                                    <!-- Nút Previous -->
                                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                        <a class="page-link page-link-prev" href="?page=${currentPage - 1}" aria-label="Previous" tabindex="-1">
                                            <span aria-hidden="true"><i class="icon-long-arrow-left"></i></span><i class="fas fa-angle-left"></i>
                                        </a>
                                    </li>

                                    <!-- Vòng lặp các trang -->
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <c:choose>
                                            <c:when test="${i == currentPage}">
                                                <li class="page-item active">
                                                    <a class="page-link text-center custom-page" href="?page=${i}">${i}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link text-center custom-page" href="?page=${i}">${i}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                    <!-- Tổng số trang -->
                                    <li class="page-item-total">of ${totalPages}</li>

                                    <!-- Nút Next -->
                                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                        <a class="page-link page-link-next" href="?page=${currentPage + 1}" aria-label="Next">
                                            <i class="fas fa-angle-right"></i><span aria-hidden="true"><i class="icon-long-arrow-right"></i></span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
    <script>
        window.onload = function () {
            const successMsg = document.getElementById("successMessage");
            if (successMsg) {
                setTimeout(() => {
                    successMsg.style.display = "none";
                }, 3000);  // ẩn sau 3 giây
            }
        };
    </script>
</html>
