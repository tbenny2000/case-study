<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<section class="bg-light2 pt-5 pb-5">
    <div class="container">
        <h1 class="text-center">${empty form.id ? 'Create' : 'Edit'} User</h1>

        <div class="row justify-content-center">
            <div class="col-lg-8">
                <form action="/user/createUser" method="POST">
                    <!-- Add this line for debugging -->
                    <p>Editing User ID: ${form.id}</
                    <input type="hidden" name="id" value="${form.id}"/>

                <!-- First Name -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" value="${form.firstName}">
                        <c:if test="${bindingResult.hasFieldErrors('firstName')}">
                            <div class="text-danger">
                                <c:forEach items="${bindingResult.getFieldErrors('firstName')}" var="error">
                                    ${error.defaultMessage}
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>

                    <!-- Last Name -->
                    <div class="col-md-6">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" value="${form.lastName}">
                        <c:if test="${bindingResult.hasFieldErrors('lastName')}">
                            <div class="text-danger">
                                <c:forEach items="${bindingResult.getFieldErrors('lastName')}" var="error">
                                    ${error.defaultMessage}
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                </div>

                <!-- Email -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${form.email}">
                        <c:if test="${bindingResult.hasFieldErrors('email')}">
                            <div class="text-danger">
                                <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
                                    ${error.defaultMessage}
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>

                    <!-- Phone -->
                    <div class="col-md-6">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${form.phone}">
                        <c:if test="${bindingResult.hasFieldErrors('phone')}">
                            <div class="text-danger">
                                <c:forEach items="${bindingResult.getFieldErrors('phone')}" var="error">
                                    ${error.defaultMessage}
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                </div>

                <!-- Address -->
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" name="address" value="${form.address}">
                    <c:if test="${bindingResult.hasFieldErrors('address')}">
                        <div class="text-danger">
                            <c:forEach items="${bindingResult.getFieldErrors('address')}" var="error">
                                ${error.defaultMessage}
                            </c:forEach>
                        </div>
                    </c:if>
                </div>

                <!-- City -->
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="city" class="form-label">City</label>
                        <input type="text" class="form-control" id="city" name="city" value="${form.city}">
                    </div>

                    <!-- State -->
                    <div class="col-md-4">
                        <label for="state" class="form-label">State</label>
                        <input type="text" class="form-control" id="state" name="state" value="${form.state}">
                    </div>

                    <!-- Zip -->
                    <div class="col-md-4">
                        <label for="zip" class="form-label">ZIP Code</label>
                        <input type="text" class="form-control" id="zip" name="zip" value="${form.zip}">
                    </div>
                </div>

                <!-- Country -->
                <div class="mb-3">
                    <label for="country" class="form-label">Country</label>
                    <input type="text" class="form-control" id="country" name="country" value="${form.country}">
                </div>

                <!-- Password (only shown for new users) -->
                <c:if test="${empty form.id}">
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password">
                        <c:if test="${bindingResult.hasFieldErrors('password')}">
                            <div class="text-danger">
                                <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                                    ${error.defaultMessage}
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                </c:if>

                <!-- Buttons -->
                <div class="mt-4">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a href="/user/search" class="btn btn-secondary ms-2">Cancel</a>
                </div>
                </form>
            </div>
        </div>
    </div>
</section>

<%--<jsp:include page="../include/footer.jsp"/>--%>