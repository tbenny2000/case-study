<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<div class="container my-5">
    <div class="text-center">
        <h2>Order Confirmed!</h2>
        <p class="lead">Thank you for your order. Your order number is: ${order.id}</p>
    </div>

    <div class="card mt-4">
        <div class="card-header">
            <h5 class="mb-0">Order Details</h5>
        </div>
        <div class="card-body">
            <table class="table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cartItems}" var="item">
                        <tr>
                            <td>${item.product.name}</td>
                            <td>${item.quantity}</td>
                            <td>$${item.price}</td>
                            <td>$${item.quantity * item.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3" class="text-end"><strong>Total:</strong></td>
                        <td><strong>$${total}</strong></td>
                    </tr>
                </tfoot>
            </table>

            <c:if test="${not empty order.comments}">
                <div class="mt-4">
                    <h6>Order Comments:</h6>
                    <p>${order.comments}</p>
                </div>
            </c:if>
        </div>
    </div>

    <div class="text-center mt-4">
        <a href="/product/search" class="btn btn-primary">Continue Shopping</a>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>