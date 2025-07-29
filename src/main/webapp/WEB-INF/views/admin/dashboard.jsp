<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Trị Phương Anh Store</title>

    <!-- Google Font hỗ trợ tiếng Việt -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
    </style>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin_dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/apexcharts@3.45.1/dist/apexcharts.min.css" rel="stylesheet">
</head>
<body class="admin-panel">
    <jsp:include page="/WEB-INF/views/components/adminSidebar.jsp" />
    <div class="main-content">
        <jsp:include page="/WEB-INF/views/components/dashboardHeader.jsp" />
        <div class="content">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col">
                            <h1 class="page-title">Bảng Điều Khiển</h1>
                        </div>
                        <div class="col-auto">
                            <div class="date-range-picker">
                                <i class="fas fa-calendar"></i>
                                <span>30 ngày gần nhất</span>
                                <i class="fas fa-chevron-down"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="stats-grid">
                    <div class="stats-card primary">
                        <div class="stats-card-content">
                            <div class="stats-info">
                                <div class="stats-header">
                                    <h5>Tổng Số Sản Phẩm</h5>
                                    <div class="stats-icon">
                                        <i class="fas fa-product">${productCount}</i>
                                    </div>
                                </div>
                                <div class="stats-data">
                                    <h3>${totalCars}</h3>
                                    <div class="stats-trend positive">
                                        <i class="fas fa-arrow-up"></i>
                                        <span>3.48%</span>
                                        <span class="trend-label">so với tháng trước</span>
                                    </div>
                                </div>
                            </div>
                            <div class="stats-chart" id="carsChart"></div>
                        </div>
                    </div>

                    <div class="stats-card info">
                        <div class="stats-card-content">
                            <div class="stats-info">
                                <div class="stats-header">
                                    <h5>Người Dùng Hoạt Động</h5>
                                    <div class="stats-icon">
                                        <i class="fas fa-users"></i>
                                    </div>
                                </div>
                                <div class="stats-data">
                                    <h3>${userCount} / ${userCount}</h3>
                                    <div class="stats-trend positive">
                                        <i class="fas fa-arrow-up"></i>
                                        <span>ts%</span>
                                        <span class="trend-label">so với tháng trước</span>
                                    </div>
                                </div>
                            </div>
                            <div class="stats-chart" id="usersChart"></div>
                        </div>
                    </div>

                    <div class="stats-card success">
                        <div class="stats-card-content">
                            <div class="stats-info">
                                <div class="stats-header">
                                    <h5>Tổng Đơn Hàng</h5>
                                    <div class="stats-icon">
                                        <i class="fas fa-shopping-cart"></i>
                                    </div>
                                </div>
                                <div class="stats-data">
                                    <h3>${totalOrders}</h3>
                                    <div class="stats-trend negative">
                                        <i class="fas fa-arrow-down"></i>
                                        <span>1.08%</span>
                                        <span class="trend-label">so với tháng trước</span>
                                    </div>
                                </div>
                            </div>
                            <div class="stats-chart" id="ordersChart"></div>
                        </div>
                    </div>

                    <div class="stats-card warning">
                        <div class="stats-card-content">
                            <div class="stats-info">
                                <div class="stats-header">
                                    <h5>Doanh Thu</h5>
                                    <div class="stats-icon">
                                        <i class="fas fa-dollar-sign"></i>
                                    </div>
                                </div>
                                <div class="stats-data">
                                    <h3>$<c:out value="${totalRevenue}" /></h3>
                                    <div class="stats-trend positive">
                                        <i class="fas fa-arrow-up"></i>
                                        <span>8.32%</span>
                                        <span class="trend-label">so với tháng trước</span>
                                    </div>
                                </div>
                            </div>
                            <div class="stats-chart" id="revenueChart"></div>
                        </div>
                    </div>
                </div>

                <div class="dashboard-grid">
                    <div class="dashboard-item sales-overview">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-header-left">
                                    <h5 class="card-title">Tổng Quan Doanh Số</h5>
                                    <span class="card-subtitle">Thống kê doanh thu hàng tháng</span>
                                </div>
                            </div>
                            <div class="card-body">
                                <div id="salesOverviewChart"></div>
                            </div>
                        </div>
                    </div>

                    <div class="dashboard-item top-selling">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-header-left">
                                    <h5 class="card-title">Sản Phẩm Bán Chạy Nhất</h5>
                                    <span class="card-subtitle">Hiệu suất sản phẩm nổi bật</span>
                                </div>
                                <div class="card-header-right">
                                    <button class="btn btn-light btn-sm">
                                        Xem Tất Cả <i class="fas fa-arrow-right"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- danh sách xe bán chạy vẫn giữ nguyên cấu trúc -->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card recent-orders">
                    <div class="card-header">
                        <div class="card-header-left">
                            <h5 class="card-title">Đơn Hàng Gần Đây</h5>
                            <span class="card-subtitle">Giao dịch gần nhất</span>
                        </div>
                        <div class="card-header-right">
                            <div class="search-box">
                                <i class="fas fa-search"></i>
                                <input type="text" placeholder="Tìm kiếm đơn hàng...">
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <!-- bảng đơn hàng giữ nguyên cấu trúc chỉ đổi phần tiêu đề cột như đã hướng dẫn -->
                    </div>
                    <div class="card-footer">
                        <div class="pagination-info">
                            Hiển thị 1 đến 10 của 50 mục
                        </div>
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <a class="page-link" href="#"><i class="fas fa-chevron-left"></i></a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/components/dashboardFooter.jsp" />
    </div>
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts@3.45.1/dist/apexcharts.min.js"></script>
    <script>
        $(document).ready(function() {
            // Toggle Sidebar
            $('.sidebar-toggle').on('click', function() {
                $('.admin-panel').toggleClass('sidebar-mini');
            });

            // Dropdown Toggle
            $('.dropdown-toggle').on('click', function(e) {
                e.preventDefault();
                $(this).next('.dropdown-menu').toggleClass('show');
            });

            // Close dropdowns when clicking outside
            $(document).on('click', function(e) {
                if (!$(e.target).closest('.dropdown').length) {
                    $('.dropdown-menu').removeClass('show');
                }
            });

            // Initialize Charts
            // Stats Mini Charts
            const miniChartOptions = {
                chart: {
                    type: 'area',
                    height: 60,
                    sparkline: {
                        enabled: true
                    },
                    toolbar: {
                        show: false
                    }
                },
                stroke: {
                    curve: 'smooth',
                    width: 2
                },
                fill: {
                    type: 'gradient',
                    gradient: {
                        shadeIntensity: 1,
                        opacityFrom: 0.7,
                        opacityTo: 0.3
                    }
                },
                series: [{
                    name: 'Value',
                    data: [25, 66, 41, 89, 63, 25, 44, 12, 36, 9, 54]
                }],
                tooltip: {
                    fixed: {
                        enabled: false
                    },
                    x: {
                        show: false
                    },
                    y: {
                        title: {
                            formatter: function(seriesName) {
                                return '';
                            }
                        }
                    },
                    marker: {
                        show: false
                    }
                }
            };

            // Initialize mini charts
            new ApexCharts(document.querySelector("#carsChart"), {
                ...miniChartOptions,
                colors: ['#072eb0']
            }).render();

            new ApexCharts(document.querySelector("#usersChart"), {
                ...miniChartOptions,
                colors: ['#17a2b8']
            }).render();

            new ApexCharts(document.querySelector("#ordersChart"), {
                ...miniChartOptions,
                colors: ['#28a745']
            }).render();

            new ApexCharts(document.querySelector("#revenueChart"), {
                ...miniChartOptions,
                colors: ['#ffc107']
            }).render();

            // Sales Overview Chart
            new ApexCharts(document.querySelector("#salesOverviewChart"), {
                chart: {
                    type: 'area',
                    height: 350,
                    toolbar: {
                        show: false
                    }
                },
                series: [{
                    name: 'Sales',
                    data: [31, 40, 28, 51, 42, 109, 100]
                }, {
                    name: 'Revenue',
                    data: [11, 32, 45, 32, 34, 52, 41]
                }],
                xaxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul']
                },
                colors: ['#072eb0', '#28a745'],
                stroke: {
                    curve: 'smooth',
                    width: 2
                },
                fill: {
                    type: 'gradient',
                    gradient: {
                        shadeIntensity: 1,
                        opacityFrom: 0.7,
                        opacityTo: 0.3
                    }
                },
                dataLabels: {
                    enabled: false
                },
                grid: {
                    borderColor: '#f1f1f1',
                    padding: {
                        left: 10,
                        right: 10
                    }
                },
                legend: {
                    position: 'top',
                    horizontalAlign: 'right'
                }
            }).render();
        });
    </script>
</body>
</html>
