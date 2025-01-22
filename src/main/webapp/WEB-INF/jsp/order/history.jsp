<%--<head>--%>
<%--    <%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--    <%@ include file="../include/header.jsp" %>--%>
<%--</head>--%>

<%--<link href="/pub/css/product.css" rel="stylesheet">--%>

<%--<div class="container my-5">--%>
<%--    <h2 class="mb-4">Order History</h2>--%>

<%--    <c:if test="${not empty orderHistory}">--%>
<%--        <div class="accordion" id="orderAccordion">--%>
<%--            <c:forEach items="${orderHistory}" var="history" varStatus="status">--%>
<%--                <div class="accordion-item mb-3 border rounded shadow-sm">--%>
<%--                    <h2 class="accordion-header">--%>
<%--                        <button class="accordion-button ${status.first ? '' : 'collapsed'}" type="button"--%>
<%--                                data-bs-toggle="collapse" data-bs-target="#order${history.order.id}">--%>
<%--                            <div class="d-flex justify-content-between align-items-center w-100 me-3">--%>
<%--                                <span>Order #${history.order.id}</span>--%>
<%--                                <span class="text-muted">--%>
<%--                                    <fmt:formatDate value="${history.order.orderDate}" pattern="MMM dd, yyyy"/>--%>
<%--                                </span>--%>
<%--                            </div>--%>
<%--                        </button>--%>
<%--                    </h2>--%>
<%--                    <div id="order${history.order.id}" class="accordion-collapse collapse ${status.first ? 'show' : ''}"--%>
<%--                         data-bs-parent="#orderAccordion">--%>
<%--                        <div class="accordion-body">--%>
<%--                            <div class="table-responsive">--%>
<%--                                <table class="table table-borderless">--%>
<%--                                    <thead>--%>
<%--                                        <tr>--%>
<%--                                            <th>Product</th>--%>
<%--                                            <th>Quantity</th>--%>
<%--                                            <th>Price</th>--%>
<%--                                            <th>Total</th>--%>
<%--                                        </tr>--%>
<%--                                    </thead>--%>
<%--                                    <tbody>--%>
<%--                                        <c:set var="orderTotal" value="0"/>--%>
<%--                                        <c:forEach items="${history.details}" var="detail">--%>
<%--                                            <c:set var="orderTotal" value="${orderTotal + (detail.quantity * detail.price)}"/>--%>
<%--                                            <tr>--%>
<%--                                                <td>--%>
<%--                                                    <div class="d-flex align-items-center">--%>
<%--                                                        <img src="${empty detail.product.imageUrl ? '/pub/images/default-product.jpg' : detail.product.imageUrl}"--%>
<%--                                                             alt="Product" class="me-3" style="width: 50px; height: 50px; object-fit: cover;">--%>
<%--                                                        <span>${detail.product.name}</span>--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td>${detail.quantity}</td>--%>
<%--                                                <td>$${detail.price}</td>--%>
<%--                                                <td>$${detail.quantity * detail.price}</td>--%>
<%--                                            </tr>--%>
<%--                                        </c:forEach>--%>
<%--                                    </tbody>--%>
<%--                                    <tfoot>--%>
<%--                                        <tr>--%>
<%--                                            <td colspan="3" class="text-end"><strong>Order Total:</strong></td>--%>
<%--                                            <td><strong>$${orderTotal}</strong></td>--%>
<%--                                        </tr>--%>
<%--                                    </tfoot>--%>
<%--                                </table>--%>
<%--                            </div>--%>

<%--                            <c:if test="${not empty history.order.comments}">--%>
<%--                                <div class="mt-3">--%>
<%--                                    <h6>Order Comments:</h6>--%>
<%--                                    <p class="mb-0">${history.order.comments}</p>--%>
<%--                                </div>--%>
<%--                            </c:if>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--    </c:if>--%>

<%--    <c:if test="${empty orderHistory}">--%>
<%--        <div class="text-center py-5">--%>
<%--            <i class="bi bi-clock-history" style="font-size: 3rem; color: #dee2e6;"></i>--%>
<%--            <h3 class="mt-3">No Order History</h3>--%>
<%--            <p class="text-muted">You haven't placed any orders yet.</p>--%>
<%--            <a href="${pageContext.request.contextPath}/product/search"--%>
<%--               class="btn btn-primary mt-3">Start Shopping</a>--%>
<%--        </div>--%>
<%--    </c:if>--%>
<%--</div>--%>

<%--<%@ include file="../include/footer.jsp" %>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<link href="/pub/css/product.css" rel="stylesheet">

<div class="container my-5">
    <h2 class="mb-4">Order History</h2>

    <c:choose>
        <c:when test="${not empty orderHistory}">
            <div class="accordion" id="orderAccordion">
                <c:forEach items="${orderHistory}" var="history" varStatus="status">
                    <div class="accordion-item mb-3">
                        <h2 class="accordion-header">
                            <button class="accordion-button ${status.first ? '' : 'collapsed'}"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#order${history.order.id}">
                                <div class="d-flex justify-content-between align-items-center w-100">
                                    <span>Order #${history.order.id}</span>
                                    <span class="text-muted">
                                        <fmt:formatDate value="${history.order.orderDate}" pattern="MMM dd, yyyy HH:mm"/>
                                    </span>
                                </div>
                            </button>
                        </h2>
                        <div id="order${history.order.id}"
                             class="accordion-collapse collapse ${status.first ? 'show' : ''}"
                             data-bs-parent="#orderAccordion">
                            <div class="accordion-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th class="text-end">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="orderTotal" value="0"/>
                                            <c:forEach items="${history.details}" var="detail">
                                                <c:set var="itemTotal" value="${detail.quantity * detail.price}"/>
                                                <c:set var="orderTotal" value="${orderTotal + itemTotal}"/>
                                                <tr>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <img src="${empty detail.product.imageUrl ? '/pub/images/default-product.jpg' : detail.product.imageUrl}"
                                                                 alt="${detail.product.name}"
                                                                 style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;">
                                                            <span>${detail.product.name}</span>
                                                        </div>
                                                    </td>
                                                    <td>$${detail.price}</td>
                                                    <td>${detail.quantity}</td>
                                                    <td class="text-end">$${String.format("%.2f", itemTotal)}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="3" class="text-end"><strong>Order Total:</strong></td>
                                                <td class="text-end"><strong>$${String.format("%.2f", orderTotal)}</strong></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>

                                <c:if test="${not empty history.order.comments}">
                                    <div class="mt-3">
                                        <h6>Order Comments:</h6>
                                        <p class="mb-0">${history.order.comments}</p>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="text-center py-5">
                <i class="bi bi-clock-history" style="font-size: 3rem; color: #dee2e6;"></i>
                <h3 class="mt-3">No Order History</h3>
                <p class="text-muted">You haven't placed any orders yet.</p>
                <a href="${pageContext.request.contextPath}/product/search"
                   class="btn btn-primary mt-3">Start Shopping</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="../include/footer.jsp" %>
