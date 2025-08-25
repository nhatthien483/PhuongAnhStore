<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Đơn Hàng</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo/main-logo-2.png" type="image/x-icon">
    <!-- Bootstrap + Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin_dashboard.css">
    <style>
        .custom-select {
            width: 100%;
            padding: 10px 12px;
            border-radius: 12px;
            border: 1px solid #ccc;
            appearance: none;
            background-color: #f9f9f9;
            font-size: 16px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
            transition: border-color 0.3s, box-shadow 0.3s;
            outline: none;
            background-image: url("data:image/svg+xml;utf8,<svg fill='%23666' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/></svg>");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 16px 16px;
        }
        .custom-select:focus {
            border-color: #4CAF50;
            box-shadow: 0 0 3px rgba(76, 175, 80, 0.5);
            background-color: #fff;
        }
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }
        .modal-content {
            background: white;
            padding: 20px 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            width: 350px;
            position: relative;
        }
        .close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 20px;
            cursor: pointer;
        }
        .btn-save {
            padding: 8px 16px;
            background-color: #4CAF50;
            border: none;
            border-radius: 8px;
            color: white;
            cursor: pointer;
        }
        .btn-save:hover {
            background-color: #45a049;
        }
        .custom-page {
            background-color: #000 !important;
            color: #fff !important;
            border-color: #000 !important;
        }
        .custom-page:hover {
            background-color: #222 !important;
        }
        .page-item.active .custom-page {
            background-color: #444 !important;
            border-color: #444 !important;
        }
        .container-fluid {
            margin-top: 20px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
        }
        .card-header {
            border-radius: 10px 10px 0 0;
            padding: 16px 20px;
            background: #f8f9fa;
        }
        .card-header h5 {
            margin: 0;
            font-weight: bold;
            color: #333;
        }
        .admin-table {
            width: 100%;
            border-collapse: collapse;
        }
        .admin-table thead {
            background: #f1f1f1;
            font-weight: 600;
        }
        .admin-table th, .admin-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e1e1e1;
            vertical-align: middle;
            text-align: center;
        }
        .admin-table tbody tr:hover {
            background-color: #fafafa;
        }
        .alert-container .alert {
            border-radius: 8px;
            font-size: 15px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
            position: relative;
        }
        .alert .close-btn {
            position: absolute;
            top: 6px;
            right: 10px;
            font-size: 20px;
            cursor: pointer;
        }
        .search-box {
            position: relative;
        }
        .search-box input {
            padding-left: 35px;
        }
        .search-box i {
            position: absolute;
            left: 10px;
            top: 10px;
            color: #aaa;
        }
    </style>
</head>
<body class="admin-panel">
    <jsp:include page="/WEB-INF/views/components/adminSidebar.jsp" />
    <div class="main-content">
        <jsp:include page="/WEB-INF/views/components/dashboardHeader.jsp" />
        <div class="container-fluid">
            <!-- Alerts -->          
            <!-- Search -->
            <div class="mb-3">
                <input type="text" class="form-control bg-light text-white" placeholder="Tìm kiếm đơn hàng..." id="searchInput">
            </div>
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5>Danh sách đánh giá</h5>              
            </div>
            <div class="alert-container m-1">
                <c:if test="${param.msg != null}">
                    <div class="alert alert-success" id="successMessage">
                        <strong>✔ Thành công!</strong>
                        <c:choose>
                            <c:when test="${param.msg == 'updated'}">Cập nhật đánh giá thành công!</c:when>
                            <c:when test="${param.msg == 'deleted'}">Xóa đánh giá thành công!</c:when>
                        </c:choose>
                    </div>
                </c:if>
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger">
                        <span class="close-btn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                        <strong>❌ Lỗi!</strong> ${param.error}
                    </div>
                </c:if>
                <c:if test="${not empty sessionScope.notification}">
                    <div class="alert alert-warning">
                        ${sessionScope.notification}
                        <c:remove var="notification" scope="session"/>
                    </div>
                </c:if>
            </div>
            <div class="card">
                <div class="card-body">
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên Khách Hàng</th>
                                <th>Sản Phẩm</th>
                                <th>Nội Dung</th>
                                <th>Ngày Tạo</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty comments}">
                                <tr>
                                    <td colspan="6">
                                        <div class="alert alert-warning">Không có đánh giá nào</div>
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="c" items="${comments}">
                                <tr>
                                    <td>${c.commentId}</td>
                                    <td>${c.getUser().getFullName()}</td>
                                    <td>${c.getProduct().getName()}</td>
                                    <td>${c.commentText}</td>
                                    <td>${c.commentDate}</td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/admin/comment" method="post" style="display:inline;">
                                            <input type="hidden" name="action" value="delete"/>
                                            <input type="hidden" name="commentId" value="${c.commentId}"/>
                                            <button type="submit" class="btn btn-danger btn-sm"
                                                    onclick="return confirm('Bạn có chắc muốn xoá bình luận này?');">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- Pagination -->
                    <nav class="p-3" aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${currentPage-1}"><i class="fas fa-angle-left"></i></a>
                            </li>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${i==currentPage?'active':''}">
                                    <a class="page-link custom-page" href="?page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${currentPage+1}"><i class="fas fa-angle-right"></i></a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <script>
                let currentStatus = "";
                let currentMethod = "";
                function filterOrders(status) {
                    currentStatus = status;
                    const dropdownButton = document.getElementById('statusFilterDropdown');
                    dropdownButton.textContent = status === '' ? "Trạng Thái" : status;
                    applyFilters();
                }
                function filterPayment(method) {
                    currentMethod = method;
                    const dropdownButton = document.getElementById('methodFilterDropdown');
                    dropdownButton.textContent = method === '' ? "Thanh Toán" : method;
                    applyFilters();
                }
                function applyFilters() {
                    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
                    document.querySelectorAll('#orderTableBody tr').forEach(row => {
                        const status = row.getAttribute("data-status");
                        const method = row.getAttribute("data-method");
                        const text = row.innerText.toLowerCase();
                        const matchSearch = text.includes(searchTerm);
                        const matchStatus = (currentStatus === '' || status === currentStatus);
                        const matchMethod = (currentMethod === '' || method === currentMethod);
                        row.style.display = (matchSearch && matchStatus && matchMethod) ? '' : 'none';
                    });
                }
                document.getElementById('searchInput').addEventListener('input', applyFilters);
                // Auto-hide success alert
                window.onload = () => {
                    const successMsg = document.getElementById('successMessage');
                    if (successMsg) setTimeout(() => successMsg.style.display = 'none', 3000);
                };
            </script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    document.querySelectorAll('.edit-service-btn').forEach(btn => {
                        btn.addEventListener('click', function (e) {
                            e.preventDefault();
                            const orderId = this.dataset.id;
                            const status = this.dataset.status;
                            document.getElementById('modalServiceId').value = orderId;
                            document.getElementById('statusSelectService').value = status;
                            document.getElementById('editServiceModal').style.display = 'flex';
                        });
                    });
                    // Đóng modal
                    document.querySelectorAll('.close-btn').forEach(btn => {
                        btn.addEventListener('click', () => {
                            btn.closest('.modal-overlay').style.display = 'none';
                        });
                    });
                    window.addEventListener('click', (e) => {
                        const modal = document.getElementById('editServiceModal');
                        if (e.target === modal) {
                            modal.style.display = 'none';
                        }
                    });
                });
            </script>
    </body>
</html>