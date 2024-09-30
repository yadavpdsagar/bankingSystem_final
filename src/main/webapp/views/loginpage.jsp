<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Login Page</title>
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
      <h1>Login to Get Access</h1>
    </div>

    <div class="d-flex justify-content-center align-items-center vh-100">
      <div class="login-container">
        <h2 class="text-center mb-4">Enter Your Details</h2>

        <form action="/#">
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
            <input
              type="password"
              class="form-control form-control-sm"
              id="pwd"
              placeholder="Enter password"
              name="pswd"
              required
            />
            <label for="pwd">Password</label>
          </div>

          <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
      </div>
    </div>

    <div class="align-items-center">
      <footer class="footer-custom p-2 bg-primary text-center">
        <h3>2024 Sagar Prasad Yadav</h3>
      </footer>
    </div>
  </body>
</html>