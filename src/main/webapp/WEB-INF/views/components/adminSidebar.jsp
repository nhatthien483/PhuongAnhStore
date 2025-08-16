<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="sidebar">
    <div class="sidebar-header">
        <a href="${pageContext.request.contextPath}/home" class="logo-link">
            <span class="text-center">Phương Anh Store</span>
        </a>
    </div>
    <div class="sidebar-body">
        <div class="user-panel">
            <%-- <div class="user-image">
                <img src="${pageContext.request.contextPath}/asset/img/avt/adminavt.png" alt="Admin Avatar">
            </div> --%>
            <div class="user-info">
                <h6>Chào Mừng</h6>
                <p>${user.getFullName()}</p>
            </div>
        </div>
        <ul class="sidebar-nav">
            <li class="nav-section">
                <span class="nav-section-text">Thống Kê</span>
            </li>           
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link active">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Thống Kê Chính</span>
                </a>
            </li>
            <li class="nav-section">
                <span class="nav-section-text">Quản Lý</span>
            </li>      
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/users" class="nav-link">
                    <i class="fas fa-users"></i>
                    <span>Quản Lý Account</span>
                    <%-- <span class="badge badge-info">24</span> --%>
                </a>
            </li>         
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/productManagement" class="nav-link">
                    <i class="fas fa-cogs"></i>
                    <span>Sản Phẩm</span>
                </a>
            </li>      
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/order" class="nav-link">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Đơn Hàng</span>
                    <%-- <span class="badge badge-danger">3</span> --%>
                </a>
            </li>
        </ul>

        
    </div>
</div> 