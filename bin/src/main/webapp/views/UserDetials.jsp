<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>DataTable Example with User API</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      
    />
    <!-- DataTables CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css"
    />
    <style>
      .container {
        margin-top: 20px;
      }
      table.dataTable thead th,
      table.dataTable tfoot th {
        text-align: center;
      }
      
       .navbar-custom {
        background-color: #007bff; /* Primary blue color */
      }

      .navbar-nav .nav-link {
        color: #fff !important; /* Ensure links are white */
        padding: 10px 15px; /* Add padding for better spacing */
        font-weight: 500; /* Slightly bolder text */
      }

      .navbar-nav .nav-link:hover {
        background-color: #0056b3; /* Darken on hover */
        border-radius: 5px; /* Rounded corners on hover */
      }
    </style>
  </head>
  <body>
     <nav class="navbar navbar-expand-sm navbar-custom">
      <div class="container-fluid">
        <h1>User Detial</h1>
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
            <li class="nav-item">
        <a class="nav-link"  href="/admin/UserRegistrationPage"> create new User</a>
        
            </li>
          
          </ul>
        </div>
      </div>
    </nav>
    
    <div class="container">
      <h2 class="text-center">User List</h2>
      <table id="userdetial" class="table table-bordered"   >
        <thead class="table-primary" >
          <tr>
            <th>User ID</th>
            <th>User Name</th>
            <th>Email</th>
            <th>Role</th>
          </tr>
        </thead>
        <tbody>
          <!-- Data will be inserted here by JavaScript -->
        </tbody>
      </table>
    </div>

    <!-- jQuery (necessary for DataTables) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
   
    ></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script>
      $(document).ready(function () {
        // Fetch data from JSONPlaceholder API
        $.ajax({
          url: "http://localhost:8080/admin/userdetials",
          method: "GET",
          success: function (data) {
            // Map user data to table rows
            var tableData = data.map(function (UserDetail) {
              return [
            	  UserDetail.userId, // User ID
            	  UserDetail.username, // User Name
            	  UserDetail.email, // Email
            	  UserDetail.role, // Role (JSONPlaceholder does not have a role field)
              ];
            });

            // Initialize DataTable
            $("#userdetial").DataTable({
              data: tableData,
              columns: [
                { title: "user Id" },
                { title: "User Name" },
                { title: "Email" },
                { title: "Role" },
              ],
            });
          },
          error: function (xhr, status, error) {
            console.error("AJAX request failed:", status, error);
          },
        });
      });
    </script>
  </body>
</html>