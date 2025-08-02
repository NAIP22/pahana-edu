<%--
  Created by IntelliJ IDEA.
  User: isuri
  Date: 7/22/2025
  Time: 10:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Item</title>
    <style>
        body { font-family: Arial; background-color: #eef2f3; padding: 40px; }
        .form-container { background: #fff; padding: 30px; max-width: 500px; margin: auto; border-radius: 8px; box-shadow: 0 0 10px #ccc; }
        input[type=text], input[type=number] {
            width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ccc; border-radius: 4px;
        }
        button { padding: 10px 20px; background: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background: #218838; }
        a { text-decoration: none; color: #007bff; display: inline-block; margin-top: 10px; }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add New Item</h2>
    <form method="post" action="item">
        <input type="hidden" name="id" value="0" />
        <label>Name:</label>
        <input type="text" name="name" required />
        <label>Unit Price:</label>
        <input type="text" name="unitPrice" required />
        <label>Stock Quantity:</label>
        <input type="number" name="stockQuantity" required />
        <button type="submit">Add Item</button>
    </form>
    <a href="item?action=list">← Back to Item List</a>
</div>
</body>
</html>

