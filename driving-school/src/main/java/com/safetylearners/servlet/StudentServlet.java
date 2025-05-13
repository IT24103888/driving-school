package com.safetylearners.servlet;

import com.safetylearners.model.Student;
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
        if (pathInfo == null || pathInfo.equals("/list")) {
            // List all students
            List<Student> students = readStudents();
            request.setAttribute("students", students);
            request.getRequestDispatcher("/studentList.jsp").forward(request, response);
        } else if (pathInfo.equals("/search")) {
            // Search students
            String searchTerm = request.getParameter("searchTerm");
            List<Student> students = readStudents();
            List<Student> filteredStudents = new ArrayList<>();
            for (Student student : students) {
                if (student.getName().toLowerCase().contains(searchTerm.toLowerCase()) ||
                        student.getId().toLowerCase().contains(searchTerm.toLowerCase())) {
                    filteredStudents.add(student);
                }
            }
            request.setAttribute("students", filteredStudents);
            request.getRequestDispatcher("/studentList.jsp").forward(request, response);
        } else if (pathInfo.equals("/edit")) {
            // Edit student form
            String id = request.getParameter("id");
            List<Student> students = readStudents();
            Student student = students.stream().filter(s -> s.getId().equals(id)).findFirst().orElse(null);
            request.setAttribute("student", student);
            request.getRequestDispatcher("/updateStudent.jsp").forward(request, response);
        } else if (pathInfo.equals("/delete")) {
            // Delete student
            String id = request.getParameter("id");
            List<Student> students = readStudents();
            students.removeIf(student -> student.getId().equals(id));
            writeStudents(students);
            response.sendRedirect(request.getContextPath() + "/student/list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo.equals("/register")) {
            // Register new student
            String id = "S" + (readStudents().size() + 1);
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            Student student = new Student(id, name, age);
            List<Student> students = readStudents();
            students.add(student);
            writeStudents(students);
            response.sendRedirect(request.getContextPath() + "/student/list");
        } else if (pathInfo.equals("/update")) {
            // Update student
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            List<Student> students = readStudents();
            for (Student student : students) {
                if (student.getId().equals(id)) {
                    student.setName(name);
                    student.setAge(age);
                    break;
                }
            }
            writeStudents(students);
            response.sendRedirect(request.getContextPath() + "/student/list");
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
