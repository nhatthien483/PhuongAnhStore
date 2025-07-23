<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Đặt Lại Mật Khẩu</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/background.css">

    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow-lg">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Đặt Lại Mật Khẩu</h3>
                            <form method="POST" action="${pageContext.request.contextPath}/reset" onsubmit="return validatePassword()">
                                <input type="hidden" name="token" value="${param.token}" />
                                <div class="mb-3">
                                    <label class="form-label">Mật Khẩu Mới</label>
                                    <input type="password" id="password" name="password" class="form-control" required />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Xác Nhận Lại Mật Khẩu</label>
                                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required />
                                    <small id="passwordError" class="text-danger d-none">Mật khẩu không khớp!</small>
                                </div>
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-success">Xác Nhận</button>
                                </div>
                            </form>
                            <c:if test="${not empty error}">
                                <p class="text-danger mt-3 text-center">${error}</p>
                            </c:if>
                            <p class="text-danger text-center"><c:out value="${error}"/></p>
                                <div class="text-center">
                                    <a href="${pageContext.request.contextPath}/login">Quay lại trang đăng nhập</a>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

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
