<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login - Safety Learners</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="hero-container">
  <h1>Safety Learners</h1>
  <h2>Login</h2>
</div>

<div class="form-container">
  <% if (request.getParameter("registration") != null) { %>
  <div class="alert success">
    Registration successful! Please login.
  </div>
  <% } %>

  <% if (request.getAttribute("error") != null) { %>
  <div class="alert error">
    <%= request.getAttribute("error") %>
  </div>
  <% } %>

  <form action="StudentServlet" method="post">
    <input type="hidden" name="action" value="login">

    <div class="form-group">
      <label for="username">Username</label>
      <input type="text" id="username" name="username" required>
    </div>

    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>
    </div>

    <button type="submit" class="submit-btn">Login</button>
  </form>

  <div class="register-prompt">
    Don't have an account? <a href="registerStudent.jsp">Register here</a>
  </div>
</div>
</body>
</html>
