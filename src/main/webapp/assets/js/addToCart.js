document.addEventListener("DOMContentLoaded", function () {
    updateCartCountFromServer();
    updateCartPriceFromServer();
    updateCartDropdown();
    document.querySelectorAll(".add_to_cart").forEach(function (button) {
        button.addEventListener("click", function () {
            let partId = this.dataset.productId;
            console.log("Clicked productId:", partId);
            if (!partId) return;

            fetch(`/PhuongAnhStore/AddToCartServlet`, {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "id=" + encodeURIComponent(partId)
            })
                .then(response => {
                    if (response.redirected) {
                        window.location.href = response.url;
                        return;
                    }
                    if (!response.ok) {
                        throw new Error("Lỗi máy chủ");
                    }
                    return response.json();
                })
                .then(data => {
                    if (!data) return;

                    console.log("Server Response:", data);

                    if (data.status === "success") {
                        const cartCountElem = document.getElementById("cart-count");
                        if (cartCountElem) {
                            cartCountElem.innerText = data.cartCount || 0;
                        }

                        // ✅ Cập nhật lại giá
                        updateCartPriceFromServer();
                        updateCartDropdown();
                        showCartNotification("Sản phẩm đã được thêm vào giỏ!", "green");
                    } else {
                        showCartNotification("Lỗi không xác định!", "red");
                    }
                })
                .catch(error => {
                    console.error("Fetch Error:", error);
                    showCartNotification("Lỗi kết nối!", "red");
                });
        });
    });
});

function updateCartCountFromServer() {
    fetch('/PhuongAnhStore/GetCartCountServlet')
        .then(response => response.json())
        .then(data => {
            const cartCountElem = document.getElementById("cart-count");
            if (cartCountElem) {
                cartCountElem.innerText = data.cartCount || 0;
            }
        })
        .catch(error => {
            console.error("Không thể lấy cart count:", error);
        });
}

function updateCartPriceFromServer() {
    fetch('/PhuongAnhStore/GetCartPriceServlet')
        .then(response => response.json())
        .then(data => {
            const cartPriceElem = document.getElementById("cart-price");
            if (cartPriceElem) {
                const price = data.cartPrice || 0;
                cartPriceElem.innerText = price.toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                });
            }
        })
        .catch(error => {
            console.error("Không thể lấy cart price:", error);
        });
}
function removeFromCart(button) {
    const productId = button.getAttribute("data-id");

    fetch(`/PhuongAnhStore/CartManagementServlet?action=delete&productId=${productId}`, {
        method: 'POST'
    })
        .then(res => {
            if (res.ok) {
                updateCartCountFromServer();
                updateCartPriceFromServer();
                updateCartDropdown(); // cập nhật lại giao diện giỏ hàng
            } else {
                throw new Error("Xóa sản phẩm thất bại");
            }
        })
        .catch(err => {
            console.error("Lỗi khi xóa sản phẩm:", err);
        });
}

function updateCartDropdown() {
    fetch('/PhuongAnhStore/GetCartItemServlet')
        .then(res => res.json())
        .then(items => {
            let html = "";
            items.forEach(item => {
                const firstImage = item.image?.split(',')[0]; // ảnh đầu tiên
                const contextPath = "${pageContext.request.contextPath}";
                html += `
        <div class="product">
          <div class="product-cart-details">
            <h4 class="product-title">
              <a href="/product-detail?id=${item.productId}">${item.name}</a>
            </h4>
            <span class="cart-product-info">
              <span class="cart-product-qty">${item.quantity}</span>
              x ${Number(item.price).toLocaleString('vi-VN')} ₫
            </span>
          </div>
          <figure class="product-image-container">
            <a href="/product-detail?id=${item.productId}" class="product-image">
              <img src="Images/${item.categoryName}/${item.categoryTypeName}/${firstImage}" 
                   alt="Ảnh" class="product-img" />
            </a>
          </figure>
          <a href="#" class="btn-remove" title="Xóa sản phẩm" data-id="${item.productId}" onclick="removeFromCart(this)">
            <i class="icon-close"></i>
        </a>
        </div>`;
            });
            document.getElementById("cart-items").innerHTML = html;
        })
        .catch(error => {
            console.error("Lỗi khi tải giỏ hàng:", error);
        });
}
function showCartNotification(message, color) {
    let notification = document.getElementById("cart-notification");
    if (!notification) return;

    notification.innerText = message;
    notification.style.display = "block";
    notification.style.backgroundColor = color;
    notification.style.color = "black";
    notification.style.padding = "10px";
    notification.style.borderRadius = "5px";

    setTimeout(() => {
        notification.style.display = "none";
    }, 2000);
}
