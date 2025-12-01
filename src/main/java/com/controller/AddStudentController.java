package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.DAO.StudentDAO;
import com.model.Student;
import com.utility.DBConnection;

@WebServlet("/addStudent")
public class AddStudentController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String roll = request.getParameter("rollNo");
		String dept = request.getParameter("department");
		String email = request.getParameter("email");

		Student s=new Student();
s.setName(name);
s.setRollNo(roll);
s.setDepartment(dept);
s.setEmail(email);


Connection conn=DBConnection.getConnection();

StudentDAO dao=new StudentDAO(conn);

boolean result=dao.addStudent(s);

if (result) {
    response.sendRedirect("view_students.jsp");
} else {
    response.sendRedirect("view_students.jsp");
}
}
}