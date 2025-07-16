<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Quên Mật Khẩu</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/background.css">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow-lg">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Quên Mật Khẩu</h3>
                            <form method="POST" action="${pageContext.request.contextPath}/login">
                                <input type="hidden" name="action" value="forgot" />
                                <div class="mb-3">
                                    <label class="form-label">Nhập Email Đã Đăng Ký Tài Khoản</label>
                                    <input type="email" name="email" class="form-control" required />
                                </div>
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-warning">Gửi Liên Kết Đặt Lại Mật Khẩu</button>
                                </div>
                            </form>
                            <c:if test="${not empty message}">
                                <p class="text-success mt-3 text-center">${message}</p>
                            </c:if>
                            <c:if test="${not empty error}">
                                <p class="text-danger mt-3 text-center">${error}</p>
                            </c:if>
                            <div class="text-center mt-3">
                                <a href="${pageContext.request.contextPath}/login">Quay Lại Trang Đăng Nhập</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
