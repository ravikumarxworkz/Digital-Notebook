<%@ page import="User.UserDetails" %>
<%
    UserDetails user = (UserDetails) session.getAttribute("userD");
    String navbarTheme = (user != null)
        ? "navbar navbar-expand-lg navbar-dark bg-primary shadow-sm"
        : "navbar navbar-expand-lg navbar-light bg-light shadow-sm";
%>

<!-- Bootstrap 5 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- FontAwesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<nav class="<%= navbarTheme %>">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="index.jsp"><i class="fas fa-book me-2"></i>ENotes</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-white fw-bold active" href="home.jsp"><i class="fas fa-home me-1"></i>Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white fw-bold active" href="addNotes.jsp"><i class="fas fa-plus me-1"></i>Add Notes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white fw-bold active" href="showNotes.jsp"><i class="fas fa-book-open me-1"></i>Show Notes</a>
                </li>
            </ul>

            <div class="d-flex">
                <% if (user != null) { %>
                    <button class="btn btn-light me-2" data-bs-toggle="modal" data-bs-target="#userModal">
                        <i class="fas fa-user-circle me-1"></i><%= user.getFirstNameString() %>
                    </button>
                    <a href="LogoutServlet" class="btn btn-outline-light">
                        <i class="fas fa-sign-out-alt me-1"></i>Logout
                    </a>
                <% } else { %>
                    <a href="login.jsp" class="btn btn-dark me-2">
                        <i class="fas fa-sign-in-alt me-1"></i>Login
                    </a>
                    <a href="register.jsp" class="btn btn-outline-dark">
                        <i class="fas fa-user-plus me-1"></i>Register
                    </a>
                <% } %>
            </div>
        </div>
    </div>
</nav>

<% if (user != null) { %>
<!-- User Info Modal -->
<div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="userModalLabel">User Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <th>User ID</th>
              <td><%= user.getId() %></td>
            </tr>
            <tr>
              <th>First Name</th>
              <td><%= user.getFirstNameString() %></td>
            </tr>
            <tr>
              <th>Last Name</th>
              <td><%= user.getLastNameString() %></td>
            </tr>
            <tr>
              <th>Email</th>
              <td><%= user.getEmailString() %></td>
            </tr>
            <tr>
              <th>Contact</th>
              <td><%= user.getPhoneString() %></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<% } %>

<!-- Bootstrap JS (v5) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
