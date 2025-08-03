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
  <meta charset="UTF-8">
  <title>Dashboard</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #f8f9fa, #e0e0e0);
      margin: 0;
      padding: 0;
    }

    .dashboard {
      max-width: 1000px;
      margin: 60px auto;
      padding: 40px;
      background: #ffffff;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }

    .dashboard h2 {
      color: #343a40;
      margin-bottom: 10px;
      text-align: center;
    }

    .dashboard p {
      text-align: center;
      color: #666;
    }

    .buttons {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
      gap: 20px;
      margin-top: 40px;
    }

    .buttons a {
      display: block;
      padding: 14px;
      background-color: #007bff;
      color: #fff;
      text-decoration: none;
      border-radius: 8px;
      text-align: center;
      font-weight: 500;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .buttons a.edit {
      background-color: #007bff;
      color: #000;
    }

    .buttons a.delete {
      background-color: #007bff;
    }

    .buttons a:hover {
      transform: translateY(-2px);
      opacity: 0.9;
    }

    .logout {
      margin-top: 40px;
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
  <p>You have successfully logged into the system dashboard.</p>

  <div class="buttons">
    <!-- Customer Actions -->
    <a href="customer?action=add">Add Customer</a>
    <a href="customer">View Customers</a>

    <!-- Item Actions -->
    <a href="item?action=add">Add Item</a>
    <a href="item?action=list">View Items</a>

    <!-- Billing Actions -->
    <a href="bill?action=create">Create Bill</a>
    <a href="bill">View Bills</a>
    <a href="help">Help Section</a>
  </div>

  <div class="logout">
    <a href="logout">Logout</a>
  </div>
</div>
</body>
</html>
