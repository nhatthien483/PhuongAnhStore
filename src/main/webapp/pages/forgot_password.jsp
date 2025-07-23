<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
	<title>Đăng Nhập</title>
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
				<form class="login100-form validate-form flex-sb flex-w" method="POST" action="${pageContext.request.contextPath}/login">
					<input type="hidden" name="action" value="forgot"/>
					<span class="login100-form-title p-b-53">
						Quên Mật Khẩu
					</span>				
						<c:if test="${not empty message}">
							<p class="display-5 w-full text-success mt-3 mb-0 px-3 text-center">${message}</p>
						</c:if>
						<c:if test="${not empty error}">
							<p class="display-5 w-full text-danger mt-3 mb-0 px-3 text-center">${error}</p>
						</c:if>
					<c:if test="${empty message and empty error}">
						<div class="p-t-31 p-b-9">
							<span class="txt1">
								Nhập Email Đã Đăng Ký Tài Khoản
							</span>
						</div>
						<div class="wrap-input100 validate-input" data-validate = "Vui lòng nhập email!">
							<input class="input100" type="email" name="email" required>
							<span class="focus-input100"></span>
						</div>

						<div class="container-login100-form-btn m-t-17">
							<button class="login100-form-btn" type="submit">
							Gửi Liên Kết Đặt Lại Mật Khẩu						
							</button>
						</div>
					</c:if>
					<div class="w-full text-center p-t-55">
						<a href="${pageContext.request.contextPath}/home" class="txt2 bo1">
						Trở về trang chủ
						</a>
					</div>
				</form>
				<p class="text-danger text-center"><c:out value="${error}"/></p>
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
	<script src="${pageContext.request.contextPath}/assets/login_assets/js/main.js"></script>

</body>
</html>