<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("view_students.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Record Deleted</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Poppins', sans-serif;
            overflow: hidden;
        }

        .box {
            background: #ffffff;
            padding: 40px 35px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
            text-align: center;
            width: 100%;
            max-width: 420px;
            animation: fadeInUp 1s ease-in-out;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .box:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
        }

        h3 {
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }

        p {
            color: #555;
            font-size: 16px;
        }

        .btn-primary {
            width: 100%;
            border-radius: 8px;
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            border: none;
            font-weight: 600;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .btn-primary:hover {
            transform: scale(1.03);
            box-shadow: 0 6px 15px rgba(37, 117, 252, 0.4);
        }

        @keyframes fadeInUp {
            from {
                transform: translateY(40px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
</head>

<body>

<div class="box">
    <h3>✅ Record Deleted Successfully</h3>
    <p>The selected record has been removed.</p>
    <a href="dashboard.jsp" class="btn btn-primary mt-3">⬅ Back to Dashboard</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
