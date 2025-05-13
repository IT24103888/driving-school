<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Student List - Safety Learners</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
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
        .container {
            max-width: 800px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
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
</div>
<div class="container">
    <h2>Student List</h2>
    <div class="search-bar">
        <form action="student/search" method="get">
            <input type="text" name="searchTerm" placeholder="Search Student by Name or ID...">
        </form>
    </div>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Actions</th>
        </tr>
        <c: var="student" items="${students}">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.age}</td>
                <td>
                    <a href="student/edit?id=${student.id}" class="action-btn edit-btn">Edit</a>
                    <a href="student/delete?id=${student.id}" class="action-btn delete-btn">Delete</a>
                </td>
            </tr>
        </c:>
    </table>
</div>
</body>
</html>