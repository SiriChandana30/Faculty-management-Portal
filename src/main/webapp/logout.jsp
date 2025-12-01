<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Invalidate the session if it exists
    session = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }

    String message = request.getParameter("message");
    if (message == null) {
        message = "You have successfully logged out.";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>👋 Logout - Faculty Portal</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap 4.6.2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
}

/* Card Container */
.logout-card {
    background: #ffffff;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
    padding: 45px 35px;
    max-width: 460px;
    text-align: center;
    animation: fadeInUp 1.1s ease;
    position: relative;
    overflow: hidden;
}
.logout-card::before {
    content: "";
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle at center, rgba(106, 17, 203, 0.15), transparent 70%);
    transform: scale(0.8);
    animation: pulseEffect 5s infinite ease-in-out;
    pointer-events: none; /* ✅ Fix for clickable buttons/links */
}


@keyframes pulseEffect {
    0%, 100% { transform: scale(0.8); opacity: 0.6; }
    50% { transform: scale(1.2); opacity: 1; }
}

/* Animations */
@keyframes fadeInUp {
    from { transform: translateY(50px); opacity: 0; }
    to { transform: translateY(0); opacity: 1; }
}

h2 {
    color: #333;
    font-weight: 600;
    font-size: 1.9rem;
    margin-bottom: 10px;
}

p {
    font-size: 16px;
    color: #555;
    margin-bottom: 25px;
}

.text-success {
    color: #28a745 !important;
    font-weight: 600;
}

.btn-custom {
    width: 100%;
    padding: 10px;
    font-size: 1.1rem;
    border-radius: 10px;
    font-weight: 600;
    transition: transform 0.25s ease, box-shadow 0.25s ease;
}

.btn-primary {
    background: linear-gradient(45deg, #6a11cb, #2575fc);
    border: none;
    color: #fff;
}

.btn-primary:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 20px rgba(37, 117, 252, 0.5);
}

.btn-outline-secondary {
    border-radius: 10px;
    border: 2px solid #6c757d;
    color: #6c757d;
}

.btn-outline-secondary:hover {
    background: #6c757d;
    color: #fff;
    transform: scale(1.05);
    box-shadow: 0 6px 15px rgba(108, 117, 125, 0.3);
}

footer {
    position: fixed;
    bottom: 12px;
    width: 100%;
    text-align: center;
    color: #fff;
    font-size: 14px;
    letter-spacing: 0.5px;
    animation: fadeIn 2s ease;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

/* Responsive Design */
@media (max-width: 576px) {
    .logout-card {
        padding: 35px 25px;
        margin: 0 20px;
    }

    h2 {
        font-size: 1.6rem;
    }
}
</style>
</head>

<body>

    <div class="logout-card">
        <h2>👋 Logged Out</h2>
        <p class="text-success"><%= message %></p>
        <p>You can safely close this page or log in again below.</p>

        <a href="login.jsp" class="btn btn-primary btn-custom">🔐 Back to Login</a>
        <a href="dashboard.jsp" class="btn btn-outline-secondary btn-custom mt-3">🏠 Go to Dashboard</a>
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
