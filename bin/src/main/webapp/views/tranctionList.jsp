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
        <h1>Traction Detials</h1>
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
              <a class="nav-link" href="/AccountRegistrationPage"> craete new traction</a>
            </li>

          </ul>
        </div>
      </div>
    </nav>




    <div class="container">
      <h2 class="text-center">Account Traction List</h2>
      <table id="TransactionDetail" class="table table-bordered"   >
        <thead class="table-primary" >
          <tr>
          <th>transactionId</th>
          <th>name</th>
            <th>Transaction Type</th>
             <th>accountNumber</th>
             <th>account type</th>
            <th>transaction Amount</th>
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
          url: "http://localhost:8080/adminemployee/tractionListget",
          method: "GET",
          success: function (data) {
            // Map user data to table rows
            var tableData = data.map(function (TransactionDetail) {
              return [
            	  
            	  TransactionDetail.transactionId,
            	  TransactionDetail.name,
            	  TransactionDetail.transactionType,
            	  TransactionDetail.accountDetail.accountNumber,
            	  TransactionDetail.accountDetail.accountType.accTyp,
            	  TransactionDetail.transactionAmount
              ];
            });

            // Initialize DataTable
            $("#TransactionDetail").DataTable({
              data: tableData,
              columns: [
                { title: "transactionId" },
                { title: "name" },
                { title: "Transaction Type" },
                { title: "accountNumber" },
                { title: "account type" },
                {title:"transaction Amount"}
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