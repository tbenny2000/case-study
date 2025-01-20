<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<link href="/pub/css/product.css" rel="stylesheet">

<div class="container my-5">
    <div class="row">
        <div class="col-lg-8">
            <!-- Checkout Steps -->
            <div class="checkout-section">
                <div class="checkout-header">
                    <h3>Checkout</h3>
                </div>

                <!-- Order Summary Step -->
                <div class="checkout-step">
                    <h5>Order Summary</h5>
                    <div class="table-responsive mt-3">
                        <table class="table table-borderless">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th class="text-end">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cartItems}" var="item">
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="${empty item.product.imageUrl ? '/pub/images/default-product.jpg' : item.product.imageUrl}"
                                                     alt="${item.product.name}"
                                                     style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;">
                                                <span>${item.product.name}</span>
                                            </div>
                                        </td>
                                        <td>${item.quantity}</td>
                                        <td class="text-end">$${item.quantity * item.price}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Order Comments -->
                <form action="/order/placeOrder" method="POST">
                    <div class="checkout-step">
                        <h5>Additional Information</h5>
                        <div class="mb-3">
                            <label for="comments" class="form-label">Order Comments (Optional)</label>
                            <textarea class="form-control" id="comments" name="comments" rows="3"
                                      placeholder="Add any special instructions or comments about your order"></textarea>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary btn-lg w-100">Place Order</button>
                </form>
            </div>
        </div>

        <!-- Order Summary Sidebar -->
        <div class="col-lg-4">
            <div class="cart-total-section">
                <h4>Order Total</h4>
                <div class="price-row">
                    <span>Subtotal</span>
                    <span>$${total}</span>
                </div>
                <div class="price-row">
                    <span>Shipping</span>
                    <span>Free</span>
                </div>
                <div class="price-row total-row">
                    <span>Total</span>
                    <span>$${total}</span>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>