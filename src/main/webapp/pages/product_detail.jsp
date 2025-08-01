<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Phương Anh Store</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo/main-logo-2.png" type="image/x-icon"> 
    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/magnific-popup/magnific-popup.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/nouislider/nouislider.css">

    <!-- Vietnam -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Agbalumo&display=swap" rel="stylesheet">
</head>
<%@ include file="/assets/components/header.jsp" %>
<body>
    <div class="page-wrapper">               
        <main class="main">
            <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
                <div class="container d-flex align-items-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                        <li class="breadcrumb-item">
                            <a href="javascript:history.back()">Quay lại</a>
                        </li>
                        <c:set var="productName" value="${product.name}" />
                        <c:set var="words" value="${fn:split(productName, ' ')}" />
                        <li class="breadcrumb-item">
                            <a>
                            <c:choose>
                                <c:when test="${fn:length(words) > 5}">
                                    <c:forEach var="w" items="${words}" varStatus="i">
                                        <c:if test="${i.index < 5}">
                                            ${w}&nbsp;
                                        </c:if>
                                    </c:forEach>
                                    ...
                                </c:when>
                                <c:otherwise>
                                    ${productName}
                                </c:otherwise>
                            </c:choose>
                            </a>
                        </li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
                <div class="container">
                    <div class="product-details-top">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="product-gallery product-gallery-vertical">
                                    <div class="row">
                                        <figure class="product-main-image">
                                            <%-- <img id="product-zoom" src="assets/images/products/single/1.jpg" data-zoom-image="assets/images/products/single/1-big.jpg" alt="product image"> --%>
                                            <c:set var="firstImage" value="${fn:split(product.image, ',')[0]}" />
                                                            <img id="product-zoom" src="${pageContext.request.contextPath}/Images/${product.category.categoryName}/${product.categoryType.categoryTypeName}/${firstImage}" 
                                                                data-zoom-image="${pageContext.request.contextPath}/Images/${product.category.categoryName}/${product.categoryType.categoryTypeName}/${firstImage}"  alt="Ảnh"/></td>
                                            <a href="#" id="btn-product-gallery" class="btn-product-gallery">
                                                <i class="icon-arrows"></i>
                                            </a>
                                        </figure><!-- End .product-main-image -->

                                        <div id="product-zoom-gallery" class="product-image-gallery">
                                            <c:forEach var="img" items="${images}">
                                                
                                                <a class="product-gallery-item" href="#"
                                                data-image="${pageContext.request.contextPath}/Images/${product.category.categoryName}/${product.categoryType.categoryTypeName}/${img}"
                                                data-zoom-image="${pageContext.request.contextPath}/Images/${product.category.categoryName}/${product.categoryType.categoryTypeName}/${img}">                                              
                                                    <img src="${pageContext.request.contextPath}/Images/${product.category.categoryName}/${product.categoryType.categoryTypeName}/${img}" 
                                                        alt="Ảnh sản phẩm" />
                                                </a>
                                            </c:forEach>
                                        </div>


                                    </div><!-- End .row -->
                                </div><!-- End .product-gallery -->
                            </div><!-- End .col-md-6 -->

                            <div class="col-md-6">
                                <div class="product-details">
                                    <h1 class="product-title">${product.name}</h1><!-- End .product-title -->

                                    <div class="product-price">
                                        ${product.formattedPrice} VNĐ
                                    </div><!-- End .product-price -->

                                    <div class="product-content">
                                        <p>${product.type}</p>
                                    </div><!-- End .product-content -->                      

                                    <div class="details-filter-row details-row-size">
                                        <label for="qty">Số lượng:</label>
                                        <div class="product-details-quantity">
                                            <input type="number" id="qty" class="form-control" value="1" min="1" max="10" step="1" data-decimals="0" required>
                                        </div><!-- End .product-details-quantity -->
                                    </div><!-- End .details-filter-row -->

                                    <div class="product-details-action rounded-3 p-3">
                                        <a href="#" class="btn-product btn-cart "><span>Thêm Vào Giỏ</span></a>
                                    </div><!-- End .product-details-action -->

                                    <div class="product-details-footer">
                                        <div class="product-cat">
                                            <span>Phân Loại Sản Phẩm</span>
                                            <a href="#">${product.getCategory().getCategoryName()}</a>,
                                            <a href="#">${product.getCategoryType().getCategoryTypeName()}</a>,
                                        </div><!-- End .product-cat -->

                                        <div class="social-icons social-icons-sm">
                                            <span class="social-label">Share:</span>
                                            <a href="#" class="social-icon" title="Facebook" target="_blank"><i class="icon-facebook-f"></i></a>
                                            <a href="#" class="social-icon" title="Twitter" target="_blank"><i class="icon-twitter"></i></a>
                                            <a href="#" class="social-icon" title="Instagram" target="_blank"><i class="icon-instagram"></i></a>
                                            <a href="#" class="social-icon" title="Pinterest" target="_blank"><i class="icon-pinterest"></i></a>
                                        </div>
                                    </div><!-- End .product-details-footer -->
                                </div><!-- End .product-details -->
                            </div><!-- End .col-md-6 -->
                        </div><!-- End .row -->
                    </div><!-- End .product-details-top -->

                    <div class="product-details-tab">
                        <ul class="nav nav-pills justify-content-center" role="tablist">
                            <li class="nav-item rounded-3">
                                <a class="nav-link active" id="product-desc-link" data-toggle="tab" href="#product-desc-tab" role="tab" aria-controls="product-desc-tab" aria-selected="true">Mô Tả Sản Phẩm</a>
                            </li>
                            <li class="nav-item rounded-3">
                                <a class="nav-link" id="product-review-link" data-toggle="tab" href="#product-review-tab" role="tab" aria-controls="product-review-tab" aria-selected="false">Đánh Giá</a>
                            </li>
                        </ul>
                        <div class="tab-content shadow rounded-3">
                            <div class="tab-pane fade show active" id="product-desc-tab" role="tabpanel" aria-labelledby="product-desc-link">
                                <div class="product-desc-content">
                                    <h3>Thông Tin Chi Tiết</h3>
                                    <div class="tab-pane fade show active" id="product-desc-tab" role="tabpanel" aria-labelledby="product-desc-link">
                                        <p style="white-space: pre-wrap;">${product.description}</p>
                                    </div>
                                </div><!-- End .product-desc-content -->
                            </div><!-- .End .tab-pane -->

                            <div class="tab-pane fade" id="product-review-tab" role="tabpanel" aria-labelledby="product-review-link">
                                <div class="reviews">
                                    <h3>Đánh Giá</h3>
                                    <div class="review">
                                        <div class="row no-gutters">
                                            <div class="col-auto">
                                                <h4><a href="#">Samanta J.</a></h4>
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 80%;"></div><!-- End .ratings-val -->
                                                    </div><!-- End .ratings -->
                                                </div><!-- End .rating-container -->
                                                <span class="review-date">6 days ago</span>
                                            </div><!-- End .col -->
                                            <div class="col">
                                                <h4>Good, perfect size</h4>

                                                <div class="review-content">
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus cum dolores assumenda asperiores facilis porro reprehenderit animi culpa atque blanditiis commodi perspiciatis doloremque, possimus, explicabo, autem fugit beatae quae voluptas!</p>
                                                </div><!-- End .review-content -->

                                                <div class="review-action">
                                                    <a href="#"><i class="icon-thumbs-up"></i>Helpful (2)</a>
                                                    <a href="#"><i class="icon-thumbs-down"></i>Unhelpful (0)</a>
                                                </div><!-- End .review-action -->
                                            </div><!-- End .col-auto -->
                                        </div><!-- End .row -->
                                    </div><!-- End .review -->

                                    <div class="review">
                                        <div class="row no-gutters">
                                            <div class="col-auto">
                                                <h4><a href="#">John Doe</a></h4>
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                                    </div><!-- End .ratings -->
                                                </div><!-- End .rating-container -->
                                                <span class="review-date">5 days ago</span>
                                            </div><!-- End .col -->
                                            <div class="col">
                                                <h4>Very good</h4>

                                                <div class="review-content">
                                                    <p>Sed, molestias, tempore? Ex dolor esse iure hic veniam laborum blanditiis laudantium iste amet. Cum non voluptate eos enim, ab cumque nam, modi, quas iure illum repellendus, blanditiis perspiciatis beatae!</p>
                                                </div><!-- End .review-content -->

                                                <div class="review-action">
                                                    <a href="#"><i class="icon-thumbs-up"></i>Helpful (0)</a>
                                                    <a href="#"><i class="icon-thumbs-down"></i>Unhelpful (0)</a>
                                                </div><!-- End .review-action -->
                                            </div><!-- End .col-auto -->
                                        </div><!-- End .row -->
                                    </div><!-- End .review -->
                                </div><!-- End .reviews -->
                            </div><!-- .End .tab-pane -->
                        </div><!-- End .tab-content -->
                    </div><!-- End .product-details-tab -->

                    <h2 class="title text-center mb-4">Có Thể Bạn Sẽ Quan Tâm</h2><!-- End .title text-center -->

                    <div class="owl-carousel owl-simple carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                        data-owl-options='{
                            "nav": false, 
                            "dots": true,
                            "margin": 20,
                            "loop": false,
                            "responsive": {
                                "0": {
                                    "items":1
                                },
                                "480": {
                                    "items":2
                                },
                                "768": {
                                    "items":3
                                },
                                "992": {
                                    "items":4
                                },
                                "1200": {
                                    "items":4,
                                    "nav": true,
                                    "dots": false
                                }
                            }
                        }'>
                        <c:forEach var="recomProduct" items="${recomList}">
                            <div class="product product-7 text-center">
                                <figure class="product-media">
                                    <span class="product-label label-new">New</span>
                                    <a href="${pageContext.request.contextPath}/list-all-product?action=viewDetail&id=${recomProduct.productId}">
                                        <c:set var="firstImage" value="${fn:split(recomProduct.image, ',')[0]}" />
                                        <img src="${pageContext.request.contextPath}/Images/${recomProduct.category.categoryName}/${recomProduct.categoryType.categoryTypeName}/${firstImage}" alt="Product image">
                                    </a>
                                    <div class="product-action">
                                        <a href="#" class="btn-product btn-cart"><span>Thêm Vào Giỏ</span></a>
                                    </div><!-- End .product-action -->
                                </figure><!-- End .product-media -->

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">${recomProduct.type}</a>
                                    </div><!-- End .product-cat -->
                                    <h3 class="product-title"><a href="product.html">${recomProduct.name}</a></h3><!-- End .product-title -->
                                    <div class="product-price">
                                        ${recomProduct.formattedPrice} VNĐ
                                    </div><!-- End .product-price -->                         
                                </div><!-- End .product-body -->
                            </div><!-- End .product --> 
                        </c:forEach>
                    </div><!-- End .owl-carousel -->
                </div><!-- End .container -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->   
    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

    <!-- Sticky Bar -->
    <div class="sticky-bar">
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <figure class="product-media">
                        <a href="#">
                            <c:set var="firstImage" value="${fn:split(product.image, ',')[0]}" />
                            <img src="${pageContext.request.contextPath}/Images/${product.category.categoryName}/${product.categoryType.categoryTypeName}/${firstImage}" alt="Product image">
                        </a>
                    </figure><!-- End .product-media -->
                    <h4 class="product-title"><a href="#">${product.name}</a></h4><!-- End .product-title -->
                </div><!-- End .col-6 -->

                <div class="col-6 justify-content-end">
                    <div class="product-price">
                        ${product.formattedPrice} VNĐ
                    </div><!-- End .product-price -->
                    <div class="product-details-quantity">
                        <input type="number" id="sticky-cart-qty" class="form-control" value="1" min="1" max="10" step="1" data-decimals="0" required>
                    </div><!-- End .product-details-quantity -->

                    <div class="product-details-action">
                        <a href="#" class="btn-product btn-cart"><span>Thêm Vào Giỏ</span></a>
                    </div><!-- End .product-details-action -->
                </div><!-- End .col-6 -->
            </div><!-- End .row -->
        </div><!-- End .container -->
    </div><!-- End .sticky-bar -->

    <!-- Mobile Menu -->

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.hoverIntent.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/superfish.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-input-spinner.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.elevateZoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-input-spinner.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.min.js"></script>
    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
<%@ include file="/assets/components/footer.jsp" %>


<!-- molla/product.html  22 Nov 2019 09:55:05 GMT -->
</html>