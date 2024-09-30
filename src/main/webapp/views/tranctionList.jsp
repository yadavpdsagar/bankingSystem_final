<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
        .container-fluid {
            padding: 0; /* Remove default padding */
        }
        .row {
            margin: 0; /* Remove margin between columns */
        }
        .table-primary th {
            background-color: #007bff; /* Match navbar color for header */
            color: white;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-custom">
        <div class="container-fluid">
            <h2 class="text-white">Transaction Details</h2>
        </div>
    </nav> 

    <div class="container-fluid" style="padding: 0rem">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3">
                <jsp:include page="employeeSuccess.jsp" />
            </div>

            <!-- Main Content -->
            <div class="col-md-9">
                <h2 class="text-center">Account Transaction List</h2>
                <table id="TransactionDetail" class="table table-bordered">
                    <thead class="table-primary">
                        <tr>
                            <th>Transaction ID</th>
                            <th>Name</th>
                            <th>Transaction Type</th>
                            <th>Account Number</th>
                            <th>Account Type</th>
                            <th>Transaction Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Data will be inserted here by JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- jQuery (necessary for DataTables) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function () {
            // Fetch data from the API
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
                            { title: "Transaction ID" },
                            { title: "Name" },
                            { title: "Transaction Type" },
                            { title: "Account Number" },
                            { title: "Account Type" },
                            { title: "Transaction Amount" }
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