<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>

   
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


        .admin-content h2 {
            text-align: center;
            color: #1e4f99; 
        }

        form {
            display: flex;
            flex-direction: column;
            width: 50%;
        }

        label {
            margin: 10px 0 5px;
        }

        input[type="text"], input[type="password"] {
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
            width:140px;
            margin-left:110px;
        }

        input[type="submit"]:hover {
            background-color: #154072; 
        }

        a {
            display: inline-block;
            margin-top: 10px;
            color: #1e4f99; 
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

       

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
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
    <h2>Admin Login</h2>
    <form action="AdminLoginServlet" method="post">
        <label>Username:</label>
        <input type="text" name="username" required />
        <br>
        <label>Password:</label>
        <input type="password" name="password" required />
        <br>
        <input type="submit" value="Login" />
    </form>
    <a href="adminForgotPassword.jsp">Forgot Password?</a>

    <% 
       
        String error = request.getParameter("error");
        if (error != null) {
            out.println("<p class='error-message'>" + error + "</p>");
        }
    %>
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
