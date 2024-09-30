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
    </style>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
      <h1 class="navbar-brand">Banking System</h1>
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
        <!-- Button to trigger the modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#comingSoonModal">
          Upcoming Feature
        </button>
      </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="comingSoonModal" tabindex="-1" aria-labelledby="comingSoonModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="comingSoonModalLabel">Feature Coming Soon</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            We are excited to bring you new features soon. Stay tuned for updates!
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Add Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
  </body>
</html>
