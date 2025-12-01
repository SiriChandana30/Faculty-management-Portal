<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Faculty Login</title>
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

        .login-container {
            background: #ffffff;
            padding: 40px 35px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
            width: 100%;
            max-width: 420px;
            animation: fadeInUp 1s ease-in-out;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
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

        .login-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .form-control {
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            box-shadow: 0 0 8px rgba(37, 117, 252, 0.5);
            border-color: #2575fc;
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

        .error-message, .success-message {
            text-align: center;
            margin-top: 15px;
            font-weight: 500;
            animation: fadeIn 0.8s ease-in;
        }

        .error-message {
            color: #ff4d4d;
        }

        .success-message {
            color: #28a745;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .login-container {
                padding: 30px 25px;
            }
            .login-container h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Faculty Login</h2>
    <form action="login" method="post" autocomplete="off">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text"
                   name="username"
                   id="username"
                   class="form-control"
                   placeholder="Enter your username"
                   required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password"
                   name="password"
                   id="password"
                   class="form-control"
                   placeholder="Enter your password"
                   required>
        </div>

        <button type="submit" class="btn btn-primary mt-2">Login</button>
    </form>

    <!-- Display success or error message -->
    <%
        String error = request.getParameter("error");
        String message = request.getParameter("message");
        if (error != null) {
    %>
        <div class="error-message"><%= error %></div>
    <%
        } else if (message != null) {
    %>
        <div class="success-message"><%= message %></div>
    <%
        }
    %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
