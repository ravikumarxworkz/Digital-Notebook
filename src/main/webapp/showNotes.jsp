<%@page import="User.post"%>
<%@page import="java.util.*"%>
<%@page import="Db.DBConnect"%>
<%@page import="DAO.postDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    UserDetails user3 = (UserDetails) session.getAttribute("userD");
    if (user3 == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "Please Login...");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>My Notes</title>
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
        
        .notes-container {
            flex: 1;
            padding: 3rem 0;
        }
        
        .notes-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 2rem;
        }
        
        .note-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            overflow: hidden;
            transition: all 0.3s ease;
            border: 1px solid rgba(0,0,0,0.05);
        }
        
        .note-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }
        
        .note-icon {
            background: rgba(67, 97, 238, 0.1);
            color: var(--primary-color);
            font-size: 2.5rem;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 1.5rem auto;
        }
        
        .note-body {
            padding: 1.5rem;
        }
        
        .note-title {
            font-family: 'Playfair Display', serif;
            font-weight: 600;
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--dark-color);
        }
        
        .note-content {
            color: #555;
            margin-bottom: 1.5rem;
            line-height: 1.6;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .note-meta {
            font-size: 0.85rem;
            color: #777;
            margin-bottom: 1.5rem;
        }
        
        .note-meta span {
            display: block;
            margin-bottom: 0.3rem;
        }
        
        .note-meta i {
            margin-right: 0.5rem;
            color: var(--primary-color);
        }
        
        .note-actions {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }
        
        .btn-note {
            flex: 1;
            border-radius: 8px;
            padding: 0.5rem;
            font-weight: 500;
            text-align: center;
            transition: all 0.3s;
        }
        
        .btn-edit {
            background: var(--primary-color);
            color: white;
            border: 1px solid var(--primary-color);
        }
        
        .btn-edit:hover {
            background: var(--secondary-color);
            color: white;
        }
        
        .btn-delete {
            background: white;
            color: var(--accent-color);
            border: 1px solid var(--accent-color);
        }
        
        .btn-delete:hover {
            background: var(--accent-color);
            color: white;
        }
        
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: #666;
        }
        
        .empty-state i {
            font-size: 3rem;
            color: #ddd;
            margin-bottom: 1rem;
        }
        
        @media (max-width: 768px) {
            .notes-header h1 {
                font-size: 2rem;
            }
            
            .notes-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    
    <div class="notes-header">
        <div class="container">
            <h1 class="animate__animated animate__fadeInDown">My Notes</h1>
        </div>
    </div>
    
    <div class="notes-container">
        <div class="container">
            <%
                String updateMsgString = (String) session.getAttribute("updateMsg");
                if (updateMsgString != null) {
            %>
            <div class="alert alert-success alert-dismissible fade show animate__animated animate__fadeIn" role="alert">
                <%=updateMsgString%>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                session.removeAttribute("updateMsg");
                }
            %>
            
            <%
                String wrongMsgString = (String) session.getAttribute("wrongMsg");
                if (wrongMsgString != null) {
            %>
            <div class="alert alert-danger alert-dismissible fade show animate__animated animate__fadeIn" role="alert">
                <%=wrongMsgString%>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                session.removeAttribute("wrongMsg");
                }
            %>
            
            <div class="notes-grid">
                <%
                    if (user3 != null) {
                        postDao obj = new postDao(DBConnect.getConnection());
                        List<post> pos = obj.getData(user3.getId());
                        
                        if (pos.isEmpty()) {
                %>
                <div class="empty-state animate__animated animate__fadeIn">
                    <i class="far fa-clipboard"></i>
                    <h3>No Notes Found</h3>
                    <p>You haven't created any notes yet. Start by adding a new note!</p>
                    <a href="addNotes.jsp" class="btn btn-primary mt-3">Create Note</a>
                </div>
                <%
                        } else {
                            for (post po : pos) {
                %>
                <div class="note-card animate__animated animate__fadeIn">
                    <div class="note-icon">
                        <i class="far fa-sticky-note"></i>
                    </div>
                    <div class="note-body">
                        <h5 class="note-title"><%=po.getTitle()%></h5>
                        <div class="note-content"><%=po.getContent()%></div>
                        <div class="note-meta">
                            <span><i class="fas fa-user"></i> <%=user3.getFirstNameString()%></span>
                            <span><i class="fas fa-calendar-alt"></i> <%=po.getpDate()%></span>
                        </div>
                        <div class="note-actions">
                            <a href="edit.jsp?note_id=<%=po.getId()%>" class="btn-note btn-edit">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <a href="deleteServlet?note_id=<%=po.getId()%>" class="btn-note btn-delete">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </div>
                    </div>
                </div>
                <%
                            }
                        }
                    }
                %>
            </div>
        </div>
    </div>
    
    <%@include file="all_component/footer.jsp"%>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>