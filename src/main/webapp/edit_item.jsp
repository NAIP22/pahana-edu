<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.icbt.model.Item" %>
<%
  Item item = (Item) request.getAttribute("item");
  if (item == null) {
    response.sendRedirect("item?action=list");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Item</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #f0f2f5, #ffffff);
      margin: 0;
      padding: 40px 0;
    }

    .container {
      max-width: 500px;
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

    input[type="text"], input[type="number"] {
      width: 100%;
      padding: 10px 12px;
      margin-bottom: 20px;
      border-radius: 8px;
      border: 1px solid #ccc;
      transition: border-color 0.3s ease;
    }

    input[type="text"]:focus, input[type="number"]:focus {
      border-color: #007bff;
      outline: none;
    }

    .btn {
      background-color: #007bff;
      color: #fff;
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
  <h2><i class="fas fa-box-open"></i> Edit Item</h2>
  <form method="post" action="item?action=update">
    <input type="hidden" name="id" value="<%= item.getId() %>" />

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="<%= item.getName() %>" required />

    <label for="unitPrice">Unit Price:</label>
    <input type="text" id="unitPrice" name="unitPrice" value="<%= item.getUnitPrice() %>" required />

    <label for="stockQuantity">Stock Quantity:</label>
    <input type="number" id="stockQuantity" name="stockQuantity" value="<%= item.getStockQuantity() %>" required />

    <div style="text-align:center; margin-top:10px;">
      <button type="submit" class="btn"><i class="fas fa-save"></i> Update Item</button>
    </div>
  </form>

  <div class="back-link">
    <a href="item?action=list"><i class="fas fa-arrow-left"></i> Back to Item List</a>
  </div>
</div>
</body>
</html>
