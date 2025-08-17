<%@ page import="com.icbt.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Customer</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #eef2f3, #ffffff);
            margin: 0;
            padding: 40px 0;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        label {
            font-weight: 600;
            color: #444;
        }

        input[type="text"] {
            padding: 10px 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #007bff;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 18px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: background-color 0.3s, transform 0.2s;
        }

        button i {
            font-size: 14px;
        }

        button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .result, .not-found {
            margin-top: 30px;
            padding: 20px;
            border-radius: 12px;
            animation: fadeIn 0.6s ease-in-out;
        }

        .result {
            background-color: #f6f8fa;
            border-left: 5px solid #007bff;
        }

        .result h3 {
            margin-top: 0;
            color: #2c3e50;
        }

        .not-found {
            background-color: #fdecea;
            color: #c0392b;
            font-weight: 600;
            text-align: center;
        }

        .back {
            margin-top: 25px;
            text-align: center;
        }

        .back a {
            color: #007bff;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: transform 0.2s;
        }

        .back a:hover {
            text-decoration: underline;
            transform: translateY(-2px);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .detail p {
            margin: 6px 0;
            font-size: 15px;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <h2><i class="fas fa-search"></i> Search Customer by Account Number</h2>

    <form action="customer" method="get">
        <input type="hidden" name="action" value="searched">
        <label for="accountNumber">Account Number:</label>
        <input type="text" id="accountNumber" name="accountNumber" required/>
        <button type="submit"><i class="fas fa-magnifying-glass"></i> Search</button>
    </form>

    <% Customer customer = (Customer) request.getAttribute("customer");
        if (customer != null) { %>
    <div class="result">
        <h3><i class="fas fa-user"></i> Customer Details</h3>
        <div class="detail">
            <p><strong>ID:</strong> <%= customer.getId() %></p>
            <p><strong>Name:</strong> <%= customer.getName() %></p>
            <p><strong>Address:</strong> <%= customer.getAddress() %></p>
            <p><strong>Phone:</strong> <%= customer.getTelephone() %></p>
        </div>
    </div>
    <% } else if (request.getAttribute("notFound") != null) { %>
    <div class="not-found"><i class="fas fa-exclamation-circle"></i> Customer not found.</div>
    <% } %>

    <div class="back">
        <a href="dashboard"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>
</div>
</body>
</html>
