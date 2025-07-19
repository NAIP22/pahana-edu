<%--
  Created by IntelliJ IDEA.
  User: isuri
  Date: 7/19/2025
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        form { max-width: 400px; }
        label { display: block; margin-top: 10px; }
        input[type="text"], input[type="email"] {
            width: 100%; padding: 8px; box-sizing: border-box;
        }
        input[type="submit"] {
            margin-top: 15px;
            background-color: #28a745;
            color: white; border: none; padding: 10px 15px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h2>Add New Customer</h2>
<form action="customer?action=add" method="post">
    <label>Name:</label>
    <input type="text" name="name" required />

    <label>Email:</label>
    <input type="email" name="email" required />

    <label>Phone:</label>
    <input type="text" name="phone" required />

    <label>Account Number:</label>
    <input type="text" name="accountNumber" required />

    <input type="submit" value="Add Customer" />
</form>
</body>
</html>

