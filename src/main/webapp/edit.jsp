<%@page import="User.post"%>
<%@page import="Db.DBConnect"%>
<%@page import="DAO.postDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    UserDetails user1 = (UserDetails) session.getAttribute("userD");
    if (user1 == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "Please Login...");
    }
    
    int noteId1 = Integer.parseInt(request.getParameter("note_id"));
    postDao dao = new postDao(DBConnect.getConnection());
    post p1 = dao.getDataById(noteId1);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Note</title>
    <%@include file="all_component/allcss.jsp"%>
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
            --success-color: #4cc9f0;
            --gradient: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .edit-header {
            background: var(--gradient);
            color: white;
            padding: 3rem 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .edit-header::before {
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
        
        .edit-header h1 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 2.8rem;
            position: relative;
            z-index: 1;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .edit-container {
            flex: 1;
            padding: 3rem 0;
        }
        
        .edit-card {
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
            min-height: 300px;
            resize: vertical;
        }
        
        .btn-save {
            background: var(--success-color);
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
            width: 100%;
            max-width: 300px;
        }
        
        .btn-save:hover {
            background: #3aa8d8;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(76, 201, 240, 0.3);
            color: white;
        }
        
        .btn-save i {
            margin-right: 8px;
        }
        
        .character-count {
            font-size: 0.8rem;
            color: #666;
            text-align: right;
            margin-top: 0.5rem;
        }
        
        .back-to-notes {
            text-align: center;
            margin-top: 1.5rem;
        }
        
        .back-to-notes a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }
        
        .back-to-notes a:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 768px) {
            .edit-header h1 {
                font-size: 2rem;
            }
            
            .edit-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    
    <div class="edit-header">
        <div class="container">
            <h1 class="animate__animated animate__fadeInDown">Edit Your Note</h1>
        </div>
    </div>
    
    <div class="edit-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="edit-card animate__animated animate__fadeIn">
                        <form action="NoteEditServlet" method="post">
                            <input type="hidden" value="<%=noteId1%>" name="noteId">
                            
                            <div class="mb-4">
                                <label for="noteTitle" class="form-label">Note Title</label>
                                <input type="text" class="form-control" id="noteTitle"
                                    placeholder="Give your note a meaningful title" name="title"
                                    required value="<%=p1.getTitle()%>">
                            </div>
                            
                            <div class="mb-4">
                                <label for="noteContent" class="form-label">Your Content</label>
                                <textarea class="form-control" id="noteContent" rows="10"
                                    placeholder="Express your thoughts here..." name="content"
                                    required><%=p1.getContent()%></textarea>
                                <div class="character-count" id="charCount">0 characters</div>
                            </div>
                            
                            <div class="text-center">
                                <button type="submit" class="btn btn-save">
                                    <i class="fas fa-save"></i> Save Changes
                                </button>
                                <div class="back-to-notes">
                                    <a href="showNotes.jsp"><i class="fas fa-arrow-left"></i> Back to all notes</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="all_component/footer.jsp"%>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Character count script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const textarea = document.getElementById('noteContent');
            const charCount = document.getElementById('charCount');
            
            // Update character count on load
            updateCharacterCount();
            
            textarea.addEventListener('input', updateCharacterCount);
            
            function updateCharacterCount() {
                const count = textarea.value.length;
                charCount.textContent = count + ' character' + (count !== 1 ? 's' : '');
            }
        });
    </script>
</body>
</html>