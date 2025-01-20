<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>


<form action="/login" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

    <div class="mt-3 row justify-content-center">
        <label for="username" class="col-sm-2 col-form-label">Username</label>
        <div class="col-sm-10 col-lg-6">
            <input type="text" class="form-control" id="username" name="username" value="">
        </div>
    </div>

    <div class="mt-3 row justify-content-center">
        <label for="password" class="col-sm-2 col-form-label">Password</label>
        <div class="col-sm-10 col-lg-6">
            <input type="password" class="form-control" id="password" name="password" value="">
        </div>
    </div>

    <div class="mt-3 row justify-content-center">
        <div class="col-sm-12 col-lg-8">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>
</form>

<%--<jsp:include page="../include/footer.jsp" />--%>