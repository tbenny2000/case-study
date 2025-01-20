<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add to Cart</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Optional: Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <!-- Custom CSS -->
    <link href="/pub/css/global.css" rel="stylesheet">
</head>
<body>
    <!-- Include the navigation header -->

    <div class="container my-5">
        <h1>Add to Cart</h1>

        <c:if test="${not empty product}">
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title">${product.name}</h5>
                    <p class="card-text">${product.description}</p>
                    <p class="card-text">Price: $${product.price}</p>
                    <a href="${pageContext.request.contextPath}/order/addToCart?id=${product.id}" class="btn btn-primary">Add to Cart</a>
                </div>
            </div>
        </c:if>

        <c:if test="${empty product}">
            <div class="alert alert-danger" role="alert">
                Product not found.
            </div>
        </c:if>
    </div>

    <!-- Bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>