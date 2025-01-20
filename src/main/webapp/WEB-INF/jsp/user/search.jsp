<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../include/header.jsp"/>

<section class="bg-light2 pt-5 pb-5">
    <div class="container">
        <h1 class="text-center">User Search</h1>
    </div>
</section>

<section class="bg-light1 pt-5 pb-5">
    <div class="container">
        <form action="/user/search" class="mb-0">
            <div class="row justify-content-center">
                <div class="col-6">
                    <div class="mb-3">


                        <!-- ============= FIRST NAME ============== -->
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" value="${search}">
                    </div>
                </div>
            </div>

            <!-- ============= SEARCH BUTTON FOR USER ============== -->



            <div class="row justify-content-center">
                <div class="col-6">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </div>
        </form>
    </div>
</section>

<c:if test="${not empty search}">
    <section class="bg-light2 pt-5 pb-5">
    <div class="container">
    <h2 class="text-center">Users Found (${usersKey.size()})</h2>

    <div class="table-responsive mt-5">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Zip Code</th>
                    <th>Country</th>
                    <th>Image</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${usersKey}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.email}</td>
                        <td>${user.password}</td>
                        <td>${user.phone}</td>
                        <td>${user.address}</td>
                        <td>${user.city}</td><td>${user.id}</td>
                        <td>${user.state}</td>
                        <td>${user.zip}</td>
                        <td>${user.country}</td>
                        <td>
                            <img src="${user.imageUrl}" style="width:200px;"/>
                        </td>
                        <td>
                            <a href="/user/edit/${user.id}" >Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    </div>
    </section>
</c:if>

<%--<jsp:include page="../include/footer.jsp"/>--%>