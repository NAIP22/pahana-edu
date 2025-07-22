<%@ page import="com.icbt.model.User" %>
<%@ page session="true" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f3f3f3;
      margin: 0;
      padding: 0;
    }

    .dashboard {
      max-width: 600px;
      margin: 80px auto;
      padding: 30px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .dashboard h2 {
      color: #333;
      margin-bottom: 20px;
      text-align: center;
    }

    .buttons {
      margin-top: 30px;
      display: flex;
      flex-direction: column;
      gap: 12px;
    }

    .buttons a {
      text-align: center;
      padding: 12px;
      background-color: #007bff;
      color: white;
      text-decoration: none;
      border-radius: 6px;
      transition: background-color 0.3s;
    }

    .buttons a:hover {
      background-color: #0056b3;
    }

    .logout {
      margin-top: 30px;
      text-align: center;
    }

    .logout a {
      color: #dc3545;
      text-decoration: none;
      font-weight: bold;
    }

    .logout a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="dashboard">
  <h2>Welcome, <%= user.getUsername() %>!</h2>
  <p style="text-align:center;">You have successfully logged into the dashboard.</p>

  <div class="buttons">
    <!-- Item Links -->
    <a href="item?action=add">Add Item</a>
    <a href="item?action=list">View Items</a>
    <!-- Edit Item would typically be from list view per item, so not linked directly -->

    <!-- Customer Links -->
    <a href="add_customer.jsp">Add Customer</a>
    <a href="customer">View Customers</a>
  </div>

  <div class="logout">
    <a href="logout">Logout</a>
  </div>
</div>
</body>
</html>
