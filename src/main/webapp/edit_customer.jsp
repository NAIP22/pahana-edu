<%--
  Created by IntelliJ IDEA.
  User: isuri
  Date: 7/19/2025
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.icbt.model.Customer" %>
<%
    Customer customer = (Customer) request.getAttribute("customer");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        form { max-width: 400px; }
        label { display: block; margin-top: 10px; }
        input[type="text"], input[type="email"] {
            width: 100%; padding: 8px; box-sizing: border-box;
        }
        input[type="submit"] {
            margin-top: 15px;
            background-color: #ffc107;
            color: black; border: none; padding: 10px 15px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h2>Edit Customer</h2>
<form action="customer?action=update" method="post">
    <input type="hidden" name="id" value="<%= customer.getId() %>" />

    <label>Name:</label>
    <input type="text" name="name" value="<%= customer.getName() %>" required />

    <label>Email:</label>
    <input type="email" name="email" value="<%= customer.getEmail() %>" required />

    <label>Phone:</label>
    <input type="text" name="phone" value="<%= customer.getPhone() %>" required />

    <label>Account Number:</label>
    <input type="text" name="accountNumber" value="<%= customer.getAccountNumber() %>" required />

    <input type="submit" value="Update Customer" />
</form>
</body>
</html>

