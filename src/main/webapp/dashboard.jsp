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
      background: linear-gradient(135deg, #ece9e6, #ffffff);
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .dashboard {
      max-width: 1100px;
      width: 90%;
      padding: 40px;
      background: #ffffff;
      border-radius: 16px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
      animation: fadeIn 1s ease-in-out;
    }

    .dashboard h2 {
      color: #2c3e50;
      margin-bottom: 10px;
      text-align: center;
      font-size: 28px;
    }

    .dashboard p {
      text-align: center;
      color: #555;
      margin-bottom: 30px;
    }

    .buttons {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 25px;
      margin-top: 30px;
    }

    .buttons a {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 20px;
      background: #f8f9fa;
      color: #007bff;
      text-decoration: none;
      border-radius: 12px;
      font-weight: 600;
      font-size: 15px;
      box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease, background 0.3s ease, box-shadow 0.3s ease;
    }

    .buttons a i {
      font-size: 26px;
      margin-bottom: 10px;
      color: #007bff;
    }

    .buttons a:hover {
      transform: translateY(-5px);
      background: #007bff;
      color: #fff;
      box-shadow: 0 6px 16px rgba(0, 123, 255, 0.3);
    }

    .buttons a:hover i {
      color: #fff;
    }

    .logout {
      margin-top: 40px;
      text-align: center;
    }

    .logout a {
      color: #e63946;
      text-decoration: none;
      font-weight: bold;
      font-size: 16px;
      transition: color 0.3s ease;
    }

    .logout a:hover {
      color: #b22222;
      text-decoration: underline;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>
<div class="dashboard">
  <h2>Welcome, <%= user.getUsername() %> </h2>
  <p>You have successfully logged into the system dashboard.</p>

  <div class="buttons">
    <!-- Customer Actions -->
    <a href="customer?action=add"><i class="fas fa-user-plus"></i> Add Customer</a>
    <a href="customer"><i class="fas fa-users"></i> View Customers</a>

    <!-- Item Actions -->
    <a href="item?action=add"><i class="fas fa-plus-circle"></i> Add Item</a>
    <a href="item?action=list"><i class="fas fa-list"></i> View Items</a>

    <!-- Billing Actions -->
    <a href="bill?action=create"><i class="fas fa-file-invoice-dollar"></i> Create Bill</a>
    <a href="bill"><i class="fas fa-receipt"></i> View Bills</a>
    <a href="customer?action=search"><i class="fas fa-search"></i> Account Details</a>
    <a href="help"><i class="fas fa-question-circle"></i> Help Section</a>
  </div>

  <div class="logout">
    <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
  </div>
</div>
</body>
</html>
