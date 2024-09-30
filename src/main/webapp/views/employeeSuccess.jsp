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
    <title>Landing Second Page</title>
    <!-- Bootstrap 5.3.3 CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
      rel="stylesheet"
    />
    <style>
      body {
        background-color: #f8f9fa; /* Light background for contrast */
      }
      #wrapper {
        height: 100vh; /* Full height */
        overflow: hidden; /* Prevent overflow */
        display: flex; /* Use flexbox for layout */
      }
      #sidebar-wrapper {
        min-width: 250px; /* Minimum width for the sidebar */
        background-color: #007bff; /* Sidebar color */
        display: flex;
        flex-direction: column; /* Stack sidebar items vertically */
        justify-content: space-between; /* Space items */
      }
      .sidebar-heading {
        font-size: 1.5rem; /* Adjust heading size */
        text-align: center; /* Center align heading */
      }
      .sidebar-divider {
        border-bottom: 1px solid rgba(255, 255, 255, 0.5); /* White separator line */
        margin: 1rem 0; /* Margin for spacing */
      }
      .list-group-item {
        transition: background-color 0.3s; /* Smooth transition */
      }
      .list-group-item:hover {
        background-color: rgba(255, 255, 255, 0.1); /* Change color on hover */
      }
      .btn-link {
        text-decoration: none; /* Remove underline from button links */
        color: #ffffff; /* Button link color */
      }
      .btn-link:hover {
        color: #f8f9fa; /* Change text color on hover */
      }
      .badge {
        font-size: 0.9rem; /* Slightly smaller badge font */
      }
      .container-fluid {
        padding: 1rem; /* Padding for container */
      }
    </style>
</head>
<body>
    <div id="wrapper">
      <!-- Sidebar -->
      <div class="bg-primary text-white" id="sidebar-wrapper">
        <div class="sidebar-heading py-4">
          <i class="fas fa-laugh-wink"></i> Banking Dashboard
        </div>

        <div class="list-group list-group-flush">
          <button
            class="btn btn-link"
            data-bs-toggle="collapse"
            data-bs-target="#tablesCollapse"
            aria-expanded="false"
            aria-controls="tablesCollapse"
          >
            <i class="fas fa-table"></i> Tables
          </button>
          <div class="collapse" id="tablesCollapse">
            <a href="/admin/userlistpage" class="list-group-item list-group-item-action bg-light" id="UserTableLink">User Table</a>
            <a href="/adminemployee/accountDetials" class="list-group-item list-group-item-action bg-light">Account Detail Table</a>
            <a href="/adminemployee/tractionList" class="list-group-item list-group-item-action bg-light">Transaction Table</a>
            <a href="/admin/Ledgerpage" class="list-group-item list-group-item-action bg-light" id="LedgertableLink">Ledger Table</a>
          </div>
          <div class="sidebar-divider"></div>
          <button
            class="btn btn-link"
            data-bs-toggle="collapse"
            data-bs-target="#pagesCollapse"
            aria-expanded="false"
            aria-controls="pagesCollapse"
          >
            <i class="fas fa-folder"></i> Pages
          </button>
          <div class="collapse" id="pagesCollapse">
            <a href="/admin/UserRegistrationPage" class="list-group-item list-group-item-action bg-light"  id="userFormLink">User Form</a>
            <a href="/admin/AccountRegistrationPage" class="list-group-item list-group-item-action bg-light" id="accountFormLink">Account Registration Form</a>
            <a href="/employee/Transctiondetialpage" class="list-group-item list-group-item-action bg-light"  id="transactionFormLink">Create Transaction</a>
          </div>
        </div>

        <div class="container-fluid mt-auto"> <!-- Move user info to the bottom -->
          <div class="d-flex align-items-center justify-content-between">
            <% UserDetails user = (UserDetails) session.getAttribute("user"); %>
            <div class="outline-light">
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
            <a href="/logout" class="btn btn-outline-light">Logout</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <script>
      const userRole = '<% if (user != null && !user.getAuthorities().isEmpty()) { %><%= user.getAuthorities().iterator().next().getAuthority() %><% } else { %>""<% } %>';
      // Hide/show links based on user role
      if (userRole === "EMPLOYEE") {
        document.getElementById("accountFormLink").style.display = "none";
        document.getElementById("userFormLink").style.display = "none";
        document.getElementById("LedgertableLink").style.display = "none";
        document.getElementById("UserTableLink").style.display = "none";
      } else if (userRole === "ADMIN") {
        document.getElementById("transactionFormLink").style.display = "none";
      }
    </script>
</body>
</html>
