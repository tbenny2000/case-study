<%--<%@ include file="../include/header.jsp" %>--%>
<%--<div class="container mt-4 text-center">--%>
<%--    <h1>500 - Server Error</h1>--%>
<%--    <p>Something went wrong. Please try again later.</p>--%>

<%--</div>--%>








<jsp:include page="../include/header.jsp" />
<div>
    <h1 class="page-title">This is a 500 error page</h1>
</div>
<div>
    <a href="/" class="btn btn-primary">Go Home</a>
</div>

<sec:authorize access="hasAnyAuthority('ADMIN')">
    <div style="margin-left:30px;" class="pb-5">
        <br><br>
        <c:if test="${not empty requestUrl}">
            <p>${requestUrl}</p>
        </c:if>
        <h3>Stack Trace</h3>
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>
        <c:if test="${not empty stackTrace}">
            <p>${stackTrace}</p>
        </c:if>
        <c:if test="${not empty rootCause}">
            <h3>Root Cause</h3>
            <p>${rootCause}</p>
        </c:if>
        <c:if test="${not empty rootTrace}">
            <p>${rootTrace}</p>
        </c:if>
    </div>
</sec:authorize>


<%--<jsp:include page="../include/footer.jsp" />--%>