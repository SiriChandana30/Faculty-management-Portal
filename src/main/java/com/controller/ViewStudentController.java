package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.utility.DBConnection;

@WebServlet("/viewStudents")
public class ViewStudentController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Connection conn = DBConnection.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from Student");
			request.setAttribute("students", rs);
			RequestDispatcher rd = request.getRequestDispatcher("view_students.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
