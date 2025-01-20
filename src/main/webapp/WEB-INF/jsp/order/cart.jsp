<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../include/header.jsp" %>
<!-- Custom CSS -->
<link href="/pub/css/global.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Optional: Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Cart</title>
</head>
<body>
    <div class="container my-5">
        <h1>Cart</h1>

        <c:if test="${not empty cartItems}">
            <table class="table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="totalAmount" value="${0}"/>
                    <c:forEach items="${cartItems}" var="item">
                        <c:set var="totalAmount" value="${totalAmount + (item.quantity * item.price)}"/>
                        <tr>
                            <td>${item.product.name}</td>
                            <td>
                                <div class="input-group">
                                    <input type="hidden" name="id" value="${item.product.id}">
                                    <button type="button" class="btn btn-outline-secondary decrement-btn" data-product-id="${item.product.id}">-</button>
                                    <input type="number" class="form-control quantity-input" value="${item.quantity}" min="1" name="quantity">
                                    <button type="button" class="btn btn-outline-secondary increment-btn" data-product-id="${item.product.id}">+</button>
                                </div>
                            </td>
                            <td>$${item.price}</td>
                            <td>$${item.quantity * item.price}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/order/removeFromCart?id=${item.product.id}" class="btn btn-danger btn-sm">Remove</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- CONTINUE SHOPPING -->
            <div class="d-flex justify-content-between align-items-center">
                <a href="${pageContext.request.contextPath}/product/search" class="btn btn-secondary">Continue Shopping</a>
                <h4>Total: $${totalAmount}</h4>
                <a href="${pageContext.request.contextPath}/order/checkout" class="btn btn-primary">Proceed to Checkout</a>
            </div>
        </c:if>

        <!-- CART ITEMS -->
        <c:if test="${empty cartItems}">
            <div class="alert alert-info" role="alert">
                Your cart is empty.
            </div>
            <a href="${pageContext.request.contextPath}/product/search" class="btn btn-secondary">Continue Shopping</a>
        </c:if>
    </div>

    <!-- Bootstrap JavaScript Bundle with Popper -->
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>--%>

<%--    <script>--%>
<%--    document.querySelectorAll('.decrement-btn').forEach(btn => {--%>
<%--        btn.addEventListener('click', () => {--%>
<%--            const quantityInput = btn.closest('.input-group').querySelector('.quantity-input');--%>
<%--            const id = btn.dataset.productId;--%>
<%--            const quantity = parseInt(quantityInput.value) - 1;--%>
<%--            quantityInput.value = Math.max(quantity, 1);--%>
<%--            updateCart(id, quantity);--%>
<%--        });--%>
<%--    });--%>

<%--    document.querySelectorAll('.increment-btn').forEach(btn => {--%>
<%--        btn.addEventListener('click', () => {--%>
<%--            const quantityInput = btn.closest('.input-group').querySelector('.quantity-input');--%>
<%--            const id = btn.dataset.productId;--%>
<%--            const quantity = parseInt(quantityInput.value) + 1;--%>
<%--            quantityInput.value = quantity;--%>
<%--            updateCart(id, quantity);--%>
<%--        });--%>
<%--    });--%>

<%--    function updateCart(id, quantity) {--%>
<%--        fetch(`${window.location.origin}/order/updateCart`, {--%>
<%--            method: 'POST',--%>
<%--            headers: {--%>
<%--                'Content-Type': 'application/x-www-form-urlencoded'--%>
<%--            },--%>
<%--            body: `id=${id}&quantity=${quantity}`--%>
<%--        })--%>
<%--        .then(response => response.text())--%>
<%--        .then(data => {--%>
<%--            // Optionally, you can update the cart display with the new data--%>
<%--            window.location.reload();--%>
<%--        })--%>
<%--        .catch(error => console.error('Error updating cart:', error));--%>
<%--    }--%>
<%--    </script>--%>

<%--    <jsp:include page="../include/footer.jsp"/>--%>
