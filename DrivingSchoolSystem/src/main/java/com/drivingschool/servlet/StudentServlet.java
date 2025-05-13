package com.drivingschool.servlet;

import com.drivingschool.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/student/*")
public class StudentServlet extends HttpServlet {
    private static final String FILE_PATH = "data/students.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        String action = request.getParameter("action");

        if (pathInfo == null || pathInfo.equals("/list") || action != null && action.equals("list")) {
            // List all students
            List<Student> students = readStudents();
            request.setAttribute("students", students);
            request.setAttribute("action", "list");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if (pathInfo != null && pathInfo.equals("/search")) {
            // Search students
            String searchTerm = request.getParameter("searchTerm");
            List<Student> students = readStudents();
            List<Student> filteredStudents = new ArrayList<>();
            for (Student student : students) {
                if (student.getFullName().toLowerCase().contains(searchTerm.toLowerCase()) ||
                        student.getId().toLowerCase().contains(searchTerm.toLowerCase())) {
                    filteredStudents.add(student);
                }
            }
            request.setAttribute("students", filteredStudents);
            request.setAttribute("action", "list");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if (pathInfo != null && pathInfo.equals("/edit")) {
            // Edit student form
            String id = request.getParameter("id");
            List<Student> students = readStudents();
            Student student = students.stream().filter(s -> s.getId().equals(id)).findFirst().orElse(null);
            request.setAttribute("student", student);
            request.setAttribute("action", "update");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if (pathInfo != null && pathInfo.equals("/delete")) {
            // Delete student
            String id = request.getParameter("id");
            List<Student> students = readStudents();
            students.removeIf(student -> student.getId().equals(id));
            writeStudents(students);
            response.sendRedirect(request.getContextPath() + "/student/list?action=list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        String action = request.getParameter("action");

        if (pathInfo != null && pathInfo.equals("/register")) {
            // Register new student
            String id = "S" + (readStudents().size() + 1);
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            String ageParam = request.getParameter("age");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            int age;
            try {
                age = Integer.parseInt(ageParam);
                if (age <= 0) throw new NumberFormatException("Age must be positive");
            } catch (NumberFormatException e) {
                request.setAttribute("action", "register");
                request.setAttribute("error", "Invalid age: Please enter a positive number.");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }

            Student student = new Student(id, fullName, email, address, phoneNumber, age, username, password);
            List<Student> students = readStudents();
            students.add(student);
            writeStudents(students);
            response.sendRedirect(request.getContextPath() + "/student/list?action=login");
        } else if (pathInfo != null && pathInfo.equals("/update")) {
            // Update student
            String id = request.getParameter("id");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            String ageParam = request.getParameter("age");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            int age;
            try {
                age = Integer.parseInt(ageParam);
                if (age <= 0) throw new NumberFormatException("Age must be positive");
            } catch (NumberFormatException e) {
                request.setAttribute("action", "update");
                request.setAttribute("student", new Student(id, fullName, email, address, phoneNumber, 0, username, password));
                request.setAttribute("error", "Invalid age: Please enter a positive number.");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }

            List<Student> students = readStudents();
            for (Student student : students) {
                if (student.getId().equals(id)) {
                    student.setFullName(fullName);
                    student.setEmail(email);
                    student.setAddress(address);
                    student.setPhoneNumber(phoneNumber);
                    student.setAge(age);
                    student.setUsername(username);
                    student.setPassword(password);
                    break;
                }
            }
            writeStudents(students);
            response.sendRedirect(request.getContextPath() + "/student/list?action=list");
        } else if (pathInfo != null && pathInfo.equals("/login")) {
            // Login
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            List<Student> students = readStudents();
            boolean authenticated = students.stream()
                    .anyMatch(student -> student.getUsername().equals(username) && student.getPassword().equals(password));

            if (authenticated) {
                request.setAttribute("action", "list");
                request.setAttribute("students", readStudents());
                request.setAttribute("message", "Login successful!");
            } else {
                request.setAttribute("action", "login");
                request.setAttribute("error", "Invalid username or password.");
            }
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    private List<Student> readStudents() throws IOException {
        List<Student> students = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) {
            file.getParentFile().mkdirs();
            file.createNewFile();
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    students.add(Student.fromString(line));
                }
            }
        }
        return students;
    }

    private void writeStudents(List<Student> students) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Student student : students) {
                writer.write(student.toString());
                writer.newLine();
            }
        }
    }
}