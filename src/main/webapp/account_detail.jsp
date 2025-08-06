<%@ page import="com.icbt.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Customer</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f6fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            outline: none;
            transition: border 0.3s;
        }

        input[type="text"]:focus {
            border-color: #007bff;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .result {
            margin-top: 30px;
            padding: 15px;
            background-color: #f1f1f1;
            border-left: 5px solid #007bff;
            border-radius: 5px;
        }

        .not-found {
            margin-top: 20px;
            color: #dc3545;
            font-weight: bold;
            text-align: center;
        }

        .back {
            margin-top: 20px;
            text-align: center;
        }

        .back a {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }

        .back a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>🔍 Search Customer by Account Number</h2>

    <form action="customer" method="get">
        <label for="accountNumber">Account Number:</label>
        <input type="hidden" name="action" value="searched">
        <input type="text" id="accountNumber" name="accountNumber" required/>
        <button type="submit">Search</button>
    </form>

    <% Customer customer = (Customer) request.getAttribute("customer");
        if (customer != null) { %>
    <div class="result">
        <h3>👤 Customer Details</h3>
        <p><strong>ID:</strong> <%= customer.getId() %></p>
        <p><strong>Name:</strong> <%= customer.getName() %></p>
        <p><strong>Address:</strong> <%= customer.getAddress() %></p>
        <p><strong>Phone:</strong> <%= customer.getTelephone() %></p>
    </div>
    <% } else if (request.getAttribute("notFound") != null) { %>
    <div class="not-found">❌ Customer not found.</div>
    <% } %>

    <div class="back">
        <a href="dashboard">← Back to Dashboard</a>
    </div>
</div>
</body>
</html>
