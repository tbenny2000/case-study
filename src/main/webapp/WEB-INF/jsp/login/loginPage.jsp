<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="../include/header.jsp"/>
    <link href="/pub/css/global.css" rel="stylesheet">
    <link href="/pub/css/login.css" rel="stylesheet">
</head>

<div class="auth-container">
    <div class="row justify-content-center">
        <div class="col-6">
            <div class="form-section">
                <h2 class="text-center mb-4">Login</h2>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger" role="alert">
                        Invalid username or password.
                    </div>
                </c:if>

                <form action="/login" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="row mb-4">
                        <div class="col-md-8 mx-auto">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control form-control-lg" id="username" name="username" value="">
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-8 mx-auto">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control form-control-lg" id="password" name="password" value="">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8 mx-auto">
                            <button type="submit" class="btn btn-primary btn-lg w-100">Login</button>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-8 mx-auto text-center">
                            <p>Don't have an account? <a href="/login/signup">Sign up here</a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../include/footer.jsp"/>