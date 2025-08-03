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
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef2f3;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 80px auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }

        input[type="text"],
        input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 15px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .back-link {
            margin-top: 15px;
            display: block;
            text-align: center;
        }

        .back-link a {
            color: #555;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Edit Customer</h2>
    <form action="customer?action=update" method="post">
        <input type="hidden" name="accountNumber" value="<%= customer.getAccountNumber() %>" />

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= customer.getName() %>" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= customer.getAddress() %>" required>

        <label for="telephone">Telephone:</label>
        <input type="tel" id="telephone" name="telephone" value="<%= customer.getTelephone() %>" required>

        <button type="submit" class="btn">Update Customer</button>
    </form>

    <div class="back-link">
        <a href="customer">Back to Customer List</a>
    </div>
</div>
</body>
</html>
