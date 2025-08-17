<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Help & Support</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #f7f4f0, #ffffff);
      margin: 0;
      padding: 40px 0;
      color: #333;
    }

    .container {
      max-width: 900px;
      margin: auto;
      background: #fff;
      padding: 40px 50px;
      border-radius: 16px;
      box-shadow: 0 8px 25px rgba(0,0,0,0.08);
      animation: fadeIn 0.8s ease-in-out;
    }

    h1 {
      text-align: center;
      color: #0766ff;
      margin-bottom: 20px;
    }

    h2 {
      margin-top: 30px;
      color: #2c3e50;
      border-bottom: 2px solid #eee;
      padding-bottom: 5px;
    }

    ul {
      line-height: 1.8;
      padding-left: 20px;
      margin-top: 10px;
    }

    ul li strong {
      color: #0766ff;
    }

    .back-btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      margin: 30px auto 0;
      padding: 12px 20px;
      width: 220px;
      font-size: 15px;
      font-weight: 600;
      border-radius: 8px;
      text-decoration: none;
      color: white;
      background-color: #0766ff;
      transition: background-color 0.3s, transform 0.2s;
    }

    .back-btn i {
      margin-right: 6px;
    }

    .back-btn:hover {
      background-color: #0556d4;
      transform: translateY(-2px);
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(15px); }
      to { opacity: 1; transform: translateY(0); }
    }

    p {
      font-size: 16px;
      margin-bottom: 15px;
    }
  </style>
</head>
<body>

<div class="container">
  <h1><i class="fas fa-life-ring"></i> Help & Support</h1>
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
    <li><strong>Email:</strong> support@pahana_edu.com</li>
    <li><strong>Phone:</strong> +94 11 123 4567</li>
    <li><strong>Office Hours:</strong> Mon - Fri, 9:00 AM - 5:00 PM</li>
  </ul>

  <a href="dashboard" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
</div>

</body>
</html>
