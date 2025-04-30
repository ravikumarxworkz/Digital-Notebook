<%@page import="Db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>ENotes | Home</title>
    <%@include file="all_component/allcss.jsp" %>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --text-color: #f8f9fa;
        }
        
        .slideshow-container {
            position: relative;
            width: 100%;
            height: 70vh;
            overflow: hidden;
        }
        
        .slide {
            position: absolute;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            opacity: 0;
            transition: opacity 1.5s ease-in-out;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            flex-direction: column;
        }
        
        .slide.active {
            opacity: 1;
        }
        
        .slide::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
        }
        
        .slide-content {
            position: relative;
            z-index: 1;
            color: var(--text-color);
            padding: 20px;
            max-width: 800px;
        }
        
        .slide-content h1 {
            font-size: 2.8rem;
            margin-bottom: 30px;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.8);
            font-weight: 700;
        }
        
        .btn-custom {
            margin: 10px;
            padding: 12px 28px;
            font-size: 1.1rem;
            border-radius: 50px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
            font-weight: 500;
            letter-spacing: 0.5px;
            border: 2px solid transparent;
        }
        
        .btn-login {
            background: var(--primary-color);
            color: white;
        }
        
        .btn-register {
            background: transparent;
            color: white;
            border-color: white;
        }
        
        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }
        
        .btn-login:hover {
            background: var(--secondary-color);
            color: white;
        }
        
        .btn-register:hover {
            background: rgba(255,255,255,0.1);
        }
        
        /* Animation for text */
        .animate-text {
            animation: fadeInUp 1s ease;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @media (max-width: 768px) {
            .slideshow-container {
                height: 80vh;
            }
            
            .slide-content h1 {
                font-size: 2rem;
            }
            
            .btn-custom {
                padding: 10px 20px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

<%@include file="all_component/navbar.jsp" %>

<div class="slideshow-container">
    <!-- Slide 1 - Notebook with pen -->
    <div class="slide active" style="background-image: url('https://images.unsplash.com/photo-1518655048521-f130df041f66?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');">
        <div class="slide-content animate-text">
            <h1><i class="fas fa-book-open"></i> ENotes - Capture Your Ideas</h1>
            <div>
                <a href="login.jsp" class="btn btn-custom btn-login">
                    <i class="fas fa-sign-in-alt"></i> Login
                </a>
                <a href="register.jsp" class="btn btn-custom btn-register">
                    <i class="fas fa-user-plus"></i> Register
                </a>
            </div>
        </div>
    </div>
    
    <!-- Slide 2 - Desk with stationery -->
    <div class="slide" style="background-image: url('https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');">
        <div class="slide-content animate-text">
            <h1><i class="fas fa-pencil-alt"></i> Organize Your Thoughts</h1>
            <div>
                <a href="login.jsp" class="btn btn-custom btn-login">
                    <i class="fas fa-sign-in-alt"></i> Login
                </a>
                <a href="register.jsp" class="btn btn-custom btn-register">
                    <i class="fas fa-user-plus"></i> Register
                </a>
            </div>
        </div>
    </div>
    
    <!-- Slide 3 - Digital notes -->
    <div class="slide" style="background-image: url('https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');">
        <div class="slide-content animate-text">
            <h1><i class="fas fa-sticky-note"></i> Your Digital Notebook</h1>
            <div>
                <a href="login.jsp" class="btn btn-custom btn-login">
                    <i class="fas fa-sign-in-alt"></i> Login
                </a>
                <a href="register.jsp" class="btn btn-custom btn-register">
                    <i class="fas fa-user-plus"></i> Register
                </a>
            </div>
        </div>
    </div>
    
    <!-- Slide 4 - Creative workspace -->
    <div class="slide" style="background-image: url('https://images.unsplash.com/photo-1540835296355-c04f7a063cbb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');">
        <div class="slide-content animate-text">
            <h1><i class="fas fa-lightbulb"></i> Where Ideas Come Alive</h1>
            <div>
                <a href="login.jsp" class="btn btn-custom btn-login">
                    <i class="fas fa-sign-in-alt"></i> Login
                </a>
                <a href="register.jsp" class="btn btn-custom btn-register">
                    <i class="fas fa-user-plus"></i> Register
                </a>
            </div>
        </div>
    </div>
</div>

<%@include file="all_component/footer.jsp" %>

<script>
    // Background slideshow functionality
    document.addEventListener('DOMContentLoaded', function() {
        const slides = document.querySelectorAll('.slide');
        let currentSlide = 0;
        
        function nextSlide() {
            slides[currentSlide].classList.remove('active');
            currentSlide = (currentSlide + 1) % slides.length;
            slides[currentSlide].classList.add('active');
            
            // Re-trigger animation for text
            const content = slides[currentSlide].querySelector('.slide-content');
            content.classList.remove('animate-text');
            void content.offsetWidth; // Trigger reflow
            content.classList.add('animate-text');
        }
        
        // Change slide every 5 seconds
        setInterval(nextSlide, 5000);
    });
</script>
</body>
</html>