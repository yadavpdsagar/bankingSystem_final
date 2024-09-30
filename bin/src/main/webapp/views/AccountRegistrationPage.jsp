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
      <div class="container-fluid p-3 bg-primary text-white text-center">
         <h1>Create Account</h1>
       </div>

       <div class="d-flex justify-content-center align-items-center vh-100">
         <div class="-container">
           <h2 class="text-center mb-4">Enter Your Details</h2>

           <form action="/admin/createacc" method="post" modelAttribute="accountReq"   >
             <div class="form-floating mb-3">
               <input
                 type="text"
                 class="form-control form-control-sm"
                 id="name"
                 placeholder="Enter Name"
                 name="name"
                 required
               />
               <label for="email">Name</label>
             </div>
             <div class="form-floating mb-3">
               <input
                 type="text"
                 class="form-control form-control-sm"
                 id="address"
                 placeholder="Enter Address"
                 name="address"
                 required
               />
               <label for="Address">Address</label>
             </div>

             <div class="form-floating mb-3">
               <select
                 class="form-control form-control-sm"
                 id="accountType"
                 name="accountType.accTypId"
                 required
               >
                 <option value="125">Fixed Deposit</option>
                 <option value="225">saving</option>
               </select>
               <label for="accountType">Account type</label>
             </div>
               <div class="form-floating mb-3">
                         <input
                           type="number"
                           class="form-control form-control-sm"
                           id="balance"
                           placeholder="Enter opening Balance"
                           name="balance"
                           required
                         />
                         <label for="balance">opening Balance</label>
                       </div>

             <button type="submit" class="btn btn-primary w-100">submit</button>
           </form>
         </div>
       </div>
  </body>
</html>
