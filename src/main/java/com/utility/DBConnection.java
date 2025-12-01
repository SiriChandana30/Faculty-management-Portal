package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getConnection() {

		 String URL = "jdbc:mysql://localhost:3306/batch60";
		 String USER = "root";
		 String PASS = "root";

		// Loading the driver
		Connection conn = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			 conn = DriverManager.getConnection(
			    "jdbc:mysql://localhost:3306/batch60?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
			    "root",
			    "root"
			);


		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;

	}
}
