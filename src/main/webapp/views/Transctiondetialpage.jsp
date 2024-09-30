<%@page import="ch.qos.logback.core.model.ImportModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Transaction Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <style>
        .container {
            width: 400px;
            padding: 20px;
            border-radius: 10px;
            background-color: #f8f9fa;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        #message {
            margin-top: 20px;
            font-size: 16px;
            text-align: center; /* Center the text inside the message div */
        }
        .container-fluid {
            padding: 0; /* Remove default padding */
        }
    </style>
</head>

<body>
    <div class="container-fluid p-3 bg-primary text-white text-center">
        <h1>Account Transaction</h1>
    </div>

    <div class="container-fluid" style="padding: 0rem">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3">
                <jsp:include page="employeeSuccess.jsp" />
            </div>

            <!-- Main Content -->
            <div class="col-md-9 d-flex justify-content-center align-items-center vh-100">
                <div class="container">
                    <h2 class="text-center mb-4">Enter Your Details</h2>

                    <form id="transactionForm">
                        <div id="message"></div> <!-- Message display area -->
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control form-control-sm" id="name" placeholder="Enter Depositor Name" name="name" required />
                            <label for="name">Depositor Name</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="text" class="form-control form-control-sm" id="accountNumber" placeholder="Enter Account Number" name="accountNumber" required />
                            <label for="accountNumber">Account Number</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="number" class="form-control form-control-sm" id="transactionAmount" placeholder="Enter Amount" name="transactionAmount" required />
                            <label for="transactionAmount">Amount</label>
                        </div>

                        <div class="mb-3">
                            <label for="transactionType" class="form-label">Transaction Type</label>
                            <select class="form-control form-control-sm" id="transactionType" name="transactionType" required>
                                <option value="WITHDRAWAL">Withdraw</option>
                                <option value="DEPOSIT">Deposit</option>
                            </select>
                        </div>

                        <button type="submit" id="submitButton" class="btn btn-primary w-100">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("transactionForm").addEventListener("submit", function(e) {
            e.preventDefault(); // Prevent the default form submission

            const transactionData = {
                name: document.getElementById("name").value,
                transactionType: document.getElementById("transactionType").value,
                transactionAmount: parseFloat(document.getElementById("transactionAmount").value),
                accountDetail: {
                    accountNumber: document.getElementById("accountNumber").value
                }
            };

            fetch('/employee/process', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(transactionData) // Send the JSON data
            })
            .then(response => {
                if (!response.ok) {
                    return response.text().then(text => { throw new Error(text); });
                }
                return response.text(); // Assuming the backend sends a success message
            })
            .then(message => {
                displayMessage(message, "green"); // Display success message
                document.getElementById("transactionForm").reset(); // Reset the form if needed
            })
            .catch(error => {
                displayMessage("Error: " + error.message, "red"); // Display error message
            });

            function displayMessage(msg, color) {
                const messageDiv = document.getElementById("message");
                messageDiv.innerText = msg; // Set the message
                messageDiv.style.color = color; // Set message color

                // Hide message after 3 seconds
                setTimeout(() => {
                    messageDiv.innerText = ""; // Clear the message
                }, 3000); // 3 seconds
            }
        });
    </script>

</body>
</html>
