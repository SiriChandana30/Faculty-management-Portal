<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add New Student</title>

<!-- Bootstrap 4.6.2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>
    body {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        font-family: 'Poppins', sans-serif;
        min-height: 100vh;
        margin: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        color: #333;
    }

    /* Card Styling */
    .card {
        width: 100%;
        max-width: 450px;
        border: none;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        animation: fadeInUp 1s ease;
        background-color: #ffffff;
        overflow: hidden;
    }

    @keyframes fadeInUp {
        from { transform: translateY(40px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    .card-header {
        background: linear-gradient(45deg, #007bff, #6a11cb);
        color: white;
        font-size: 1.5rem;
        font-weight: 600;
        text-align: center;
        padding: 18px;
        letter-spacing: 1px;
    }

    .card-body {
        padding: 30px;
    }

    label {
        font-weight: 500;
        color: #333;
    }

    .form-control {
        border-radius: 8px;
        padding: 10px;
        font-size: 1rem;
        transition: all 0.3s ease;
        border: 1px solid #ccc;
    }

    .form-control:focus {
        border-color: #6a11cb;
        box-shadow: 0 0 8px rgba(106, 17, 203, 0.4);
    }

    .btn-primary {
        background: linear-gradient(45deg, #6a11cb, #2575fc);
        border: none;
        border-radius: 10px;
        font-weight: 600;
        font-size: 1.1rem;
        padding: 12px;
        transition: transform 0.2s ease, box-shadow 0.3s ease;
    }

    .btn-primary:hover {
        transform: scale(1.03);
        box-shadow: 0 6px 15px rgba(37, 117, 252, 0.4);
    }

    .btn-outline-secondary, .btn-outline-info {
        border-radius: 8px;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .btn-outline-secondary:hover {
        background-color: #6c757d;
        color: white;
    }

    .btn-outline-info:hover {
        background-color: #17a2b8;
        color: white;
    }

    .link-buttons {
        margin-top: 15px;
        text-align: center;
    }

    footer {
        text-align: center;
        color: #f1f1f1;
        font-size: 14px;
        margin-top: 30px;
    }

    /* Responsive Design */
    @media (max-width: 576px) {
        .card {
            margin: 20px;
        }
        .card-header {
            font-size: 1.3rem;
        }
    }
</style>
</head>

<body>

<div class="card">
    <div class="card-header">🎓 Add New Student</div>
    <div class="card-body">
        <form action="addStudent" method="post" autocomplete="off">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter student name" required>
            </div>

            <div class="form-group">
                <label for="roll_no">Roll Number</label>
                <input type="text" class="form-control" id="roll_no" name="roll_no" placeholder="Enter roll number" required>
            </div>

            <div class="form-group">
                <label for="department">Department</label>
                <input type="text" class="form-control" id="department" name="department" placeholder="Enter department" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address" required>
            </div>

            <button type="submit" class="btn btn-primary mt-2">Add Student</button>
        </form>

        <div class="link-buttons mt-3">
            <a href="view_students.jsp" class="btn btn-outline-secondary btn-sm mx-1">
            <button type="submit" class="btn btn-primary mt-2"> 📋 View Students</button>
            </a>
            <a href="dashboard.jsp" class="btn btn-outline-info btn-sm mx-1">
            <button type="submit" class="btn btn-primary mt-2">🏠 Dashboard
            </button>
            </a>
        </div>
    </div>
</div>

<footer>
    &copy; <%= java.time.Year.now() %> Faculty Management System. All Rights Reserved.
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
