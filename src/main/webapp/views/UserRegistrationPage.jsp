<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <style>
        .registration-container {
            width: 400px;
            padding: 20px;
            border-radius: 10px;
            background-color: #f8f9fa;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        #message {
            margin-top: 20px;
            font-size: 16px;
        }
        .container-fluid {
            padding: 0; /* Remove default padding */
        }
    </style>
</head>

<body>
    <div class="container-fluid p-3 bg-primary text-white text-center">
        <h1>User Registration</h1>
    </div>

    <div class="container-fluid" style="padding: 0rem">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3">
                <jsp:include page="employeeSuccess.jsp" />
            </div>

            <!-- Main Content -->
            <div class="col-md-9 d-flex justify-content-center align-items-center vh-100">
                <div class="registration-container">
                    <h2 class="text-center mb-4">Enter Your Details</h2>

                    <form id="registrationForm">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control form-control-sm" id="userName" placeholder="Enter Username" name="userName" required />
                            <label for="userName">Username</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="email" class="form-control form-control-sm" id="email" placeholder="Enter Email" name="email" required />
                            <label for="email">Email</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="password" class="form-control form-control-sm" id="password" placeholder="Enter Password" name="password" required />
                            <label for="password">Password</label>
                        </div>

                        <div class="mb-3">
                            <label for="role" class="form-label">Role</label>
                            <select class="form-control form-control-sm" id="role" name="role" required>
                                <option value="ADMIN">Admin</option>
                                <option value="EMPLOYEE">Employee</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </form>

                    <div id="message"></div> <!-- Message display area -->
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("registrationForm").addEventListener("submit", function(e) {
            e.preventDefault(); // Prevent the default form submission

            const registrationData = {
                userName: document.getElementById("userName").value,
                email: document.getElementById("email").value,
                password: document.getElementById("password").value,
                role: document.getElementById("role").value
            };

            console.log("Sending data:", JSON.stringify(registrationData)); // Log the data being sent

            fetch('/admin/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(registrationData) // Send the JSON data
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
                document.getElementById("registrationForm").reset(); // Reset the form if needed
            
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
