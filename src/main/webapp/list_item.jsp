<%--
  Created by IntelliJ IDEA.
  User: isuri
  Date: 7/22/2025
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.model.Item" %>
<%
    List<Item> items = (List<Item>) request.getAttribute("items");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Item List</title>
    <style>
        body { font-family: Arial; background-color: #eef2f3; padding: 40px; }
        table { width: 90%; margin: auto; border-collapse: collapse; background: white; box-shadow: 0 0 10px #ccc; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: center; }
        th { background-color: #343a40; color: white; }
        a.button { padding: 6px 12px; background-color: #007bff; color: white; text-decoration: none; border-radius: 4px; }
        a.button:hover { background-color: #0056b3; }
        .add-btn { display: block; margin: 20px auto; text-align: center; }
    </style>
</head>
<body>
<h2 style="text-align:center;">Item List</h2>
<div class="add-btn">
    <a href="item?action=add" class="button">+ Add New Item</a><br><br>
    <a href="dashboard" class="button"> Back to Dashboard</a>
</div>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Unit Price</th>
        <th>Stock Quantity</th>
        <th>Actions</th>
    </tr>
    <%
        if (items != null && !items.isEmpty()) {
            for (Item item : items) {
    %>
    <tr>
        <td><%= item.getId() %></td>
        <td><%= item.getName() %></td>
        <td><%= item.getUnitPrice() %></td>
        <td><%= item.getStockQuantity() %></td>
        <td>
            <a href="item?action=edit&id=<%= item.getId() %>" class="button">Edit</a>
            <a href="item?action=delete&id=<%= item.getId() %>" class="button"
               onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr><td colspan="5">No items found.</td></tr>
    <% } %>
</table>
</body>
</html>

