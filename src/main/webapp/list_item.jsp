<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.model.Item" %>
<%
    List<Item> items = (List<Item>) request.getAttribute("items");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Item List</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
            margin: 0;
            padding: 40px 0;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2c3e50;
        }

        .add-btns {
            text-align: center;
            margin-bottom: 20px;
        }

        .add-btns a {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 8px 16px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            color: white;
            transition: transform 0.2s ease;
            margin: 0 5px;
        }

        .add-btns a.add-btn {
            background: #28a745;
        }

        .add-btns a.add-btn:hover {
            background: #218838;
            transform: translateY(-2px);
        }

        .add-btns a.back-btn {
            background: #6c757d;
        }

        .add-btns a.back-btn:hover {
            background: #5a6268;
            transform: translateY(-2px);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
            font-size: 14px;
        }

        table th {
            background: #007bff;
            color: white;
            font-weight: 600;
        }

        table tr:nth-child(even) {
            background: #f9f9f9;
        }

        table tr:hover {
            background: #f1f7ff;
            transition: background 0.3s ease;
        }

        .btn {
            padding: 6px 12px;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            font-size: 13px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: transform 0.2s ease, opacity 0.2s ease;
        }

        .btn i {
            font-size: 14px;
        }

        .edit-btn {
            background: #17a2b8;
        }

        .edit-btn:hover {
            background: #138496;
            transform: translateY(-2px);
        }

        .delete-btn {
            background: #dc3545;
        }

        .delete-btn:hover {
            background: #c82333;
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
    <h2><i class="fas fa-boxes"></i> Item List</h2>

    <div class="add-btns">
        <a href="item?action=add" class="add-btn"><i class="fas fa-plus-circle"></i> Add New Item</a>
        <a href="dashboard" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
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
                <a href="item?action=edit&id=<%= item.getId() %>" class="btn edit-btn">
                    <i class="fas fa-edit"></i> Edit
                </a>
                <a href="item?action=delete&id=<%= item.getId() %>" class="btn delete-btn"
                   onclick="return confirm('Are you sure you want to delete this item?')">
                    <i class="fas fa-trash"></i> Delete
                </a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5">No items found.</td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
