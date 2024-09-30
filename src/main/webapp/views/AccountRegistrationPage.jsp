<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-container {
            width: 400px;
            padding: 20px;
            border-radius: 10px;
            background-color: #f8f9fa;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .container-fluid {
            padding: 0; /* Remove default padding */
        }
    </style>
</head>
<body>
    <div class="container-fluid p-3 bg-primary text-white text-center">
        <h1>Create Account</h1>
    </div>

    <div class="container-fluid" style="padding: 0rem">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3">
                <jsp:include page="employeeSuccess.jsp" />
            </div>

            <!-- Main Content -->
            <div class="col-md-9 d-flex justify-content-center align-items-center vh-100">
                <div class="login-container">
                    <h2 class="text-center mb-4">Enter Your Details</h2>
                    <form id="accountForm">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" required />
                            <label for="name">Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="address" placeholder="Enter Address" name="address" required />
                            <label for="address">Address</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-control" id="accountType" required>
                                <option value="125">Fixed Deposit</option>
                                <option value="225">Saving</option>
                            </select>
                            <label for="accountType">Account Type</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="balance" placeholder="Enter Opening Balance" name="balance" required />
                            <label for="balance">Opening Balance</label>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Submit</button>
                    </form>
                    <div id="message" style="margin-top: 20px;"></div> <!-- Message display area -->
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("accountForm").addEventListener("submit", function(e) {
            e.preventDefault(); // Prevent default form submission

            const accountData = {
                name: document.getElementById("name").value,
                address: document.getElementById("address").value,
                balance: parseFloat(document.getElementById("balance").value),
                accountType: {
                    accTypId: document.getElementById("accountType").value
                }
            };

            fetch('/admin/createacc', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(accountData) // Send the JSON data
            })
            .then(response => {
                if (!response.ok) {
                    return response.text().then(text => { throw new Error(text); });
                }
                return response.text(); // Assuming the backend sends a success message
            })
            .then(message => {
                document.getElementById("message").innerText = message; // Display success message
                document.getElementById("message").style.color = "green"; // Success color
                document.getElementById("accountForm").reset(); // Reset the form
                
                setTimeout(() => {
                    document.getElementById("message").innerText = ""; // Clear the message
                }, 3000);
            })
            .catch(error => {
                document.getElementById("message").innerText = "Error: " + error.message; // Display error message
                document.getElementById("message").style.color = "red"; // Error color
                
                setTimeout(() => {
                    document.getElementById("message").innerText = ""; // Clear the message
                }, 3000);
            });
        });
    </script>
</body>
</html>
