<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <%@ include file="all_component/allcss.jsp" %>
    
    <style>
        :root {
            --primary-color: #2575fc;
            --secondary-color: #6a11cb;
            --light-color: #f8f9fa;
            --dark-color: #212529;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .login-container {
            display: flex;
            align-items: center;
            justify-content: center;
            flex: 1;
            padding: 2rem;
        }

        .login-card {
            width: 100%;
            max-width: 450px;
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }

        .login-card:hover {
            transform: translateY(-5px);
        }

        .card-header {
            background: linear-gradient(to right, var(--secondary-color), var(--primary-color));
            color: white;
            text-align: center;
            padding: 1.5rem;
            border-bottom: none;
        }

        .card-header h4 {
            margin: 0;
            font-weight: 600;
        }

        .card-body {
            padding: 2rem;
            background-color: white;
        }

        .form-floating label {
            color: #6c757d;
            font-weight: 500;
        }

        .form-control {
            height: 50px;
            border-radius: 8px;
            border: 1px solid #ced4da;
            padding-left: 15px;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(37, 117, 252, 0.25);
        }

        .password-input-group {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #6c757d;
            cursor: pointer;
            z-index: 5;
        }

        .btn-login {
            background: linear-gradient(to right, var(--secondary-color), var(--primary-color));
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            transition: all 0.3s;
        }

        .btn-login:hover {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .alert {
            border-radius: 8px;
            margin-bottom: 1.5rem;
        }

        .footer {
            background-color: rgba(0, 0, 0, 0.1);
            color: white;
            text-align: center;
            padding: 1rem;
            margin-top: auto;
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .login-container {
                padding: 1rem;
            }
            
            .card-body {
                padding: 1.5rem;
            }
        }
    </style>
</head>

<body>
    <%@ include file="all_component/navbar.jsp" %>

    <div class="login-container">
        <div class="login-card">
            <div class="card-header">
                <i class="fas fa-user-circle me-2"></i>
                <h4>Login to Your Account</h4>
            </div>

            <!-- Error and success messages -->
            <%
                String invalidMsg = (String) session.getAttribute("login-failed");
                if (invalidMsg != null) {
            %>
            <div class="alert alert-danger alert-dismissible fade show mx-3 mt-3" role="alert">
                <%= invalidMsg %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% session.removeAttribute("login-failed"); } %>

            <%
                String withoutLogin = (String) session.getAttribute("login-error");
                if (withoutLogin != null) {
            %>
            <div class="alert alert-danger alert-dismissible fade show mx-3 mt-3" role="alert">
                <%= withoutLogin %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% session.removeAttribute("login-error"); } %>

            <%
                String lgMsg = (String) session.getAttribute("logOutMsg");
                if (lgMsg != null) {
            %>
            <div class="alert alert-success alert-dismissible fade show mx-3 mt-3" role="alert">
                <%= lgMsg %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% session.removeAttribute("logOutMsg"); } %>

            <div class="card-body">
                <form action="loginServlet" method="post">
                    <div class="form-floating mb-4">
                        <input type="email" class="form-control" id="emailInput" name="uemail" placeholder="name@example.com" required>
                        <label for="emailInput">Email address</label>
                    </div>

                    <div class="form-floating mb-4 password-input-group">
                        <input type="password" class="form-control" id="passwordInput" name="upassword" placeholder="Password" required>
                        <label for="passwordInput">Password</label>
                        <button type="button" class="password-toggle" id="togglePassword">
                            <i class="far fa-eye"></i>
                        </button>
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary btn-login">
                            <i class="fas fa-sign-in-alt me-2"></i>Login
                        </button>
                    </div>

                    <div class="text-center mt-3">
                        <a href="#" class="text-decoration-none">Forgot password?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="all_component/footer.jsp" %>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS for password toggle -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const togglePassword = document.querySelector('#togglePassword');
            const passwordInput = document.querySelector('#passwordInput');
            
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