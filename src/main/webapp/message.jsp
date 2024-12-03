<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ceylon Care - Contact Messages</title>
    <link rel="stylesheet" href="message.css"> <!-- Updated to use styles.css -->
    <script>
        // Show alert if there is an error message
        <c:if test="${not empty errorMessage}">
            alert('${errorMessage}');
        </c:if>
    </script>
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

    <main>
        <h2>View Messages</h2>
        <table class="styled-table">
            <thead>
                <tr>
                	<th>No</th>
                	<th>Message Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Click to Update</th>
                    <th>Click to Delete</th>
                </tr>
            </thead>
            <tbody>
            
				<%
					int number = 1;
				%>
				
                <!-- Use JSTL forEach tag to iterate over the list of messages -->
                <c:forEach var="msg" items="${mesDetails}">
                    <tr>
                    	<td><%= number %>.</td>
                    	<td>${msg.id}</td>
                        <td>${msg.firstName} ${msg.lastName}</td>
                        <td>${msg.opEmail}</td>
                        <td>${msg.formattedDateTime}</td>
                        <td class="description">
                        
                        	<c:if test="${fn:length(msg.description) > 20}">
						        ${fn:substring(msg.description, 0, 20)}...
						    </c:if>
						    <c:if test="${fn:length(msg.description) <= 20}">
						        ${msg.description}
						    </c:if>
                        
                        </td>
                        <td>
                            <form action="updateMessage.jsp" method="post">
						        <input type="hidden" name="id" value="${msg.id}">
						        <input type="hidden" name="firstName" value="${msg.firstName}">
						        <input type="hidden" name="lastName" value="${msg.lastName}">
						        <input type="hidden" name="opEmail" value="${msg.opEmail}">
						        <input type="hidden" name="description" value="${msg.description}">
						        <button type="submit">Update</button>
						    </form>
                        </td>
                        <td>
                            <form action="DeleteMessage" method="POST">
                                <input type="hidden" name="id" value="${msg.id}">
                                <input type="hidden" name="email" value="${msg.email}">
                                <button type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                    
                    <% number = number + 1; %>
                    
                </c:forEach>
            </tbody>
        </table>
    </main>

    <footer class="footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms of Service</a></p>
    </footer>
</body>
</html>
