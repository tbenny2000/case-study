<%@ include file="../include/header.jsp" %>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-6">
            <img src="/images/${product.id}.jpg" class="img-fluid">
        </div>
        <div class="col-md-6">
            <h1>${product.name}</h1>
            <p class="lead">$${product.price}</p>
            <p>${product.description}</p>
            <sec:authorize access="hasRole('ADMIN')">
                <a href="/admin/products/edit/${product.id}" class="btn btn-warning">Edit</a>
                <button class="btn btn-danger" onclick="deleteProduct(${product.id})">Delete</button>
            </sec:authorize>
        </div>
    </div>
</div>