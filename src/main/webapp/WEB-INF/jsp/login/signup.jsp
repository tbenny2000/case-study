<head>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <jsp:include page="../include/header.jsp"/>
  <link href="/pub/css/global.css" rel="stylesheet">
  <link href="/pub/css/signup.css" rel="stylesheet">
</head>

<div class="auth-container">
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="form-section">
        <h2 class="text-center mb-4">Create Account</h2>

        <form action="/login/signupSubmit" method="post">
          <!-- Username -->
          <div class="row mb-4">
            <div class="col-md-8 mx-auto">
              <label for="username" class="form-label">Username</label>
              <input type="text" class="form-control form-control-lg" id="username" name="username" value="">
              <c:if test="${bindingResult.hasFieldErrors('username')}">
                <c:forEach var="error" items="${bindingResult.getFieldErrors('username')}">
                  <div class="form_input_error">${error.getDefaultMessage()}</div>
                </c:forEach>
              </c:if>
            </div>
          </div>

          <!-- Password -->
          <div class="row mb-4">
            <div class="col-md-8 mx-auto">
              <label for="password" class="form-label">Password</label>
              <input type="password" class="form-control form-control-lg" id="password" name="password" value="">
              <c:if test="${bindingResult.hasFieldErrors('password')}">
                <c:forEach var="error" items="${bindingResult.getFieldErrors('password')}">
                  <div class="form_input_error">${error.getDefaultMessage()}</div>
                </c:forEach>
              </c:if>
            </div>
          </div>

          <!-- Full Name -->
          <div class="row mb-4">
            <div class="col-md-8 mx-auto">
              <label for="fullname" class="form-label">Full Name</label>
              <input type="text" class="form-control form-control-lg" id="fullname" name="fullname" value="">
              <c:if test="${bindingResult.hasFieldErrors('fullname')}">
                <c:forEach var="error" items="${bindingResult.getFieldErrors('fullname')}">
                  <div class="form_input_error">${error.getDefaultMessage()}</div>
                </c:forEach>
              </c:if>
            </div>
          </div>

          <!-- Submit Button -->
          <div class="row">
            <div class="col-md-8 mx-auto">
              <button type="submit" class="btn btn-primary btn-lg w-100">Create Account</button>
            </div>
          </div>

          <div class="row mt-3">
            <div class="col-md-8 mx-auto text-center">
              <p>Already have an account? <a href="/login/login">Login here</a></p>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../include/footer.jsp"/>