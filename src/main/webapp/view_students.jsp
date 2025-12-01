<%@ page import="java.sql.*" %>
<%@ page import="com.utility.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Session validation
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>📋 All Students | Faculty Portal</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        min-height: 100vh;
        margin: 0;
        display: flex;
        flex-direction: column;
    }

    /* Navbar */
    .navbar {
        background: linear-gradient(45deg, #6a11cb, #2575fc);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        font-weight: 500;
        animation: slideDown 0.8s ease;
    }

    .navbar-brand {
        font-weight: 600;
        font-size: 1.4rem;
        letter-spacing: 0.5px;
    }

    @keyframes slideDown {
        from { transform: translateY(-40px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    /* Main container */
    .content-container {
        background: #ffffff;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
        padding: 35px;
        margin: 100px auto 40px;
        width: 95%;
        max-width: 1100px;
        animation: fadeInUp 1s ease;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .content-container:hover {
        transform: translateY(-5px);
        box-shadow: 0 14px 35px rgba(0, 0, 0, 0.3);
    }

    @keyframes fadeInUp {
        from { transform: translateY(50px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    .table-title {
        text-align: center;
        font-size: 1.8rem;
        font-weight: 600;
        color: #333;
        margin-bottom: 25px;
    }

    .search-box {
        max-width: 300px;
        margin: 0 auto 25px;
    }

    .search-box input {
        border-radius: 30px;
        border: 2px solid #2575fc;
        padding: 10px 15px;
        width: 100%;
        outline: none;
        transition: all 0.3s ease;
    }

    .search-box input:focus {
        box-shadow: 0 0 10px rgba(37, 117, 252, 0.5);
    }

    .table {
        border-radius: 12px;
        overflow: hidden;
    }

    thead {
        background: linear-gradient(45deg, #6a11cb, #2575fc);
        color: #fff;
        text-transform: uppercase;
        font-size: 14px;
    }

    tbody tr {
        transition: all 0.25s ease;
    }

    tbody tr:hover {
        background: #f1f5ff;
        transform: scale(1.01);
    }

    td, th {
        vertical-align: middle !important;
    }

    /* Buttons */
    .btn-action {
        border-radius: 25px;
        font-size: 13px;
        padding: 6px 14px;
        transition: all 0.3s ease;
    }

    .btn-action:hover {
        transform: scale(1.07);
        box-shadow: 0 5px 10px rgba(0,0,0,0.15);
    }

    .btn-lg {
        border-radius: 30px;
        padding: 10px 25px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .btn-lg:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 15px rgba(0,0,0,0.25);
    }

    footer {
        text-align: center;
        color: #fff;
        font-size: 14px;
        margin-bottom: 20px;
        animation: fadeIn 1.2s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    /* Responsive */
    @media (max-width: 768px) {
        .content-container { padding: 25px; }
        .table-title { font-size: 1.4rem; }
        .btn-lg { width: 100%; margin-bottom: 10px; }
        table { font-size: 13px; }
    }
</style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <a class="navbar-brand" href="dashboard.jsp">🎓 Faculty Portal</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto text-center">
            <li class="nav-item"><a class="nav-link" href="logout.jsp">🚪 Logout</a></li>
        </ul>
    </div>
</nav>

<!-- Main Content -->
<div class="content-container">
    <div class="table-title">📋 All Students</div>

    <div class="search-box">
        <input type="text" id="searchInput" placeholder="🔍 Search by Name or Roll No...">
    </div>

    <div class="table-responsive">
        <table id="studentTable" class="table table-bordered text-center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Roll No</th>
                    <th>Department</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        conn = DBConnection.getConnection();
                        st = conn.createStatement();
                        rs = st.executeQuery("SELECT * FROM Student ORDER BY id DESC");

                        boolean hasData = false;
                        while (rs.next()) {
                            hasData = true;
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("rollNo") %></td>
                    <td><%= rs.getString("department") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td>
                        <a href="edit_student.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-info btn-action">✏️ Edit</a>
                        <a href="deleteStudent?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger btn-action"
                           onclick="return confirm('Are you sure you want to delete this student?');">🗑️ Delete</a>
                    </td>
                </tr>
                <%
                        }
                        if (!hasData) {
                %>
                <tr><td colspan="6" class="text-muted">No students found.</td></tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='6' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        try { if (rs != null) rs.close(); if (st != null) st.close(); if (conn != null) conn.close(); } catch (Exception ignore) {}
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="text-center mt-4">
        <a href="add_student.jsp" class="btn btn-success btn-lg mx-2 shadow-sm">➕ Add Student</a>
        <a href="dashboard.jsp" class="btn btn-secondary btn-lg mx-2 shadow-sm">🏠 Dashboard</a>
    </div>
</div>

<footer>
    &copy; <%= java.time.Year.now() %> Faculty Management System. All Rights Reserved.
</footer>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Search Filter
    document.getElementById("searchInput").addEventListener("keyup", function() {
        const filter = this.value.toLowerCase();
        const rows = document.querySelectorAll("#studentTable tbody tr");
        rows.forEach(row => {
            const text = row.innerText.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    });
</script>

</body>
</html>
