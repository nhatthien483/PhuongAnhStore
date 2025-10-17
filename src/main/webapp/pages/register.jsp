<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Đăng ký tài khoản</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/background.css">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow-lg">
                        <div class="card-body">
                            <h3 class="card-title text-center mb-4">Đăng ký tài khoản</h3>
                            <c:if test="${not empty err}">
                                <p class="text-danger mt-3 text-center">${err}</p>
                            </c:if>
                            <form method="POST" action="${pageContext.request.contextPath}/login" onsubmit="return validatePassword()">
                                <input type="hidden" name="action" value="register" />

                                <div class="mb-3">
                                    <label class="form-label">Tên đăng nhập</label>
                                    <input type="text" name="username" class="form-control" required />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control" required />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mật khẩu</label>
                                    <input type="password" name="password" id="password" class="form-control" required />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Xác nhận mật khẩu</label>
                                    <input type="password" id="confirmPassword" class="form-control" required />
                                    <small id="passwordError" class="text-danger d-none">Mật khẩu không khớp!</small>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Họ tên</label>
                                    <input type="text" name="fullname" class="form-control" required />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Số điện thoại</label>
                                    <input 
                                        type="text" 
                                        name="phone" 
                                        class="form-control" 
                                        required 
                                        pattern="^0\d{9}$" 
                                        title="Số điện thoại phải bắt đầu bằng 0 và gồm 10 chữ số."
                                    />
                                </div>


                                <div class="mb-3">
                                    <label class="form-label">Địa chỉ</label>
                                    <input type="text" name="address" class="form-control" required />
                                </div>

                                <div class="d-grid mb-3">
                                    <button type="submit" class="btn btn-success">Tạo tài khoản</button>
                                </div>
                                <c:if test="${not empty mess}">
                                <p class="text-success mt-3 text-center">${mess}</p>
                            </c:if>
                            </form>
                            <div class="text-center">
                                <a href="${pageContext.request.contextPath}/login">Quay lại trang đăng nhập</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function validatePassword() {
                const password = document.getElementById("password").value;
                const confirm = document.getElementById("confirmPassword").value;
                const errorText = document.getElementById("passwordError");

                if (password !== confirm) {
                    errorText.classList.remove("d-none");
                    return false;
                } else {
                    errorText.classList.add("d-none");
                    return true;
                }
            }
        </script>
    </body>
</html>
