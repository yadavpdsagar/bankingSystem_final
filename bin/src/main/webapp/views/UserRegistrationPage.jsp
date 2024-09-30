<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>UserRegistrationPage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

 
</head>
  <style>
    .login-container {
      width: 400px;
      padding: 20px;
      border-radius: 10px;
      background-color: #f8f9fa; /* Light background for form */
      box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); /* Subtle shadow */
    }
  </style>
 
  <body>
    <div class="container-fluid p-3 bg-primary text-white text-center">
      <h1>Register user</h1>
      
    </div>

    <div  id="myForm" class="d-flex justify-content-center align-items-center vh-100">
      <div class="login-container">
        <h2 class="text-center mb-4">Enter Your Details</h2>

        <form id="contactForm" action="/admin/register" method="post" modelAttribute="reqRes"  )"  >
          <div class="form-floating mb-3">
            <input
              type="text"
              class="form-control form-control-sm"
              id="name"
              placeholder="Enter Name"
              name="userName"
              required
            />
            <label for="email">Name</label>
          </div>

          <div class="form-floating mb-3">
            <input
              type="email"
              class="form-control form-control-sm"
              id="email"
              placeholder="Enter email"
              name="email"
              required
            />
            <label for="email">Email</label>
          </div>
          <div class="form-floating mb-3">
            <select
              class="form-control form-control-sm"
              id="role"
              name="role"
              required
            >
              <option value="ADMIN">Admin</option>
              <option value="EMPLOYEE">User</option>
            </select>
            <label for="role">User type</label>
          </div>

          <div class="form-floating mb-3">
            <input
              type="password"
              class="form-control form-control-sm"
              id="pwd"
              placeholder="Enter password"
              name="Password"
              required
            />
            <label for="Password">Password</label>
          </div>

          <button type="submit" class="btn btn-primary w-100">Summit</button>
        </form>
      </div>
    </div>
    
    <!-- Modal -->
     <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Success</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Your data has been successfully submitted!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
       
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" ></script>
    
     <script>
        function handleSubmit(event) {
            event.preventDefault(); // Prevent the form from submitting normally

            // Your form submission logic here
            // For demonstration, we'll just log a message
            console.log('Form submitted');
            // Show the success modal
            var successModal = new bootstrap.Modal(document.getElementById('successModal'));
            successModal.show();
            // Clear the form fields
            document.getElementById('contactForm').reset();
        }
    </script>
 

  </body>
</html>



