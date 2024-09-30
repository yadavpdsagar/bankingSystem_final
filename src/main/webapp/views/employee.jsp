<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.GrantedAuthority"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.bank.demo.Model.UserDetail" %>
     
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home Page</title>
    <!-- Add Bootstrap CSS -->
      <!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
      /* Additional styling for the page */
      .container {
        margin-top: 20px;
      }
      .hero-section {
        text-align: center;
        padding: 50px 20px;
        background-color: #f8f9fa;
        border-radius: 8px;
      }
      .hero-section h1 {
        margin-bottom: 20px;
      }
      .hero-section {
        text-align: center;
        padding: 50px 20px;
        background-color: #f8f9fa;
        border-radius: 8px;
      }
    </style>
  </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <div class="container-fluid">
        <h1 class="navbar-brand text-white">Banking System</h1>
        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <!-- Dropdown Menu -->
                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle text-white"
                        href="#"
                        id="navbarDropdown"
                        role="button"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                    >
                        Menu
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/adminemployee/accountDetials">Account Details</a></li>
                        <li><a class="dropdown-item" href="/employee/Transctiondetialpage">Transaction Details</a></li>
                        <li><a class="dropdown-item" href="/adminemployee/tractionList">Transaction List</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="d-flex align-items-center">
        
        <!-- role send  -->
            <div class="me-3">
                <div class="container bg-light p-3 rounded shadow-sm">
                    <% UserDetails user = (UserDetails) request.getAttribute("user"); %>
                    <% if (user != null) { %>
                       
                        <p class="mb-0">Username: <strong><%= user.getUsername() %></strong></p>
                        <p class="mb-0">Roles:
                            <span class="badge bg-secondary">
                                <% for (GrantedAuthority authority : user.getAuthorities()) { %>
                                    <%= authority.getAuthority() %> <br/>
                                <% } %>
                            </span>
                        </p>
                    <% } else { %>
                        <p class="text-danger">User not found. Please log in.</p>
                    <% } %>
                </div>
            </div>
            <a href="/logout" class="btn btn-outline-light">Logout</a>
        </div>
    </div>
   
</nav>


    <div
      class="container d-flex justify-content-center align-items-center"
      style="height: 80vh"
    >
      <div class="hero-section">
        <h1>Welcome to Our Website</h1>
        <p>
          <b> At SecureBank,</b> we offer a range of financial products to suit
          your needs. Explore our Fixed Deposits for guaranteed returns with
          flexible terms, or enjoy the convenience of our Savings Accounts with
          attractive interest rates and easy access to your funds. With
          competitive rates, robust security, and excellent customer service,
          SecureBank is here to help you manage your finances effectively.
          Discover more and let us assist you in achieving your financial goals!
        </p>
      </div>
    </div>

    <!-- Add Bootstrap JS and dependencies -->

<!-- Bootstrap Bundle with Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>