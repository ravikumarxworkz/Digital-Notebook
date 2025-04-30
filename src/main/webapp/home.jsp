<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
    UserDetails user2 = (UserDetails)session.getAttribute("userD");
    if(user2 == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "Please Login...");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Home - Notes App</title>
    <%@ include file="all_component/allcss.jsp" %>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #f72585;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --gradient: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            color: #333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .hero-section {
            background: var(--gradient);
            color: white;
            padding: 5rem 0;
            position: relative;
            overflow: hidden;
        }
        
        .hero-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('img/dots-pattern.png') repeat;
            opacity: 0.1;
            z-index: 0;
        }
        
        .hero-content {
            position: relative;
            z-index: 1;
        }
        
        .hero-title {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .hero-subtitle {
            font-size: 1.25rem;
            margin-bottom: 2.5rem;
            opacity: 0.9;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .hero-image {
            max-width: 600px;
            width: 100%;
            height: auto;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }
        
        .hero-image:hover {
            transform: translateY(-5px);
        }
        
        .btn-start {
            background-color: white;
            color: var(--primary-color);
            border: none;
            border-radius: 50px;
            padding: 12px 30px;
            font-weight: 600;
            font-size: 1.1rem;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-start:hover {
            background-color: var(--accent-color);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(247, 37, 133, 0.3);
        }
        
        .btn-start i {
            margin-right: 8px;
            font-size: 1.2rem;
        }
        
        .features-section {
            padding: 5rem 0;
            background-color: white;
        }
        
        .feature-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            height: 100%;
            border: 1px solid rgba(0,0,0,0.05);
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }
        
        .feature-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }
        
        .feature-title {
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--dark-color);
        }
        
        .feature-text {
            color: #666;
            font-size: 0.95rem;
        }
        
        /* Animation classes */
        .animate-delay-1 {
            animation-delay: 0.2s;
        }
        
        .animate-delay-2 {
            animation-delay: 0.4s;
        }
        
        .animate-delay-3 {
            animation-delay: 0.6s;
        }
        
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1rem;
            }
            
            .hero-image {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    
    <div class="hero-section text-center">
        <div class="container hero-content">
            <div class="row align-items-center">
                <div class="col-lg-6 order-lg-1 order-2 animate__animated animate__fadeInLeft">
                    <h1 class="hero-title">Organize Your Thoughts</h1>
                    <p class="hero-subtitle">Capture ideas, create notes, and stay productive with our beautifully simple note-taking application. Access your notes anytime, anywhere.</p>
                    <a href="addNotes.jsp" class="btn btn-start animate__animated animate__pulse animate__infinite">
                        <i class="fas fa-plus-circle"></i> Start Taking Notes
                    </a>
                </div>
                <div class="col-lg-6 order-lg-2 order-1 mb-4 mb-lg-0 animate__animated animate__fadeInRight">
                    <img src="img/enotelogo.jpg" alt="Note Taking App" class="hero-image img-fluid">
                </div>
            </div>
        </div>
    </div>
    
    <div class="features-section">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4 animate__animated animate__fadeInUp animate-delay-1">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <h3 class="feature-title">Quick Capture</h3>
                        <p class="feature-text">Instantly jot down ideas as they come to you with our lightning-fast interface.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4 animate__animated animate__fadeInUp animate-delay-2">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-mobile-alt"></i>
                        </div>
                        <h3 class="feature-title">Access Anywhere</h3>
                        <p class="feature-text">Your notes are available on all your devices, anytime you need them.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4 animate__animated animate__fadeInUp animate-delay-3">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-lock"></i>
                        </div>
                        <h3 class="feature-title">Secure Storage</h3>
                        <p class="feature-text">Your data is protected with enterprise-grade security and encryption.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="all_component/footer.jsp"%>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS for animations -->
    <script>
        // Add animation classes when elements come into view
        document.addEventListener('DOMContentLoaded', function() {
            const animateElements = document.querySelectorAll('.animate__animated');
            
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add(entry.target.dataset.animation);
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.1 });
            
            animateElements.forEach(element => {
                observer.observe(element);
            });
        });
    </script>
</body>
</html>