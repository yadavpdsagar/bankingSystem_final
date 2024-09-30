<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Account Transaction Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
   <style>
      .-container {
        width: 400px;
        padding: 20px;
        border-radius: 10px;
        background-color: #f8f9fa;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
      }
    </style>
</head>

 <body>
    <div class="container-fluid p-3 bg-primary text-white text-center">
      <h1>Create Account</h1>
    </div>

    <div class="d-flex justify-content-center align-items-center vh-100">
      <div class="-container">
        <h2 class="text-center mb-4">Enter Your Details</h2>

        <form action="/employee/process"  method="post" modelAttribute="transactionReq">
        <div class="form-floating mb-3">
                    <input
                      type="text"
                      class="form-control form-control-sm"
                      id="name"
                      placeholder=" Enter Depositor Name "
                      name="name"
                      required
                    />
                    <label for="name">Depositor Name </label>
                  </div>
          <div class="form-floating mb-3">
            <input
              type="text"
              class="form-control form-control-sm"
              id="accountNumber"
              placeholder=" Enter Account number"
              name="accountDetail.accountNumber"
              required
            />
            <label for="accountNumber">Account number</label>
          </div>
          <div class="form-floating mb-3">
            <input
              type="number"
              class="form-control form-control-sm"
              id="transactionAmount"
              placeholder="Enter Amount"
              name="transactionAmount"
              required
            />
            <label for="transactionAmount">Amount</label>
          </div>

          <div class="mb-3">
            <label class="form-label">Account type</label>
            <div class="form-check">
              <input
                class="form-check-input"
                type="radio"
                name="Accounttype"
                id="fixDeposit"
                value="FD"
                required
              />
              <label class="form-check-label" for="fixDeposit">
                Fixed Deposit
              </label>
            </div>
            <div class="form-check">
              <input
                class="form-check-input"
                type="radio"
                name="Accounttype"
                id="saving"
                value="SA"
                required
              />
              <label class="form-check-label" for="saving">
                Savings Account
              </label>
            </div>
          </div>

          <div class="mb-3">
            <label for="transactionType" class="form-label"
              >Transaction type</label
            >
            <select
              class="form-control form-control-sm"
              id="transactionType"
              name="transactionType"
              required>
              <option value="WITHDRAWAL">Withdraw</option>
              <option value="DEPOSIT">Deposit</option>
            </select>
          </div>

         
          <button type="submit" id="submitButton" class="btn btn-primary w-100">Submit</button>
     
        </form>
      </div>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const fixDepositRadio = document.getElementById("fixDeposit");
        const savingRadio = document.getElementById("saving");
        const transactionTypeSelect =
          document.getElementById("transactionType");

        fixDepositRadio.addEventListener("change", function () {
          if (fixDepositRadio.checked) {
            // Disable Withdraw option when Fixed Deposit is selected
            transactionTypeSelect.querySelector(
              'option[value="WITHDRAWAL"]'
            ).disabled = true;
            transactionTypeSelect.value = "DEPOSIT"; // Set to Deposit by default
          }
        });

        savingRadio.addEventListener("change", function () {
          // Enable Withdraw option when Savings Account is selected
          transactionTypeSelect.querySelector(
            'option[value="WITHDRAWAL"]'
          ).disabled = false;
        });
      });
        // for summition 
      document.addEventListener("DOMContentLoaded", function () {
          const form = document.getElementById("transactionForm");
          const submitButton = document.getElementById("submitButton");

          form.addEventListener("submit", function () {
            submitButton.disabled = true;
    </script>
  </body>
</html>


