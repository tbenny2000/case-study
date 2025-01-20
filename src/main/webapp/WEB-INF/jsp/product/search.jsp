<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<jsp:include page="../include/header.jsp" />--%>

<%--<section style="background-color:gray">--%>
<%--    <div class="container">--%>
<%--        <div class="row pt-5 pb-5">--%>
<%--            <h1 class="text-center">Search Page</h1>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<section>--%>
<%--    <div class="container">--%>
<%--        <div class="row justify-content-center pt-5 pb-3">--%>
<%--            <div class="col-8 text-center">--%>
<%--                <!-- Removed enctype as it's not needed for a simple search form -->--%>
<%--                <form action="/product/search">--%>
<%--                    <div class="mb-3">--%>
<%--                        <label for="search" class="form-label"><h4>Product Name Search</h4></label>--%>
<%--                        <input type="text" value="${search}" class="form-control" id="search" name="search" placeholder="Enter search term"/>--%>
<%--                    </div>--%>
<%--                    <button type="submit" class="btn btn-primary">Search</button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<section>--%>
<%--    <div class="container">--%>
<%--        <div class="row pt-5">--%>
<%--            <div class="col-12">--%>
<%--                <h2 class="text-center">Products Found (${products.size()})</h2>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row pt-3">--%>
<%--            <div class="col-12">--%>
<%--                <table class="table">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>ID</th>--%>
<%--                        <th>Name</th>--%>
<%--                        <th>Price</th>--%>
<%--                        <th>Stock Quantity</th>--%>
<%--                        <th>Category</th>--%>
<%--                        <th>Description</th>--%>
<%--                        <th>Image</th>--%>
<%--                        <th>Edit</th>--%>
<%--                        <th>Add To Cart</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach var="product" items="${products}">--%>
<%--                        <tr>--%>
<%--                            <td>${product.id}</td>--%>
<%--                            <td>${product.name}</td>--%>
<%--                            <td>$${product.price}</td>--%>
<%--                            <td>${product.stockQuantity}</td>--%>
<%--                            <td>${product.category}</td>--%>
<%--                            <td>${product.description}</td>--%>
<%--                            <td>--%>
<%--                                <c:if test="${not empty product.imageUrl}">--%>
<%--                                    <img src="${product.imageUrl}" style="width:200px;" alt="${product.name}"/>--%>
<%--                                </c:if>--%>
<%--                            </td>--%>
<%--                            <td><a href="/product/create?id=${product.id}" class="btn btn-primary btn-sm">Edit</a></td>--%>
<%--                            <td><a href="/order/addToCart?id=${product.id}" class="btn btn-success btn-sm">Add To Cart</a></td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--&lt;%&ndash;<!-- ============== FOOTER ==================== -->&ndash;%&gt;--%>
<%--&lt;%&ndash;<jsp:include page="../include/footer.jsp"/>&ndash;%&gt;--%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../include/header.jsp"/>


<style>
    .card {
        transition: transform 0.2s ease;
        height: auto;  /* Changed from h-100 to auto */
    }

    .card-img-top {
        width: 100px;
        height: 100px;
        object-fit: contain;
        margin: 10px auto;  /* Center the image */
        display: block;
    }

    .card-body {
        padding: 1rem;
        flex: none;  /* Prevent card-body from expanding */
    }

    /* Remove extra spacing */
    .row {
        row-gap: 1rem !important;  /* Reduce vertical gap */
    }

    .col {
        margin-bottom: 1rem;  /* Add consistent bottom margin */
    }
</style>


<div class="container py-5">
    <!-- Page Title -->
    <h1 class="text-center mb-4">Products</h1>

    <!-- Combined Search and Filter Form -->
    <form action="/product/search" method="get">
        <div class="row mb-4">
            <!-- Search Input -->
            <div class="col-md-6">
                <div class="d-flex">
                    <input type="text" name="search" class="form-control me-2" value="${search}" placeholder="Search products...">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </div>

            <!-- Filters -->
            <div class="col-md-6 d-flex justify-content-end gap-2">
                <select class="form-select w-auto" name="price">
                    <option value="">Sort by Price</option>
                    <option value="low_to_high" ${param.price == 'low_to_high' ? 'selected' : ''}>Price: Low to High</option>
                    <option value="high_to_low" ${param.price == 'high_to_low' ? 'selected' : ''}>Price: High to Low</option>
                </select>
            </div>
        </div>
    </form>

    <!-- Products Count -->
    <p class="text-muted mb-4">${products.size()} products</p>

    <!-- Rest of your products display code -->
</div>

<!-- Update your product grid structure -->
<div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-2">
    <c:forEach items="${products}" var="product">
        <div class="col">
            <div class="card border-0 shadow-sm">
                <!-- Replace your current img tag with this choose block -->
                <c:choose>
                    <c:when test="${not empty product.imageUrl}">
                        <img src="${product.imageUrl}"
                             class="card-img-top"
                             alt="${product.name}">
                    </c:when>
                    <c:otherwise>
                        <div class="card-img-top d-flex align-items-center justify-content-center bg-light">
                            <span class="text-muted">No Image</span>
                        </div>
                    </c:otherwise>
                </c:choose>

                <div class="card-body">
                    <h5 class="card-title">${product.name}</h5>
                    <p class="card-text">${product.category}</p>
                    <p class="card-text fw-bold">$${product.price}</p>
                    <div class="d-flex justify-content-between">
                        <a href="/product/edit/${product.id}" class="btn btn-outline-secondary btn-sm">Edit</a>
                        <a href="/order/addToCart?id=${product.id}" class="btn btn-primary btn-sm">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


<%--<jsp:include page="../include/footer.jsp"/>--%>