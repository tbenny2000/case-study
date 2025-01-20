<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Soccer Store</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Optional: Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <!-- Custom CSS -->
    <link href="/pub/css/global.css" rel="stylesheet">

    <!-- Bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
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

                <!-- Products - Available to all -->>
                <li class="nav-item dropdown mx-2">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        Products
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/product/search">Browse Products</a></li>
                        <!-- Only show create/edit options to admins -->
                        <sec:authorize access="hasAuthority('ADMIN')">
                            <li><a class="dropdown-item" href="/product/create">Create Product</a></li>
                        </sec:authorize>
                    </ul>
                </li>

                <!-- Users - Only for authenticated users -->
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item mx-2">
                        <a class="nav-link" href="/user/profile">My Profile</a>
                    </li>
                </sec:authorize>


                <!-- Admin - Only for admins -->
                <sec:authorize access="hasAuthority('ADMIN')">
                    <li class="nav-item dropdown mx-2">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            Admin
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/admin/dashboard">Dashboard</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/admin/users">Manage Users</a></li>
                            <li><a class="dropdown-item" href="/admin/products">Manage Products</a></li>
                        </ul>
                    </li>
                </sec:authorize>
            </ul>

            <!-- Right-aligned auth items -->
            <ul class="navbar-nav ms-auto d-flex align-items-center">
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item mx-2">
                        <a class="nav-link" href="/login/login">Login</a>
                    </li>
                    <li class="nav-item mx-2">
                        <a class="nav-link" href="/login/signup">Sign Up</a>
                    </li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item dropdown mx-2">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <sec:authentication property="principal.username"/>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="/user/profile">My Profile</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item text-danger" href="/login/logout">Logout</a></li>
                        </ul>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</div>

