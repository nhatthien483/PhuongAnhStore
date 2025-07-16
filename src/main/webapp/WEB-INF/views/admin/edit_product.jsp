<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.css"/>
</head>
<body class="bg-light">
<div class="container mt-5">
    <c:choose>
        <c:when test="${product == null}">
            <div class="alert alert-danger text-center">
                <h5>⚠️ Không tìm thấy sản phẩm để cập nhật.</h5>
                <a href="products" class="btn btn-primary mt-3">Quay lại danh sách</a>
            </div>
        </c:when>

        <c:otherwise>
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card shadow">
                        <div class="card-header bg-success text-white">
                            <h4 class="mb-0">Chỉnh sửa sản phẩm: <strong>${product.name}</strong></h4>
                        </div>
                        <div class="card-body">
                            <form method="post" action="products" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="update"/>
                                <input type="hidden" name="id" value="${product.productId}"/>

                                <div class="mb-3">
                                    <label class="form-label">Tên sản phẩm</label>
                                    <input type="text" name="name" value="${product.name}" class="form-control" required/>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Giá</label>
                                    <input type="number" step="0.01" name="price" value="${product.price}" class="form-control" required/>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mô tả</label>
                                    <textarea name="description" class="form-control" rows="4">${product.description}</textarea>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Ảnh hiện tại</label><br/>
                                    <img src="${pageContext.request.contextPath}/Images/${product.imagePath}" alt="Current image"
                                         class="img-thumbnail mb-2" style="max-height: 200px;">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Chọn ảnh mới (nếu muốn thay)</label>
                                    <input type="file" name="imageFile" accept="image/*" class="form-control" id="imageInput"/>
                                    <img id="previewImage" class="img-thumbnail mt-3" style="max-height: 300px; display:none;" />
                                    <input type="hidden" name="croppedImage" id="croppedImage"/>
                                </div>

                                <div class="text-end">
                                    <a href="products" class="btn btn-secondary">Quay lại</a>
                                    <button type="submit" class="btn btn-success">Lưu thay đổi</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<!-- Scripts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.js"></script>
<script>
    const input = document.getElementById("imageInput");
    const preview = document.getElementById("previewImage");
    let cropper;

    input.addEventListener("change", function () {
        const file = input.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
                preview.style.display = "block";

                if (cropper) cropper.destroy();
                cropper = new Cropper(preview, {
                    aspectRatio: 1,
                    viewMode: 1,
                    autoCropArea: 1,
                    cropend: () => {
                        const canvas = cropper.getCroppedCanvas();
                        document.getElementById("croppedImage").value = canvas.toDataURL("image/png");
                    }
                });
            };
            reader.readAsDataURL(file);
        }
    });
</script>
</body>
</html>
