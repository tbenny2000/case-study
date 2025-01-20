<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <jsp:include page="../include/header.jsp"/>
    <link href="/pub/css/global.css" rel="stylesheet">
    <link href="/pub/css/profile.css" rel="stylesheet">
</head>

<div class="profile-container">
    <div class="row">
        <div class="col-12">
            <div class="form-section">
                <h2 class="text-center mb-4">My Profile</h2>

                <!-- Messages -->
                <c:if test="${not empty success}">
                    <div class="alert alert-success" role="alert">
                            ${success}
                    </div>
                </c:if>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                            ${error}
                    </div>
                </c:if>

                <form:form method="POST" action="/user/profile" modelAttribute="form">
                    <!-- Personal Information -->
                    <div class="mb-4">
                        <h4>Personal Information</h4>
                        <div class="row">
                            <div class="col-md-4">
                                <label for="firstName" class="form-label">First Name</label>
                                <form:input path="firstName" class="form-control"/>
                                <form:errors path="firstName" class="text-danger"/>
                            </div>

                            <div class="col-md-4">
                                <label for="lastName" class="form-label">Last Name</label>
                                <form:input path="lastName" class="form-control"/>
                                <form:errors path="lastName" class="text-danger"/>
                            </div>

                            <div class="col-md-4">
                                <label for="email" class="form-label">Email</label>
                                <form:input path="email" type="email" class="form-control"/>
                                <form:errors path="email" class="text-danger"/>
                            </div>
                        </div>
                    </div>

                    <!-- Contact Information -->
                    <div class="mb-4">
                        <h4>Contact Information</h4>
                        <div class="row">
                            <div class="col-md-3">
                                <label for="phone" class="form-label">Phone</label>
                                <form:input path="phone" class="form-control"/>
                            </div>

                            <div class="col-md-9">
                                <label for="address" class="form-label">Address</label>
                                <form:input path="address" class="form-control"/>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-4">
                                <label for="city" class="form-label">City</label>
                                <form:input path="city" class="form-control"/>
                            </div>

                            <div class="col-md-3">
                                <label for="state" class="form-label">State</label>
                                <form:input path="state" class="form-control"/>
                            </div>

                            <div class="col-md-2">
                                <label for="zip" class="form-label">ZIP Code</label>
                                <form:input path="zip" class="form-control"/>
                            </div>

                            <div class="col-md-3">
                                <label for="country" class="form-label">Country</label>
                                <form:input path="country" class="form-control"/>
                            </div>
                        </div>
                    </div>

                    <!-- Password Section -->
                    <div class="mb-4">
                        <h4>Change Password</h4>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="password" class="form-label">New Password</label>
                                <form:password path="password" class="form-control"/>
                                <small class="text-muted">Leave blank to keep current password</small>
                                <form:errors path="password" class="text-danger"/>
                            </div>

                            <div class="col-md-6">
                                <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                <form:password path="confirmPassword" class="form-control"/>
                                <form:errors path="confirmPassword" class="text-danger"/>
                            </div>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="row">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary w-100">Update Profile</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../include/footer.jsp"/>