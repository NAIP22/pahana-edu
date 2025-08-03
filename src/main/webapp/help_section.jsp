<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Help & Support</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f9f9f9;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 900px;
      margin: 40px auto;
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px #ccc;
    }

    h1, h2 {
      color: #333;
      text-align: center;
    }

    ul {
      line-height: 1.8;
    }

    .back-btn {
      display: block;
      margin: 30px auto;
      width: 200px;
      text-align: center;
      background-color: #007bff;
      color: white;
      padding: 10px 15px;
      border-radius: 5px;
      text-decoration: none;
    }

    .back-btn:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Help & Support</h1>
  <p>Welcome to the Billing System Help Center. Here's how you can use the system:</p>

  <h2>🔧 How to Use</h2>
  <ul>
    <li><strong>Create Bill:</strong> Navigate to "Create Bill", select a customer, choose items, enter quantities. The total will be auto-calculated.</li>
    <li><strong>Manage Items:</strong> Go to "Items" to add, edit, or delete items. Each item has a price and available stock.</li>
    <li><strong>View Bills:</strong> Use the "Bill List" to view past bills, including customer and item details.</li>
    <li><strong>Print:</strong> Each bill can be printed using the print icon next to the bill record.</li>
  </ul>

  <h2>📞 Support</h2>
  <ul>
    <li>Email: support@pahana_edu.com</li>
    <li>Phone: +94 11 123 4567</li>
    <li>Office Hours: Mon - Fri, 9:00 AM - 5:00 PM</li>
  </ul>

  <a href="dashboard" class="back-btn">← Back to Dashboard</a>
</div>
</body>
</html>
