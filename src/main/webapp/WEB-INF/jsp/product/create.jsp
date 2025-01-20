<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<!-- =============== PRODUCT PAGE =========================== -->
<h1 class="page-title">This is a create product page</h1>


<div class="container">
    <form action="/product/createSubmit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${form.id}">

        <!-- =============== PRODUCT NAME =========================== -->
        <div class="row pt-5">
            <div class="col-6">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" id="name" value="${form.name}">
                </div>
            </div>
        </div>
        <c:if test="${bindingResult.hasFieldErrors('name')}">
            <div class="row">
                <div class="col-6 mb-3">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>


        <!-- =============== PRODUCT PRICE =========================== -->
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input type="text" name="price" class="form-control" id="price" value="${form.price}">
                </div>
            </div>
        </div>
        <c:if test="${bindingResult.hasFieldErrors('price')}">
            <div class="row">
                <div class="col-6 mb-3">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('price')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- =============== PRODUCT STOCK QUANTITY =========================== -->
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="stockQuantity" class="form-label">Stock Quantity</label>
                    <input type="text" name="stockQuantity" class="form-control" id="stockQuantity" value="${form.stockQuantity}">
                </div>
            </div>
        </div>
        <c:if test="${bindingResult.hasFieldErrors('stockQuantity')}">
            <div class="row">
                <div class="col-6 mb-3">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('stockQuantity')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- =============== PRODUCT CATEGORY =========================== -->
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="category" class="form-label">Category</label>
                    <input type="text" name="category" class="form-control" id="category" value="${form.category}">
                </div>
            </div>
        </div>
        <c:if test="${bindingResult.hasFieldErrors('category')}">
            <div class="row">
                <div class="col-6 mb-3">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('category')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- =============== PRODUCT DESCRIPTION =========================== -->
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <input type="text" name="description" class="form-control" id="description" value="${form.description}">
                </div>
            </div>
        </div>
        <c:if test="${bindingResult.hasFieldErrors('description')}">
            <div class="row">
                <div class="col-6 mb-3">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('description')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- =============== PRODUCT IMAGE =========================== -->
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="imageURL" class="form-label">Image URL</label>
                    <input type="text" name="imageUrl" class="form-control" id="imageUrl" value="${form.imageUrl}">
                </div>
            </div>
        </div>
<%--        <div class="row">--%>
<%--            <div class="col-6">--%>
<%--                <div class="mb-3">--%>
<%--                    <label for="imageFile" class="form-label">Product Image</label>--%>
<%--                    <input type="file" name="imageFile" class="form-control" id="imageFile" accept="image/*" style="width:100px;">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        <c:if test="${bindingResult.hasFieldErrors('imageUrl')}">
            <div class="row">
                <div class="col-6 mb-3">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('imageUrl')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- PRODUCT SAVE OR CANCEL SUBMIT -->
        <div class="row pt-3">
            <div class="col-6">
                <button type="submit" class="btn btn-primary">Save Product</button>

                <a class="btn btn-primary ms-3" href="/" role="button">Cancel</a>
            </div>
        </div>

    </form>
</div>

<%--<jsp:include page="../include/footer.jsp"/>--%>