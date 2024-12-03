<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Forgot Password</title>
    <script type="text/javascript">
        window.onload = function() {
            <% 
                String message = (String) request.getAttribute("message");
                String error = (String) request.getAttribute("error");
                if (message != null) {
            %>
                alert("<%= message %>");
            <% 
                } else if (error != null) {
            %>
                alert("<%= error %>");
            <% 
                }
            %>
        }
    </script>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="admin-styles.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9f1fe; 
            margin: 0;
            padding: 0;
        }

        .admin-profile {
            background-color: #00b386; 
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        .admin-profile:hover {
            background-color: #009973; 
        }

        form {
            display: flex;
            flex-direction: column;
            width: 50%;
        }

        label {
            margin: 10px 0 5px;
        }

        input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #1e4f99; 
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            margin-top: 20px;
            border-radius: 5px;
            width: 140px;
            margin-left: 110px;
        }

        input[type="submit"]:hover {
            background-color: #154072; 
        }

    </style>
</head>
<body>

<header class="admin-header">
    <div class="admin-logo">
        <img src="images/logo.png" alt="Ceylon Care Logo">
        <h1>Ceylon Care Admin</h1>
    </div>
</header>

<main class="admin-content">
    <h2>Forgot Password</h2>
    <form action="AdminForgotPasswordServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required />
        <br><br>
        <input type="submit" value="Send Reset Link" />
    </form>
</main>

<footer class="admin-footer">
    <p>200/9, Devananda Road, Piliyandala</p>
    <p>&copy; 2024 Ceylon Care. All rights reserved. | 
        <a href="#">Privacy Policy</a> | 
        <a href="#">Terms of Service</a>
    </p>
</footer>

<script src="admin-script.js"></script>
</body>
</html>
