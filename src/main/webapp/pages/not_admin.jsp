<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Không có quyền truy cập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/background.css">

</head>
<body class="bg-light">
    <div class="container text-center mt-5">
        <h2 class="text-danger">🚫 Bạn không có quyền truy cập trang này!</h2>
        <p class="mt-3">Trang này chỉ dành cho quản trị viên (admin).</p>
        <a href="<%= request.getContextPath() %>/home" class="btn btn-primary mt-4">Về trang chủ</a>
    </div>
</body>
</html>
