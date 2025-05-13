<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Update Student</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .form-container {
      max-width: 800px;
      margin: 30px auto;
      padding: 20px;
      background-color: #f8f9fa;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .form-header {
      text-align: center;
      margin-bottom: 20px;
    }
    .form-group-row {
      display: flex;
      gap: 15px;
    }
    .form-group-row .form-group {
      flex: 1;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="form-container">
    <div class="form-header">
      <h2>Update Student Information</h2>
    </div>

    <form action="students" method="post">
      <input type="hidden" name="action" value="update">
      <input type="hidden" name="licenseNumber" value="${student.licenseNumber}">

      <h5 class="mb-3">Personal Information</h5>
      <div class="form-group-row mb-3">
        <div class="form-group">
          <label for="firstName" class="form-label">First Name *</label>
          <input type="text" class="form-control" id="firstName" name="firstName" value="${student.firstName}" required>
        </div>
        <div class="form-group">
          <label for="lastName" class="form-label">Last Name *</label>
          <input type="text" class="form-control" id="lastName" name="lastName" value="${student.lastName}" required>
        </div>
      </div>

      <div class="form-group-row mb-3">
        <div class="form-group">
          <label for="dateOfBirth" class="form-label">Date of Birth *</label>
          <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="${student.dateOfBirth}" required>
        </div>
        <div class="form-group">
          <label class="form-label">Gender *</label>
          <div class="d-flex gap-3">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="gender" id="male" value="Male" ${student.gender == 'Male' ? 'checked' : ''} required>
              <label class="form-check-label" for="male">Male</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="gender" id="female" value="Female" ${student.gender == 'Female' ? 'checked' : ''}>
              <label class="form-check-label" for="female">Female</label>
            </div>
          </div>
        </div>
      </div>

      <h5 class="mb-3 mt-4">Contact Information</h5>
      <div class="form-group mb-3">
        <label for="address1" class="form-label">Street Address *</label>
        <input type="text" class="form-control" id="address1" name="address1" value="${student.address1}" required>
      </div>
      <div class="form-group mb-3">
        <label for="address2" class="form-label">Street Address Line 2</label>
        <input type="text" class="form-control" id="address2" name="address2" value="${student.address2}">
      </div>

      <div class="form-group-row mb-3">
        <div class="form-group">
          <label for="city" class="form-label">City *</label>
          <input type="text" class="form-control" id="city" name="city" value="${student.city}" required>
        </div>
        <div class="form-group">
          <label for="region" class="form-label">Region *</label>
          <input type="text" class="form-control" id="region" name="region" value="${student.region}" required>
        </div>
      </div>

      <div class="form-group-row mb-3">
        <div class="form-group">
          <label for="postalCode" class="form-label">Postal / Zip Code *</label>
          <input type="text" class="form-control" id="postalCode" name="postalCode" value="${student.postalCode}" required>
        </div>
        <div class="form-group">
          <label for="country" class="form-label">Country *</label>
          <input type="text" class="form-control" id="country" name="country" value="${student.country}" required>
        </div>
      </div>

      <div class="form-group-row mb-3">
        <div class="form-group">
          <label for="email" class="form-label">Email *</label>
          <input type="email" class="form-control" id="email" name="email" value="${student.email}" required>
        </div>
        <div class="form-group">
          <label for="phone" class="form-label">Phone Number *</label>
          <input type="tel" class="form-control" id="phone" name="phone" value="${student.phone}" required>
        </div>
      </div>

      <h5 class="mb-3 mt-4">Driving Information</h5>
      <div class="form-group mb-4">
        <label for="licenseNumber" class="form-label">License Number *</label>
        <input type="text" class="form-control" id="licenseNumber" name="licenseNumber" value="${student.licenseNumber}" readonly>
      </div>

      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <a href="students" class="btn btn-outline-secondary me-md-2">Cancel</a>
        <button type="submit" class="btn btn-primary">Update Student</button>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
