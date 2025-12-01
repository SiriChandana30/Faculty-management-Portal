<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>

<%
// Redirect to login if session not found
if (session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Faculty Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap 4.6.2 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>
body {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	font-family: 'Poppins', sans-serif;
	min-height: 100vh;
	margin: 0;
	color: #333;
	overflow-x: hidden;
	display: flex;
	flex-direction: column;
}

/* Navbar Styling */
.navbar {
	background: rgba(0, 0, 0, 0.2);
	backdrop-filter: blur(6px);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.navbar-brand {
	font-weight: 600;
	font-size: 1.3rem;
}

.nav-link {
	color: #fff !important;
	transition: background 0.3s ease;
}

.nav-link:hover {
	background: rgba(255, 255, 255, 0.15);
	border-radius: 8px;
}

/* Welcome Card Styling */
.welcome-card {
	background: #fff;
	border-radius: 15px;
	padding: 40px 30px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
	text-align: center;
	margin-top: 80px;
	animation: fadeInUp 1s ease;
}

@
keyframes fadeInUp {from { transform:translateY(40px);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}
.welcome-card h2 {
	font-weight: 600;
	color: #007bff;
}

.welcome-card p {
	color: #555;
	margin-bottom: 25px;
}

.btn-lg {
	border-radius: 10px;
	padding: 10px 30px;
	font-weight: 600;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.btn-lg:hover {
	transform: scale(1.05);
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
}

footer {
	margin-top: auto;
	text-align: center;
	color: #f0f0f0;
	font-size: 15px;
	padding: 20px 0;
}

/* Responsive tweaks */
@media ( max-width : 768px) {
	.welcome-card {
		padding: 30px 20px;
	}
	.btn-lg {
		display: block;
		width: 100%;
		margin-bottom: 15px;
	}
}
</style>
</head>
<body>

	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
		<a class="navbar-brand" href="#">Faculty Portal</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarMenu" aria-controls="navbarMenu"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarMenu">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="logout.jsp">🚪
						Logout</a></li>
			</ul>
		</div>
	</nav>

	<!-- Welcome Section -->
	<div class="container">
		<div class="welcome-card mt-5">
			<h2>
				Welcome,
				<%=session.getAttribute("username")%>
				👋
			</h2>
			<p class="lead">Manage students, view records, and perform all
				faculty actions efficiently.</p>
			<hr>
			<div class="mt-4">
				<a href="add_student.jsp" class="btn btn-success btn-lg mx-2">➕
					Add Student</a> <a href="view_students.jsp"
					class="btn btn-info btn-lg mx-2">📋 View Students</a> <a
					href="logout.jsp" class="btn btn-danger btn-lg mx-2">🚪 Logout</a>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer>
		&copy;
		<%=java.time.Year.now()%>
		Faculty Management System. All Rights Reserved.
	</footer>

	<!-- Bootstrap JS + Dependencies -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
