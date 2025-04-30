<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="User.UserDetails"%>
<%
    UserDetails user1 = (UserDetails)session.getAttribute("userD");
    if(user1 == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "Please Login...");
    } 
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add New Note</title>
    <%@include file="all_component/allcss.jsp" %>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .notes-header {
            background: var(--gradient);
            color: white;
            padding: 3rem 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .notes-header::before {
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
        
        .notes-header h1 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 2.8rem;
            position: relative;
            z-index: 1;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .notes-header p {
            font-size: 1.1rem;
            opacity: 0.9;
            position: relative;
            z-index: 1;
            max-width: 700px;
            margin: 0.5rem auto 0;
        }
        
        .notes-container {
            flex: 1;
            padding: 3rem 0;
        }
        
        .notes-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            padding: 2.5rem;
            margin-bottom: 2rem;
            border: 1px solid rgba(0,0,0,0.05);
        }
        
        .form-label {
            font-weight: 600;
            color: var(--dark-color);
            margin-bottom: 0.8rem;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.15);
        }
        
        textarea.form-control {
            min-height: 200px;
            resize: vertical;
        }
        
        .btn-add-note {
            background: var(--gradient);
            border: none;
            border-radius: 50px;
            padding: 12px 30px;
            font-weight: 600;
            font-size: 1rem;
            letter-spacing: 0.5px;
            color: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-add-note:hover {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(63, 55, 201, 0.3);
            color: white;
        }
        
        .btn-add-note i {
            margin-right: 8px;
        }
        
        .character-count {
            font-size: 0.8rem;
            color: #666;
            text-align: right;
            margin-top: 0.5rem;
        }
        
        @media (max-width: 768px) {
            .notes-header h1 {
                font-size: 2rem;
            }
            
            .notes-header p {
                font-size: 0.95rem;
            }
            
            .notes-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <%@include file="all_component/navbar.jsp" %>
    
    <div class="notes-header">
        <div class="container">
            <h1 class="animate__animated animate__fadeInDown">Create New Note</h1>
            <p class="animate__animated animate__fadeInUp animate__delay-1s">Capture your thoughts, ideas, and inspiration</p>
        </div>
    </div>
    
    <div class="notes-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="notes-card animate__animated animate__fadeIn">
                        <form action="AddNotesServlet" method="post">
                            <%
                                UserDetails us = (UserDetails)session.getAttribute("userD");
                                if(us != null) {
                            %>
                            <input type="hidden" value="<%= us.getId() %>" name="uid">
                            <% } %>
                            
                            <div class="mb-4">
                                <label for="noteTitle" class="form-label">Note Title</label>
                                <input type="text" class="form-control" id="noteTitle" 
                                    placeholder="Give your note a meaningful title" name="title" required>
                            </div>
                            
                            <div class="mb-4">
                                <label for="noteContent" class="form-label">Your Content</label>
                                <textarea class="form-control" id="noteContent" rows="10" 
                                    placeholder="Express your thoughts here..." name="content" required></textarea>
                                <div class="character-count" id="charCount">0 characters</div>
                            </div>
                            
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-add-note">
                                    <i class="fas fa-plus-circle"></i> Save Note
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="all_component/footer.jsp" %>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Character count script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const textarea = document.getElementById('noteContent');
            const charCount = document.getElementById('charCount');
            
            textarea.addEventListener('input', function() {
                const count = this.value.length;
                charCount.textContent = count + ' character' + (count !== 1 ? 's' : '');
            });
            
            // Trigger input event to update count on page load
            textarea.dispatchEvent(new Event('input'));
        });
    </script>
</body>
</html>