<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="/pub/css/global.css" rel="stylesheet">
</head>
<title>Soccer Store</title>
<body>

<div class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand me-4" href="/">Soccer Store</a>

        <!-- Mobile toggle button -->
        <button class="navbar-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
            <span class="navbar-toggle-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Left-aligned main menu items -->
            <ul class="navbar-nav me-auto d-flex align-items-center">
                <li class="nav-item mx-2">
                    <a class="nav-link" href="/">Home</a>
                </li>

                <!-- Products -->
                <li class="nav-item dropdown mx-2">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        Products
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/product/search">Browse Products</a></li>
                        <sec:authorize access="hasAuthority('ADMIN')">
                            <li><a class="dropdown-item" href="/product/create">Create Product</a></li>
                        </sec:authorize>
                    </ul>
                </li>

                <!-- My Profile -->
                <li class="nav-item dropdown mx-2">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        My Profile
                    </a>
                    <ul class="dropdown-menu">
                        <sec:authorize access="isAuthenticated()">
                            <li>
                                <span class="dropdown-item-text">
                                    <strong><sec:authentication property="principal.username"/></strong>
                                </span>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/user/profile">My Profile</a></li>
                            <li><a class="dropdown-item" href="/order/history">Order History</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item text-danger" href="/login/logout">Logout</a></li>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                            <li><a class="dropdown-item" href="/login/login">Login</a></li>
                            <li><a class="dropdown-item" href="/user/createUser">Create Account</a></li>
                        </sec:authorize>
                    </ul>
                </li>
            </ul>

<%--            <!-- In the My Profile dropdown -->--%>
<%--            <sec:authorize access="!isAuthenticated()">--%>
<%--                <li><a class="dropdown-item" href="/login/login">Login</a></li>--%>
<%--                <li><a class="dropdown-item" href="/user/createUser">Create Account</a></li>--%>
<%--            </sec:authorize>--%>

            <!-- In the right-aligned menu -->
            <ul class="navbar-nav ms-auto d-flex align-items-center">
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item mx-2">
                        <a class="nav-link" href="/user/createUser">Create Account</a>
                    </li>
                    <li class="nav-item mx-2">
                        <a class="nav-link" href="/login/login">Login</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</div>