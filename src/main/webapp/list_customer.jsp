<%@ page import="java.util.*, com.icbt.model.Customer" %>
<%@ page session="true" %>
<%
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef2f3;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 5px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn.delete {
            background-color: #dc3545;
        }

        .btn.delete:hover {
            background-color: #c82333;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
        }

        .back-link a {
            color: #555;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Customer List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Account Number</th>
            <th>Name</th>
            <th>Address</th>
            <th>Telephone</th>
            <th>Actions</th>
        </tr>

        <%
            if (customers != null && !customers.isEmpty()) {
                for (Customer customer : customers) {
        %>
        <tr>
            <td><%= customer.getId() %></td>
            <td><%= customer.getAccountNumber() %></td>
            <td><%= customer.getName() %></td>
            <td><%= customer.getAddress() %></td>
            <td><%= customer.getTelephone() %></td>
            <td>
                <a href="customer?action=edit&id=<%= customer.getId() %>" class="btn">Edit</a>
                <a href="customer?action=delete&id=<%= customer.getId() %>" class="btn delete"
                   onclick="return confirm('Are you sure you want to delete this customer?')">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" style="text-align: center;">No customers found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <div style="text-align: center;">
        <a href="add_customer.jsp" class="btn">Add New Customer</a>
    </div>

    <div class="back-link">
        <a href="dashboard.jsp"> Back to Dashboard</a>
    </div>
</div>
</body>
</html>
