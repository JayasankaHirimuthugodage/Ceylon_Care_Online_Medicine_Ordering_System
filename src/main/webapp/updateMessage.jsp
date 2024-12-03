<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Message - Ceylon Care</title>
    <link rel="stylesheet" href="updateMessage.css">
</head>
<body>

    <header class="header">
        <div class="logo">
            <img src="images/logo.png" alt="Ceylon Care Logo">
            <h1>Ceylon Care</h1>
        </div>
        <nav class="nav-menu">
            <a href="home.jsp">Home</a>
            <a href="ProductHomeServlet">Products</a>
            <a href="aboutUs.jsp">About Us</a>
            <a href="contactUs.jsp">Contact Us</a>
            
            <%
                if (session.getAttribute("user") != null) {
            %>
                <a href="Profile.jsp">Profile</a>
            <%
                }
            %>
            
        </nav>
        
        <div class="user-actions">
		    <a href="" class="upload-btn">Upload Prescription</a>
		    <a href="cart.jsp">Cart</a>
		
		    <%
		        if (session.getAttribute("user") != null) {
		    %>
		        <!-- If the user is logged in, show the Logout button -->
		        <a href="LogoutServlet">Logout</a>
		    <%
		        } else {
		    %>
		        <!-- If the user is not logged in, show Sign Up and Log In buttons -->
		        <a href="signup.jsp">Sign Up</a>
		        <a href="login.jsp">Log In</a>
		    <%
		        }
		    %>
		</div>
		
    </header>

    <main class="main-content">
        <h2>Update Message</h2>

        <%
            String id = request.getParameter("id");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String opEmail = request.getParameter("opEmail");
            String description = request.getParameter("description");
        %>

        <form action="UpdateMessage" method="post" class="update-form">
            <div class="form-group">
                <label for="id">Id:</label>
                <input type="text" id="id" name="id" value="<%=id%>" readonly>
            </div>
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" value="<%=firstName%>" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" value="<%=lastName%>" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="opEmail" value="<%=opEmail%>" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="4" required><%=description%></textarea>
            </div>
            <div class="form-group button-group">
            	
            	
            
            
                <button type="submit" class="submit-btn" name="submit">Update</button>
            </div>
        </form>
    </main>

    <footer class="footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms of Service</a></p>
    </footer>

</body>
</html>
