<%--<head>--%>
<%--    <%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>--%>
<%--    <%@ include file="../include/header.jsp" %>--%>

<%--    <!-- Bootstrap CSS -->--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">--%>

<%--    <!-- Optional: Bootstrap Icons -->--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">--%>

<%--    <link href="/pub/css/global.css" rel="stylesheet">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">--%>

<%--    <!-- Add CSRF meta tags here -->--%>
<%--    <meta name="_csrf" content="${_csrf.token}"/>--%>
<%--    <meta name="_csrf_header" content="${_csrf.headerName}"/>--%>

<%--    <link href="/pub/css/product.css" rel="stylesheet">--%>
<%--</head>--%>

<%--<div class="container my-5">--%>
<%--    <h2 class="mb-4">Shopping Cart</h2>--%>

<%--    <div class="row">--%>
<%--        <div class="col-lg-8">--%>
<%--            <!-- Cart Items -->--%>
<%--            <c:if test="${not empty cartItems}">--%>
<%--                <c:forEach items="${cartItems}" var="item">--%>
<%--                    <div class="cart-item">--%>
<%--                        <div class="row align-items-center">--%>
<%--                            <!-- Product Image -->--%>
<%--                            <div class="col-md-2">--%>
<%--                                <img src="${empty item.product.imageUrl ? '/pub/images/default-product.jpg' : item.product.imageUrl}"--%>
<%--                                     alt="${item.product.name}" class="cart-item-image">--%>
<%--                            </div>--%>

<%--                            <!-- Product Details -->--%>
<%--                            <div class="col-md-4">--%>
<%--                                <h5 class="mb-1">${item.product.name}</h5>--%>
<%--                                <p class="text-muted mb-0">Unit Price: $${item.price}</p>--%>
<%--                            </div>--%>

<%--                            <!-- Quantity Controls -->--%>
<%--                            <div class="col-md-3">--%>
<%--                                <div class="cart-quantity-controls">--%>
<%--                                    <button type="button" class="quantity-btn decrement-btn" data-product-id="${item.product.id}">-</button>--%>
<%--                                    <input type="number" class="form-control text-center quantity-input"--%>
<%--                                           value="${item.quantity}" min="1" style="width: 60px;">--%>
<%--                                    <button type="button" class="quantity-btn increment-btn" data-product-id="${item.product.id}">+</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <!-- Total Price -->--%>
<%--                            <div class="col-md-2">--%>
<%--                                <span class="fw-bold">$${item.quantity * item.price}</span>--%>
<%--                            </div>--%>

<%--                            <!-- Remove Button -->--%>
<%--                            <div class="col-md-1">--%>
<%--                                <a href="${pageContext.request.contextPath}/order/removeFromCart?id=${item.product.id}"--%>
<%--                                   class="btn btn-link text-danger">--%>
<%--                                    <i class="bi bi-trash"></i>--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </c:if>--%>
<%--        </div>--%>

<%--        <!-- Order Summary -->--%>
<%--        <div class="col-lg-4">--%>
<%--            <div class="cart-total-section">--%>
<%--                <h4 class="mb-4">Order Summary</h4>--%>

<%--                <div class="price-row">--%>
<%--                    <span>Subtotal</span>--%>
<%--                    <span>$${totalAmount}</span>--%>
<%--                </div>--%>

<%--                <div class="price-row">--%>
<%--                    <span>Shipping</span>--%>
<%--                    <span>Free</span>--%>
<%--                </div>--%>

<%--                <div class="price-row total-row">--%>
<%--                    <span>Total</span>--%>
<%--                    <span>$${totalAmount}</span>--%>
<%--                </div>--%>

<%--                <div class="d-grid gap-2 mt-4">--%>
<%--                    <a href="${pageContext.request.contextPath}/order/checkout"--%>
<%--                       class="btn btn-primary btn-lg">Proceed to Checkout</a>--%>
<%--                    <a href="${pageContext.request.contextPath}/product/search"--%>
<%--                       class="btn btn-outline-secondary">Continue Shopping</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Empty Cart Message -->--%>
<%--    <c:if test="${empty cartItems}">--%>
<%--        <div class="text-center py-5">--%>
<%--            <i class="bi bi-cart-x" style="font-size: 3rem; color: #dee2e6;"></i>--%>
<%--            <h3 class="mt-3">Your cart is empty</h3>--%>
<%--            <p class="text-muted">Add some products to your cart and come back!</p>--%>
<%--            <a href="${pageContext.request.contextPath}/product/search"--%>
<%--               class="btn btn-primary mt-3">Browse Products</a>--%>
<%--        </div>--%>
<%--    </c:if>--%>
<%--</div>--%>

<%--    <!-- ===============JAVASCRIPT TO HANDLE THE CART QUANTITY =============-->--%>
<%--    <script>--%>
<%--        document.addEventListener('DOMContentLoaded', function() {--%>
<%--            // Handle increment buttons--%>
<%--            document.querySelectorAll('.increment-btn').forEach(button => {--%>
<%--                button.addEventListener('click', function() {--%>
<%--                    const productId = this.getAttribute('data-product-id');--%>
<%--                    updateCart(productId, 1);--%>
<%--                });--%>
<%--            });--%>

<%--            // Handle decrement buttons--%>
<%--            document.querySelectorAll('.decrement-btn').forEach(button => {--%>
<%--                button.addEventListener('click', function() {--%>
<%--                    const productId = this.getAttribute('data-product-id');--%>
<%--                    updateCart(productId, -1);--%>
<%--                });--%>
<%--            });--%>

<%--            // Handle manual quantity changes--%>
<%--            document.querySelectorAll('.quantity-input').forEach(input => {--%>
<%--                let originalValue = parseInt(input.value);--%>
<%--                input.addEventListener('change', function() {--%>
<%--                    const productId = this.closest('tr').querySelector('input[name="id"]').value;--%>
<%--                    const newValue = parseInt(this.value);--%>
<%--                    const difference = newValue - originalValue;--%>

<%--                    if (newValue >= 0) {--%>
<%--                        updateCart(productId, difference);--%>
<%--                    }--%>
<%--                });--%>
<%--            });--%>

<%--            function updateCart(productId, quantityChange) {--%>
<%--                fetch('/order/updateCart?id=' + productId + '&quantity=' + quantityChange, {--%>
<%--                    method: 'POST'--%>
<%--                }).then(response => {--%>
<%--                    if (response.ok) {--%>
<%--                        window.location.reload();--%>
<%--                    } else {--%>
<%--                        console.error('Error updating cart');--%>
<%--                    }--%>
<%--                }).catch(error => {--%>
<%--                    console.error('Error:', error);--%>
<%--                    alert('Error updating cart. Please try again.');--%>
<%--                });--%>
<%--            }--%>
<%--        });--%>
<%--    </script>--%>
<%--</body>--%>


<%--<jsp:include page="../include/footer.jsp"/>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../include/header.jsp" %>

<link href="/pub/css/product.css" rel="stylesheet">

<div class="container my-5">
    <h2 class="mb-4">Shopping Cart</h2>

    <div class="row">
        <div class="col-lg-8">
            <!-- Cart Items -->
            <c:if test="${not empty cartItems}">
                <c:set var="subtotal" value="0" />
                <c:forEach items="${cartItems}" var="item">
                    <c:set var="subtotal" value="${subtotal + (item.quantity * item.price)}" />
                    <div class="cart-item">
                        <div class="row align-items-center">
                            <!-- Product Image -->
                            <div class="col-md-2">
                                <img src="${empty item.product.imageUrl ? '/pub/images/default-product.jpg' : item.product.imageUrl}"
                                     alt="${item.product.name}" class="cart-item-image">
                            </div>

                            <!-- Product Details -->
                            <div class="col-md-4">
                                <h5 class="mb-1">${item.product.name}</h5>
                                <p class="text-muted mb-0">Unit Price: $${item.price}</p>
                            </div>

                            <!-- Quantity Controls -->
                            <div class="col-md-3">
                                <div class="cart-quantity-controls">
                                    <button type="button" class="quantity-btn decrement-btn" data-product-id="${item.product.id}">-</button>
                                    <input type="number" class="form-control text-center quantity-input"
                                           value="${item.quantity}" min="1" style="width: 60px;">
                                    <button type="button" class="quantity-btn increment-btn" data-product-id="${item.product.id}">+</button>
                                </div>
                            </div>

                            <!-- Total Price -->
                            <div class="col-md-2">
                                <span class="fw-bold">$${String.format("%.2f", item.quantity * item.price)}</span>
                            </div>

                            <!-- Remove Button -->
                            <div class="col-md-1">
                                <a href="${pageContext.request.contextPath}/order/removeFromCart?id=${item.product.id}"
                                   class="btn btn-link text-danger">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>

        <!-- Order Summary -->
        <div class="col-lg-4">
            <div class="cart-total-section">
                <h4 class="mb-4">Order Summary</h4>

                <div class="price-row">
                    <span>Subtotal</span>
                    <span>$${String.format("%.2f", subtotal)}</span>
                </div>

                <div class="price-row">
                    <span>Shipping</span>
                    <span>Free</span>
                </div>

                <div class="price-row total-row">
                    <span>Total</span>
                    <span>$${String.format("%.2f", subtotal)}</span>
                </div>

                <div class="d-grid gap-2 mt-4">
                    <a href="${pageContext.request.contextPath}/order/checkout"
                       class="btn btn-primary btn-lg">Proceed to Checkout</a>
                    <a href="${pageContext.request.contextPath}/product/search"
                       class="btn btn-outline-secondary">Continue Shopping</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Empty Cart Message -->
    <c:if test="${empty cartItems}">
        <div class="text-center py-5">
            <i class="bi bi-cart-x" style="font-size: 3rem; color: #dee2e6;"></i>
            <h3 class="mt-3">Your cart is empty</h3>
            <p class="text-muted">Add some products to your cart and come back!</p>
            <a href="${pageContext.request.contextPath}/product/search"
               class="btn btn-primary mt-3">Browse Products</a>
        </div>
    </c:if>
</div>

<%@ include file="../include/footer.jsp" %>
