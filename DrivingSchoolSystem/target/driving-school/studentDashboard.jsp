<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Safety Learners - Home</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="navbar">
  <div class="navbar-left">🚗 Safety Learners</div>
  <div class="navbar-center">
    <a href="#">Dashboard</a>
    <a href="#">Request Lesson</a>
    <a href="#">Lesson Queue</a>
    <a href="#">Schedule Lesson</a>
  </div>
  <div class="navbar-right">
    <span>Welcome, User</span>
    <button onclick="window.location.href='login.jsp'">Login</button>
  </div>
</div>

<div class="hero">
  <div class="hero-text">
    <h1>Welcome to Safety Learners</h1>
    <p>Your journey to becoming a confident driver starts here. Schedule lessons, track your progress, and achieve your driving goals.</p>
    <button onclick="window.location.href='register.jsp'">Register Now</button>
  </div>
</div>

<div class="stats">
  <div>
    <h2>👥 2,500+</h2>
    <p>Happy Students</p>
  </div>
  <div>
    <h2>✔️ 95%</h2>
    <p>Pass Rate</p>
  </div>
  <div>
    <h2>⏱️ 15,000+</h2>
    <p>Hours Taught</p>
  </div>
  <div>
    <h2>📍 7</h2>
    <p>Centers</p>
  </div>
</div>
</body>
</html>

