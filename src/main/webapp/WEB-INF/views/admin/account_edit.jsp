<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thêm sản phẩm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/cropperjs@1.5.13/dist/cropper.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

        <style>
            #imagePreview img {
                width: 100px;
                height: 100px;
                object-fit: cover;
                margin-right: 5px;
                border-radius: 5px;
            }
            #imagePreview {
                display: flex;
                flex-wrap: wrap;
            }

            .image-wrapper {
                position: relative;
                width: 100px;
                height: 100px;
            }

            .preview-img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 5px;
                border: 1px solid #ccc;
            }
        </style>
    </head>
    <body class="bg-light">
        <div class="container py-5">
            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">
                <i class="fas fa-home"></i> Trở Về Trang Chủ
            </a>

            <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-outline-secondary">
                <i class="fas fa-arrow-left"></i> Trở Về Trang Quản Lý Người Dùng
            </a>
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <div class="card shadow">
                <div class="card-header bg-dark text-white d-flex justify-content-center">
                    <h4>Sửa sản phẩm</h4>
                </div>
                <div class="card-body">
                    <c:if test="${empty success}">
                        <!-- Form sửa user -->
                        <form action="${pageContext.request.contextPath}/admin/users" method="post">
                            <input type="hidden" name="action" value="edit" />
                            <input type="hidden" name="id" value="${user.userId}"/>

                            <div class="mb-3">
                                <label class="form-label">Username</label>
                                <input type="text" name="username" class="form-control" value="${user.username}" readonly />
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Tên người dùng</label>
                                    <input type="text" name="fullname" class="form-control" value="${user.fullName}" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Số điện thoại</label>
                                    <input type="text" name="phone" class="form-control" value="${user.phone}" />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="text" name="email" class="form-control" value="${user.email}" readonly />
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Địa chỉ</label>
                                <input type="text" name="address" class="form-control" value="${user.address}" />
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Phân quyền</label>
                                    <select name="roleId" class="form-select">
                                        <option value="1" ${user.roleId == 1 ? 'selected' : ''}>Admin</option>
                                        <option value="2" ${user.roleId == 2 ? 'selected' : ''}>Nhân viên</option>
                                        <option value="3" ${user.roleId == 3 ? 'selected' : ''}>Khách hàng</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Trạng thái</label>
                                    <select name="status" class="form-select">
                                        <option value="active" ${user.status == 'active' ? 'selected' : ''}>Hoạt động</option>
                                        <option value="banned" ${user.status == 'banned' ? 'selected' : ''}>Bị chặn</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Ngày tạo</label>
                                <input type="date" name="createAt" class="form-control" value="${user.createAt}" />
                            </div>

                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-1"></i> Cập nhật
                            </button>
                        </form>

                    </c:if>
                </div>
            </div>
        </div>      
    </body>
    <!-- Scripts -->
</html>
