<%@ page import="com.icbt.model.Bill, com.icbt.model.BillItem" %>
<%
    Bill bill = (Bill) request.getAttribute("bill");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Bill Receipt</title>
    <style>
        body {
            font-family: Arial;
            padding: 30px;
            background: #fff;
        }

        .receipt {
            max-width: 600px;
            margin: auto;
            border: 1px solid #ccc;
            padding: 20px;
        }

        h2 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #aaa;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        .total {
            text-align: right;
            font-weight: bold;
            margin-top: 20px;
        }

        .print-btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            width: fit-content;
        }
    </style>
</head>
<body>
<div class="receipt">
    <h2>Bill Receipt</h2>
    <p><strong>Bill ID:</strong> <%= bill.getId() %></p>
    <p><strong>Date:</strong> <%= bill.getBillDate() %></p>
    <p><strong>Customer ID:</strong> <%= bill.getCustomerId() %></p>

    <table>
        <tr>
            <th>Item ID</th>
            <th>Qty</th>
            <th>Unit Price</th>
            <th>Total</th>
        </tr>
        <% for (BillItem item : bill.getItems()) { %>
        <tr>
            <td><%= item.getItemId() %></td>
            <td><%= item.getQuantity() %></td>
            <td>Rs. <%= item.getUnitPrice() %></td>
            <td>Rs. <%= item.getTotalPrice() %></td>
        </tr>
        <% } %>
    </table>

    <p class="total">Total Amount: Rs. <%= bill.getTotalAmount() %></p>

    <a class="print-btn" href="#" onclick="window.print()">🖨️ Print</a>
</div>
</body>
</html>
