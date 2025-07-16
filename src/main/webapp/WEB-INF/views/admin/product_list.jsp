<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
    <head>
        <title>Quản lý sản phẩm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .product-img {
                height: 60px;
                width: 60px;
                object-fit: cover;
                border-radius: 8px;
                border: 1px solid #ddd;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .table thead th {
                vertical-align: middle;
            }

            .table td, .table th {
                vertical-align: middle;
            }

            .card {
                border-radius: 12px;
            }

            .btn-sm {
                font-size: 0.85rem;
            }

            .btn-warning, .btn-danger {
                transition: transform 0.15s ease;
            }

            .btn-warning:hover, .btn-danger:hover {
                transform: scale(1.05);
            }

            .badge {
                font-size: 0.9rem;
            }
        </style>
    </head>
    <body>
        <div class="container py-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="text-primary fw-bold">📦 Danh sách sản phẩm</h3>
                <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">🏠Trở Về Trang Chủ</a>
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-outline-secondary">⬅Trở Về Trang Quản Lý</a>
                <a href="productManagement?action=add" class="btn btn-success shadow-sm">
                    Thêm sản phẩm
                </a>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-body p-0">
                    <table class="table table-hover table-bordered align-middle mb-0">
                        <thead class="table-primary text-center">
                            <tr>
                                <th style="width: 5%">ID</th>
                                <th style="width: 8%">Ảnh</th>
                                <th style="width: 20%">Tên</th>
                                <th style="width: 12%">Giá</th>
                                <th style="width: 20%">Danh mục</th>
                                <th style="width: 8%">Kho</th>
                                <th style="width: 10%">Trạng thái</th>
                                <th style="width: 17%">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${products}">
                                <tr>
                                    <td class="text-center">${p.productId}</td>
                                    <td class="text-center">
                                        <c:set var="firstImage" value="${fn:split(p.image, ',')[0]}" />
                                        <img src="${pageContext.request.contextPath}/Images/${p.category.categoryName}/${p.categoryType.categoryTypeName}/${firstImage}" 
                                             alt="Ảnh" class="product-img" /></td>
                                    <td>${p.name}</td>
                                    <td class="text-end text-nowrap text-success fw-semibold">${p.formattedPrice} ₫</td>
                                    <td>${p.category.categoryName} / ${p.categoryType.categoryTypeName}</td>
                                    <td class="text-center">${p.stock}</td>
                                    <td class="text-center">
                                        <span class="badge ${p.status ? 'bg-success' : 'bg-secondary'}">
                                            ${p.status ? 'Hiển thị' : 'Ẩn'}
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <a href="products?action=edit&id=${p.productId}" class="btn btn-warning btn-sm me-1">✏️ Sửa</a>
                                        <a href="products?action=delete&id=${p.productId}" class="btn btn-danger btn-sm"
                                           onclick="return confirm('Xác nhận xoá sản phẩm?')">🗑️ Xoá</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
