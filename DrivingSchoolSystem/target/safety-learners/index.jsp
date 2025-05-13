<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Safety Learners</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      color: #333;
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
    .hero {
      background: url('https://via.placeholder.com/1200x600') no-repeat center center;
      background-size: cover;
      height: 400px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      color: #1e3a8a;
    }
    .hero h1 {
      font-size: 48px;
      margin: 10px 0;
    }
    .hero .register-box {
      background: white;
      padding: 15px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      margin: 20px 0;
      font-size: 18px;
      width: 80%;
      max-width: 400px;
    }
    .hero .register-btn {
      background-color: #1e90ff;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      font-size: 18px;
      margin-top: 20px;
      cursor: pointer;
    }
    .stats {
      display: flex;
      justify-content: space-around;
      padding: 20px;
      background-color: #f9f9f9;
    }
    .stat-box {
      background: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      text-align: center;
      width: 150px;
    }
    .container {
      max-width: 800px;
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
    .search-bar {
      margin-bottom: 20px;
    }
    .search-bar input {
      padding: 10px;
      width: 70%;
      max-width: 300px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    table, th, td {
      border: 1px solid #ccc;
    }
    th, td {
      padding: 10px;
      text-align: left;
    }
    th {
      background-color: #1e90ff;
      color: white;
    }
    .action-btn {
      padding: 5px 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      text-decoration: none;
      color: white;
    }
    .edit-btn {
      background-color: #1e90ff;
    }
    .delete-btn {
      background-color: #ff4444;
    }
    .error {
      color: #ff4444;
      margin-bottom: 10px;
    }
    .message {
      color: #1e90ff;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
<div class="navbar">
  <div class="left">
    <a href="index.jsp">Safety Learners</a>
    <a href="student/list?action=list">Student List</a>
  </div>
  <div class="right">
    <span class="user">Welcome, User</span>
    <a href="student/list?action=login" class="login-btn">Login</a>
  </div>
</div>

<c:if test="${empty action || action == 'home'}">
  <div class="hero">
    <h1>Safety Learners</h1>
    <div class="register-box">
      Register a new student for the Safety Learners program
    </div>
    <button class="register-btn" onclick="window.location.href='register.jsp'">Register Now</button>
  </div>
  <div class="stats">
    <div class="stat-box">
      2,500+<br>Students Registered
    </div>
    <div class="stat-box">
      95%<br>Pass Rate
    </div>
    <div class="stat-box">
      15,000+<br>Driving Hours
    </div>
    <div class="stat-box">
      12<br>Expert Instructors
    </div>
  </div>
</c:if>

<c:if test="${action == 'register'}">
  <div class="container">
    <h2 style="color: #1e3a8a;">Register a New Student</h2>
    <form action="student/register" method="post">
      <div class="form-group">
        <label for="register_fullName">Full Name:</label>
        <input type="text" id="register_fullName" name="fullName" required>
      </div>
      <div class="form-group">
        <label for="register_email">Email:</label>
        <input type="email" id="register_email" name="email" required>
      </div>
      <div class="form-group">
        <label for="register_address">Address:</label>
        <input type="text" id="register_address" name="address" required>
      </div>
      <div class="form-group">
        <label for="register_phoneNumber">Phone Number:</label>
        <input type="text" id="register_phoneNumber" name="phoneNumber" required>
      </div>
      <div class="form-group">
        <label for="register_age">Age:</label>
        <input type="number" id="register_age" name="age" required>
      </div>
      <div class="form-group">
        <label for="register_username">Username:</label>
        <input type="text" id="register_username" name="username" required>
      </div>
      <div class="form-group">
        <label for="register_password">Password:</label>
        <input type="password" id="register_password" name="password" required>
      </div>
      <button type="submit" class="submit-btn">Register</button>
    </form>
  </div>
</c:if>

<c:if test="${action == 'list'}">
  <div class="container">
    <h2 style="color: #1e3a8a;">Student List</h2>
    <c:if test="${not empty message}">
      <div class="message">${message}</div>
    </c:if>
    <div class="search-bar">
      <form action="student/search" method="get">
        <input type="text" name="searchTerm" placeholder="Search Student by Name or ID...">
        <input type="hidden" name="action" value="list">
      </form>
    </div>
    <table>
      <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Phone Number</th>
        <th>Age</th>
        <th>Actions</th>
      </tr>
      <c:forEach var="student" items="${students}">
        <tr>
          <td>${student.id}</td>
          <td>${student.fullName}</td>
          <td>${student.email}</td>
          <td>${student.address}</td>
          <td>${student.phoneNumber}</td>
          <td>${student.age}</td>
          <td>
            <a href="student/edit?id=${student.id}" class="action-btn edit-btn">Edit</a>
            <a href="student/delete?id=${student.id}" class="action-btn delete-btn">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
</c:if>

<c:if test="${action == 'update'}">
  <div class="container">
    <h2 style="color: #1e3a8a;">Update Student</h2>
    <form action="student/update" method="post">
      <input type="hidden" name="id" value="${student.id}">
      <div class="form-group">
        <label for="update_fullName">Full Name:</label>
        <input type="text" id="update_fullName" name="fullName" value="${student.fullName}" required>
      </div>
      <div class="form-group">
        <label for="update_email">Email:</label>
        <input type="email" id="update_email" name="email" value="${student.email}" required>
      </div>
      <div class="form-group">
        <label for="update_address">Address:</label>
        <input type="text" id="update_address" name="address" value="${student.address}" required>
      </div>
      <div class="form-group">
        <label for="update_phoneNumber">Phone Number:</label>
        <input type="text" id="update_phoneNumber" name="phoneNumber" value="${student.phoneNumber}" required>
      </div>
      <div class="form-group">
        <label for="update_age">Age:</label>
        <input type="number" id="update_age" name="age" value="${student.age}" required>
      </div>
      <div class="form-group">
        <label for="update_username">Username:</label>
        <input type="text" id="update_username" name="username" value="${student.username}" required>
      </div>
      <div class="form-group">
        <label for="update_password">Password:</label>
        <input type="password" id="update_password" name="password" value="${student.password}" required>
      </div>
      <button type="submit" class="submit-btn">Update</button>
    </form>
  </div>
</c:if>

<c:if test="${action == 'login'}">
  <div class="container">
    <h2 style="color: #1e3a8a;">Login</h2>
    <c:if test="${not empty error}">
      <div class="error">${error}</div>
    </c:if>
    <form action="student/login" method="post">
      <div class="form-group">
        <label for="login_username">Username:</label>
        <input type="text" id="login_username" name="username" required>
      </div>
      <div class="form-group">
        <label for="login_password">Password:</label>
        <input type="password" id="login_password" name="password" required>
      </div>
      <button type="submit" class="submit-btn">Login</button>
    </form>
  </div>
</c:if>
</body>
</html>
