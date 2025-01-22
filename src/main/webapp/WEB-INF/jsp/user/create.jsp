<head>
    </head><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="../include/header.jsp"/>

    <link href="/pub/css/product.css" rel="stylesheet">
</head>

<div class="product-container">
    <div class="row">
        <div class="col-8">
            <div class="form-section">
                <!-- =========== ACCOUNT ============== -->
                <h2 class="text-center mb-4">${empty form.id ? 'Create' : 'Edit'} Account</h2>
                <form action="/user/createUser" method="POST">
                    <!-- Personal Information -->
                    <div class="mb-4">
                        <!-- =========== PERSONAL INFORMATION ============== -->
                        <h4 class="section-header">Personal Information</h4>
                        <div class="col">
                            <div class="col-md-4 mb-3">
                                <label for="firstName" class="form-label">First Name</label>
                                <input type="text" class="form-control form-control-lg" id="firstName" name="firstName"
                                       value="${form.firstName}">
                                <c:if test="${bindingResult.hasFieldErrors('firstName')}">
                                    <div class="text-danger">
                                        <c:forEach items="${bindingResult.getFieldErrors('firstName')}" var="error">
                                            ${error.defaultMessage}
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>

                            <!-- =========== LAST NAME ============== -->
                            <div class="col-md-4 mb-3">
                                <label for="lastName" class="form-label">Last Name</label>
                                <input type="text" class="form-control form-control-lg" id="lastName" name="lastName"
                                       value="${form.lastName}">
                                <c:if test="${bindingResult.hasFieldErrors('lastName')}">
                                    <div class="text-danger">
                                        <c:forEach items="${bindingResult.getFieldErrors('lastName')}" var="error">
                                            ${error.defaultMessage}
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- =========== EMAIL ============== -->
                        <div class="col">
                            <div class="col-md-4 mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control form-control-lg" id="email" name="email"
                                       value="${form.email}">
                                <c:if test="${bindingResult.hasFieldErrors('email')}">
                                    <div class="text-danger">
                                        <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
                                            ${error.defaultMessage}
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>

                            <!-- =========== PHONE ============== -->
                            <div class="col-md-4 mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="text" class="form-control form-control-lg" id="phone" name="phone"
                                       value="${form.phone}">
                            </div>
                        </div>
                    </div>

                    <!-- ============== ADDRESS INFORMATION ============ -->
                    <div class="col-4 mb-4">
                        <h4 class="section-header">Address Information</h4>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control form-control-lg" id="address" name="address"
                                   value="${form.address}">
                        </div>

                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label for="city" class="form-label">City</label>
                                <input type="text" class="form-control form-control-lg" id="city" name="city"
                                       value="${form.city}">
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="state" class="form-label">State</label>
                                <input type="text" class="form-control form-control-lg" id="state" name="state"
                                       value="${form.state}">
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="zip" class="form-label">ZIP Code</label>
                                <input type="text" class="form-control form-control-lg" id="zip" name="zip"
                                       value="${form.zip}">
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="country" class="form-label">Country</label>
                            <input type="text" class="form-control form-control-lg" id="country" name="country"
                                   value="${form.country}">
                        </div>
                    </div>

                    <!-- =============== PASSWORD SECTION ================= -->
                    <div class="mb-4">
                        <h4 class="section-header">Security</h4>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control form-control-lg" id="password"
                                       name="password">
                                <c:if test="${bindingResult.hasFieldErrors('password')}">
                                    <div class="text-danger">
                                        <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                                            ${error.defaultMessage}
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <!-- =============== SUBMIT BUTTONS ================ -->
                    <div class="row mt-4">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-lg">Create Account</button>
                            <a href="/login/login" class="btn btn-secondary btn-lg ms-2">Already have an account?</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../include/footer.jsp"/>