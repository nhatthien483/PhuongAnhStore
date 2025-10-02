document.addEventListener("DOMContentLoaded", function () {
    updateCartCountFromServer();
    updateCartPriceFromServer();
    updateCartDropdown();
    loadCart();
    document.querySelectorAll(".add_to_cart").forEach(function (button) {
        button.addEventListener("click", function () {
            let partId = this.dataset.productId;
            let qtyInput = document.getElementById("qty");
            let quantity = qtyInput ? parseInt(qtyInput.value) : 1;

            if (!partId || quantity < 1) return;

            fetch(`/PhuongAnhStore/api/AddToCartServlet`, {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "id=" + encodeURIComponent(partId) + "&quantity=" + encodeURIComponent(quantity)
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

                        updateCartPriceFromServer();
                        updateCartDropdown();
                        showCartNotification("Sản phẩm đã được thêm vào giỏ!", "green");
                    } else {
                        showCartNotification("Lỗi không xác định!", "red");
                    }
                })
                .catch(error => {
                    console.error("Fetch Error:", error);
                    showCartNotification("Vui lòng đăng nhập hoặc đăng ký nếu chưa có tài khoản!", "red");
                });
        });
    });
});


function updateCartCountFromServer() {
    fetch('/PhuongAnhStore/api/GetCartCountServlet')
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
    fetch('/PhuongAnhStore/api/GetCartPriceServlet')
        .then(response => response.json())
        .then(data => {
            const cartPriceElem = document.getElementById("cart-price");
            const cartPriceElems = document.getElementById("cart-cart-price");
            if (cartPriceElem) {
                const price = data.cartPrice || 0;
                cartPriceElem.innerText = price.toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                });
            } if (cartPriceElems) {
                const price = data.cartPrice || 0;
                cartPriceElems.innerText = price.toLocaleString('vi-VN', {
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
                loadCart();
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
    fetch('/PhuongAnhStore/api/GetCartItemServlet')
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
              <a href="list-all-product?action=viewDetail&id=${item.productId}">${item.name}</a>
            </h4>
            <span class="cart-product-info">
              <span class="cart-product-qty">${item.quantity}</span>
              x ${Number(item.price).toLocaleString('vi-VN')} ₫
            </span>
          </div>
          <figure class="product-image-container">
            <a href="list-all-product?action=viewDetail&id=${item.productId}" class="product-image">
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
            updateCartCountFromServer();
            updateCartPriceFromServer();
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

function loadCart() {
    const cartBody = document.querySelector('#cart-body'); // thêm dòng này
    fetch("/PhuongAnhStore/api/GetCartItemServlet")
        .then(res => res.json())
        .then(items => {
            cartBody.innerHTML = "";
            items.forEach(item => {
                const tr = document.createElement("tr");
                const imagePath = `Images/${item.categoryName}/${item.categoryTypeName}/${item.image.split(',')[0]}`;
                const detailLink = `/list-all-product?action=viewDetail&id=${item.productId}`;
                const total = item.price * item.quantity;

                tr.innerHTML = `
                <td class="product-col">
                    <div class="product">
                        <figure class="product-media">      
                            <a href="${detailLink}">
                                <img src="${imagePath}" alt="Ảnh" class="product-img" />
                            </a>
                        </figure>
                        <h3 class="product-title">
                            <a href="${detailLink}">${item.name}</a>
                        </h3>
                    </div>
                </td>
                <td class="price-col">${Number(item.price).toLocaleString('vi-VN')}đ</td>
                <td class="quantity-col">
                    <div class="cart-product-quantity">
                       
                        <input type="number" class="quantity form-control" value="${item.quantity}" min="1" max="200" step="1" data-id="${item.productId}" required>
                    </div>
                </td>
                <td class="total-col">${formatCurrencyVN(total)}</td>
                <td class="remove-col">
                    <button class="btn-remove" data-id="${item.productId}" onclick="removeFromCartDetail(this)">
                        <i class="icon-close"></i>
                    </button>
                </td>
                `;
                cartBody.appendChild(tr);
            });

            attachQuantityEvents();
        });
}

function attachQuantityEvents() {
    document.querySelectorAll(".increase").forEach(btn => {
        btn.addEventListener("click", function () {
            const id = this.dataset.id;
            const input = document.querySelector(`input.quantity[data-id="${id}"]`);
            input.value = parseInt(input.value) + 1;
            updateQuantity(id, input.value);
        });
    });

    document.querySelectorAll(".decrease").forEach(btn => {
        btn.addEventListener("click", function () {
            const id = this.dataset.id;
            const input = document.querySelector(`input.quantity[data-id="${id}"]`);
            if (parseInt(input.value) > 1) {
                input.value = parseInt(input.value) - 1;
                updateQuantity(id, input.value);
            }
        });
    });

    document.querySelectorAll("input.quantity").forEach(input => {
        input.addEventListener("change", function () {
            const id = this.dataset.id;
            updateQuantity(id, this.value);
        });
    });
}

function updateQuantity(productId, newQuantity) {
    fetch("/PhuongAnhStore/api/updateCart", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            productId: parseInt(productId),
            quantity: parseInt(newQuantity)
        })
    }).then(res => {
        if (res.ok) {
            updateCartDropdown();
            loadCart(); // Reload cart display
        }
    });
}
function formatCurrencyVN(value) {
    return value.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
}
function removeFromCartDetail(button) {
    const productId = button.getAttribute("data-id");

    fetch(`/PhuongAnhStore/CartManagementServlet?action=delete&productId=${productId}`, {
        method: 'POST'
    })
        .then(res => {
            if (res.ok) {
                loadCart();
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
