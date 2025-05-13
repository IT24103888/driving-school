<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            color: white;
        }
        .hero h1 {
            font-size: 48px;
            margin: 0;
        }
        .hero p {
            font-size: 18px;
        }
        .hero .register-btn {
            background-color: #1e90ff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 18px;
            margin-top: 20px;
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
        .stat-box i {
            font-size: 24px;
            color: #1e90ff;
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="left">
        <a href="index.jsp">Safety Learners</a>
        <a href="#">Dashboard</a>
        <a href="#">Request Lesson</a>
        <a href="#">Lesson Queue</a>
        <a href="#">Schedule Lesson</a>
    </div>
    <div class="right">
        <span class="user">Welcome, User</span>
        <a href="#" class="login-btn">Login</a>
    </div>
</div>
<div class="hero">
    <h1>Welcome to Safety Learners</h1>
    <p>Your journey to becoming a confident driver starts here. Schedule lessons, track your progress, and achieve your driving goals.</p>
    <a href="registerStudent.jsp" class="register-btn">Register Now</a>
</div>
<div class="stats">
    <div class="stat-box">
        <i>👥</i><br>
        2,500+<br>Students Registered
    </div>
    <div class="stat-box">
        <i>✔️</i><br>
        95%<br>Pass Rate
    </div>
    <div class="stat-box">
        <i>⏰</i><br>
        15,000+<br>Driving Hours
    </div>
    <div class="stat-box">
        <i>🚗</i><br>
        7<br>Vehicles
    </div>
</div>
</body>
</html>