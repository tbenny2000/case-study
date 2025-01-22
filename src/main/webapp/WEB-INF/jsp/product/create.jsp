<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="../include/header.jsp"/>

    <link href="/pub/css/product.css" rel="stylesheet">
</head>


<%--<!-- =============== PRODUCT PAGE =========================== -->--%>
<div class="product-container">
    <div class="row">
        <div class="col-12">
            <div class="form-section">
                <h2 class="text-center mb-4">${empty form.id ? 'Create' : 'Edit'} Product</h2>

                <form action="/product/createSubmit" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${form.id}"/>

                    <!-- =============== BASIC INFORMATION =========================== -->
                    <div class="mb-4">
                        <h4 class="section-header">Basic Information</h4>
                        <div class="row">
                            <!-- =============== PRODUCT NAME =========================== -->
                            <div class="col-md-6 mb-3">
                                <label for="name" class="form-label">Product Name</label>
                                <input type="text" class="form-control form-control-lg" id="name" name="name" value="${form.name}">
                                <c:if test="${bindingResult.hasFieldErrors('name')}">
                                    <div class="text-danger">
                                        <c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
                                            ${error.defaultMessage}
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                            <!-- =============== CATEGORY =========================== -->
                            <div class="col-md-6 mb-3">
                                <label for="category" class="form-label">Category</label>
                                <select class="form-select form-select-lg" id="category" name="category">
                                    <option value="" ${empty form.category ? 'selected' : ''}>Select a Category</option>
                                    <c:forEach items="${categories}" var="cat">
                                        <option value="${cat}" ${cat eq form.category ? 'selected' : ''}>
                                                ${cat}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="price" class="form-label">Price</label>
                                <input type="number" step="0.01" class="form-control form-control-lg" id="price" name="price" value="${form.price}">
                                <c:if test="${bindingResult.hasFieldErrors('price')}">
                                    <div class="text-danger">
                                        <c:forEach items="${bindingResult.getFieldErrors('price')}" var="error">
                                            ${error.defaultMessage}
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="stockQuantity" class="form-label">Stock Quantity</label>
                                <input type="number" class="form-control form-control-lg" id="stockQuantity" name="stockQuantity" value="${form.stockQuantity}">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control form-control-lg" id="description" name="description" rows="3">${form.description}</textarea>
                        </div>
                    </div>

                    <!-- Image Upload -->
                    <div class="mb-4">
                        <h4 class="section-header">Product Image</h4>
                        <div class="image-upload-section">
                            <input type="file" class="form-control form-control-lg" id="imageFile" name="imageFile">
                            <input type="hidden" name="imageUrl" value="${form.imageUrl}">

                            <c:if test="${not empty form.imageUrl}">
                                <div class="mt-3">
                                    <p>Current Image:</p>
                                    <img src="${form.imageUrl}" alt="Product Image" class="image-preview">
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Submit Buttons -->
                    <div class="button-group">
                        <button type="submit" class="btn btn-primary btn-lg">Save Product</button>
                        <a href="/product/search" class="btn btn-secondary btn-lg ms-2">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../include/footer.jsp"/>