<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Account List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<style>
      .login-container {
        width: 400px;
        padding: 20px;
        border-radius: 10px;
        background-color: #f8f9fa;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
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
 <body>
    <nav class="navbar navbar-expand-sm navbar-custom">
      <div class="container-fluid">
        <h1>Account Detials</h1>
      </div>
    </nav>




    <div class="container">
      <h2 class="text-center">Account List</h2>
      <table id="AccountDetail" class="table table-bordered"   >
        <thead class="table-primary" >
          <tr>
            <th>accountNumber</th>
            <th>address</th>
            <th>name</th>
            <th>balance</th>
            <th>accTyp</th>
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
          url: "http://localhost:8080/adminemployee/accountdetialslist",
          method: "GET",
          success: function (data) {
            // Map user data to table rows
            var tableData = data.map(function (AccountDetail) {
              return [
            	  AccountDetail.accountNumber,
            	  AccountDetail.address,
            	  AccountDetail.name,
            	  AccountDetail.balance,
            	  AccountDetail.accountType.accTyp,
              ];
            });

            // Initialize DataTable
            $("#AccountDetail").DataTable({
              data: tableData,
              columns: [
                { title: "accountNumber" },
                { title: "address" },
                { title: "name" },
                { title: "balance" },
                {title:"accTyp"}
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