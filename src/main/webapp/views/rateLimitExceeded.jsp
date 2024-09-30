<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rate Limit Exceeded</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            color: #212529;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin-top: 100px;
        }
        .alert {
            border-radius: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="alert alert-danger text-center">
            <h4 class="alert-heading">Rate Limit Exceeded</h4>
            <p>You have exceeded the number of allowed requests. Please try again later.</p>
        </div>
    </div>
    <!-- Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-GLhlTn6jB0cHBK5fJLRV5A5O6Gz0mB+Ff1v9Lw2Q9dE5F6k7l+L1aTwkqf2i+0w" crossorigin="anonymous"></script>
</body>
</html>
