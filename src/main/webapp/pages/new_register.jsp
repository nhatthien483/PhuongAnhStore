<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
	<title>Đăng Ký</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/login_assets/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/login_assets/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/login_assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/login_assets/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/login_assets/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/login_assets/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/login_assets/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/login_assets/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/login_assets/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/login_assets/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/login_assets/css/main.css">
<!--===============================================================================================-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Agbalumo&display=swap" rel="stylesheet">
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
		<video autoplay muted loop id="bg-video">
        <source src="${pageContext.request.contextPath}/assets/images/banner/background_vd2.mp4" type="video/mp4">
        Trình duyệt của bạn không hỗ trợ video.
    </video>
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w" method="POST" action="${pageContext.request.contextPath}/login" onsubmit="return validatePassword()">
					<input type="hidden" name="action" value="register" />
					<span class="login100-form-title p-b-53">
						Đăng Ký
					</span>
					<a href="#" class="btn-face m-b-20">
						<i class="fa fa-facebook-official"></i>
						Facebook
					</a>
					<a href="#" class="btn-google m-b-20">
						<img src="${pageContext.request.contextPath}/assets/login_assets/images/icons/icon-google.png" alt="GOOGLE">
						Google
					</a>

                    <c:if test="${not empty err}">
                        <p class="text-danger mt-3 text-center">${err}</p>
                    </c:if>

					<div class="p-t-31 p-b-9">
						<span class="txt1">
							Tên Đăng Nhập
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Vui lòng nhập tên đăng nhập!">
						<input class="input100" type="text" name="username" required>
						<span class="focus-input100"></span>
					</div>
					
                    <div class="p-t-31 p-b-9">
						<span class="txt1">
							Email
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Vui lòng nhập email!">
						<input class="input100" type="email" name="email" required >
						<span class="focus-input100"></span>
					</div>

					<div class="p-t-13 p-b-9">
						<span class="txt1">
							Mật Khẩu
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Vui lòng nhập mật khẩu!">
						<input class="input100" type="password" name="password" id="password" required>
						<span class="focus-input100"></span>
					</div>

                    <div class="p-t-13 p-b-9">
						<span class="txt1">
							Xác Nhận Mật Khẩu
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Vui lòng xác nhận mật khẩu!">
						<input class="input100" type="password" name="password" id="confirmPassword" required>
						<span class="focus-input100"></span>
					</div>

                    <div class="p-t-31 p-b-9">
						<span class="txt1">
							Họ Và Tên
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Vui lòng nhập họ và tên!">
						<input class="input100" type="text" name="fullname" required>
						<span class="focus-input100"></span>
					</div>

                    <div class="p-t-31 p-b-9">
						<span class="txt1">
							Số Điện Thoại
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Vui lòng nhập số điện thoại!">
						<input class="input100" type="emial" name="phone" required>
						<span class="focus-input100"></span>
					</div>

                    <div class="p-t-31 p-b-9">
						<span class="txt1">
							Địa Chỉ
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Vui lòng nhập địa chỉ!">
						<input class="input100" type="emial" name="address" required>
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" type="submit">
							Tạo Tài Khoản
						</button>
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
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/assets/login_assets/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/assets/login_assets/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/assets/login_assets/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/assets/login_assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/assets/login_assets/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/assets/login_assets/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/login_assets/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/assets/login_assets/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/assets/login_assets/assets/js/main.js"></script>
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