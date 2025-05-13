<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Safety Learners - Login</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <style>
    .alert-success {
      background-color: #d4edda;
      color: #155724;
      padding: 12px;
      border-radius: 4px;
      margin-bottom: 20px;
      border: 1px solid #c3e6cb;
    }
  </style>
</head>
<body>
<div class="login-container">
  <h1>Safety Learners</h1>
  <h2>Login</h2>

  <%-- Show success message if redirected from registration --%>
  <% if ("success".equals(request.getParameter("registration"))) { %>
  <div class="alert-success">
    Registration successful for <%= request.getParameter("username") %>! Please login.
  </div>
  <% } %>

  <form action="login" method="post">
    <div class="form-group">
      <input type="text" name="username" placeholder="Username" required>
    </div>
    <div class="form-group">
      <input type="password" name="password" placeholder="Password" required>
    </div>
    <button type="submit" class="btn">Login</button>
  </form>


</div>
</body>
</html>
