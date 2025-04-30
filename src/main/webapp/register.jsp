<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="all_component/allcss.jsp"%>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Animate.css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<style>
:root {
    --primary-color: #6a11cb;
    --secondary-color: #2575fc;
    --dark-color: #2b1810;
    --light-color: #f8f9fa;
}

.reg-container {
    min-height: 100vh;
    display: flex;
    align-items: center;
    background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                url('img/registrationBack.jpg') no-repeat center center fixed;
    background-size: cover;
    padding: 2rem 0;
}

.reg-card {
    border: none;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
    transition: transform 0.3s ease;
    background: rgba(255, 255, 255, 0.95);
}

.reg-card:hover {
    transform: translateY(-5px);
}

.card-header-custom {
    background: linear-gradient(135deg, var(--dark-color), var(--primary-color));
    color: white;
    padding: 1.5rem;
    text-align: center;
    position: relative;
    overflow: hidden;
}

.card-header-custom::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, var(--primary-color), var(--secondary-color), var(--primary-color));
}

.card-header-custom i {
    font-size: 2.5rem;
    margin-bottom: 1rem;
    color: rgba(255, 255, 255, 0.9);
}

.card-header-custom h5 {
    font-weight: 600;
    letter-spacing: 1px;
    margin: 0;
}

.form-group {
    margin-bottom: 1.5rem;
    position: relative;
}

.form-control {
    height: 50px;
    border-radius: 8px;
    padding-left: 15px;
    border: 1px solid #ddd;
    transition: all 0.3s;
}

.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 0.25rem rgba(106, 17, 203, 0.25);
}

label {
    font-weight: 500;
    margin-bottom: 0.5rem;
    color: #555;
}

.password-container {
    position: relative;
}

.password-toggle {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #777;
    z-index: 10;
}

.btn-register {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    border: none;
    border-radius: 8px;
    padding: 12px 0;
    font-weight: 600;
    letter-spacing: 1px;
    text-transform: uppercase;
    width: 100%;
    transition: all 0.3s;
    margin-top: 1rem;
}

.btn-register:hover {
    background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.alert {
    border-radius: 8px;
    margin: 1rem 0;
}

.password-hint {
    font-size: 0.8rem;
    color: #666;
    margin-top: 0.3rem;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .reg-container {
        padding: 1rem;
    }
    
    .card-header-custom {
        padding: 1rem;
    }
    
    .card-header-custom i {
        font-size: 2rem;
    }
}
</style>
</head>

<body>
    <%@include file="all_component/navbar.jsp"%>
    
    <div class="reg-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="card reg-card animate__animated animate__fadeIn">
                        <div class="card-header card-header-custom">
                            <i class="fas fa-user-plus"></i>
                            <h5>CREATE YOUR ACCOUNT</h5>
                        </div>
                        
                        <div class="card-body p-4 p-md-5">
                            <%
                                String regMsg = (String) session.getAttribute("reg-success");
                                if (regMsg != null) {
                            %>
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <%=regMsg%> For Login <a href="login.jsp" class="alert-link">Click here</a>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <%
                                session.removeAttribute("reg-success");
                                }
                            %>
                            
                            <%
                                String failedMsg = (String) session.getAttribute("failed-msg");
                                if (failedMsg != null) {
                            %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <%=failedMsg%>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <%
                                session.removeAttribute("failed-msg");
                            }
                            %>
                            
                            <form action="UserServlet" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputFirstName">First Name</label>
                                            <input type="text" class="form-control" id="exampleInputFirstName" 
                                                placeholder="Enter First Name" name="fname" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputLastName">Last Name</label>
                                            <input type="text" class="form-control" id="exampleInputLastName" 
                                                placeholder="Enter Last Name" name="lname" required>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail">Email Address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail" 
                                        placeholder="Enter Email" name="uemail" required>
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleInputNumber">Phone Number</label>
                                    <input type="tel" class="form-control" id="exampleInputNumber" 
                                        placeholder="Enter Phone Number" name="unumber" required>
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleInputPassword">Password</label>
                                    <div class="password-container">
                                        <input type="password" class="form-control" id="exampleInputPassword" 
                                            placeholder="Enter Password" name="upassword" required>
                                        <span class="password-toggle" id="togglePassword">
                                            <i class="far fa-eye"></i>
                                        </span>
                                    </div>
                                    <small class="password-hint">
                                        Must contain 1 uppercase, 1 lowercase, and 1 special character
                                    </small>
                                </div>
                                
                                <button type="submit" class="btn btn-primary btn-register">
                                    <i class="fas fa-user-plus me-2"></i>REGISTER NOW
                                </button>
                                
                                <div class="text-center mt-3">
                                    <p class="mb-0">Already have an account? <a href="login.jsp" class="text-decoration-none">Login here</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="all_component/footer.jsp"%>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Password toggle script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const togglePassword = document.querySelector('#togglePassword');
            const passwordInput = document.querySelector('#exampleInputPassword');
            
            togglePassword.addEventListener('click', function() {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                
                // Toggle eye icon
                this.innerHTML = type === 'password' ? '<i class="far fa-eye"></i>' : '<i class="far fa-eye-slash"></i>';
            });
        });
    </script>
</body>
</html>