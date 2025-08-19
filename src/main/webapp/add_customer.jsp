<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
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

        .container {
            width: 100%;
            max-width: 500px;
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2c3e50;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        label {
            font-weight: 600;
            color: #444;
            margin-bottom: 6px;
        }

        .input-group {
            display: flex;
            align-items: center;
            background: #f8f9fa;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 10px;
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        .input-group i {
            margin-right: 10px;
            color: #007bff;
        }

        .input-group input {
            border: none;
            outline: none;
            background: transparent;
            flex: 1;
            font-size: 15px;
            color: #333;
        }

        .input-group:focus-within {
            border-color: #007bff;
            box-shadow: 0 0 6px rgba(0, 123, 255, 0.3);
        }

        .btn {
            background: #007bff;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background: #0056b3;
            transform: translateY(-2px);
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            text-decoration: none;
            color: #007bff;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .back-link a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<div class="container">
    <h2><i class="fas fa-user-plus"></i> Add New Customer</h2>
    <form action="customer?action=add" method="post">

        <div class="input-group">
            <i class="fas fa-id-card"></i>
            <input type="text" id="accountNumber" name="accountNumber" placeholder="Account Number" required>
        </div>

        <div class="input-group">
            <i class="fas fa-user"></i>
            <input type="text" id="name" name="name" placeholder="Customer Name" required>
        </div>

        <div class="input-group">
            <i class="fas fa-map-marker-alt"></i>
            <input type="text" id="address" name="address" placeholder="Address" required>
        </div>

        <div class="input-group">
            <i class="fas fa-phone"></i>
            <input type="tel" id="telephone" name="telephone" placeholder="Telephone Number" required>
        </div>

        <button type="submit" class="btn"><i class="fas fa-plus-circle"></i> Add Customer</button>
    </form>

    <div class="back-link">
        <a href="customer"><i class="fas fa-arrow-left"></i> Back to Customer List</a>
    </div>
</div>
</body>
</html>
