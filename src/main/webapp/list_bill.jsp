<%@ page import="java.util.*, com.icbt.model.Bill" %>
<%@ page import="com.icbt.model.BillItem" %>
<%@ page import="com.icbt.model.Customer" %>
<%@ page import="com.icbt.model.Item" %>
<%
    List<Bill> bills = (List<Bill>) request.getAttribute("bills");
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
    List<Item> items = (List<Item>) request.getAttribute("items");
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
            max-width: 1000px;
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
            background-color: #0766ff;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .back-btn {
            background-color: #6c6f7d;
            display: inline-block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: white;
            padding: 8px 16px;
            border-radius: 4px;
        }

        .back-btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Bill Records</h2>

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
                <ul style="margin:0; padding-left: 15px; text-align: left;">
                    <% for (BillItem item : bill.getItems()) {
                    for (Item i: items){
                        if(item.getItemId() == i.getId()){
                    %>
                    <li><%= i.getName() + " - " +  item.getQuantity()%></li>
                    <% }
                    }
                    } %>
                </ul>
            </td>
            <td><%= bill.getBillDate() %></td>
            <td><%= bill.getTotalAmount() %></td>
            <td>
                <a class="btn edit-btn" href="bill?action=edit&id=<%= bill.getId() %>">Edit</a>
                <a class="btn delete-btn" href="bill?action=delete&id=<%= bill.getId() %>" onclick="return confirm('Are you sure you want to delete this bill?')">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No bills found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <br/>
    <a href="dashboard" class="back-btn"> Back to Dashboard</a>
</div>
</body>
</html>
