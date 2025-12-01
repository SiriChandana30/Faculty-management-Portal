package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.utility.DBConnection;

@WebServlet("/editStudent")
public class EditStudentController extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String roll = request.getParameter("roll_no");
		String dept = request.getParameter("department");
		String email = request.getParameter("email");
		
		try {
		
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = conn
				.prepareStatement("UPDATE Student SET name=?, roll_no=?, department=?, email=? WHERE id=?");
		ps.setString(1, name);
		ps.setString(2, roll);
		ps.setString(3, dept);
		ps.setString(4, email);
		ps.setInt(5, id);
		ps.executeUpdate();
		response.sendRedirect("view_students.jsp");
	
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		}

}
