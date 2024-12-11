<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Ceylon Care</title>
     <style>
        
	    :root {
	    --primary-color: #0056b3;
	    --secondary-color: #57c5b6;
	    --accent-color: #159895;
	    --light-color: #e6f2ff;
	    --text-color: #ffffff;
	    --dark-text: #333333;
		}
		
		body {
		    font-family: Arial, sans-serif;
		    margin: 0;
		    padding: 0;
		    display: flex;
		    flex-direction: column;
		    min-height: 100vh;
		    background-color: var(--light-color);
		}
		
		.header {
		    background-color: var(--primary-color);
		    color: var(--text-color);
		    padding: 1rem;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    flex-wrap: wrap;
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		}
		
		.logo {
		    display: flex;
		    align-items: center;
		}
		
		.logo img {
		    width: 60px;
		    height: 60px;
		    margin-right: 15px;
		    border-radius: 50%;
		    box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
		    transition: transform 0.3s ease;
		}
		
		.logo img:hover {
		    transform: scale(1.1);
		}
		
		.logo h1 {
		    font-size: 1.8rem;
		    margin: 0;
		    color: var(--text-color);
		    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
		}
		
		.nav-menu {
		    display: flex;
		    gap: 1rem;
		}
		
		.nav-menu a {
		    color: var(--text-color);
		    text-decoration: none;
		    padding: 0.5rem 1rem;
		    border-radius: 4px;
		    transition: background-color 0.4s;
		}
		
		.nav-menu a:hover {
		    background-color: var(--secondary-color);
		}
		
		.user-actions {
		    display: flex;
		    align-items: center;
		    gap: 1rem;
		}
		
		.user-actions a {
		    color: var(--text-color);
		    text-decoration: none;
		    padding: 0.5rem 1rem;
		    border-radius: 4px;
		    background-color: var(--accent-color);
		    transition: background-color 0.3s;
		}
		
		.user-actions a:hover {
		    background-color: var(--secondary-color);
		}
		
		.upload-btn {
		    background-color: var(--secondary-color);
		    font-weight: bold;
		}
        
        
        .about-section {
            text-align: center;
            padding: 2rem;
            background-color: var(--light-color);
        }

        .about-section h2 {
            margin-bottom: 1.5rem;
            font-size:2rem;
            color: var(--dark-text);
        }

        .slideshow-container {
            max-width: 800px;
            position: relative;
            margin: auto;
        }

        .mySlides {
            display: none;
        }

        .slide-img {
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        .prev:hover, .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        .team {
            display: flex;
            justify-content: space-around;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .team-member {
            max-width: 250px;
            margin: 1rem;
            text-align: center;
        }

        .team-member img {
            width: 100%;
            border-radius: 50%;
            margin-bottom: 1rem;
        }

        .team-member h3 {
        	font-size: 1rem;
            margin: 0.5rem 0;
            color: var(--primary-color);
        }

        .team-member p {
            color: var(--dark-text);
        }
        
        
        .footer {
		    background-color: var(--primary-color);
		    color: var(--text-color);
		    padding: 1rem;
		    text-align: center;
		    margin-top: auto;
		}
		
		.footer a {
		    color: var(--light-color);
		    text-decoration: none;
		}
		
		.footer a:hover {
		    text-decoration: underline;
		}
		
		@media (max-width: 768px) {
		    .header {
		        flex-direction: column;
		        align-items: flex-start;
		    }
		
		    .logo img {
		        width: 50px;
		        height: 50px;
		    }
		
		    .logo h1 {
		        font-size: 1.5rem;
		    }
		
		    .nav-menu,
		    .user-actions {
		        margin-top: 1rem;
		        flex-direction: column;
		        align-items: flex-start;
		        width: 100%;
		    }
		
		    .nav-menu a,
		    .user-actions a {
		        width: 100%;
		        box-sizing: border-box;
		        text-align: center;
		    }
		}
        
        
    </style>
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="images/logo.png" alt="Ceylon Care Logo">
            <h1>Ceylon Care Medicine System</h1>
        </div>
        <nav class="nav-menu">
            <a href="home.jsp">Home</a>
            <a href="products.html">Products</a>
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
            <a href="upload-prescription.html" class="upload-btn">Upload Prescription</a>
            <a href="cart.html">Cart</a>
            
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
        <div class="about-section">
            <h2>About Us</h2>
            <p>Welcome to Ceylon Care, your trusted online medicine ordering system dedicated to providing you with quality healthcare products.</p>

            <div class="slideshow-container">
                <div class="mySlides fade">
                    <img src="images/slide1.png" class="slide-img" alt="Slide 1">
                </div>
                <div class="mySlides fade">
                    <img src="images/slide2.png" class="slide-img" alt="Slide 2">
                </div>
                <div class="mySlides fade">
                    <img src="images/slide3.png" class="slide-img" alt="Slide 3">
                </div>

            </div>
            <p>Our mission is to make healthcare accessible and affordable for everyone.</p>

            <h2>Meet Our Team</h2>
            <div class="team">
                <div class="team-member">
                    <img src="images/img1.jpg" alt="Team Member 1">
                    <h3>John Doe</h3>
                    <p>CEO and Founder</p>
                </div>
                <div class="team-member">
                    <img src="images/img2.jpg" alt="Team Member 2">
                    <h3>Jane Smith</h3>
                    <p>Chief Pharmacist</p>
                </div>
                <div class="team-member">
                    <img src="images/img3.jpg" alt="Team Member 3">
                    <h3>Robert Brown</h3>
                    <p>Marketing Manager</p>
                </div>
            </div>
        </div>
    </main>

    <footer class="footer">
        <p>200/9, Devananda Road, Piliyandala</p>
        <p>&copy; 2024 Ceylon Care. All rights reserved. | <a href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms of Service</a></p>
    </footer>

    <script src="script.js"></script>
    <script>
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            const slides = document.getElementsByClassName("mySlides");
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) {
                slideIndex = 1;
            }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 3000); // Change image every 3 seconds
        }

        function plusSlides(n) {
            slideIndex += n;
            if (slideIndex > document.getElementsByClassName("mySlides").length) {
                slideIndex = 1;
            } else if (slideIndex < 1) {
                slideIndex = document.getElementsByClassName("mySlides").length;
            }
            showSlidesManual(slideIndex);
        }

        function showSlidesManual(index) {
            const slides = document.getElementsByClassName("mySlides");
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[index - 1].style.display = "block";
        }
    </script>
</body>
</html>
