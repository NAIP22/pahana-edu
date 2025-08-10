<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.model.Bill" %>
<%@ page import="com.icbt.model.BillItem" %>
<%@ page import="com.icbt.model.Item" %>
<%@ page import="com.icbt.model.Customer" %>

<%
  Bill bill = (Bill) request.getAttribute("bill");
  if (bill == null) {
    System.out.println("<h3>No bill found.</h3>");
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
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f7f4f0;
      margin: 0;
      padding: 20px;
      color: #333;
    }

    h1 {
      text-align: center;
      color: #2b4a5a;
    }

    .bill-container {
      background: white;
      max-width: 800px;
      margin: auto;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }

    table, th, td {
      border: 1px solid #ddd;
    }

    th {
      background-color: #3c5c8b;
      color: white;
      padding: 10px;
    }

    td {
      padding: 8px;
      text-align: center;
    }

    .total-row {
      font-weight: bold;
      background-color: #f0e6dd;
    }

    .actions {
      text-align: center;
      margin-top: 20px;
    }

    .btn {
      padding: 10px 16px;
      margin: 5px;
      border-radius: 5px;
      border: none;
      cursor: pointer;
      color: white;
      font-size: 14px;
    }

    .print-btn {
      background-color: #17a2b8;
    }
    .print-btn:hover {
      background-color: #138496;
    }

    .pdf-btn {
      background-color: #ffc107;
      text-decoration: none;
      display: inline-block;
    }
    .pdf-btn:hover {
      background-color: #e0a800;
    }

    @media print {
      .actions { display: none; }
    }
  </style>
</head>
<body>

<div class="bill-container">
  <h1>Pahana Edu - Bill Summary</h1>
  <p><strong>Bill ID:</strong> <%= bill.getId() %></p>
  <p><strong>Date:</strong> <%= bill.getBillDate() %></p>
  <% for (Customer customer: customers){
    if(bill.getCustomerId() == customer.getId()){
      %>
      <p><strong>Customer Name:</strong> <%= customer.getName() %></p>
  <%
    }
  }

  %>

  <table>
    <tr>
      <th>Item</th>
      <th>Qty</th>
      <th>Unit Price (LKR)</th>
      <th>Total (LKR)</th>
    </tr>
    <%
      double grandTotal = 0;
      for (BillItem item : billItems) {
        grandTotal += item.getTotalPrice();
    %>
    <tr>
      <% for (Item i: items){
        if(item.getItemId() == i.getId()){
      %>
      <td><%= i.getName() %></td>
      <%
          }
        }

      %>
      <td><%= item.getQuantity() %></td>
      <td><%= String.format("%.2f", item.getUnitPrice()) %></td>
      <td><%= String.format("%.2f", item.getTotalPrice()) %></td>
    </tr>
    <% } %>
    <tr class="total-row">
      <td colspan="3">Grand Total</td>
      <td><%= String.format("%.2f", grandTotal) %></td>
    </tr>
  </table>

  <div class="actions">
    <button onclick="window.print()" class="btn print-btn">🖨 Print Bill</button>
    <div class="back">
      <a href="dashboard">Back to Dashboard</a>
    </div>
  </div>
</div>  

</body>
</html>
