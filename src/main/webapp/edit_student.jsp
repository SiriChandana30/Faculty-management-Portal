<%@ page import="java.sql.*"%>
<%@ page import="com.utility.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
if (session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
	return;
}

int id = Integer.parseInt(request.getParameter("id"));
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
	conn = DBConnection.getConnection();
	ps = conn.prepareStatement("SELECT * FROM Student WHERE id = ?");
	ps.setInt(1, id);
	rs = ps.executeQuery();
} catch (Exception e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>✏️ Edit Student | Faculty Portal</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">

<style>
body {
	font-family: 'Poppins', sans-serif;
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	overflow-x: hidden;
}

/* Navbar */
.navbar {
	background: rgba(0, 0, 0, 0.3);
	backdrop-filter: blur(10px);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
	animation: slideDown 0.8s ease;
}

.navbar-brand {
	font-weight: 600;
	font-size: 1.4rem;
	letter-spacing: 0.5px;
	color: #fff !important;
}

.nav-link {
	color: #fff !important;
	transition: color 0.3s;
}

.nav-link:hover {
	color: #ffe066 !important;
}

@
keyframes slideDown {from { transform:translateY(-40px);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}

/* Card Container */
.edit-container {
	background: #ffffff;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
	padding: 40px 35px;
	margin: 100px auto 40px;
	width: 95%;
	max-width: 550px;
	animation: fadeInUp 1.1s ease;
	position: relative;
	overflow: hidden;
}

.edit-container::before {
	content: "";
	position: absolute;
	top: -50%;
	left: -50%;
	width: 200%;
	height: 200%;
	background: radial-gradient(circle at center, rgba(106, 17, 203, 0.15),
		transparent 70%);
	transform: scale(0);
	animation: pulseEffect 5s infinite ease-in-out;
}

@
keyframes pulseEffect { 0%, 100% {
	transform: scale(0.8);
	opacity: 0.5;
}
50%
{
transform:scale
(1
.2
);
opacity:1;
}
}
.edit-title {
	text-align: center;
	font-size: 1.9rem;
	font-weight: 600;
	color: #333;
	margin-bottom: 25px;
	animation: fadeIn 1s ease;
}

@
keyframes fadeInUp {from { transform:translateY(50px);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
label {
	font-weight: 500;
	color: #333;
}

.form-control {
	border-radius: 10px;
	border: 1.5px solid #ccc;
	transition: all 0.3s ease;
}

.form-control:focus {
	border-color: #2575fc;
	box-shadow: 0 0 10px rgba(37, 117, 252, 0.5);
}

.btn-primary {
	width: 100%;
	border-radius: 10px;
	background: linear-gradient(45deg, #6a11cb, #2575fc);
	border: none;
	font-weight: 600;
	transition: transform 0.25s ease, box-shadow 0.25s ease;
	color: #fff;
}

.btn-primary:hover {
	transform: scale(1.05);
	box-shadow: 0 8px 20px rgba(37, 117, 252, 0.5);
}

.btn-outline-secondary, .btn-outline-info {
	border-radius: 25px;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.btn-outline-secondary:hover, .btn-outline-info:hover {
	transform: translateY(-3px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

footer {
	text-align: center;
	color: #fff;
	margin-bottom: 20px;
	font-size: 14px;
	animation: fadeIn 1.5s ease;
}

@media ( max-width : 576px) {
	.edit-container {
		padding: 25px;
	}
	.edit-title {
		font-size: 1.5rem;
	}
}
</style>
</head>

<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
		<a class="navbar-brand" href="dashboard.jsp">🎓 Faculty Portal</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto text-center">
				<li class="nav-item"><a class="nav-link" href="logout.jsp">🚪
						Logout</a></li>
			</ul>
		</div>
	</nav>

	<!-- Edit Form -->
	<div class="edit-container">
		<div class="edit-title">✏️ Edit Student</div>

		<%
		if (rs != null && rs.next()) {
		%>
		<form action="editStudent" method="post" autocomplete="off">
			<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

			<div class="form-group">
				<label for="name">Full Name</label> <input type="text"
					class="form-control" id="name" name="name"
					value="<%=rs.getString("name")%>" required>
			</div>

			<div class="form-group">
				<label for="roll_no">Roll Number</label> <input type="text"
					class="form-control" id="roll_no" name="roll_no"
					value="<%=rs.getString("roll_no")%>" required>
			</div>

			<div class="form-group">
				<label for="department">Department</label> <input type="text"
					class="form-control" id="department" name="department"
					value="<%=rs.getString("department")%>" required>
			</div>

			<div class="form-group">
				<label for="email">Email Address</label> <input type="email"
					class="form-control" id="email" name="email"
					value="<%=rs.getString("email")%>" required>
			</div>

			<button type="submit" class="btn btn-primary mt-3">💾 Update
				Student</button>
		</form>
		<%
		} else {
		%>
		<div class="alert alert-danger text-center mt-4">⚠️ No student
			record found for the given ID.</div>
		<%
		}
		%>

		<div class="text-center mt-4">
			<a href="view_students.jsp"
				class="btn btn-outline-secondary btn-sm mx-2">
				<button type="submit" class="btn btn-primary mt-1">📋 Back
					to Students</button>
			</a> <a href="dashboard.jsp" class="btn btn-outline-info btn-sm mx-2">
				<button type="submit" class="btn btn-primary mt-1">🏠
					Dashboard</button>
			</a>
		</div>

	</div>

	<footer>
		&copy;
		<%=java.time.Year.now()%>
		Faculty Management System. All Rights Reserved.
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

<%
try {
	if (rs != null)
		rs.close();
	if (ps != null)
		ps.close();
	if (conn != null)
		conn.close();
} catch (Exception ignored) {
}
%>
