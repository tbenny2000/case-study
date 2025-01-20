<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../include/header.jsp"/>

<link href="/pub/css/product.css" rel="stylesheet">
</head>

<!-- Hero Section with Search -->
<div class="hero-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 text-center">
                <h1 class="display-4 text-white mb-4">Discover Your Perfect Soccer Gear</h1>
                <form action="/product/search" method="GET" class="search-form">
                    <div class="input-group mb-3">
                        <input type="text" name="search" class="form-control form-control-lg"
                               placeholder="Search products..." value="${search}">
                        <button class="btn btn-primary btn-lg" type="submit">Search</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Filters Section -->
<div class="container mt-4 mb-4">
    <div class="row align-items-center">
        <div class="col-md-6">
            <h4 class="mb-0">${empty search ? 'All Products' : 'Search Results'}</h4>
            <p class="text-muted">Showing ${products.size()} products</p>
        </div>
        <div class="col-md-6 text-end">
            <select class="form-select d-inline-block w-auto"
                    onchange="window.location.href=this.value">
                <option value="/product/search?search=${search}">Sort by...</option>
                <option value="/product/search?search=${search}&price=low_to_high"
                ${param.price == 'low_to_high' ? 'selected' : ''}>
                    Price: Low to High
                </option>
                <option value="/product/search?search=${search}&price=high_to_low"
                ${param.price == 'high_to_low' ? 'selected' : ''}>
                    Price: High to Low
                </option>
            </select>
        </div>
    </div>
</div>

<!-- Products Grid -->
<div class="container mb-5">
    <div class="row">
        <c:forEach items="${products}" var="product">
            <div class="col-md-4 col-lg-3 mb-4">
                <div class="product-card">
                    <div class="product-image-wrapper">
                        <img src="${empty product.imageUrl ? '/pub/images/default-product.jpg' : product.imageUrl}"
                             alt="${product.name}" class="product-image">
                        <div class="product-actions">
                            <sec:authorize access="isAuthenticated()">
                                <a href="/order/addToCart?id=${product.id}" class="btn btn-primary btn-sm">
                                    Add to Cart
                                </a>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('ADMIN')">
                                <a href="/product/edit/${product.id}" class="btn btn-outline-light btn-sm">
                                    Edit
                                </a>
                            </sec:authorize>
                        </div>
                    </div>
                    <div class="product-info">
                        <h5 class="product-title">${product.name}</h5>
                        <p class="product-description">${product.description}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="product-price">$${String.format("%.2f", product.price)}</span>
                            <sec:authorize access="!isAuthenticated()">
                                <a href="/login/login" class="btn btn-outline-primary btn-sm">
                                    Login to Purchase
                                </a>
                            </sec:authorize>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- No Products Found Message -->
    <c:if test="${empty products}">
        <div class="text-center py-5">
            <div class="empty-state">
                <i class="bi bi-search"></i>
                <h3>No products found</h3>
                <p>Try adjusting your search criteria</p>
            </div>
        </div>
    </c:if>
</div>

<jsp:include page="../include/footer.jsp"/><jsp:include page="../include/footer.jsp"/>