<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Xác nhận thành công</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/background.css">
        <style>
            body {
                background: linear-gradient(to right, #d4fc79, #96e6a1);
                animation: fadeIn 1s ease-in;
            }
            .card {
                animation: slideUp 0.6s ease-out;
                border: none;
                border-radius: 15px;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            @keyframes slideUp {
                from {
                    transform: translateY(50px);
                    opacity: 0;
                }
                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }
        </style>
        <!-- Lottie animation -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lottie-web/5.7.6/lottie.min.js"></script>
    </head>
    <body>
        <div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
            <div class="card shadow-lg p-4 text-center bg-white">
                <div id="lottie-success" style="height: 150px; width: 150px; margin: auto;"></div>

                <h2 class="text-success mt-3">Đổi Mật Khẩu Thành Công!</h2>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary mt-3 px-4">Đến trang đăng nhập</a>
            </div>
        </div>

        <script>
            // Hiển thị animation thành công
            lottie.loadAnimation({
                container: document.getElementById('lottie-success'),
                renderer: 'svg',
                loop: false,
                autoplay: true,
                path: 'https://assets2.lottiefiles.com/packages/lf20_jbrw3hcz.json' // animation success
            });
        </script>
    </body>
</html>
