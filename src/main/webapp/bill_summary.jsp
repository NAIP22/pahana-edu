<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.model.Bill" %>
<%@ page import="com.icbt.model.BillItem" %>
<%@ page import="com.icbt.model.Item" %>
<%@ page import="com.icbt.model.Customer" %>

<%
  Bill bill = (Bill) request.getAttribute("bill");
  if (bill == null) {
    response.sendRedirect("bill?action=list");
    return;
  }
  List<BillItem> billItems = bill.getItems();
  List<Item> items = (List<Item>) request.getAttribute("items");
  List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Bill Summary - Pahana Edu</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #f7f4f0, #ffffff);
      margin: 0;
      padding: 40px 0;
      color: #333;
    }

    .bill-container {
      background: #fff;
      max-width: 900px;
      margin: auto;
      padding: 30px 40px;
      border-radius: 16px;
      box-shadow: 0 8px 25px rgba(0,0,0,0.08);
      animation: fadeIn 0.8s ease-in-out;
    }

    h1 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 25px;
    }

    .bill-info p {
      font-size: 16px;
      margin: 6px 0;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    th, td {
      padding: 12px 10px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #0766ff;
      color: white;
      font-weight: 600;
    }

    .total-row {
      font-weight: bold;
      background-color: #f0f4f8;
    }

    .actions {
      margin-top: 25px;
      text-align: center;
    }

    .btn {
      padding: 10px 20px;
      border-radius: 8px;
      border: none;
      cursor: pointer;
      font-size: 15px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 6px;
      transition: background-color 0.3s, transform 0.2s;
      color: white;
    }

    .print-btn {
      background-color: #17a2b8;
    }

    .print-btn:hover {
      background-color: #138496;
      transform: translateY(-2px);
    }

    .back a {
      margin-left: 10px;
      color: #0766ff;
      font-weight: 500;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 5px;
      transition: transform 0.2s;
    }

    .back a:hover {
      text-decoration: underline;
      transform: translateY(-2px);
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(15px); }
      to { opacity: 1; transform: translateY(0); }
    }

    @media print {
      .actions { display: none; }
    }
  </style>
</head>
<body>

<div class="bill-container">
  <h1><i class="fas fa-receipt"></i> Bill Summary</h1>

  <div class="bill-info">
    <p><strong>Bill ID:</strong> <%= bill.getId() %></p>
    <p><strong>Date:</strong> <%= bill.getBillDate() %></p>
    <% for (Customer customer: customers) {
      if (bill.getCustomerId() == customer.getId()) { %>
    <p><strong>Customer Name:</strong> <%= customer.getName() %></p>
    <% } } %>
  </div>

  <table>
    <tr>
      <th>Item</th>
      <th>Quantity</th>
      <th>Unit Price (LKR)</th>
      <th>Total (LKR)</th>
    </tr>
    <%
      double grandTotal = 0;
      for (BillItem bi : billItems) {
        grandTotal += bi.getTotalPrice();
    %>
    <tr>
      <% for (Item i: items) {
        if(bi.getItemId() == i.getId()) { %>
      <td><%= i.getName() %></td>
      <% } } %>
      <td><%= bi.getQuantity() %></td>
      <td><%= String.format("%.2f", bi.getUnitPrice()) %></td>
      <td><%= String.format("%.2f", bi.getTotalPrice()) %></td>
    </tr>
    <% } %>
    <tr class="total-row">
      <td colspan="3">Grand Total</td>
      <td><%= String.format("%.2f", grandTotal) %></td>
    </tr>
  </table>

  <div class="actions">
    <button onclick="window.print()" class="btn print-btn"><i class="fas fa-print"></i> Print Bill</button>
    <div class="back">
      <a href="dashboard"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>
  </div>
</div>

</body>
</html>
