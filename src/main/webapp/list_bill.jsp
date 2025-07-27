<%@ page import="java.util.*, com.icbt.model.Bill" %>
<%
    List<Bill> bills = (List<Bill>) request.getAttribute("bills");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Bill List</title>
    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        table th {
            background-color: #007bff;
            color: white;
        }

        .btn {
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            color: white;
            font-size: 13px;
        }

        .edit-btn {
            background-color: #ffc107;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .print-btn {
            background-color: #28a745;
        }

        .back {
            margin-top: 20px;
            text-align: center;
        }

        .back a {
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Bill Records</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Customer ID</th>
            <th>Date</th>
            <th>Total Amount (Rs.)</th>
            <th>Actions</th>
        </tr>
        <%
            if (bills != null && !bills.isEmpty()) {
                for (Bill bill : bills) {
        %>
        <tr>
            <td><%= bill.getId() %></td>
            <td><%= bill.getCustomerId() %></td>
            <td><%= bill.getBillDate() %></td>
            <td><%= bill.getTotalAmount() %></td>
            <td>
                <a class="btn edit-btn" href="bill?action=edit&id=<%= bill.getId() %>">Edit</a>
                <a class="btn delete-btn" href="bill?action=delete&id=<%= bill.getId() %>" onclick="return confirm('Are you sure you want to delete this bill?')">Delete</a>
                <a class="btn print-btn" href="view_bill.jsp?id=<%= bill.getId() %>" target="_blank">Print</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5">No bills found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <div class="back">
        <a href="dashboard.jsp">← Back to Dashboard</a>
    </div>
</div>
</body>
</html>
