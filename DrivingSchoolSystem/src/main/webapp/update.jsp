<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Update Student - Safety Learners</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
    }
    .navbar {
      background-color: #1e90ff;
      padding: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .navbar a {
      color: white;
      text-decoration: none;
      margin: 0 15px;
    }
    .navbar .right {
      display: flex;
      align-items: center;
    }
    .navbar .right a {
      margin-left: 15px;
    }
    .navbar .right .user {
      color: white;
    }
    .navbar .right .login-btn {
      background-color: #104e8b;
      padding: 5px 10px;
      border-radius: 5px;
    }
    .container {
      max-width: 600px;
      margin: 20px auto;
      background: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .form-group {
      margin-bottom: 15px;
    }
    .form-group label {
      display: block;
      margin-bottom: 5px;
      color: #1e3a8a;
    }
    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    .submit-btn {
      background-color: #1e90ff;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
  </style>
</head>
<body>
<div class="navbar">
  <div class="left">
    <a href="index.jsp">Safety Learners</a>
    <a href="student/list">Student List</a>
  </div>
  <div class="right">
    <span class="user">Welcome, User</span>
    <a href="#" class="login-btn">Login</a>
  </div>
</div>
<div class="container">
  <h2 style="color: #1e3a8a;">Update Student</h2>
  <form action="student/update" method="post">
    <input type="hidden" name="id" value="${student.id}">
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" value="${student.name}" required>
    </div>
    <div class="form-group">
      <label for="age">Age:</label>
      <input type="number" id="age" name="age" value="${student.age}" required>
    </div>
    <button type="submit" class="submit-btn">Update</button>
  </form>
</div>
</body>
</html>
