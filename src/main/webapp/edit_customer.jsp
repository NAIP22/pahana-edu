<%@ page import="com.icbt.model.Customer" %>
<%@ page session="true" %>
<%
    Customer customer = (Customer) request.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("list_customer.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f0f2f5, #ffffff);
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

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
            color: #444;
        }

        input[type="text"], input[type="tel"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #ccc;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="tel"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: transform 0.2s ease, opacity 0.2s ease;
        }

        .btn i {
            font-size: 14px;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .back-link {
            margin-top: 20px;
            text-align: center;
        }

        .back-link a {
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
            transition: transform 0.2s ease;
        }

        .back-link a:hover {
            text-decoration: underline;
            transform: translateY(-2px);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<div class="container">
    <h2><i class="fas fa-user-edit"></i> Edit Customer</h2>
    <form action="customer?action=update" method="post">
        <input type="hidden" name="accountNumber" value="<%= customer.getAccountNumber() %>" />

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= customer.getName() %>" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= customer.getAddress() %>" required>

        <label for="telephone">Telephone:</label>
        <input type="tel" id="telephone" name="telephone" value="<%= customer.getTelephone() %>" required>

        <div style="text-align:center; margin-top:10px;">
            <button type="submit" class="btn"><i class="fas fa-save"></i> Update Customer</button>
        </div>
    </form>

    <div class="back-link">
        <a href="customer"><i class="fas fa-arrow-left"></i> Back to Customer List</a>
    </div>
</div>
</body>
</html>
