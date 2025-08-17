<%@ page import="java.util.*, com.icbt.model.Bill, com.icbt.model.BillItem, com.icbt.model.Customer, com.icbt.model.Item" %>
<%
    List<Bill> bills = (List<Bill>) request.getAttribute("bills");
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
    List<Item> items = (List<Item>) request.getAttribute("items");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill List</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
            margin: 0;
            padding: 40px 0;
        }

        .container {
            max-width: 1100px;
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
            border-radius: 6px;
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

        .back-btn {
            display: inline-block;
            background: #6c757d;
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 8px;
            font-weight: 600;
            margin-top: 20px;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .back-btn:hover {
            background: #5a6268;
            transform: translateY(-2px);
        }

        ul {
            margin: 0;
            padding-left: 20px;
            text-align: left;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<div class="container">
    <h2><i class="fas fa-file-invoice"></i> Bill Records</h2>

    <table>
        <tr>
            <th>Bill ID</th>
            <th>Customer Name</th>
            <th>Item(s)</th>
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
            <%
                for (Customer customer: customers){
                    if(bill.getCustomerId() == customer.getId()){
            %>
            <td><%= customer.getName() %></td>
            <%
                    }
                }
            %>
            <td>
                <ul>
                    <% for (BillItem item : bill.getItems()) {
                        for (Item i: items){
                            if(item.getItemId() == i.getId()){
                    %>
                    <li><%= i.getName() + " - " +  item.getQuantity()%></li>
                    <%      }
                    }
                    } %>
                </ul>
            </td>
            <td><%= bill.getBillDate() %></td>
            <td><%= bill.getTotalAmount() %></td>
            <td>
                <a class="btn edit-btn" href="bill?action=edit&id=<%= bill.getId() %>">
                    <i class="fas fa-edit"></i> Edit
                </a>
                <a class="btn delete-btn" href="bill?action=delete&id=<%= bill.getId() %>" onclick="return confirm('Are you sure you want to delete this bill?')">
                    <i class="fas fa-trash"></i> Delete
                </a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No bills found.</td>
        </tr>
        <% } %>
    </table>

    <a href="dashboard" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
</div>
</body>
</html>
