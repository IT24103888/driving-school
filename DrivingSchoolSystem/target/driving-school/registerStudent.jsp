<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Student Registration - Safety Learners</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="hero-container">
  <h1>Safety Learners</h1>
  <h2>Student Registration</h2>
  <p>Register a new student for the Safety Learners program</p>
</div>

<div class="form-container">
  <form action="StudentServlet" method="post">
    <input type="hidden" name="action" value="register">

    <div class="form-group">
      <label for="fullName">Full Name</label>
      <input type="text" id="fullName" name="fullName" required>
    </div>

    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" id="email" name="email" required>
    </div>

    <div class="form-group">
      <label for="phoneNumber">Phone Number</label>
      <input type="tel" id="phoneNumber" name="phoneNumber" required>
    </div>

    <div class="form-group">
      <label for="address">Address</label>
      <input type="text" id="address" name="address" required>
    </div>

    <div class="form-group">
      <label for="username">Username</label>
      <input type="text" id="username" name="username" required>
    </div>

    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>
    </div>

    <button type="submit" class="submit-btn">Register</button>
  </form>

  <div class="login-prompt">
    Already have an account? <a href="login.jsp">Login here</a>
  </div>
</div>
</body>
</html>
