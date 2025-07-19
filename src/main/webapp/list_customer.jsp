<%--
  Created by IntelliJ IDEA.
  User: isuri
  Date: 7/19/2025
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.icbt.model.Customer" %>
<%
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { padding: 12px; border: 1px solid #ccc; text-align: left; }
        th { background-color: #f2f2f2; }
        a.button {
            padding: 6px 12px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            margin-right: 5px;
            border-radius: 3px;
        }
        a.button.delete { background-color: #dc3545; }
    </style>
</head>
<body>
<h2>Customer List</h2>
<a href="add_customer.jsp" class="button">Add New Customer</a>
<br/><br/>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Account Number</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="customer" items="${customers}">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.email}</td>
            <td>${customer.phone}</td>
            <td>${customer.accountNumber}</td>
            <td>
                <a href=customer?action=edit&id=${customer.id}" class="button">Edit</a>
                <a href="customer?action=delete&id=${customer.id}" class="button delete" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

