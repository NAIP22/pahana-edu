<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
    <style>
        <%@ include file="styles.jsp" %>
    </style>
</head>
<body>
<div class="container">
    <h2>Add New Customer</h2>
    <form action="customer?action=add" method="post">
        <label for="accountNumber">Account Number:</label>
        <input type="text" id="accountNumber" name="accountNumber" required>

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>

        <label for="telephone">Telephone:</label>
        <input type="tel" id="telephone" name="telephone" required>

        <button type="submit" class="btn">Add Customer</button>
    </form>

    <div class="back-link">
        <a href="customer">← Back to Customer List</a>
    </div>
</div>
</body>
</html>
