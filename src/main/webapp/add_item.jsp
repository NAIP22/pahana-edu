<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Item</title>
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

        label {
            font-weight: 600;
            color: #444;
            margin-bottom: 6px;
            display: block;
        }

        .input-group {
            display: flex;
            align-items: center;
            background: #f8f9fa;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 10px;
            margin-bottom: 18px;
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
            background: #28a745;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background: #218838;
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
    <h2><i class="fas fa-box"></i> Add New Item</h2>
    <form method="post" action="item">
        <input type="hidden" name="id" value="0" />

        <div class="input-group">
            <i class="fas fa-tag"></i>
            <input type="text" name="name" placeholder="Item Name" required />
        </div>

        <div class="input-group">
            <i class="fas fa-dollar-sign"></i>
            <input type="text" name="unitPrice" placeholder="Unit Price" required />
        </div>

        <div class="input-group">
            <i class="fas fa-boxes"></i>
            <input type="number" name="stockQuantity" placeholder="Stock Quantity" required />
        </div>

        <button type="submit" class="btn"><i class="fas fa-plus-circle"></i> Add Item</button>
    </form>

    <div class="back-link">
        <a href="item?action=list"><i class="fas fa-arrow-left"></i> Back to Item List</a>
    </div>
</div>
</body>
</html>
