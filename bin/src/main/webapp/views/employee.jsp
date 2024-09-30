<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home Page</title>
    <!-- Add Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <style>
      /* Additional styling for the page */
      .container {
        margin-top: 20px;
      }
      .hero-section {
        text-align: center;
        padding: 50px 20px;
        background-color: #f8f9fa;
        border-radius: 8px;
      }
      .hero-section h1 {
        margin-bottom: 20px;
      }
      .hero-section {
        text-align: center;
        padding: 50px 20px;
        background-color: #f8f9fa;
        border-radius: 8px;
      }
    </style>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
      <h1 class="navbar-brand" >Banking system</h1>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
          <!-- Dropdown Menu -->
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle shift-right"
              href="#"
              id="navbarDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"

            >
              Menu
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
               <a class="nav-link" href="/adminemployee/accountDetials">Account Detials</a>
               <a class="nav-link" href="/employee/Transctiondetialpage">Transction detial </a>
               <a class="nav-link" href="/adminemployee/tractionList"> Transction  </a>

            </div>
          </li>
        </ul>
      </div>

    <a href="/logout" class="btn btn-primary">logout</a>
    </nav>

    <div
      class="container d-flex justify-content-center align-items-center"
      style="height: 80vh"
    >
      <div class="hero-section">
        <h1>Welcome to Our Website</h1>
        <p>
          <b> At SecureBank,</b> we offer a range of financial products to suit
          your needs. Explore our Fixed Deposits for guaranteed returns with
          flexible terms, or enjoy the convenience of our Savings Accounts with
          attractive interest rates and easy access to your funds. With
          competitive rates, robust security, and excellent customer service,
          SecureBank is here to help you manage your finances effectively.
          Discover more and let us assist you in achieving your financial goals!
        </p>
      </div>
    </div>

    <!-- Add Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>