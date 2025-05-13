<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Safety Learners - Student Profile</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <style>
    .profile-container {
      max-width: 800px;
      margin: 30px auto;
      padding: 30px;
      background: white;
      border-radius: 8px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    .profile-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
      padding-bottom: 20px;
      border-bottom: 1px solid #eee;
    }

    .profile-title {
      color: #2c3e50;
      font-size: 24px;
    }

    .profile-details {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
    }

    .detail-group {
      margin-bottom: 15px;
    }

    .detail-label {
      font-weight: 600;
      color: #7f8c8d;
      margin-bottom: 5px;
      display: block;
    }

    .detail-value {
      padding: 10px;
      background-color: #f8f9fa;
      border-radius: 4px;
      border-left: 4px solid #3498db;
    }

    .profile-actions {
      margin-top: 30px;
      display: flex;
      gap: 15px;
    }

    .btn-edit {
      background-color: #3498db;
      color: white;
      padding: 10px 20px;
      border-radius: 4px;
      text-decoration: none;
    }

    .btn-back {
      background-color: #95a5a6;
      color: white;
      padding: 10px 20px;
      border-radius: 4px;
      text-decoration: none;
    }
  </style>
</head>
<body>
<div class="dashboard-container">
  <div class="sidebar">
    <h1>Safety Learners</h1>
    <ul>
      <li><a href="${pageContext.request.contextPath}/dashboard.jsp">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/list.jsp">Student List</a></li>
      <li><a href="${pageContext.request.contextPath}/register.jsp">Student Registration</a></li>
      <li><a href="${pageContext.request.contextPath}/student?action=search">Student Search</a></li>
      <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
    </ul>
  </div>

  <div class="main-content">
    <div class="profile-container">
      <div class="profile-header">
        <h2 class="profile-title">Student Profile</h2>
      </div>

      <div class="profile-details">
        <div class="detail-group">
          <span class="detail-label">Full Name</span>
          <div class="detail-value">${student.fullName}</div>
        </div>

        <div class="detail-group">
          <span class="detail-label">Username</span>
          <div class="detail-value">${student.username}</div>
        </div>

        <div class="detail-group">
          <span class="detail-label">Email</span>
          <div class="detail-value">${student.email}</div>
        </div>

        <div class="detail-group">
          <span class="detail-label">Phone Number</span>
          <div class="detail-value">${student.phoneNumber}</div>
        </div>

        <div class="detail-group">
          <span class="detail-label">Address</span>
          <div class="detail-value">${student.address}</div>
        </div>
      </div>

      <div class="profile-actions">
        <a href="${pageContext.request.contextPath}/student?action=edit&username=${student.username}" class="btn-edit">Edit Profile</a>
        <a href="${pageContext.request.contextPath}/student?action=list" class="btn-back">Back to List</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>
