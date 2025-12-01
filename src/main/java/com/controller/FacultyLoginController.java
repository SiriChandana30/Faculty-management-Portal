package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class FacultyLoginController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Connection conn = DBConnection.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM user WHERE username=? AND password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				response.sendRedirect("dashboard.jsp");
			} else {
				response.sendRedirect("login.jsp?error=Invalid credentials");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("login.jsp?message=Error in Login");
		}

	}

}
