<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/cropperjs@1.5.13/dist/cropper.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        #imagePreview img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            margin-right: 5px;
            border-radius: 5px;
        }
    </style>
</head>
<body class="bg-light">
<div class="container py-5">
        <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">
    <i class="fas fa-home"></i> Trở Về Trang Chủ
</a>

<a href="${pageContext.request.contextPath}/admin/productManagement" class="btn btn-outline-secondary">
    <i class="fas fa-arrow-left"></i> Trở Về Trang Sản Phẩm
</a>

    <div class="card shadow">
        <div class="card-header bg-dark text-white d-flex justify-content-center">
            <h4>Thêm sản phẩm</h4>
        </div>
        <div class="card-body">
            <form id="productForm">
                <input type="hidden" name="action" value="create">
                <div class="mb-3">
                    <label class="form-label">Tên sản phẩm</label>
                    <input type="text" name="name" class="form-control" required>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Giá</label>
                        <input type="number" name="price" class="form-control" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Thương hiệu</label>
                        <input list="brands" name="brand" id="brand" class="form-select" required placeholder="Nhập tên thương hiệu...">
                            <datalist id="brands">
                                <option value="Kingkong">
                                <option value="Gor">
                                <option value="Welkome">
                                <option value="Anank">
                                <option value="Kuzoom">
                                <option value="Quaker">
                                <option value="Bamba">
                                <option value="Kingston">
                                <option value="Sandisk">
                                <option value="Mercusys">
                                <option value="Borofone">
                                <option value="Usams">
                                <option value="XO">
                                <option value="RapooRemax">
                                <option value="Baseus">
                                <option value="Anker">
                                <option value="Wiwu">
                                <option value="Hoco">
                                <option value="TP-Link">
                                <option value="Mircom">
                                <option value="Mescom">
                                <option value="Robot">
                                <option value="A4tech">
                                <option value="Aula">
                                <option value="Klisonli">
                                <option value="Basefast">
                                <option value="Kakusiga">
                                <option value="DEIOG">
                                <option value="Ugreen">
                                <option value="Vention">
                                <option value="Tomate">
                                <option value="Arigato">
                                <option value="Soundmax">
                                <option value="Logitech">
                                <option value="Dell">
                                <option value="HP">
                                <option value="Oubala">
                                <option value="Picom">
                                <option value="MT-Viki">
                                <option value="Likgus">
                                <option value="Vivan">
                                <option value="MotoWolf">
                                <option value="ZDK">
                                <option value="Ehoona">
                                <option value="VegGieg">
                                <option value="KINGMASTER">
                                <option value="Syndee">
                                <option value="Memo">
                                <option value="TPU">
                                <option value="LDNIO">
                                <option value="SenDem">
                                <option value="No name">
                                <option value="Khác">
                                <option value="XUNFOX">
                                <option value="E-Dra">
                                <option value="T-Wolf">
                                <option value="Forder">
                                <option value="Fmouse">
                                <option value="Inphic">
                                <option value="Hổ Vằn">
                                <option value="Ezeey">
                                <option value="LECOO">
                                <option value="Peterhot">
                                <option value="Memumi">
                                <option value="X-Level">
                                <option value="Lishen">
                                <option value="Iris">
                                <option value="Sulada">
                                <option value="Nillkin">
                                <option value="SwitchEasy">
                                <option value="VTZ">
                                <option value="KST">
                                <option value="Space">
                                <option value="Rock">
                                <option value="Beltou">
                                <option value="Panasonic">
                                <option value="DP">
                            </datalist>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Danh mục lớn</label>
                        <select name="categoryName" class="form-select" required>
                            <option value="PhuKienSac">Phụ Kiện Sạc</option>
                            <option value="PhuKienMayTinh">Phụ Kiện Máy Tính</option>
                            <option value="ThietBiMang">Thiết Bị Mạng</option>
                            <option value="ThietBiAmThanh">Thiết Bị Âm Thanh</option>
                            <option value="Op-CuongLuc">Ốp - Cường Lực</option>
                            <option value="PhuKienOtoXeMay">Phụ Kiện Ô tô Xe máy</option>
                            <option value="PhuKienLivestream-ChupAnh">Phụ Kiện Livestream-Chụp Ảnh</option>
                            <option value="ThietBiChuyenDoi-LuuTru">Thiết Bị Chuyển Đổi - Lưu Trữ</option>
                            <option value="PhuKienChoiGame">Phụ Kiện Chơi Game</option>
                            <option value="PhuKienKhac">Phụ Kiện Khác</option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Danh mục nhỏ</label>
                        <select name="categoryTypeName" class="form-select" required>
                            <option value="BoSac">Bộ Sạc</option>
                            <option value="CuSac">Củ Sạc</option>
                            <option value="CapSac">Cáo Sạc</option>
                            <option value="ODien">Ổ Điện</option>
                            <option value="SacDuPhong">Sạc Dự Phòng</option>
                            <option value="Adapter">Adapter</option>
                            <option value="BaoVeCam">Bảo Vệ Cam</option>
                            <option value="CaseAirpod">CaseAirpod</option>
                            <option value="CuongLucDienThoai">Cường Lực Điện Thoại</option>
                            <option value="CuongLucIpad">Cường Lực Ipad</option>
                            <option value="Khac">Khác</option>
                            <option value="OpDienThoai">Ốp Điện Thoại</option>
                            <option value="OpIpad">Ốp Ipad</option>
                            <option value="PPF-Nano">PPF-Nano</option>
                            <option value="DenLivestream">Đèn Livestream</option>
                            <option value="Tripod-GaySlfie">Tripod-Gậy Slfie</option>
                            <option value="BanPhim">Bàn Phím</option>
                            <option value="BoSacLaptop">Bộ Sạc Laptop</option>
                            <option value="Chuot">Chuột</option>
                            <option value="QuatTanNhiet-GiaDo">Quạt Tản Nhiệt - Giá Đỡ</option>
                            <option value="GiaDoOto">Giá Đỡ Ô tô</option>
                            <option value="GiaDoXeMay">Giá Đỡ Xe máy</option>
                            <option value="TauSac">Tẩu Sạc</option>
                            <option value="LoaKaraoke">Loa Karaoke</option>
                            <option value="LoaKhongDay">Loa Không Dây</option>
                            <option value="LoaViTinh">Loa Vi Tính</option>
                            <option value="MicThuAm-Karaoke">Mic Thu Âm - Karaoke</option>
                            <option value="TaiNgheCoDay">Tai Nghe Có Dây</option>
                            <option value="TaiNgheKhongDay">Tai Nghe Không Dây</option>
                            <option value="CapChuyenDoi">Cáp Chuyển Đổi</option>
                            <option value="CapNoiDai">Cáp Nối Dài</option>
                            <option value="DauDocThe">Đầu Đọc Thẻ</option>
                            <option value="HUB-BoChuyenDoi">HUB - Bộ Chuyển Đổi</option>
                            <option value="Ocung">Ổ Cứng</option>
                            <option value="OTG">OTG</option>
                            <option value="TheNho">Thẻ Nhớ</option>
                            <option value="USB">USB</option>
                            <option value="BoKichWifi">Bộ Kích Wifi</option>
                            <option value="Router">Router</option>
                            <option value="USBWifi">USBWifi</option>
                            <option value="TuiChongNuoc">Túi Chống Nước</option>
                            <option value="MocKhoa">Móc Khóa</option>
                            <option value="DenUsb">Đèn USB</option>
                            <option value="Quat">Quạt</option>
                            <option value="SoLanh">Sò Lạnh</option>
                            <option value="BaoTayChoiGame">Bao Tay Chơi Game</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Kho</label>
                        <input type="number" name="stock" class="form-control" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Trạng thái</label>
                        <select name="status" class="form-select">
                            <option value="true">Hiển thị</option>
                            <option value="false">Ẩn</option>
                        </select>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Mô tả</label>
                    <textarea name="description" class="form-control" rows="3"></textarea>
                </div>

                <!-- Ảnh sản phẩm -->
                <div class="mb-3">
                    <label class="form-label">Ảnh sản phẩm</label>
                    <input type="file" id="imageInput" accept="image/*" class="form-control">
                    <div id="imagePreview" class="mt-3 d-flex flex-wrap"></div>
                </div>
                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-success"><i class="fas fa-save me-1"></i> Lưu sản phẩm</button>
                </div>
            </form>
        </div>
    </div>
</div>

                <!-- Modal Crop -->
                <div class="modal fade" id="cropModal" tabindex="-1">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Cắt ảnh sản phẩm (1:1)</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body text-center">
                                <img id="cropImage" style="max-width:100%; max-height:600px;" />
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <button class="btn btn-primary" id="cropAndSave">Cắt và thêm</button>
                            </div>
                        </div>
                    </div>
                </div>
</body>
<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/cropperjs@1.5.13/dist/cropper.min.js"></script>
<script>
    const contextPath = window.location.origin + '${pageContext.request.contextPath}';
</script>

<script>
    let cropper;
    let croppedImages = []; // Lưu { blob, filename }

    const imageInput = document.getElementById("imageInput");
    const cropImage = document.getElementById("cropImage");
    const cropModalEl = document.getElementById("cropModal");
    const cropModal = new bootstrap.Modal(cropModalEl);
    const imagePreview = document.getElementById("imagePreview");

    imageInput.addEventListener("change", function (event) {
        const file = event.target.files[0];
        if (!file) return;

        const reader = new FileReader();
        reader.onload = function (e) {
            cropImage.src = e.target.result;
            cropModal.show();

            cropModalEl.addEventListener('shown.bs.modal', () => {
                if (cropper) cropper.destroy();
                cropper = new Cropper(cropImage, {
                    aspectRatio: 1,
                    viewMode: 1,
                    autoCropArea: 1
                });
            }, { once: true }); // Chỉ gọi một lần sau mỗi show

            cropImage.dataset.filename = file.name;
        };
        reader.readAsDataURL(file);
    });

    document.getElementById("cropAndSave").addEventListener("click", function () {
        if (!cropper) return;

        const canvas = cropper.getCroppedCanvas({
            width: 1200,
            height: 1200
        });

        canvas.toBlob(blob => {
            const filename = cropImage.dataset.filename || ("image" + Date.now() + ".png");

            // Lưu vào mảng
            croppedImages.push({
                blob: blob,
                filename: filename
            });

            // Xem trước ảnh nhỏ
            const url = URL.createObjectURL(blob);
            const img = document.createElement("img");
            img.src = url;
            imagePreview.appendChild(img);

            // ✅ Xóa focus khỏi nút bên trong modal trước khi ẩn modal
            document.activeElement.blur();

            // ✅ Đóng modal an toàn
            cropModal.hide();
        });
    });

    document.getElementById("productForm").addEventListener("submit", function (e) {
        e.preventDefault();

        if (croppedImages.length === 0) {
            alert("Vui lòng thêm ít nhất một ảnh sản phẩm.");
            return;
        }

        const form = e.target;
        const formData = new FormData(form);

        croppedImages.forEach((item, i) => {
            formData.append("image" + i, item.blob, item.filename);
        });

        fetch(contextPath + "/admin/productManagement", {
            method: "POST",
            body: formData
        })
        .then(res => {
            if (res.ok) {
                window.location.href = contextPath + "/admin/productManagement";
            } else {
                return res.text().then(text => alert("Lỗi: " + text));
            }
        })
        .catch(err => {
            console.error("Fetch error:", err);
            alert("Đã xảy ra lỗi kết nối.");
        });
    });
</script>
</html>
